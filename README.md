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
- `backup_views.py` — versi 1x-perintah: connect langsung ke DB2, jalankan
  query, simpan snapshot CSV ke `Backup/`, lalu generate `output.sql` — tanpa
  perlu buka DBeaver. Lihat [Opsi B](#opsi-b-1x-perintah-tanpa-dbeaver) di
  bawah.
- `output.sql` — hasil akhir yang di-generate dari `format_view_ddl.py` atau
  `backup_views.py`, ini yang di-push ke GitHub sebagai backup.
- `Scripts/` — kumpulan query SQL lain untuk kebutuhan operasional
  sehari-hari (laporan, monitoring, dsb). Folder ini terpisah dari alur
  backup view otomatis di atas.

## Cara Menjalankan Backup

Ada dua cara, hasil akhirnya sama-sama `output.sql`.

### Opsi A: manual lewat DBeaver

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

### Opsi B: 1x perintah, tanpa DBeaver

`backup_views.py` connect langsung ke DB2, jalankan query yang sama seperti di
atas, simpan snapshot CSV ke `Backup/`, lalu langsung generate `output.sql` —
semua dalam satu perintah.

1. Salin `.env.example` jadi `.env`, isi kredensial koneksi DB2 (`DB2_HOST`,
   `DB2_PORT`, `DB2_DATABASE`, `DB2_USER`, `DB2_PASSWORD`). File `.env` sudah
   masuk `.gitignore`, tidak akan ke-push.

2. Jalankan:

   ```bash
   python backup_views.py
   ```

3. Hasilnya akan tersimpan sebagai `output.sql`, dan snapshot CSV-nya ikut
   disimpan di `Backup/` untuk referensi.

### Setelah itu

Commit dan push `output.sql` ke GitHub. File CSV di `Backup/` tidak perlu
di-push (sudah di-`.gitignore`).

## Requirement

- Python 3.
- Install dependency lewat `pip install -r requirements.txt`, yang berisi:
  - [`sqlparse`](https://pypi.org/project/sqlparse/) — dipakai kedua opsi
    untuk merapikan format DDL.
  - [`ibm_db`](https://pypi.org/project/ibm-db/) dan
    [`python-dotenv`](https://pypi.org/project/python-dotenv/) — hanya
    dipakai Opsi B untuk connect langsung ke DB2.
