DROP VIEW ITXVIEWKGBRUTOBONORDER2;
--CREATE VIEW ITXVIEWKGBRUTOBONORDER2 AS 
SELECT
--	DISTINCT 
    PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE,
    PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE,
    PRODUCTIONDEMAND.CODE,
    PRODUCTIONDEMAND.ITEMTYPEAFICODE AS ITEMTYPE_DEMAND,
    PRODUCTIONDEMAND.SUBCODE01,
    PRODUCTIONDEMAND.SUBCODE02,
    PRODUCTIONDEMAND.SUBCODE03,
    PRODUCTIONDEMAND.SUBCODE04,
    PRODUCTIONRESERVATION.ITEMTYPEAFICODE AS ITEMTYPE_RESERV,
    PRODUCTIONRESERVATION.USERPRIMARYUOMCODE,
    PRODUCTIONRESERVATION.USERPRIMARYQUANTITY,
    a.VALUESTRING,
    s.LINESTATUS 
FROM
    PRODUCTIONDEMAND PRODUCTIONDEMAND
LEFT OUTER JOIN PRODUCTIONRESERVATION PRODUCTIONRESERVATION ON PRODUCTIONDEMAND.CODE = PRODUCTIONRESERVATION.ORDERCODE
LEFT OUTER JOIN ADSTORAGE a ON a.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a.FIELDNAME = 'OriginalPDCode'
LEFT JOIN SALESORDERLINE s ON s.SALESORDERCODE = PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE AND s.ORDERLINE = PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE 
WHERE
    PRODUCTIONDEMAND.ITEMTYPEAFICODE = 'KFF' AND PRODUCTIONRESERVATION.ITEMTYPEAFICODE = 'KGF' AND a.VALUESTRING IS NULL AND s.LINESTATUS = 1
--    AND PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE = 'DOM2300726' 
--    AND PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE = '60'