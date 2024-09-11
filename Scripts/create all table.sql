-- db_dying.db_dying.tbl_acc_perbaikan_dye definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_acc_perbaikan_dye;

CREATE TABLE db_dying.db_dying.tbl_acc_perbaikan_dye (
	id int NOT NULL,
	nama varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_acc_perbaikan_dye_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_analisa definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_analisa;

CREATE TABLE db_dying.db_dying.tbl_analisa (
	id int NOT NULL,
	nama varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_analisa_id PRIMARY KEY (id),
	CONSTRAINT tbl_analisa$tbl_analisa_nama_IDX UNIQUE (nama)
);


-- db_dying.db_dying.tbl_analisa_mesin_tunggu definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_analisa_mesin_tunggu;

CREATE TABLE db_dying.db_dying.tbl_analisa_mesin_tunggu (
	id int NOT NULL,
	analisa varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_analisa_mesin_tunggu_id PRIMARY KEY (id),
	CONSTRAINT tbl_analisa_mesin_tunggu$analisa UNIQUE (analisa)
);


-- db_dying.db_dying.tbl_arah_warna definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_arah_warna;

CREATE TABLE db_dying.db_dying.tbl_arah_warna (
	id int NOT NULL,
	arah_warna varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_arah_warna_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_bonkain definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_bonkain;

CREATE TABLE db_dying.db_dying.tbl_bonkain (
	id bigint NOT NULL,
	id_nsp bigint DEFAULT NULL NULL,
	buyer varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kd_ganti varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_bon varchar(11) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	alasan varchar(12) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	sebab varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	analisa varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	pencegahan varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna1 varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna2 varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna3 varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kg1 numeric(12,2) DEFAULT NULL NULL,
	kg2 numeric(12,2) DEFAULT NULL NULL,
	kg3 numeric(12,2) DEFAULT NULL NULL,
	pjg1 numeric(12,2) DEFAULT NULL NULL,
	pjg2 numeric(12,2) DEFAULT NULL NULL,
	pjg3 numeric(12,2) DEFAULT NULL NULL,
	satuan1 varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	satuan2 varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	satuan3 varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nokk1 char(16) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nokk2 char(16) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nokk3 char(16) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot1 varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot2 varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot3 varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat date DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_bonkain_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX id_nsp ON db_dying.db_dying.tbl_bonkain (id_nsp);
CREATE NONCLUSTERED INDEX no_bon ON db_dying.db_dying.tbl_bonkain (no_bon);
CREATE NONCLUSTERED INDEX no_order ON db_dying.db_dying.tbl_bonkain (no_order);


-- db_dying.db_dying.tbl_bukaresep definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_bukaresep;

CREATE TABLE db_dying.db_dying.tbl_bukaresep (
	id int NOT NULL,
	nokk varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nodemand varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	langganan varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	buyer varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	gshift varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	noresep1 varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	suffix1 varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	noresep2 varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	suffix2 varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	cek_resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket_resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	diperiksa_oleh varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	personil varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	createdatetime datetime2(0) DEFAULT NULL NULL,
	[start] datetime2(0) DEFAULT NULL NULL,
	stop datetime2(0) DEFAULT NULL NULL,
	jml_gerobak varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	proses varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kapasitas int DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_bukaresep_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_datatest definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_datatest;

CREATE TABLE db_dying.db_dying.tbl_datatest (
	id bigint NOT NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_test varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	langganan varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	buyer varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	po varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_hanger varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_item varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	g_shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lebar int DEFAULT NULL NULL,
	gramasi int DEFAULT NULL NULL,
	t_jawab varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	roll int DEFAULT NULL NULL,
	bruto numeric(12,2) DEFAULT NULL NULL,
	ket varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_mesin varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	masalah varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	improve varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	loading decimal(5,2) DEFAULT NULL NULL,
	l_r varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_program varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	demand_erp varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	prodorder_erp varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	rpm int DEFAULT NULL NULL,
	cycle_time int DEFAULT NULL NULL,
	tekanan decimal(7,2) DEFAULT NULL NULL,
	nozzle int DEFAULT NULL NULL,
	blower decimal(5,2) DEFAULT NULL NULL,
	plaiter varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	file_grafik varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket_proses varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	hasil_qc varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	cek_shading varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	file_inspek varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	update_status varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_datatest_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_delete_log_mesin definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_delete_log_mesin;

CREATE TABLE db_dying.db_dying.tbl_delete_log_mesin (
	id int NOT NULL,
	user_name nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	user_ip nvarchar(45) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	deleted_at datetime DEFAULT getdate() NOT NULL,
	no_mesin varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	no_mc_lama varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_mesin_baru varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL
);


-- db_dying.db_dying.tbl_dokumen definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_dokumen;

CREATE TABLE db_dying.db_dying.tbl_dokumen (
	id int NOT NULL,
	no_dokumen varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	nama_dokumen varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	sts varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'Pending' NULL,
	catatan varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat date DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_dokumen_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_dokumen_detail definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_dokumen_detail;

CREATE TABLE db_dying.db_dying.tbl_dokumen_detail (
	id int NOT NULL,
	id_dokumen int NOT NULL,
	sts varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	catatan varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_status date DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_dokumen_detail_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_energi definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_energi;

CREATE TABLE db_dying.db_dying.tbl_energi (
	id int NOT NULL,
	kode char(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ket varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_energi_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_gantikain definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_gantikain;

CREATE TABLE db_dying.db_dying.tbl_gantikain (
	id bigint NOT NULL,
	nokk varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nodemand varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	langganan varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	po varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_hanger varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_item varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lebar int DEFAULT NULL NULL,
	gramasi int DEFAULT NULL NULL,
	masalah varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	t_jawab varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	t_jawab1 varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	t_jawab2 varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	persen int DEFAULT NULL NULL,
	persen1 int DEFAULT NULL NULL,
	persen2 int DEFAULT NULL NULL,
	jenis_kain varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	styl varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	qty_kirim decimal(12,2) DEFAULT NULL NULL,
	qty_claim decimal(12,2) DEFAULT NULL NULL,
	qty_order decimal(12,2) DEFAULT NULL NULL,
	qty_foc decimal(12,2) DEFAULT NULL NULL,
	personil varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	penyebab varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	satuan_o varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	satuan_k varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	satuan_c varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	sts varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'0' NULL,
	sts_red varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'0' NULL,
	tgl_email date DEFAULT NULL NULL,
	tgl_buat date DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_gantikain_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX no_hanger ON db_dying.db_dying.tbl_gantikain (no_hanger);
CREATE NONCLUSTERED INDEX no_order ON db_dying.db_dying.tbl_gantikain (no_order);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_gantikain (nokk);
CREATE NONCLUSTERED INDEX tgl_buat ON db_dying.db_dying.tbl_gantikain (tgl_buat);


-- db_dying.db_dying.tbl_hasilcelup definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_hasilcelup;

CREATE TABLE db_dying.db_dying.tbl_hasilcelup (
	id bigint NOT NULL,
	id_montemp bigint DEFAULT NULL NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nodemand varchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lama_proses varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	status varchar(24) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	g_shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ph_cb varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	suhu_cb varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ph_poly varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	suhu_poly varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ph_cott varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	suhu_cott varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	berat_jns varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ph_naco varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	a_panas varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	a_dingin varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	point int DEFAULT NULL NULL,
	proses_point varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	k_resep varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jml_topping varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	analisa varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	operator_keluar varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	acc_keluar varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tambah_obat varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tambah_obat1 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tambah_obat2 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tambah_obat3 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tambah_obat4 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tambah_obat5 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tambah_obat6 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	operator_potong varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kd_stop varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	mulai_stop datetime2(0) DEFAULT NULL NULL,
	selesai_stop datetime2(0) DEFAULT NULL NULL,
	proses varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	rcode varchar(12) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	air_akhir decimal(12,2) DEFAULT NULL NULL,
	gerobak char(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jns_gerobak varchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	analisa_topping varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_resep varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_resep2 varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kategori_warna varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	resep varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	analisa_resep varchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	status_resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tambah_dyestuff varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	arah_warna varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	status_warna varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	leader varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	point2 varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_hasilcelup_id PRIMARY KEY (id),
	CONSTRAINT tbl_hasilcelup$id_montemp UNIQUE (id_montemp)
);
CREATE NONCLUSTERED INDEX g_shift ON db_dying.db_dying.tbl_hasilcelup (g_shift);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_hasilcelup (nokk);
CREATE NONCLUSTERED INDEX nokk1 ON db_dying.db_dying.tbl_hasilcelup (nokk);
CREATE NONCLUSTERED INDEX rcode ON db_dying.db_dying.tbl_hasilcelup (rcode);
CREATE NONCLUSTERED INDEX tgl_buat ON db_dying.db_dying.tbl_hasilcelup (tgl_buat);


-- db_dying.db_dying.tbl_jenis_proses definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_jenis_proses;

CREATE TABLE db_dying.db_dying.tbl_jenis_proses (
	id int NOT NULL,
	proses_name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	std_waktu varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_jenis_proses_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_jenis_salah definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_jenis_salah;

CREATE TABLE db_dying.db_dying.tbl_jenis_salah (
	id bigint NOT NULL,
	jenis_salah varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_jenis_salah_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_kategori_masalah_ncp definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_kategori_masalah_ncp;

CREATE TABLE db_dying.db_dying.tbl_kategori_masalah_ncp (
	id int NOT NULL,
	kategori_masalah varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_kategori_masalah_ncp_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_kategori_penyelesaian definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_kategori_penyelesaian;

CREATE TABLE db_dying.db_dying.tbl_kategori_penyelesaian (
	id int NOT NULL,
	kategori varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_kategori_penyelesaian_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_ke definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_ke;

CREATE TABLE db_dying.db_dying.tbl_ke (
	id int NOT NULL,
	ke varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_ke_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_ket_stopmesin definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_ket_stopmesin;

CREATE TABLE db_dying.db_dying.tbl_ket_stopmesin (
	id int NOT NULL,
	ket_stopmesin varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_ket_stopmesin_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_ketdttest definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_ketdttest;

CREATE TABLE db_dying.db_dying.tbl_ketdttest (
	id bigint NOT NULL,
	ket varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_ketdttest_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_leader definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_leader;

CREATE TABLE db_dying.db_dying.tbl_leader (
	id int NOT NULL,
	leader varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_leader_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_masalah_celupan definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_masalah_celupan;

CREATE TABLE db_dying.db_dying.tbl_masalah_celupan (
	id bigint NOT NULL,
	id_hasilcelup bigint NOT NULL,
	inspektor varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	masalah varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tidakan_perbaikan varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat date DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_masalah_celupan_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_masterrc definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_masterrc;

CREATE TABLE db_dying.db_dying.tbl_masterrc (
	id int NOT NULL,
	akar_masalah varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	[group] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_masterrc_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_matching_dyeing definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_matching_dyeing;

CREATE TABLE db_dying.db_dying.tbl_matching_dyeing (
	id int NOT NULL,
	nokk varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nodemand varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	gshift varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	langganan varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	buyer varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jam_terima datetime2(0) DEFAULT NULL NULL,
	acc_matching varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	operator_penerima varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	keterangan varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	pemberi_resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	acc_resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ok_ke varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	operator_matcher varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	note varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	createdatetime datetime2(0) DEFAULT NULL NULL,
	createdatetime_proses datetime2(0) DEFAULT NULL NULL,
	jenis_prosses varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	std_waktu_prosses varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_matching_dyeing_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_matching_history definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_matching_history;

CREATE TABLE db_dying.db_dying.tbl_matching_history (
	id int NOT NULL,
	id_matching varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	pemberi_resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	acc_resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ok_ke varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	operator_matcher varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	note varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	creationdatetime datetime2(0) DEFAULT NULL NULL,
	acc_creationdatetime datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_matching_history_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_mesin definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_mesin;

CREATE TABLE db_dying.db_dying.tbl_mesin (
	id int NOT NULL,
	no_mesin varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	kapasitas int NOT NULL,
	l_r char(5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	kode varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	waktu_tunggu int DEFAULT NULL NULL,
	wt_des decimal(5,2) DEFAULT NULL NULL,
	no_mc_lama varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_mesin_baru varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_mesin_id PRIMARY KEY (id),
	CONSTRAINT tbl_mesin$no_mesin UNIQUE (no_mesin)
);
CREATE NONCLUSTERED INDEX kapasitas ON db_dying.db_dying.tbl_mesin (kapasitas);
CREATE NONCLUSTERED INDEX no_mesin_baru ON db_dying.db_dying.tbl_mesin (no_mesin_baru);


-- db_dying.db_dying.tbl_monitoring definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_monitoring;

CREATE TABLE db_dying.db_dying.tbl_monitoring (
	id bigint NOT NULL,
	id_sample bigint DEFAULT NULL NULL,
	l_r varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	c_time numeric(12,0) DEFAULT NULL NULL,
	tekanan numeric(12) DEFAULT NULL NULL,
	rpm numeric(12,0) DEFAULT NULL NULL,
	p_air numeric(12,0) DEFAULT NULL NULL,
	a_panas varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	a_dingin varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	qty numeric(12,2) DEFAULT NULL NULL,
	lot varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	langganan varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_hanger varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_resep varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nozzle numeric(12,0) DEFAULT NULL NULL,
	a_lebar int DEFAULT NULL NULL,
	a_gramasi int DEFAULT NULL NULL,
	p_gramasi int DEFAULT NULL NULL,
	p_lebar int DEFAULT NULL NULL,
	brt_jenis numeric(12,3) DEFAULT NULL NULL,
	ph varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ph1 varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	c_over varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	p_kain numeric(12,2) DEFAULT NULL NULL,
	loading numeric(12,2) DEFAULT NULL NULL,
	kapasitas int DEFAULT NULL NULL,
	proses varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket_status varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	status varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'OK' NULL,
	operator varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_monitor date DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_monitoring_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX no_resep ON db_dying.db_dying.tbl_monitoring (no_resep);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_monitoring (nokk);
CREATE NONCLUSTERED INDEX status ON db_dying.db_dying.tbl_monitoring (status);
CREATE NONCLUSTERED INDEX tbl_monitoring ON db_dying.db_dying.tbl_monitoring (tgl_monitor);


-- db_dying.db_dying.tbl_montemp definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_montemp;

CREATE TABLE db_dying.db_dying.tbl_montemp (
	id bigint NOT NULL,
	id_schedule bigint DEFAULT NULL NULL,
	jammasukkain datetime2(0) DEFAULT NULL NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nodemand varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	pakai_air int DEFAULT NULL NULL,
	carry_over int DEFAULT NULL NULL,
	shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	g_shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	operator varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	colorist varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	leader varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_program varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	l_r varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	l_r_2 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	cycle_time int DEFAULT NULL NULL,
	rpm int DEFAULT NULL NULL,
	tekanan decimal(7,2) DEFAULT NULL NULL,
	nozzle int DEFAULT NULL NULL,
	benang varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	std_cok_wrn varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lebar_a int DEFAULT NULL NULL,
	gramasi_a int DEFAULT NULL NULL,
	lebar_s int DEFAULT NULL NULL,
	gramasi_s int DEFAULT NULL NULL,
	pjng_kain numeric(12,2) DEFAULT NULL NULL,
	pjng_kain_perlubang numeric(12,2) DEFAULT NULL NULL,
	ket varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	status varchar(12) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'sedang jalan' NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	rol varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	bruto numeric(12,2) DEFAULT NULL NULL,
	susut_lebar numeric(12,2) DEFAULT NULL NULL,
	susut_panjang numeric(12,2) DEFAULT NULL NULL,
	speed numeric(12,2) DEFAULT NULL NULL,
	vacum numeric(12,2) DEFAULT NULL NULL,
	vr1 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr2 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr3 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr4 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr5 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr6 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr7 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr8 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr9 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr10 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr11 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr12 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr13 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr14 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	vr15 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ch1 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ch2 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ch3 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ch4 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ch5 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ch6 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lb1 int DEFAULT NULL NULL,
	lb2 int DEFAULT NULL NULL,
	lb3 int DEFAULT NULL NULL,
	lb4 int DEFAULT NULL NULL,
	lb5 int DEFAULT NULL NULL,
	lb6 int DEFAULT NULL NULL,
	lb7 int DEFAULT NULL NULL,
	lb8 int DEFAULT NULL NULL,
	sc1 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	sc2 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	sc3 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	sc4 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	sk varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	stm varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ws_abc varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ws varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	plaiter varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	blower decimal(5,2) DEFAULT NULL NULL,
	air_awal decimal(12,2) DEFAULT NULL NULL,
	waktu_tunggu decimal(5,2) DEFAULT NULL NULL,
	note_wt varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	oper_shift varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lotlgcy varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lebar_fin int DEFAULT NULL NULL,
	grm_fin int DEFAULT NULL NULL,
	lebar_dye int DEFAULT NULL NULL,
	grm_dye int DEFAULT NULL NULL,
	masukkain varchar(11) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	gabung_celup varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	loterp varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	demanderp varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nokk_legacy varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kategori_resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kasih_resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	acc_resep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	absen_in varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_in varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	absen_out varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_out varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	keterangan varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	archive varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	creationdatetime datetime2(0) DEFAULT NULL NULL,
	ket_stopmesin varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket_stopmesin2 varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket_stopmesin3 varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket_stopmesin4 varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_stop datetime2(0) DEFAULT NULL NULL,
	tgl_stop2 datetime2(0) DEFAULT NULL NULL,
	tgl_stop3 datetime2(0) DEFAULT NULL NULL,
	tgl_stop4 datetime2(0) DEFAULT NULL NULL,
	tgl_mulai datetime2(0) DEFAULT NULL NULL,
	tgl_mulai2 datetime2(0) DEFAULT NULL NULL,
	tgl_mulai3 datetime2(0) DEFAULT NULL NULL,
	tgl_mulai4 datetime2(0) DEFAULT NULL NULL,
	tgl_target datetime2(0) DEFAULT NULL NULL,
	sisa_waktu varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_montemp_id PRIMARY KEY (id),
	CONSTRAINT tbl_montemp$id_schedule UNIQUE (id_schedule)
);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_montemp (nokk);
CREATE NONCLUSTERED INDEX status ON db_dying.db_dying.tbl_montemp (status);
CREATE NONCLUSTERED INDEX tgl_mulai ON db_dying.db_dying.tbl_montemp (tgl_mulai);
CREATE NONCLUSTERED INDEX tgl_stop ON db_dying.db_dying.tbl_montemp (tgl_stop);
CREATE NONCLUSTERED INDEX tgl_target ON db_dying.db_dying.tbl_montemp (tgl_target);


-- db_dying.db_dying.tbl_nama_colorist definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_nama_colorist;

CREATE TABLE db_dying.db_dying.tbl_nama_colorist (
	id int NOT NULL,
	nama_colorist varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_nama_colorist_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_ncp definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_ncp;

CREATE TABLE db_dying.db_dying.tbl_ncp (
	id bigint NOT NULL,
	no_ncp varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dept varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	note varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_ncp date DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_ncp_id PRIMARY KEY (id),
	CONSTRAINT tbl_ncp$no_ncp UNIQUE (no_ncp)
);


-- db_dying.db_dying.tbl_ncp_detail1 definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_ncp_detail1;

CREATE TABLE db_dying.db_dying.tbl_ncp_detail1 (
	id bigint NOT NULL,
	id_ncp bigint DEFAULT NULL NULL,
	no_ncp varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	acc_celup varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_proses date DEFAULT NULL NULL,
	no_mc varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	peng_jawab varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	perbaikan varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	analisa varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	status varchar(21) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'Sedang Perbaikan' NULL,
	CONSTRAINT PK_tbl_ncp_detail1_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_ncp_memo definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_ncp_memo;

CREATE TABLE db_dying.db_dying.tbl_ncp_memo (
	id int NOT NULL,
	jnsdata varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'NCP' NOT NULL,
	nokk varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	no_ncp varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nokk_ncp varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	langganan varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	buyer varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	po_number varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	[order] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	rol_induk int DEFAULT NULL NULL,
	qty_induk decimal(12,2) DEFAULT NULL NULL,
	rol_ncp int DEFAULT NULL NULL,
	qty_ncp decimal(12,2) DEFAULT NULL NULL,
	tolak_qcf varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_celup date DEFAULT NULL NULL,
	mc_celup varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	acc_keluar varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	operator varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	masalah varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	masalah_dye varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tempat_kain varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_rencana date DEFAULT NULL NULL,
	tgl_penyelesaian date DEFAULT NULL NULL,
	acc_perbaikan varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	penyelesaian varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	id_ncp bigint NOT NULL,
	no_program varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	press_pump decimal(6,2) DEFAULT NULL NULL,
	loading decimal(6,2) DEFAULT NULL NULL,
	nozzle int DEFAULT NULL NULL,
	l_r varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	blower decimal(6,2) DEFAULT NULL NULL,
	rpm int DEFAULT NULL NULL,
	plaiter varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	cycle_time int DEFAULT NULL NULL,
	po_rajut varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_hanger varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	analisa_penyebab varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket_penyelesaian varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kategori_masalah varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	acc_perbaikan_dye varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	perbaikan_dye varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ncp_hitung varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kategori_penyelesaian varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jml_perbaikan int DEFAULT NULL NULL,
	akar_masalah varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	solusi_panjang varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nama_mesin varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_ncp_sebelumnya varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	accperbaikan_sebelumnya varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	k_resep varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kategori_resep varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	test1_roll varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot_ncp varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_ncp_memo_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX tbl_ncp_memo_id_ncp_IDX ON db_dying.db_dying.tbl_ncp_memo (id_ncp);


-- db_dying.db_dying.tbl_news_line definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_news_line;

CREATE TABLE db_dying.db_dying.tbl_news_line (
	id int NOT NULL,
	gedung varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	news_line varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	status varchar(12) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'Tampil' NULL,
	CONSTRAINT PK_tbl_news_line_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_nozzle definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_nozzle;

CREATE TABLE db_dying.db_dying.tbl_nozzle (
	id int NOT NULL,
	satuan varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	nilai int NOT NULL,
	ket varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_nozzle_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_perbaikan_dye definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_perbaikan_dye;

CREATE TABLE db_dying.db_dying.tbl_perbaikan_dye (
	id int NOT NULL,
	perbaikan varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_perbaikan_dye_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_percobaanke definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_percobaanke;

CREATE TABLE db_dying.db_dying.tbl_percobaanke (
	id int NOT NULL,
	ke varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_percobaanke_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_point_greige definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_point_greige;

CREATE TABLE db_dying.db_dying.tbl_point_greige (
	id int NOT NULL,
	proses varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	point int DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_point_greige_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_potongcelup definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_potongcelup;

CREATE TABLE db_dying.db_dying.tbl_potongcelup (
	id bigint NOT NULL,
	id_hasilcelup bigint DEFAULT NULL NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nodemand varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	comment_warna varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	acc varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	disposisi varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	operator varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	g_shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_potongcelup_id PRIMARY KEY (id),
	CONSTRAINT tbl_potongcelup$id_hasilcelup UNIQUE (id_hasilcelup)
);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_potongcelup (nokk);
CREATE NONCLUSTERED INDEX nokk1 ON db_dying.db_dying.tbl_potongcelup (nokk);


-- db_dying.db_dying.tbl_proses definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_proses;

CREATE TABLE db_dying.db_dying.tbl_proses (
	id int NOT NULL,
	proses varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_proses_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_relaxing definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_relaxing;

CREATE TABLE db_dying.db_dying.tbl_relaxing (
	id bigint NOT NULL,
	nokk varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	no_program varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	s_in numeric(11,0) DEFAULT NULL NULL,
	s_out numeric(11,0) DEFAULT NULL NULL,
	jam_masuk varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	standar_ varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_resep varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_proses date DEFAULT NULL NULL,
	roll int DEFAULT NULL NULL,
	l_in int DEFAULT NULL NULL,
	l_out int DEFAULT NULL NULL,
	g_in numeric(11,2) DEFAULT NULL NULL,
	g_out numeric(11,2) DEFAULT NULL NULL,
	l_susut numeric(11,2) DEFAULT NULL NULL,
	g_susut numeric(11,2) DEFAULT NULL NULL,
	suhu1 numeric(11,2) DEFAULT NULL NULL,
	suhu2 numeric(11,2) DEFAULT NULL NULL,
	suhu3 numeric(11,2) DEFAULT NULL NULL,
	suhu4 numeric(11,2) DEFAULT NULL NULL,
	suhu5 numeric(11,2) DEFAULT NULL NULL,
	suhu6 numeric(11,2) DEFAULT NULL NULL,
	speed1 numeric(11,2) DEFAULT NULL NULL,
	speed2 numeric(11,2) DEFAULT NULL NULL,
	speed3 numeric(11,2) DEFAULT NULL NULL,
	speed4 numeric(11,2) DEFAULT NULL NULL,
	speed5 numeric(11,2) DEFAULT NULL NULL,
	speed6 numeric(11,2) DEFAULT NULL NULL,
	catatan varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_relaxing_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_relaxing_manual definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_relaxing_manual;

CREATE TABLE db_dying.db_dying.tbl_relaxing_manual (
	id bigint NOT NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_po varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lebar varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	gramasi varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	benang varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	langganan varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_resep varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_relaxing_manual_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_relaxing_manual (nokk);


-- db_dying.db_dying.tbl_resep_suffix definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_resep_suffix;

CREATE TABLE db_dying.db_dying.tbl_resep_suffix (
	id int NOT NULL,
	fabric_type varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	color_group varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	resep_suffix varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_resep_suffix_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_salahresep definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_salahresep;

CREATE TABLE db_dying.db_dying.tbl_salahresep (
	id bigint NOT NULL,
	id_celup bigint DEFAULT NULL NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	g_shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kesalahan varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	t_jawab1 varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	t_jawab2 varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_salahresep_id PRIMARY KEY (id),
	CONSTRAINT tbl_salahresep$id_celup UNIQUE (id_celup)
);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_salahresep (nokk);
CREATE NONCLUSTERED INDEX tgl_buat ON db_dying.db_dying.tbl_salahresep (tgl_buat);


-- db_dying.db_dying.tbl_sample definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_sample;

CREATE TABLE db_dying.db_dying.tbl_sample (
	id bigint NOT NULL,
	nokk varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_mesin varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_program varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	roll varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	standar_ varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_resep varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jam_masuk varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	tgl_proses date DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_sample_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX no_resep ON db_dying.db_dying.tbl_sample (no_resep);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_sample (nokk);
CREATE NONCLUSTERED INDEX tgl_update ON db_dying.db_dying.tbl_sample (tgl_update);


-- db_dying.db_dying.tbl_sample_manual definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_sample_manual;

CREATE TABLE db_dying.db_dying.tbl_sample_manual (
	id bigint NOT NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_po varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	warna varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lebar varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	gramasi varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	benang varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	langganan varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_resep varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_sample_manual_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_sample_manual (nokk);


-- db_dying.db_dying.tbl_schedule definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_schedule;
DROP TABLE db_dying.db_dying.tbl_schedule;
CREATE TABLE db_dying.db_dying.tbl_schedule (
	id bigint NOT NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nodemand varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kapasitas int DEFAULT NULL NULL,
	loading decimal(5,2) DEFAULT NULL NULL,
	no_mesin varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	mc_from varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_urut varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	no_sch int DEFAULT NULL NULL,
	no_resep varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_resep2 varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	suffix varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	suffix2 varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	resep varchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kategori_warna varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	proses varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	energi varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	dyestuff varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_masuk date DEFAULT NULL NULL,
	personil varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	personil_stdtarget varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lastupdatetime_stdtarget datetime2(0) DEFAULT NULL NULL,
	acc_staff varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket_status varchar(19) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	langganan varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	buyer varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	po varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_hanger varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_item varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_delivery date DEFAULT NULL NULL,
	lebar int DEFAULT NULL NULL,
	gramasi int DEFAULT NULL NULL,
	warna varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	qty_order numeric(12,2) DEFAULT NULL NULL,
	pjng_order numeric(12,2) DEFAULT NULL NULL,
	satuan_order varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lotlgcy varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	rol int DEFAULT NULL NULL,
	bruto numeric(12,2) DEFAULT NULL NULL,
	no_rajut varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	g_shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	status varchar(12) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'antri mesin' NOT NULL,
	operation varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	target decimal(4,2) DEFAULT NULL NULL,
	revisi int DEFAULT 0 NULL,
	ket_kain varchar(19) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kk_kestabilan varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'0' NULL,
	kk_normal varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'0' NULL,
	tgl_mulai datetime2(0) DEFAULT NULL NULL,
	tgl_stop datetime2(0) DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	high_temp int DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_schedule_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX kapasitas ON db_dying.db_dying.tbl_schedule (kapasitas);
CREATE NONCLUSTERED INDEX no_mesin ON db_dying.db_dying.tbl_schedule (no_mesin);
CREATE NONCLUSTERED INDEX no_urut ON db_dying.db_dying.tbl_schedule (no_urut);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_schedule (nokk);
CREATE NONCLUSTERED INDEX proses ON db_dying.db_dying.tbl_schedule (proses);
CREATE NONCLUSTERED INDEX status ON db_dying.db_dying.tbl_schedule (status);
CREATE NONCLUSTERED INDEX tbl_schedule_no_mesin_IDX ON db_dying.db_dying.tbl_schedule (no_mesin);


-- db_dying.db_dying.tbl_schedule_detail definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_schedule_detail;

CREATE TABLE db_dying.db_dying.tbl_schedule_detail (
	id bigint NOT NULL,
	id_schedule bigint DEFAULT NULL NULL,
	no_urut varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_mesin varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	userid varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_schedule_detail_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX id_schedule ON db_dying.db_dying.tbl_schedule_detail (id_schedule);


-- db_dying.db_dying.tbl_schedule_now definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_schedule_now;

CREATE TABLE db_dying.db_dying.tbl_schedule_now (
	id bigint NOT NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	nodemand varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kapasitas int DEFAULT NULL NULL,
	loading decimal(5,2) DEFAULT NULL NULL,
	no_mesin varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	mc_from varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_urut varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	no_sch int DEFAULT NULL NULL,
	no_resep varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_resep2 varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	resep varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kategori_warna varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	proses varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	energi varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	dyestuff varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_masuk date DEFAULT NULL NULL,
	personil varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	acc_staff varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ket_status varchar(18) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	langganan varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	buyer varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	po varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_hanger varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_item varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_delivery date DEFAULT NULL NULL,
	lebar int DEFAULT NULL NULL,
	gramasi int DEFAULT NULL NULL,
	warna varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	qty_order numeric(12,2) DEFAULT NULL NULL,
	pjng_order numeric(12,2) DEFAULT NULL NULL,
	satuan_order varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	rol int DEFAULT NULL NULL,
	bruto numeric(12,2) DEFAULT NULL NULL,
	no_rajut varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	g_shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	status varchar(12) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'antri mesin' NOT NULL,
	operation varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	target decimal(3) DEFAULT NULL NULL,
	revisi int DEFAULT 0 NULL,
	ket_kain varchar(19) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kk_kestabilan varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'0' NULL,
	kk_normal varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'0' NULL,
	tgl_mulai datetime2(0) DEFAULT NULL NULL,
	tgl_stop datetime2(0) DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_schedule_now_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX kapasitas ON db_dying.db_dying.tbl_schedule_now (kapasitas);
CREATE NONCLUSTERED INDEX no_mesin ON db_dying.db_dying.tbl_schedule_now (no_mesin);
CREATE NONCLUSTERED INDEX no_urut ON db_dying.db_dying.tbl_schedule_now (no_urut);
CREATE NONCLUSTERED INDEX nokk ON db_dying.db_dying.tbl_schedule_now (nokk);
CREATE NONCLUSTERED INDEX proses ON db_dying.db_dying.tbl_schedule_now (proses);
CREATE NONCLUSTERED INDEX status ON db_dying.db_dying.tbl_schedule_now (status);


-- db_dying.db_dying.tbl_setting_mesin definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_setting_mesin;

CREATE TABLE db_dying.db_dying.tbl_setting_mesin (
	id bigint NOT NULL,
	nokk varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	langganan varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	buyer varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	po varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_hanger varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_item varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_delivery date DEFAULT NULL NULL,
	lebar int DEFAULT NULL NULL,
	gramasi int DEFAULT NULL NULL,
	warna varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	qty_order numeric(12,2) DEFAULT NULL NULL,
	pnjg_order numeric(12,2) DEFAULT NULL NULL,
	satuan_order varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lot varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	rol int DEFAULT NULL NULL,
	bruto numeric(12,2) DEFAULT NULL NULL,
	pjng_kain numeric(12,2) DEFAULT NULL NULL,
	kapasitas varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_mc varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	loading decimal(5,2) DEFAULT NULL NULL,
	prod_order varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	prod_demand varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_program varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	l_r varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	l_r_poly varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	cycle_time int DEFAULT NULL NULL,
	masukkain varchar(11) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	rpm int DEFAULT NULL NULL,
	tekanan decimal(7,2) DEFAULT NULL NULL,
	tekanan_poly decimal(7,2) DEFAULT NULL NULL,
	nozzle int DEFAULT NULL NULL,
	nozzle_poly int DEFAULT NULL NULL,
	blower decimal(5,2) DEFAULT NULL NULL,
	blower_poly decimal(5,2) DEFAULT NULL NULL,
	plaiter varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jumlah_test varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	catatan varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	alur_proses varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	file_gambar varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat datetime2(0) DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_setting_mesin_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_spectro definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_spectro;

CREATE TABLE db_dying.db_dying.tbl_spectro (
	id bigint NOT NULL,
	nokk varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	langganan varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_order varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	buyer varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_item varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_hanger varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis_kain varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	lebar numeric(5,2) DEFAULT NULL NULL,
	gramasi numeric(6,2) DEFAULT NULL NULL,
	warna varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_warna varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_lot varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	qty_order numeric(12,2) DEFAULT NULL NULL,
	rcode varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	no_mc varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	l_r varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	loading numeric(12,2) DEFAULT NULL NULL,
	kapasitas int DEFAULT NULL NULL,
	tgl_buat date DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_spectro_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX tbl_spectro_nokk_IDX ON db_dying.db_dying.tbl_spectro (nokk);


-- db_dying.db_dying.tbl_staff definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_staff;

CREATE TABLE db_dying.db_dying.tbl_staff (
	id int NOT NULL,
	nama varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jabatan varchar(14) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_staff_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX nama ON db_dying.db_dying.tbl_staff (nama);


-- db_dying.db_dying.tbl_std_jam definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_std_jam;

CREATE TABLE db_dying.db_dying.tbl_std_jam (
	id int NOT NULL,
	kode varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	jenis varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	target int DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_std_jam_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_stopmesin definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_stopmesin;

CREATE TABLE db_dying.db_dying.tbl_stopmesin (
	id bigint NOT NULL,
	no_stop varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	g_shift varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kapasitas int DEFAULT NULL NULL,
	no_mesin varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	proses varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	kd_stopmc varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	mulai datetime2(0) DEFAULT NULL NULL,
	selesai datetime2(0) DEFAULT NULL NULL,
	keterangan varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_buat date DEFAULT NULL NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_stopmesin_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_tahapan_matching definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_tahapan_matching;

CREATE TABLE db_dying.db_dying.tbl_tahapan_matching (
	id int DEFAULT NULL NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	[desc] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL
);


-- db_dying.db_dying.tbl_tahapan_matching_history definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_tahapan_matching_history;

CREATE TABLE db_dying.db_dying.tbl_tahapan_matching_history (
	id int NOT NULL,
	id_matching int DEFAULT NULL NULL,
	operator_matcher varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	created_at datetime2(0) NOT NULL,
	id_tahapan int DEFAULT NULL NULL,
	tahapan varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	percobaan_ke varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_tahapan_matching_history_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_tjawabdttest definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_tjawabdttest;

CREATE TABLE db_dying.db_dying.tbl_tjawabdttest (
	id bigint NOT NULL,
	nama varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_tjawabdttest_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX nama ON db_dying.db_dying.tbl_tjawabdttest (nama);


-- db_dying.db_dying.tbl_urut definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_urut;

CREATE TABLE db_dying.db_dying.tbl_urut (
	id int NOT NULL,
	no_urut int DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_urut_id PRIMARY KEY (id)
);


-- db_dying.db_dying.tbl_user definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_user;

CREATE TABLE db_dying.db_dying.tbl_user (
	id int NOT NULL,
	nama varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	username varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	password varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	dept varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	[level] varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	status varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	foto varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT N'avatar' NULL,
	tgl_update datetime2(0) DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_user_id PRIMARY KEY (id)
);
CREATE NONCLUSTERED INDEX dept ON db_dying.db_dying.tbl_user (dept);


-- db_dying.db_dying.tbl_ncp_detail definition

-- Drop table

-- DROP TABLE db_dying.db_dying.tbl_ncp_detail;

CREATE TABLE db_dying.db_dying.tbl_ncp_detail (
	id bigint NOT NULL,
	id_ncp bigint NOT NULL,
	nokk varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	acc_celup varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	tgl_proses date DEFAULT NULL NULL,
	no_mc varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	shift varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	peng_jawab varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	perbaikan varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	analisa varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK_tbl_ncp_detail_id PRIMARY KEY (id),
	CONSTRAINT tbl_ncp_detail$id_ncp FOREIGN KEY (id_ncp) REFERENCES db_dying.db_dying.tbl_ncp(id)
);
CREATE NONCLUSTERED INDEX id_ncp ON db_dying.db_dying.tbl_ncp_detail (id_ncp);