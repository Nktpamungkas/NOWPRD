SELECT
	no_absen,
	nama,
	dept,
-- 	HITUNG PERORANG
-- 	tanggal,
-- 	waktu_lembur_start,
-- 	waktu_lembur_stop,
-- 	total_jam_lembur,
-- 	(if(CASE
-- 		WHEN DATE_FORMAT(tanggal,'%w') = 0 THEN 'libur'
-- 		WHEN DATE_FORMAT(tanggal,'%w') = 1 THEN 'biasa'
-- 		WHEN DATE_FORMAT(tanggal,'%w') = 2 THEN 'biasa'
-- 		WHEN DATE_FORMAT(tanggal,'%w') = 3 THEN 'biasa'
-- 		WHEN DATE_FORMAT(tanggal,'%w') = 4 THEN 'biasa'
-- 		WHEN DATE_FORMAT(tanggal,'%w') = 5 THEN 'biasa'
-- 		WHEN DATE_FORMAT(tanggal,'%w') = 6 THEN 'libur'
-- 	END = "biasa", (total_jam_lembur * 2) - 0.5, total_jam_lembur*2)) as lembur_total
-- HITUNG KESELURUHAN
	sum(if(CASE
		WHEN DATE_FORMAT(tanggal,'%w') = 0 THEN 'libur'
		WHEN DATE_FORMAT(tanggal,'%w') = 1 THEN 'biasa'
		WHEN DATE_FORMAT(tanggal,'%w') = 2 THEN 'biasa'
		WHEN DATE_FORMAT(tanggal,'%w') = 3 THEN 'biasa'
		WHEN DATE_FORMAT(tanggal,'%w') = 4 THEN 'biasa'
		WHEN DATE_FORMAT(tanggal,'%w') = 5 THEN 'biasa'
		WHEN DATE_FORMAT(tanggal,'%w') = 6 THEN 'libur'
	END = "biasa", (total_jam_lembur * 2) - 0.5, total_jam_lembur*2)) as lembur_total,
	sum(if(CASE
		WHEN DATE_FORMAT(tanggal,'%w') = 0 THEN 'libur'
		WHEN DATE_FORMAT(tanggal,'%w') = 1 THEN 'biasa'
		WHEN DATE_FORMAT(tanggal,'%w') = 2 THEN 'biasa'
		WHEN DATE_FORMAT(tanggal,'%w') = 3 THEN 'biasa'
		WHEN DATE_FORMAT(tanggal,'%w') = 4 THEN 'biasa'
		WHEN DATE_FORMAT(tanggal,'%w') = 5 THEN 'biasa'
		WHEN DATE_FORMAT(tanggal,'%w') = 6 THEN 'libur'
	END = "biasa", (total_jam_lembur * 2) - 0.5, total_jam_lembur*2) * 24773) as lembur
FROM
	`daftar_lembur` 
WHERE
-- 	no_absen IN ('3629')
-- 	dept = 'DIT' AND 
	tanggal BETWEEN "2022-10-19" 
	AND "2022-11-18" -- AND nama = "NILOKUSUMO TRI PAMUNGKAS"
GROUP BY nama