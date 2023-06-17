                                 hapus adjustnya di modify
                                
SELECT * FROM tbl_matching WHERE no_resep LIKE '%DR22111058%'

SELECT recipe_code, SUBSTRING_INDEX(SUBSTRING_INDEX(recipe_code, ';', 1), ';', -1), SUBSTRING_INDEX(SUBSTRING_INDEX(recipe_code, ';', 2), ';', -1) FROM tbl_matching WHERE id LIKE '31981'

SELECT * FROM tbl_matching WHERE jenis_matching LIKE '%NOW%'

SELECT
	id,idm,percobaan_ke,benang_aktual,lebar_aktual,gramasi_aktual,lr,ph,rc_sh,rc_tm,soaping_sh,soaping_tm,`status`,cie_wi,cie_tint,spektro_r,done_matching,ket,selesai_by,selesai_at,tside_c,tside_min,cside_c,
	cside_min,timer,kadar_air,koreksi_resep,final_matcher,colorist1,colorist2,matcher,grp,bleaching_sh,bleaching_tm,second_lr
FROM
	`tbl_status_matching` 
WHERE
	idm = 'D22100195'

SELECT b.color_code, b.recipe_code, a.id as id_status, a.idm, a.flag, a.grp, a.matcher, a.cek_warna, a.cek_dye, a.status, a.kt_status, a.koreksi_resep, a.percobaan_ke, a.benang_aktual, a.lebar_aktual, a.gramasi_aktual, a.soaping_sh, a.soaping_tm, a.rc_sh, a.rc_tm, a.lr, a.cie_wi, a.cie_tint, a.done_matching, a.ph,
    a.spektro_r, a.ket, a.created_at as tgl_buat_status, a.created_by as status_created_by, a.edited_at, a.edited_by, a.target_selesai, a.cside_c,
    a.cside_min, a.tside_c, a.tside_min, a.mulai_by, a.mulai_at, a.selesai_by, a.selesai_at, a.approve_by, a.approve_at, a.approve,
    b.id, b.no_resep, b.no_order, b.no_po, b.langganan, b.no_item, b.jenis_kain, b.benang, b.cocok_warna, b.warna, a.kadar_air,
    b.no_warna, b.lebar, b.gramasi, b.qty_order, b.tgl_in, b.tgl_out, b.proses, b.buyer, a.final_matcher, a.colorist1, a.colorist2, 
    b.tgl_delivery, b.note, b.jenis_matching, b.tgl_buat, b.tgl_update, b.created_by, a.bleaching_sh, a.bleaching_tm, a.second_lr, a.remark_dye
    FROM tbl_status_matching a
    INNER JOIN tbl_matching b ON a.idm = b.no_resep
    where a.id = '31981'
    ORDER BY a.id desc limit 1
		
		
SELECT * FROM tbl_matching_detail WHERE id_status = '31981' order by flag;



SELECT status_resep_dye from `tbl_matching_detail` where `id_matching` = '30877' and `id_status`= '31570' and `resep` = 'dye' order by id DESC LIMIT 1
		
SELECT id, kode, subcode, nama, CASE WHEN conc1 = 0 THEN '' ELSE conc1 END AS conc1, time_1, doby1, inserted_by, last_edit_by, status_resep_dye 
FROM tbl_matching_detail where id_status = '31770' AND not resep = 'dye' order by flag

SELECT * FROM tbl_dyestuff WHERE code = '$r_cmp[kode]'

SELECT b.id AS id_matching, a.id AS id_status, b.recipe_code, a.idm AS SUFFIXCODE, b.warna, SUBSTR(a.lr, 3) AS LR,
    case
        when SUBSTRING(b.no_resep, 1,2) = 'DR' or SUBSTRING(b.no_resep, 1,2) = 'CD' or SUBSTRING(b.no_resep, 1,2) = 'OB' then CONCAT(SUBSTRING(b.no_resep, 3), 'L')
        when SUBSTRING(b.no_resep, 1,2) = 'D2' or SUBSTRING(b.no_resep, 1,2) = 'R2' or SUBSTRING(b.no_resep, 1,2) = 'A2' then CONCAT(SUBSTRING(b.no_resep, 2), 'L')
    end as no_resep_convert
FROM tbl_status_matching a
INNER JOIN tbl_matching b ON a.idm = b.no_resep
WHERE a.id = '31770'
ORDER BY a.id desc limit 1
