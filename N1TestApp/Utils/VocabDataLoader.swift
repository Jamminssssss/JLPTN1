// VocabDataLoader.swift
import Foundation

// ⚠️ Word / GrammarExample 이 이미 다른 파일에 정의되어 있다면 아래 두 struct는 제거하세요.
struct Word {
    let kanji: String
    let reading: String
    let meanings: [String: String]
}

struct GrammarExample {
    let grammar: String
    let example: String
    let meanings: [String: String]
    let translations: [String: String]
}

enum ContentLanguage {
    static var currentKey: String {
        let language = Locale.current.language
        let code = language.languageCode?.identifier ?? "en"

        guard code == "zh" else { return code }

        if language.script?.identifier == "Hant" {
            return "zh-Hant"
        }

        if let region = language.region?.identifier,
           ["TW", "HK", "MO"].contains(region) {
            return "zh-Hant"
        }

        return "zh-Hans"
    }
}

final class VocabDataLoader {

    static let shared = VocabDataLoader()
    private init() {}

    lazy var words: [Word] = parseWords()
    lazy var grammarExamples: [GrammarExample] = parseGrammar()

    private let localizedColumns: [(key: String, suffixes: [String])] = [
        ("ko", ["ko"]),
        ("en", ["en"]),
        ("ja", ["ja"]),
        ("zh-Hans", ["zh_hans", "zh"]),
        ("zh-Hant", ["zh_hant"]),
        ("fr", ["fr"]),
        ("id", ["id"]),
        ("es", ["es"]),
        ("th", ["th"]),
        ("vi", ["vi"])
    ]

    // MARK: N1_vocab.csv

    private func parseWords() -> [Word] {
        guard let url = Bundle.main.url(forResource: "N1_vocab", withExtension: "csv"),
              let raw = try? String(contentsOf: url, encoding: .utf8) else {
            print("[VocabDataLoader] ⚠️ N1_vocab.csv 로드 실패")
            return []
        }

        let rows = parseCSV(raw)
        guard let header = rows.first else { return [] }
        let columns = columnIndices(from: header)

        var result: [Word] = []
        for row in rows.dropFirst() {
            guard row.count >= 2 else { continue }

            let kanji = row[0].trimmed
            let reading = row[1].trimmed
            guard !kanji.isEmpty, !reading.isEmpty else { continue }

            result.append(Word(
                kanji: kanji,
                reading: reading,
                meanings: localizedValues(prefix: "meaning", row: row, columns: columns)
            ))
        }
        return result
    }

    // MARK: N1_grammar.csv

    private func parseGrammar() -> [GrammarExample] {
        guard let url = Bundle.main.url(forResource: "N1_grammar", withExtension: "csv"),
              let raw = try? String(contentsOf: url, encoding: .utf8) else {
            print("[VocabDataLoader] ⚠️ N1_grammar.csv 로드 실패")
            return []
        }

        let rows = parseCSV(raw)
        guard let header = rows.first else { return [] }
        let columns = columnIndices(from: header)

        var result: [GrammarExample] = []
        for row in rows.dropFirst() {
            guard row.count >= 2 else { continue }

            let grammar = row[0].trimmed
            let example = row[1].trimmed
            guard !grammar.isEmpty, !example.isEmpty else { continue }

            result.append(GrammarExample(
                grammar: grammar,
                example: example,
                meanings: localizedValues(prefix: "meaning", row: row, columns: columns),
                translations: localizedValues(prefix: "translation", row: row, columns: columns)
            ))
        }
        return result
    }

    private func columnIndices(from header: [String]) -> [String: Int] {
        Dictionary(uniqueKeysWithValues: header.enumerated().map {
            ($0.element.trimmed.lowercased(), $0.offset)
        })
    }

    private func localizedValues(
        prefix: String,
        row: [String],
        columns: [String: Int]
    ) -> [String: String] {
        var values: [String: String] = [:]

        for language in localizedColumns {
            for suffix in language.suffixes {
                guard let index = columns["\(prefix)_\(suffix)"], index < row.count else { continue }
                let value = row[index].trimmed
                if !value.isEmpty {
                    values[language.key] = value
                    break
                }
            }
        }

        return values
    }

    // MARK: RFC 4180 CSV Parser (멀티라인 필드 지원)

    private func parseCSV(_ text: String) -> [[String]] {
        var rows: [[String]] = []
        var fields: [String] = []
        var field = ""
        var inQuotes = false

        let chars = Array(text.replacingOccurrences(of: "\r\n", with: "\n"))
        var i = chars.startIndex

        while i < chars.endIndex {
            let ch = chars[i]
            if inQuotes {
                if ch == "\"" {
                    let next = chars.index(after: i)
                    if next < chars.endIndex, chars[next] == "\"" {
                        field.append("\"")
                        i = chars.index(after: next)
                        continue
                    } else {
                        inQuotes = false
                    }
                } else {
                    field.append(ch)
                }
            } else {
                switch ch {
                case "\"": inQuotes = true
                case ",":
                    fields.append(field); field = ""
                case "\n":
                    fields.append(field); field = ""
                    if !fields.isEmpty { rows.append(fields); fields = [] }
                default:
                    field.append(ch)
                }
            }
            i = chars.index(after: i)
        }

        fields.append(field)
        if fields.contains(where: { !$0.isEmpty }) { rows.append(fields) }

        return rows
    }
}

private extension String {
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
            .trimmingCharacters(in: CharacterSet(charactersIn: "\u{FEFF}"))
    }
}
