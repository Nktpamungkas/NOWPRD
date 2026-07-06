# NOWPRD — Backup View Database DB2

Project ini digunakan untuk membackup definisi (DDL) view database DB2 production
(`NOWPRD`), khususnya view dengan skema `DB2ADMIN` dan nama diawali `ITXVIEW`,
supaya definisinya tersimpan sebagai riwayat di GitHub dan mudah ditelusuri kalau
ada perubahan.

## Struktur Project

- `Backup/` — hasil export mentah (CSV) dari DBeaver, berisi kolom `VIEWSCHEMA`,
  `VIEWNAME`, `TEXT` per view. Folder ini hanya file kerja sementara (masuk
  `.gitignore`, tidak di-push) karena isinya diganti/dihapus tiap kali backup.
- `format_view_ddl.py` — script Python untuk mengubah CSV hasil export menjadi
  satu file `.sql` yang rapi dan ter-format, dipisah per view dengan header
  comment.
- `output.sql` — hasil akhir yang di-generate dari `format_view_ddl.py`, ini yang
  di-push ke GitHub sebagai backup.
- `Scripts/` — kumpulan query SQL lain untuk kebutuhan operasional
  sehari-hari (laporan, monitoring, dsb). Folder ini terpisah dari alur
  backup view otomatis di atas.

## Cara Menjalankan Backup

1. Buka DBeaver, koneksikan ke `NOWPRD` (live production), lalu jalankan query
   berikut:

   ```sql
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
   ```

2. Export hasil query dalam format CSV, simpan di folder `Backup/` pada project
   ini (beri nama sesuai yang dibackup, misalnya `VIEWS_20260706.csv`).

3. Jalankan script berikut di terminal pada root project untuk generate DDL:

   ```bash
   python format_view_ddl.py "Backup/nama_file.csv" output.sql
   ```

4. Hasilnya akan tersimpan sebagai `output.sql`.

5. Commit dan push `output.sql` ke GitHub. File CSV di `Backup/` tidak perlu
   di-push (sudah di-`.gitignore`).

## Requirement

- Python 3 dengan package [`sqlparse`](https://pypi.org/project/sqlparse/)
  terpasang (`pip install sqlparse`).
