"""Validate every exam record and its bundled media. Run from any directory."""
import csv
import json
import math
from pathlib import Path
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
APP = ROOT / "N1TestApp"
EXPECTED = {"reading": [14, 50, 68, 63, 69], "audio": [4, 37, 35, 35, 35]}
durations = {}
count = 0
project = (ROOT / "N1TestApp.xcodeproj/project.pbxproj").read_text()

for kind, counts in EXPECTED.items():
    for number, expected in enumerate(counts, 1):
        path = APP / "Resources" / f"jlptn1_{kind}_set{number}.csv"
        with path.open(newline="", encoding="utf-8-sig") as source:
            records = list(csv.reader(source, strict=True))
        header = records[0]
        assert len(records) - 1 == expected, path
        groups = {}
        audio_ranges = {}
        for index, fields in enumerate(records[1:], 1):
            location = f"{path.name}, question {index}"
            assert len(fields) == len(header), location
            row = dict(zip(header, fields))
            options = [row[f"option{i}"] for i in range(1, 5) if row[f"option{i}"]]
            assert len(options) == len(set(options)), location
            assert row["answer"] in options, location
            assert row["question"].strip(), location
            prefix = "explanation_" if kind == "reading" else "script_"
            assert all(value.strip() for key, value in row.items() if key.startswith(prefix)), location
            if row.get("imageName"):
                asset = APP / "Assets.xcassets" / (row["imageName"] + ".imageset")
                contents = json.loads((asset / "Contents.json").read_text())
                assert any((asset / image["filename"]).is_file() for image in contents["images"] if image.get("filename")), location
            if row.get("passage_group"):
                assert row["sub_question"].strip(), location
                group = groups.setdefault(row["passage_group"], [])
                if group:
                    assert index == group[-1][0] + 1, location
                    assert row["question"] == group[-1][1], location
                group.append((index, row["question"]))
            if kind == "audio":
                audio = APP / "Audio" / row["audioFileName"]
                assert audio.is_file(), location
                for key, value in row.items():
                    if key.startswith("script_"):
                        assert not re.match(r'^\d+(?:番)?,"', value), (location, key, "nested CSV markup")
                        assert '\",\"' not in value, (location, key, "stray CSV delimiters")
                start, end = row["startTime"], row["endTime"]
                assert bool(start) == bool(end), location
                if shutil.which("ffprobe") and audio not in durations:
                    durations[audio] = float(subprocess.check_output([
                        "ffprobe", "-v", "error", "-show_entries", "format=duration",
                        "-of", "default=noprint_wrappers=1:nokey=1", str(audio)
                    ]))
                    assert math.isfinite(durations[audio]) and durations[audio] > 0, location
                if start:
                    start, end = float(start), float(end)
                    assert math.isfinite(start) and math.isfinite(end), location
                    assert 0 <= start < end, location
                    if shutil.which("ffprobe"):
                        assert end <= durations[audio], location
                    previous = audio_ranges.get(audio)
                    if previous:
                        prev_start, prev_end, prev_scripts = previous
                        scripts = {k: v for k, v in row.items() if k.startswith("script_")}
                        # Two questions may intentionally share one recorded conversation.
                        assert start >= prev_end or (start == prev_start and end == prev_end and scripts == prev_scripts), location
                    audio_ranges[audio] = (start, end, {k: v for k, v in row.items() if k.startswith("script_")})
                # Set 1 is bundled; other sets must match their ODR download tag.
                tag = f"Audio/{audio.name} = (Audio_N1_Set{number}, );"
                assert (tag in project) if number > 1 else (f"Audio/{audio.name} =" not in project), location
            count += 1

print(f"PASS: {count} questions, all language fields, media references, passage groups and audio ranges")
