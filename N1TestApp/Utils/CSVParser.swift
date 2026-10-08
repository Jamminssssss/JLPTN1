import Foundation

/// Parses complete CSV records, including escaped quotes and quoted newlines.
enum CSVParser {
    enum ParseError: Error { case unterminatedQuotedField }

    static func parse(_ content: String) throws -> [[String]] {
        let characters = Array(content
            .replacingOccurrences(of: "\r\n", with: "\n")
            .replacingOccurrences(of: "\r", with: "\n"))
        var rows: [[String]] = []
        var row: [String] = []
        var field = ""
        var quoted = false
        var index = characters.first == "\u{FEFF}" ? 1 : 0

        func finishRow() {
            row.append(field)
            if row.contains(where: { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }) {
                rows.append(row)
            }
            row = []
            field = ""
        }

        while index < characters.count {
            let character = characters[index]
            if quoted {
                if character == "\"" {
                    if index + 1 < characters.count, characters[index + 1] == "\"" {
                        field.append("\"")
                        index += 1
                    } else {
                        quoted = false
                    }
                } else {
                    field.append(character)
                }
            } else if character == "\"", field.isEmpty {
                quoted = true
            } else if character == "," {
                row.append(field)
                field = ""
            } else if character == "\n" {
                finishRow()
            } else {
                field.append(character)
            }
            index += 1
        }
        guard !quoted else { throw ParseError.unterminatedQuotedField }
        if !field.isEmpty || !row.isEmpty { finishRow() }
        return rows
    }
}
