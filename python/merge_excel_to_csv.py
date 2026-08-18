#!/usr/bin/env python3
"""Merge Excel workbooks in a folder into CSV files.

Every worksheet is read. Worksheets with the same name across workbooks
are merged into one CSV. Source workbook and worksheet are preserved.
"""

from pathlib import Path
import sys
import pandas as pd


def main() -> None:
    if len(sys.argv) != 3:
        print("Usage: python merge_excel_to_csv.py INPUT_FOLDER OUTPUT_FOLDER")
        sys.exit(1)

    input_dir = Path(sys.argv[1])
    output_dir = Path(sys.argv[2])

    if not input_dir.is_dir():
        print(f"Error: input folder not found: {input_dir}")
        sys.exit(1)

    output_dir.mkdir(parents=True, exist_ok=True)

    files = sorted(input_dir.glob("*.xlsx")) + sorted(input_dir.glob("*.xls"))
    if not files:
        print(f"No Excel files found in {input_dir}")
        return

    grouped = {}

    for workbook in files:
        print(f"Reading: {workbook}")
        for sheet_name, df in pd.read_excel(workbook, sheet_name=None).items():
            if df.empty:
                continue

            df = df.copy()
            df.insert(0, "source_file", workbook.name)
            df.insert(1, "source_sheet", str(sheet_name))
            grouped.setdefault(str(sheet_name), []).append(df)

    if not grouped:
        print("No non-empty worksheets found.")
        return

    for sheet_name, frames in grouped.items():
        merged = pd.concat(frames, ignore_index=True, sort=False)
        safe_name = "".join(
            "_" if c in '/\\:*?"<>|' else c for c in sheet_name
        ).strip() or "sheet"

        output_path = output_dir / f"{safe_name}.csv"
        merged.to_csv(output_path, index=False, encoding="utf-8")
        print(f"Created: {output_path} ({len(merged):,} rows)")


if __name__ == "__main__":
    main()
