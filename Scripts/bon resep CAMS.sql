SELECT
    rs_reservationline,
    rs_creationdatetime,
    rs_productionordercode,
    rs_subcode01,
    rs_subcode02,
    rs_subcode03,
    CASE
        WHEN (rs_subcode02 = '' AND rs_subcode03 = '')OR(rs_subcode02 IS NULL AND rs_subcode03 IS NULL) THEN rs_subcode01
        ELSE CONCAT(rs_subcode01, '-', rs_subcode02,'-', rs_subcode03)
    END AS CODE,
    RS_USERPRIMARYQUANTITY AS ACUAN_QTY,
    RS_USEDUSERPRIMARYQUANTITY AS AKTUAL_QTY
FROM
    tab_rs 
WHERE
    rs_productionordercode LIKE '%00080741%' AND rs_reservationline > 1000 AND rs_reservationline < 1000+100 AND NOT (rs_subcode02 = '' OR rs_subcode03 = '')