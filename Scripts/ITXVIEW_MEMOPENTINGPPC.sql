-- DB2ADMIN.ITXVIEW_MEMOPENTINGPPC source
DROP VIEW ITXVIEW_MEMOPENTINGPPC;
--CREATE VIEW ITXVIEW_MEMOPENTINGPPC AS
SELECT
    DISTINCT
	i.ITEMTYPEAFICODE,
    i.ITEMTYPEAFICODE_YND,
    p2.CREATIONDATETIME AS ORDERDATE,
    TRIM(ip.LANGGANAN) || '|' || TRIM(ip.BUYER) AS PELANGGAN,
    i.PROJECTCODE AS NO_ORDER,
    ik.EXTERNALREFERENCE AS NO_PO,
    TRIM(i.SUBCODE01) || '-' || TRIM(i.SUBCODE02) || '-' || TRIM(i.SUBCODE03) || '-' || TRIM(i.SUBCODE04) || '-' ||
    TRIM(i.SUBCODE05) || '-' || TRIM(i.SUBCODE06) || '-' || TRIM(i.SUBCODE07) || '-' || TRIM(i.SUBCODE08) AS KETERANGAN_PRODUCT,
    i4.WARNA AS WARNA,
    i.SUBCODE05 AS NO_WARNA,
    i.DELIVERYDATE AS DELIVERY,
    p.USEDUSERPRIMARYQUANTITY AS QTY_BAGIKAIN,
    in2.USERPRIMARYQUANTITY AS NETTO,
    CASE
        WHEN DAYS(now()) - DAYS(Timestamp_Format(i.DELIVERYDATE, 'YYYY-MM-DD')) < 0 THEN 0
        ELSE DAYS(now()) - DAYS(Timestamp_Format(i.DELIVERYDATE, 'YYYY-MM-DD'))
    END AS DELAY,
    i.PRODUCTIONORDERCODE AS NO_KK,
    i.DEAMAND AS DEMAND,
    i.ORDERLINE,
    TRIM(i.PROGRESSSTATUS) AS PROGRESSSTATUS,
    u.LONGDESCRIPTION AS KETERANGAN,
    i.ABSUNIQUEID_DEMAND,
    i.REQUIREDDUEDATE,
    a2.VALUESTRING AS OriginalPDCode,
    a3.VALUESTRING AS SplittedFrom,
    i.CREATIONDATETIME_SALESORDER
FROM
    ITXVIEWKK i
LEFT JOIN ITXVIEW_KGBRUTO ik ON ik.PROJECTCODE = i.PROJECTCODE
    AND ik.ORIGDLVSALORDERLINEORDERLINE = i.ORIGDLVSALORDERLINEORDERLINE
    AND ik.CODE = i.DEAMAND
LEFT JOIN ITXVIEW_RESERVATION_KK p ON p.ORDERCODE = i.PRODUCTIONDEMANDCODE
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = i.ABSUNIQUEID_DEMAND
    AND a.FIELDNAME = 'DefectTypeCode'
LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = i.ABSUNIQUEID_DEMAND
    AND a2.FIELDNAME = 'OriginalPDCode'
LEFT JOIN ADSTORAGE a3 ON a3.UNIQUEID = i.ABSUNIQUEID_DEMAND
    AND a3.FIELDNAME = 'SplittedFrom'
LEFT JOIN USERGENERICGROUP u ON u.CODE = a.VALUESTRING
    AND u.USERGENERICGROUPTYPECODE = '006'
LEFT JOIN ITXVIEWCOLOR i4 ON i4.ITEMTYPECODE = i.ITEMTYPEAFICODE
    AND i4.SUBCODE01 = i.SUBCODE01
    AND i4.SUBCODE02 = i.SUBCODE02
    AND i4.SUBCODE03 = i.SUBCODE03
    AND i4.SUBCODE04 = i.SUBCODE04
    AND i4.SUBCODE05 = i.SUBCODE05
    AND i4.SUBCODE06 = i.SUBCODE06
    AND i4.SUBCODE07 = i.SUBCODE07
    AND i4.SUBCODE08 = i.SUBCODE08
    AND i4.SUBCODE09 = i.SUBCODE09
    AND i4.SUBCODE10 = i.SUBCODE10
LEFT JOIN ITXVIEW_NETTO in2 ON in2.CODE = i.DEAMAND
    AND in2.SALESORDERLINESALESORDERCODE = i.PROJECTCODE
LEFT JOIN ITXVIEW_PELANGGAN ip ON ip.ORDPRNCUSTOMERSUPPLIERCODE = i.ORDPRNCUSTOMERSUPPLIERCODE
    AND ip.CODE = i.BONORDER
LEFT JOIN PRODUCTIONORDER p2 ON p2.CODE = i.PRODUCTIONORDERCODE
WHERE
    p.USEDUSERPRIMARYQUANTITY IS NOT NULL
    OR NOT p.USEDUSERPRIMARYQUANTITY = 0
    --    	AND i.PROJECTCODE = 'DOM2300106'
    --    AND i.DELIVERYDATE BETWEEN '2023-01-01' AND '2023-03-31';