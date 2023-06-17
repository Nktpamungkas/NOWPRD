SELECT a.id AS id_matching_detail, a.*, b.* FROM tbl_matching_detail a LEFT JOIN tbl_matching b ON b.id = a.id_matching WHERE id_matching = '31564' AND id_status = '30803' order by flag

SELECT * FROM tbl_dyestuff WHERE code = 'D-1-012'