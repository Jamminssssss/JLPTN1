"""Produce local Japanese ASR evidence; never changes exam data.

Usage: python transcribe_exam_audio.py --model /path/to/mlx-model --output /tmp/n1-asr
Requires mlx_whisper and ffmpeg. Model weights must already be available locally.
ASR is review evidence, not an authoritative replacement for the recorded speech.
"""
import argparse
import json
import subprocess
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--model", required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--windows", type=Path, help="JSON list of {file, start, end} windows to recheck ASR omissions")
    parser.add_argument("--no-word-timestamps", action="store_true", help="Faster text-only review of short windows")
    args = parser.parse_args()
    import mlx_whisper

    root = Path(__file__).resolve().parents[1]
    args.output.mkdir(parents=True, exist_ok=True)
    if args.windows:
        jobs = json.loads(args.windows.read_text())
    else:
        jobs = [{"file": p.name} for p in sorted((root / "N1TestApp/Audio").glob("*.m4a"), key=lambda p: int(p.stem[3:]))]
    for job in jobs:
        source = root / "N1TestApp/Audio" / job["file"]
        suffix = f"-{job['start']}-{job['end']}" if "start" in job else ""
        destination = args.output / (source.stem + suffix + ".json")
        if destination.exists():
            continue
        wav = args.output / (source.stem + suffix + ".wav")
        command = ["ffmpeg", "-v", "error", "-nostdin", "-y", "-i", str(source)]
        if "start" in job:
            assert 0 <= job["start"] < job["end"]
            command += ["-ss", str(job["start"]), "-t", str(job["end"] - job["start"])]
        subprocess.run(command + ["-ar", "16000", "-ac", "1", str(wav)], check=True)
        print("TRANSCRIBING", source.name, flush=True)
        result = mlx_whisper.transcribe(
            str(wav), path_or_hf_repo=args.model, language="ja", temperature=0,
            condition_on_previous_text=False, word_timestamps=not args.no_word_timestamps, verbose=None,
        )
        result["source_file"] = source.name
        result["source_offset"] = job.get("start", 0)
        destination.write_text(json.dumps(result, ensure_ascii=False, indent=2))
        print("DONE", source.name, flush=True)


if __name__ == "__main__":
    main()
