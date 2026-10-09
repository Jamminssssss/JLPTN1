#!/usr/bin/env python3
"""Exercise DatabaseManager's SQLite code on macOS without Xcode or iCloud.

Run: python3 Scripts/validate_incorrect_notes.py
Only the database location, UIKit import, and calendar prompt are substituted.
CloudKitManager is stubbed; the app's database methods run unchanged.
"""

import os
from pathlib import Path
import sqlite3
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "N1TestApp/Utils/DatabaseManager.swift"
HARNESS = r'''
import Foundation
import SQLite3
import CloudKit

enum CKSyncRecordType { case examProgress, incorrectNote }
final class CloudKitManager {
    static let shared = CloudKitManager()
    var uploads = 0
    func upload(type: CKSyncRecordType, recordName: String, fields: [String: CKRecordValue]) { uploads += 1 }
    func delete(type: CKSyncRecordType, recordName: String) { }
    static func progressRecordName(level: String, quizGroup: String) -> String { "progress" }
    static func incorrectNoteRecordName(level: String, quizGroup: String, questionIndex: Int) -> String { "note" }
}

let manager = DatabaseManager.shared
if CommandLine.arguments.contains("--reopen") {
    let notes = manager.fetchAllIncorrectNotes()
    precondition(notes.count == 3, "Notes must survive reopening the database")
    precondition(notes.contains { $0.level == "JLPTN1Audio" && $0.questionIndex == 2 })
    precondition(notes.contains { $0.level == "JLPTN1" && $0.questionIndex == 4 })
    print("PASS: persistence and repeated schema migration")
} else {
    if CommandLine.arguments.contains("--legacy") {
        let legacy = manager.fetchIncorrectNotes(level: "JLPTN1")
        precondition(legacy.count == 1 && legacy[0].questionIndex == 0)
        precondition(!legacy[0].requiresSubscription, "Migration must preserve existing notes")
        manager.deleteIncorrectAnswer(level: "JLPTN1", quizGroup: "Group1_set1", questionIndex: 0)
    }

    var updates = 0
    let observer = NotificationCenter.default.addObserver(
        forName: Notification.Name("incorrectNotesDidUpdate"), object: nil, queue: nil
    ) { _ in updates += 1 }
    manager.saveIncorrectAnswer(level: "JLPTN1", quizGroup: "Group1_set1", questionIndex: 4)
    manager.saveIncorrectAnswer(level: "JLPTN1Audio", quizGroup: "Group2_set1", questionIndex: 2)
    precondition(updates == 2 && CloudKitManager.shared.uploads == 2)
    precondition(manager.getIncorrectAnswers(level: "JLPTN1", quizGroup: "Group1_set1") == [4])
    precondition(manager.getIncorrectAnswers(level: "JLPTN1Audio", quizGroup: "Group2_set1") == [2])
    manager.saveIncorrectAnswer(level: "JLPTN1", quizGroup: "Group1_set1", questionIndex: 4)
    precondition(manager.fetchAllIncorrectNotes().count == 2, "Repeated wrong answers must not duplicate notes")

    let date = Date(timeIntervalSince1970: 1_700_000_000)
    let level = "JLPTN1-日本語-" + String(repeating: "x", count: 300)
    let group = "Group1_set5-'quoted'-" + String(repeating: "y", count: 300)
    precondition(manager.upsertIncorrectNoteLocalOnly(
        level: level, quizGroup: group, questionIndex: 7, timestamp: date, requiresSubscription: true
    ))
    let note = manager.fetchIncorrectNotes(level: level).first!
    precondition(note.level == level && note.quizGroup == group && note.questionIndex == 7)
    precondition(note.timestamp == date && note.requiresSubscription, "Temporary UTF-8 values must be copied")
    manager.deleteIncorrectAnswer(level: level, quizGroup: group, questionIndex: 7)
    precondition(manager.fetchIncorrectNotes(level: level).isEmpty)
    manager.saveProgressLocalOnly(level: level, quizGroup: group, index: 3)
    manager.saveProgressLocalOnly(level: level, quizGroup: group, index: 8)
    precondition(manager.loadProgress(level: level, quizGroup: group) == 8)
    manager.resetProgress(level: level, quizGroup: group)
    precondition(manager.loadProgress(level: level, quizGroup: group) == 0)

    DispatchQueue.concurrentPerform(iterations: 30) { index in
        precondition(manager.upsertIncorrectNoteLocalOnly(
            level: "JLPTN1", quizGroup: "Group1_set2", questionIndex: index,
            timestamp: date, requiresSubscription: true
        ))
        precondition(manager.getIncorrectAnswers(level: "JLPTN1", quizGroup: "Group1_set2").contains(index))
    }
    precondition(manager.fetchIncorrectNotes(level: "JLPTN1").count == 31)
    for index in 0..<30 {
        manager.deleteIncorrectAnswer(level: "JLPTN1", quizGroup: "Group1_set2", questionIndex: index)
    }
    precondition(manager.upsertIncorrectNoteLocalOnly(
        level: "JLPTN1", quizGroup: "Group1_set5", questionIndex: 8,
        timestamp: date, requiresSubscription: true
    ))

    // Force a real SQLite write error and verify it does not announce a saved note.
    var db: OpaquePointer?
    precondition(sqlite3_open(ProcessInfo.processInfo.environment["INCORRECT_NOTES_TEST_DB"]!, &db) == SQLITE_OK)
    precondition(sqlite3_exec(db, "CREATE TRIGGER fail_note BEFORE INSERT ON incorrect_notes BEGIN SELECT RAISE(ABORT, 'forced failure'); END;", nil, nil, nil) == SQLITE_OK)
    let previousUpdates = updates
    let previousUploads = CloudKitManager.shared.uploads
    manager.saveIncorrectAnswer(level: "JLPTN1", quizGroup: "Group1_set1", questionIndex: 99)
    precondition(updates == previousUpdates && CloudKitManager.shared.uploads == previousUploads)
    precondition(!manager.getIncorrectAnswers(level: "JLPTN1", quizGroup: "Group1_set1").contains(99))
    precondition(sqlite3_exec(db, "DROP TRIGGER fail_note;", nil, nil, nil) == SQLITE_OK)
    sqlite3_close(db)
    NotificationCenter.default.removeObserver(observer)
    print("PASS: reading/listening save, fetch, duplicate, delete, timestamp, subscription flag, progress, concurrent access, write failure")
}
'''


def main():
    with tempfile.TemporaryDirectory(prefix="incorrect-notes-", dir="/private/tmp") as directory:
        work = Path(directory)
        source = SOURCE.read_text()
        source = source.replace("import UIKit\n", "")
        source = source.replace("        requestCalendarAccess()", "        // No calendar prompt in validation.")
        original = 'let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("quiz_progress.sqlite")'
        assert original in source
        source = source.replace(original, 'let fileURL = URL(fileURLWithPath: ProcessInfo.processInfo.environment["INCORRECT_NOTES_TEST_DB"]!)')
        (work / "DatabaseManager.swift").write_text(source)
        (work / "main.swift").write_text(HARNESS)
        executable = work / "validate"
        subprocess.run([
            "swiftc", "-module-cache-path", str(work / "module-cache"),
            str(work / "DatabaseManager.swift"), str(work / "main.swift"), "-o", str(executable),
        ], check=True)
        for legacy in (False, True):
            database = work / ("legacy.sqlite" if legacy else "fresh.sqlite")
            if legacy:
                with sqlite3.connect(database) as connection:
                    connection.execute("CREATE TABLE incorrect_notes (level TEXT, quizGroup TEXT, questionIndex INTEGER, timestamp DATETIME DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (level, quizGroup, questionIndex))")
                    connection.execute("INSERT INTO incorrect_notes (level, quizGroup, questionIndex) VALUES ('JLPTN1', 'Group1_set1', 0)")
            environment = dict(os.environ, INCORRECT_NOTES_TEST_DB=str(database))
            print(f"Validating {'legacy' if legacy else 'fresh'} database", flush=True)
            subprocess.run([str(executable)] + (["--legacy"] if legacy else []), env=environment, check=True)
            subprocess.run([str(executable), "--reopen"], env=environment, check=True)


if __name__ == "__main__":
    main()
