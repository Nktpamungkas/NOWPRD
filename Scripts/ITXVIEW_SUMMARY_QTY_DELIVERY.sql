DROP VIEW ITXVIEW_SUMMARY_QTY_DELIVERY;
--CREATE VIEW ITXVIEW_SUMMARY_QTY_DELIVERY AS 
SELECT
    DISTINCT
    s.ITEMTYPEAFICODE,
    s4.SALESDOCUMENTPROVISIONALCODE,
    s5.GOODSISSUEDATE,
    a2.CODE,
    iasp.LOTCODE,
    s.ORDERLINE,
    ip.LANGGANAN AS PELANGGAN,
    ip.BUYER,
    s.SALESORDERCODE AS NO_ORDER,
    s.EXTERNALREFERENCE AS NO_PO,
    TRIM(s.SUBCODE02) || '-' || TRIM(s.SUBCODE03) AS KET_PRODUCT,
    s.INTERNALREFERENCE AS STYLE,
    il.LEBAR,
    COALESCE(NULLIF(i.GRAMASI_FKF, ''), i.GRAMASI_KFF) AS GRAMASI,
    i2.WARNA,
    TRIM(s.SUBCODE05) AS NO_WARNA,
    s.PRICEUNITOFMEASURECODE,
    s.USERPRIMARYQUANTITY AS NETTO,
    TRIM(s.USERPRIMARYUOMCODE) AS SATUAN_NETTO,
    s.BASESECONDARYQUANTITY AS NETTO_2,
    TRIM(s.USERSECONDARYUOMCODE) AS SATUAN_NETTO_2,
    s.USERSECONDARYQUANTITY AS NETTO_M,
    p.SECONDARYUNSTEADYCVSFACTOR AS KONVERSI,
    COALESCE(s3.CONFIRMEDDELIVERYDATE, s2.CONFIRMEDDUEDATE) AS ACTUAL_DELIVERY,
    a2.LINENUMBER,
    (a2.USERPRIMARYQUANTITY) AS QTY_SUDAH_KIRIM,
    (a2.USERSECONDARYQUANTITY) AS QTY_SUDAH_KIRIM_2,
    CASE
        WHEN e.QUALITYREASONCODE IS NULL THEN '1'
        ELSE e.QUALITYREASONCODE
    END AS QUALITYREASONCODE
FROM
    SALESORDERLINE s
LEFT JOIN SALESORDER s2 ON s2.CODE = s.SALESORDERCODE
LEFT JOIN ITXVIEW_PELANGGAN ip ON ip.ORDPRNCUSTOMERSUPPLIERCODE = s2.ORDPRNCUSTOMERSUPPLIERCODE AND ip.CODE = s.SALESORDERCODE
LEFT JOIN ITXVIEW_KGBRUTO ik ON ik.PROJECTCODE = s.SALESORDERCODE AND ik.ORIGDLVSALORDERLINEORDERLINE = s.ORDERLINE
LEFT JOIN ITXVIEWLEBAR il ON il.SALESORDERCODE = s.SALESORDERCODE AND il.ORDERLINE = s.ORDERLINE
LEFT JOIN ITXVIEWGRAMASI i ON i.SALESORDERCODE = s.SALESORDERCODE AND i.ORDERLINE = s.ORDERLINE
LEFT JOIN ITXVIEWCOLOR i2 ON i2.ITEMTYPECODE = s.ITEMTYPEAFICODE
    AND i2.SUBCODE01 = s.SUBCODE01
    AND i2.SUBCODE02 = s.SUBCODE02
    AND i2.SUBCODE03 = s.SUBCODE03
    AND i2.SUBCODE04 = s.SUBCODE04
    AND i2.SUBCODE05 = s.SUBCODE05
    AND i2.SUBCODE06 = s.SUBCODE06
    AND i2.SUBCODE07 = s.SUBCODE07
    AND i2.SUBCODE08 = s.SUBCODE08
    AND i2.SUBCODE09 = s.SUBCODE09
    AND i2.SUBCODE10 = s.SUBCODE10
LEFT JOIN PRODUCT p ON p.ITEMTYPECODE = s.ITEMTYPEAFICODE
    AND p.SUBCODE01 = s.SUBCODE01
    AND p.SUBCODE02 = s.SUBCODE02
    AND p.SUBCODE03 = s.SUBCODE03
    AND p.SUBCODE04 = s.SUBCODE04
    AND p.SUBCODE05 = s.SUBCODE05
    AND p.SUBCODE06 = s.SUBCODE06
    AND p.SUBCODE07 = s.SUBCODE07
    AND p.SUBCODE08 = s.SUBCODE08
    AND p.SUBCODE09 = s.SUBCODE09
    AND p.SUBCODE10 = s.SUBCODE10
LEFT JOIN SALESORDERDELIVERY s3 ON s3.SALESORDERLINESALESORDERCODE = s.SALESORDERCODE AND s3.SALESORDERLINEORDERLINE = s.ORDERLINE
LEFT JOIN SALESDOCUMENTLINE s4 ON s4.DLVSALORDERLINESALESORDERCODE = s.SALESORDERCODE AND s4.DLVSALESORDERLINEORDERLINE = s.ORDERLINE
    AND s4.DOCUMENTTYPETYPE = 05 AND NOT s4.PROGRESSSTATUS = 0
LEFT JOIN ALLOCATION a ON a.ORDERCODE = s4.SALESDOCUMENTPROVISIONALCODE AND a.ORDERLINE = s4.ORDERLINE
LEFT JOIN ITXVIEW_ALLOCATION_SURATJALAN_PPC iasp ON iasp.CODE = a.CODE
LEFT JOIN ALLOCATION a2 ON a2.CODE = a.CODE AND a2.LOTCODE = iasp.LOTCODE AND NOT a2.PICKINGCODE IS NULL
LEFT JOIN SALESDOCUMENT s5 ON s5.PROVISIONALCODE = s4.SALESDOCUMENTPROVISIONALCODE
LEFT JOIN ELEMENTS e ON e.CODE = a2.ITEMELEMENTCODE
WHERE
    s.LINESTATUS = '1'
--	AND s.SALESORDERCODE = 'DOM2401566' 
    --	AND NOT e.QUALITYREASONCODE = 'FOC' 
    --	AND e.QUALITYREASONCODE IS NULL
    --    	AND s.ORDERLINE = '60'
    --	AND iasp.LOTCODE = '00143138'
GROUP BY
    s.ITEMTYPEAFICODE,
    s4.SALESDOCUMENTPROVISIONALCODE,
    s5.GOODSISSUEDATE,
    a2.CODE,
    iasp.LOTCODE,
    s.ORDERLINE,
    ip.LANGGANAN,
    ip.BUYER,
    s.SALESORDERCODE,
    s.EXTERNALREFERENCE,
    s.SUBCODE02,
    s.SUBCODE03,
    s.INTERNALREFERENCE,
    il.LEBAR,
    i.GRAMASI_KFF,
    i.GRAMASI_FKF,
    i2.WARNA,
    s.SUBCODE05,
    s.PRICEUNITOFMEASURECODE,
    s.USERPRIMARYQUANTITY,
    s.USERPRIMARYUOMCODE,
    s.BASESECONDARYQUANTITY,
    s.USERSECONDARYUOMCODE,
    s.USERSECONDARYQUANTITY,
    p.SECONDARYUNSTEADYCVSFACTOR,
    s3.CONFIRMEDDELIVERYDATE,
    s2.CONFIRMEDDUEDATE,
    a2.LINENUMBER,
    a2.USERPRIMARYQUANTITY,
    a2.USERSECONDARYQUANTITY,
    e.QUALITYREASONCODE;