#!/usr/bin/env python3
"""Convert one TSV file or all TSV files in a folder to CSV."""

from pathlib import Path
import csv
import sys


def convert_file(input_path: Path, output_path: Path) -> None:
    with input_path.open("r", newline="", encoding="utf-8-sig") as src:
        reader = csv.reader(src, delimiter="\t")
        with output_path.open("w", newline="", encoding="utf-8") as dst:
            csv.writer(dst).writerows(reader)
    print(f"Converted: {input_path} -> {output_path}")


def main() -> None:
    if len(sys.argv) not in (2, 3):
        print("Usage: python tsv_to_csv.py INPUT [OUTPUT]")
        sys.exit(1)

    source = Path(sys.argv[1])
    if not source.exists():
        print(f"Error: not found: {source}")
        sys.exit(1)

    if source.is_file():
        output = Path(sys.argv[2]) if len(sys.argv) == 3 else source.with_suffix(".csv")
        convert_file(source, output)
        return

    output_dir = Path(sys.argv[2]) if len(sys.argv) == 3 else source
    output_dir.mkdir(parents=True, exist_ok=True)

    files = sorted(source.glob("*.tsv"))
    if not files:
        print(f"No .tsv files found in {source}")
        return

    for input_path in files:
        convert_file(input_path, output_dir / f"{input_path.stem}.csv")


if __name__ == "__main__":
    main()
