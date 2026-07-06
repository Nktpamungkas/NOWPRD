#!/usr/bin/env python3
"""
Konversi hasil export DBeaver (CSV dari query SYSCAT.VIEWS) jadi satu file
.sql yang rapi, ter-format, dipisah per view dengan header comment.

Cara pakai:
    python3 format_view_ddl.py views_export.csv output.sql

CSV yang diharapkan punya kolom (header, urutan bebas):
    VIEWSCHEMA, VIEWNAME, TEXT
"""

import sys
import csv
import sqlparse


def clean_ddl_text(raw_text: str, schema: str, view_name: str) -> str:
    """
    TEXT dari SYSCAT.VIEWS biasanya isinya cuma badan SELECT-nya saja
    (tanpa 'CREATE VIEW ...'), jadi kita bungkus supaya jadi DDL utuh
    dan bisa langsung dieksekusi ulang kalau perlu.
    """
    text = raw_text.strip()

    # Kalau DB2 udah nyimpen include "CREATE VIEW" di TEXT, jangan dobel-bungkus
    if text.upper().startswith("CREATE"):
        full_stmt = text
    else:
        full_stmt = f'CREATE OR REPLACE VIEW "{schema}"."{view_name}" AS\n{text}'

    formatted = sqlparse.format(
        full_stmt,
        reindent=True,
        keyword_case="upper",
        identifier_case=None,   # jangan ubah case nama kolom/tabel asli
        indent_width=4,
        wrap_after=80,
    )
    return formatted.strip()


def main():
    if len(sys.argv) < 3:
        print("Usage: python3 format_view_ddl.py <input.csv> <output.sql>")
        sys.exit(1)

    input_csv = sys.argv[1]
    output_sql = sys.argv[2]

    with open(input_csv, newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        # normalisasi nama kolom (DBeaver kadang kasih prefix/quote beda-beda)
        fieldmap = {c.strip().upper(): c for c in reader.fieldnames}

        required = ["VIEWSCHEMA", "VIEWNAME", "TEXT"]
        missing = [c for c in required if c not in fieldmap]
        if missing:
            print(f"Kolom berikut tidak ditemukan di CSV: {missing}")
            print(f"Kolom yang ada: {reader.fieldnames}")
            sys.exit(1)

        rows = list(reader)

    with open(output_sql, "w", encoding="utf-8") as out:
        out.write(f"-- Generated DDL export, {len(rows)} view(s)\n")
        out.write("-- =====================================================\n\n")

        for row in rows:
            schema = row[fieldmap["VIEWSCHEMA"]].strip()
            name = row[fieldmap["VIEWNAME"]].strip()
            text = row[fieldmap["TEXT"]] or ""

            if not text.strip():
                out.write(f"-- [SKIP] {schema}.{name}: TEXT kosong\n\n")
                continue

            out.write(f"-- ---------------------------------------------------\n")
            out.write(f"-- View: {schema}.{name}\n")
            out.write(f"-- ---------------------------------------------------\n")
            try:
                ddl = clean_ddl_text(text, schema, name)
            except Exception as e:
                out.write(f"-- [ERROR formatting] {e}\n")
                ddl = text
            out.write(ddl)
            out.write(";\n\n\n")

    print(f"Selesai. {len(rows)} view ditulis ke {output_sql}")


if __name__ == "__main__":
    main()
