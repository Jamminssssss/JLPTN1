import Foundation

@main
enum ExamDataValidation {
    static func main() throws {
        let root = URL(fileURLWithPath: CommandLine.arguments.dropFirst().first ?? FileManager.default.currentDirectoryPath)
        let resources = root.appendingPathComponent("N1TestApp/Resources")
        let fixture = "\u{FEFF}text,value\r\n\"a, \"\"quote\"\"\nnext line\",ok\r\n\r\n"
        let parsed = try CSVParser.parse(fixture)
        precondition(parsed == [["text", "value"], ["a, \"quote\"\nnext line", "ok"]])
        do {
            _ = try CSVParser.parse("header\n\"unfinished")
            preconditionFailure("An unterminated field must fail")
        } catch CSVParser.ParseError.unterminatedQuotedField { }

        let localized = AudioQuestion(question: "Test", options: ["1", "2", "3"], answer: "1", audioFileName: "test.m4a", scripts: ["ko": "한국어", "en": "English", "zh_hans": "简体", "zh_hant": "繁體"])
        precondition(localized.localizedScript(languageCode: "zh", scriptCode: "Hans") == "简体")
        precondition(localized.localizedScript(languageCode: "zh", scriptCode: "Hant") == "繁體")
        precondition(localized.localizedScript(languageCode: "zh-TW", scriptCode: nil) == "繁體")
        precondition(localized.localizedScript(languageCode: "en-US", scriptCode: nil) == "English")

        let readingCounts = [14, 50, 68, 63, 69]
        let audioCounts = [4, 37, 35, 35, 35]
        for set in 1...5 {
            let readingText = try String(contentsOf: resources.appendingPathComponent("jlptn1_reading_set\(set).csv"), encoding: .utf8)
            let reading = DataLoader.parseQuestions(from: readingText)
            precondition(reading.count == readingCounts[set - 1])
            precondition(reading.allSatisfy { $0.options.count == 4 && $0.options.contains($0.answer) })
            let groups = DataLoader.groupQuestions(reading)
            precondition(groups.flatMap(\.questionIndices) == Array(reading.indices))
            for group in groups where group.isMulti {
                precondition(group.questions.allSatisfy { $0.question == group.sharedPassage && $0.subQuestion != nil })
            }
            // Escaped quotes in translated explanations must survive app loading.
            let records = try CSVParser.parse(readingText)
            let jaColumn = records[0].firstIndex(of: "explanation_ja")!
            for (question, row) in zip(reading, records.dropFirst()) {
                precondition(question.explanationJa == row[jaColumn].nilIfEmpty)
            }
            if set == 1 { precondition(reading[11].answer == "となる") }
            if set == 3 {
                precondition(reading[62].subQuestion?.contains("情報占有率") == true)
                precondition(reading[54].question?.contains("模範ではない。「教師と生徒」") == true)
            }
            if set == 4 { precondition(groups.last?.questions.count == 2) }
            if set == 5 {
                precondition(reading[36].options.contains("主人公を"))
                precondition(reading[52].subQuestion?.contains("以下のどの3つか") == true)
            }

            let audioText = try String(contentsOf: resources.appendingPathComponent("jlptn1_audio_set\(set).csv"), encoding: .utf8)
            let audio = AudioDataLoader.parseQuestions(from: audioText)
            precondition(audio.count == audioCounts[set - 1])
            precondition(audio.allSatisfy { (3...4).contains($0.options.count) && $0.options.contains($0.answer) && $0.scripts?["ja"] != nil })
            let audioRecords = try CSVParser.parse(audioText)
            for (question, row) in zip(audio, audioRecords.dropFirst()) {
                for (column, name) in audioRecords[0].enumerated() where name.hasPrefix("script_") {
                    let language = String(name.dropFirst("script_".count))
                    let expected = row[column].trimmingCharacters(in: .whitespacesAndNewlines)
                        .replacingOccurrences(of: "\\n", with: "\n")
                    precondition(question.scripts?[language] == expected)
                }
            }
            if set == 3 { precondition(audio[12].answer == "車で移動販売を行うこと") }
            if set == 2 {
                precondition(audio[35].scripts == audio[36].scripts)
                precondition(audio[11].scripts?["ja"]?.contains("通学路") == true)
                precondition(audio[34].scripts?["ja"]?.contains("味付け、発売当初からそのまま") == true)
                precondition(audio[35].startTime == 19.6 && audio[35].endTime == 178.2)
                precondition(audio[35].scripts?["en"]?.contains("1.Tomita Museum /") == false)
            }
            if set == 4 {
                precondition(audio[19].scripts?["ja"]?.contains("むしゃくしゃする") == true)
                precondition(audio[19].scripts?["en"]?.contains("irritated") == true)
            }
            if set == 5 {
                let script = audio[4].scripts!["ja"]!
                precondition(audio[5].endTime == 736.5)
                let healthScript = audio[32].scripts!["ja"]!
                precondition(healthScript.contains("パンやおにぎり"))
                precondition(healthScript.contains("自由裁量"))
                precondition(!healthScript.contains("コーヒー"))
                precondition(audio[33].scripts == audio[34].scripts)
                precondition(audio[33].startTime == 235.2 && audio[33].endTime == 386.5)
                precondition(script.components(separatedBy: "私どもの方でシート").count == 2)
                precondition(script.contains("女: じゃあ、荷物"))
                precondition(audio[6].scripts?["ja"]?.contains("男: 面白いね") == true)
            }
        }
        print("PASS: 264 reading and 146 listening questions; CSV escaping, grouping and answer regressions")
    }
}
