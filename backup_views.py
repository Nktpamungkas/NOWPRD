#!/usr/bin/env python3
"""
Backup DDL view DB2ADMIN.ITXVIEW% dari database NOWPRD dalam 1 perintah:
connect ke DB2, jalankan query SYSCAT.VIEWS, simpan snapshot CSV ke Backup/,
lalu generate output.sql lewat format_view_ddl.py — tanpa harus buka DBeaver.

Cara pakai:
    python backup_views.py

Kredensial koneksi dibaca dari file .env (lihat .env.example).
"""

import csv
import os
import sys
from datetime import datetime

import ibm_db
from dotenv import load_dotenv

from format_view_ddl import clean_ddl_text

QUERY = """
SELECT
    VIEWSCHEMA,
    VIEWNAME,
    TEXT
FROM
    SYSCAT.VIEWS
WHERE
    VIEWSCHEMA = 'DB2ADMIN'
    AND VIEWNAME LIKE 'ITXVIEW%'
ORDER BY
    VIEWNAME
"""


def connect():
    load_dotenv()

    required = ["DB2_HOST", "DB2_PORT", "DB2_DATABASE", "DB2_USER", "DB2_PASSWORD"]
    missing = [key for key in required if not os.environ.get(key)]
    if missing:
        print(f"Variable .env berikut belum diisi: {missing}")
        print("Salin .env.example ke .env lalu isi kredensialnya.")
        sys.exit(1)

    conn_str = (
        f"DATABASE={os.environ['DB2_DATABASE']};"
        f"HOSTNAME={os.environ['DB2_HOST']};"
        f"PORT={os.environ['DB2_PORT']};"
        "PROTOCOL=TCPIP;"
        f"UID={os.environ['DB2_USER']};"
        f"PWD={os.environ['DB2_PASSWORD']};"
    )
    return ibm_db.connect(conn_str, "", "")


def fetch_views(conn):
    stmt = ibm_db.exec_immediate(conn, QUERY)
    rows = []
    row = ibm_db.fetch_assoc(stmt)
    while row:
        rows.append(
            {
                "VIEWSCHEMA": row["VIEWSCHEMA"],
                "VIEWNAME": row["VIEWNAME"],
                "TEXT": row["TEXT"],
            }
        )
        row = ibm_db.fetch_assoc(stmt)
    return rows


def write_csv(rows, csv_path):
    with open(csv_path, "w", newline="", encoding="utf-8-sig") as f:
        writer = csv.DictWriter(f, fieldnames=["VIEWSCHEMA", "VIEWNAME", "TEXT"])
        writer.writeheader()
        writer.writerows(rows)


def write_sql(rows, sql_path):
    with open(sql_path, "w", encoding="utf-8") as out:
        out.write(f"-- Generated DDL export, {len(rows)} view(s)\n")
        out.write("-- =====================================================\n\n")

        for row in rows:
            schema = row["VIEWSCHEMA"].strip()
            name = row["VIEWNAME"].strip()
            text = row["TEXT"] or ""

            if not text.strip():
                out.write(f"-- [SKIP] {schema}.{name}: TEXT kosong\n\n")
                continue

            out.write("-- ---------------------------------------------------\n")
            out.write(f"-- View: {schema}.{name}\n")
            out.write("-- ---------------------------------------------------\n")
            try:
                ddl = clean_ddl_text(text, schema, name)
            except Exception as e:
                out.write(f"-- [ERROR formatting] {e}\n")
                ddl = text
            out.write(ddl)
            out.write(";\n\n\n")


def main():
    backup_dir = os.path.join(os.path.dirname(__file__), "Backup")
    os.makedirs(backup_dir, exist_ok=True)

    timestamp = datetime.now().strftime("%Y%m%d%H%M")
    csv_path = os.path.join(backup_dir, f"VIEWS_{timestamp}.csv")
    sql_path = os.path.join(os.path.dirname(__file__), "output.sql")

    print("Menghubungkan ke NOWPRD...")
    conn = connect()
    try:
        print("Menjalankan query SYSCAT.VIEWS...")
        rows = fetch_views(conn)
    finally:
        ibm_db.close(conn)

    write_csv(rows, csv_path)
    print(f"Snapshot CSV disimpan: {csv_path}")

    write_sql(rows, sql_path)
    print(f"Selesai. {len(rows)} view ditulis ke {sql_path}")


if __name__ == "__main__":
    main()
