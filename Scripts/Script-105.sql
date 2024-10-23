SELECT
    DISTINCT 
    LISTAGG(DISTINCT TRIM(i.SUBCODE05), ', ') AS NO_WARNA,
    i.PROVISIONALCODE,
    TRIM(i.PRICEUNITOFMEASURECODE) AS PRICEUNITOFMEASURECODE,
    i.DEFINITIVECOUNTERCODE,
    i.DEFINITIVEDOCUMENTDATE,
    i.ORDERPARTNERBRANDCODE,
    i.PO_NUMBER AS PO_NUMBER,
    i.ITEMDESCRIPTION AS JENIS_KAIN,
    LISTAGG(DISTINCT TRIM(iasp.WAREHOUSELOCATIONCODE), ', ') AS LOKASI,
    DAY(i.GOODSISSUEDATE) || '-' || MONTHNAME(i.GOODSISSUEDATE) || '-' || YEAR(i.GOODSISSUEDATE) AS GOODSISSUEDATE,
    i.ORDPRNCUSTOMERSUPPLIERCODE,
    CASE 
        WHEN i.PAYMENTMETHODCODE <> 'FOC' THEN ''
        ELSE i.PAYMENTMETHODCODE
    END AS PAYMENTMETHODCODE,
    i.ITEMTYPEAFICODE,
    i.DLVSALORDERLINESALESORDERCODE AS DLVSALORDERLINESALESORDERCODE,
    i.DLVSALESORDERLINEORDERLINE AS DLVSALESORDERLINEORDERLINE,
    LISTAGG(DISTINCT TRIM(iasp.LOTCODE), ', ' ) AS LOTCODE,
    LISTAGG(DISTINCT ''''|| TRIM(iasp.LOTCODE) ||'''', ', ' ) AS LOTCODE2,
    i2.WARNA AS WARNA,
    i.LEGALNAME1,
    i.CODE AS CODE
FROM
    ITXVIEW_SURATJALAN_PPC_FOR_POSELESAI i
LEFT JOIN ITXVIEW_ALLOCATION_SURATJALAN_PPC iasp ON
    iasp.CODE = i.CODE
LEFT JOIN ITXVIEWCOLOR i2 ON
    i2.ITEMTYPECODE = i.ITEMTYPEAFICODE
    AND i2.SUBCODE01 = i.SUBCODE01
    AND i2.SUBCODE02 = i.SUBCODE02
    AND i2.SUBCODE03 = i.SUBCODE03
    AND i2.SUBCODE04 = i.SUBCODE04
    AND i2.SUBCODE05 = i.SUBCODE05
    AND i2.SUBCODE06 = i.SUBCODE06
    AND i2.SUBCODE07 = i.SUBCODE07
    AND i2.SUBCODE08 = i.SUBCODE08
    AND i2.SUBCODE09 = i.SUBCODE09
    AND i2.SUBCODE10 = i.SUBCODE10
WHERE
--    $where_no_order $where_date 
     i.PROVISIONALCODE = 'ESP2400686'
    AND NOT (SUBSTR(i.DLVSALORDERLINESALESORDERCODE, 1,3) = 'CAP' AND (i.ITEMTYPEAFICODE = 'KFF' OR i.ITEMTYPEAFICODE = 'KGF'))
    AND i.DOCUMENTTYPETYPE = 05 
    AND NOT i.CODE IS NULL 
    AND i.PROGRESSSTATUS_SALDOC = 2
GROUP BY
    i.PROVISIONALCODE,
    i.PRICEUNITOFMEASURECODE,
    i.DEFINITIVEDOCUMENTDATE,
    i.ORDERPARTNERBRANDCODE,
    i.PO_NUMBER,
    i.PROJECTCODE,
    i.GOODSISSUEDATE,
    i.ORDPRNCUSTOMERSUPPLIERCODE,
    i.PAYMENTMETHODCODE,
    i.PO_NUMBER,
    i.ITEMTYPEAFICODE,
    i.DLVSALORDERLINESALESORDERCODE,
    i.DLVSALESORDERLINEORDERLINE,
    i.ITEMDESCRIPTION,
    i.DEFINITIVECOUNTERCODE,
    i2.WARNA,
    i.LEGALNAME1,
    i.CODE
ORDER BY
    i.PROVISIONALCODE ASC
    
    
 SELECT 
    COUNT(QUALITYREASONCODE) AS ROLL,
    SUM(FOC_KG) AS KG,
    SUM(FOC_YARDMETER) AS YARD_MTR,
    KET_YARDMETER,
    ALLOCATIONCODE
FROM
    ITXVIEW_SURATJALAN_EXIM2A
WHERE 
    QUALITYREASONCODE = 'FOC'
    AND PROVISIONALCODE = 'ESP2400686'
    AND ALLOCATIONCODE IN ('000000939485','000000939486','000000939487')
GROUP BY 
    KET_YARDMETER,
    ALLOCATIONCODE