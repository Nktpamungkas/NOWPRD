DROP VIEW ITXVIEW_KGBRUTO;
--CREATE VIEW ITXVIEW_KGBRUTO AS
SELECT DISTINCT 	
    p.ORIGDLVSALORDLINESALORDERCODE AS PROJECTCODE,
    p.CODE,
    CASE
    	WHEN p2.ITEMTYPEAFICODE = 'WTR' THEN '0'
    	ELSE p2.PRODUCTIONORDERCODE
    END AS PRODUCTIONORDERCODE,
    p.ITEMTYPEAFICODE AS ITEMTYPE_DEMAND,
    p.SUBCODE01,
    p.SUBCODE02,
    p.SUBCODE03,
    p.SUBCODE04,
    p.SUBCODE05,
    p.SUBCODE06,
    p.SUBCODE07,
    p.SUBCODE08,
    p.SUBCODE09,
    p.SUBCODE10,
    p.ORIGDLVSALORDERLINEORDERLINE,
    CASE
    	WHEN p2.ITEMTYPEAFICODE = 'WTR' THEN '0'
    	ELSE p2.ITEMTYPEAFICODE
    END AS ITEMTYPE_RESERVATION,
    CASE
    	WHEN p2.ITEMTYPEAFICODE = 'WTR' THEN '0'
    	ELSE p2.USERPRIMARYQUANTITY
    END AS USERPRIMARYQUANTITY,
    CASE
    	WHEN p2.ITEMTYPEAFICODE = 'WTR' THEN '0'
    	ELSE p2.USERPRIMARYUOMCODE
    END AS USERPRIMARYUOMCODE,
    CASE
    	WHEN p2.ITEMTYPEAFICODE = 'WTR' THEN '0'
    	ELSE p2.USERSECONDARYQUANTITY
    END AS USERSECONDARYQUANTITY,
    CASE
    	WHEN p2.ITEMTYPEAFICODE = 'WTR' THEN '0'
    	ELSE p2.USERSECONDARYUOMCODE
    END AS USERSECONDARYUOMCODE,
    CASE
        WHEN s2.EXTERNALREFERENCE IS NULL THEN s.EXTERNALREFERENCE
        ELSE s2.EXTERNALREFERENCE
    END AS EXTERNALREFERENCE,
    s.INTERNALREFERENCE,
    a.VALUESTRING 
FROM
    PRODUCTIONDEMAND p
LEFT JOIN SALESORDERLINE s ON s.SALESORDERCODE = p.ORIGDLVSALORDLINESALORDERCODE AND s.ORDERLINE = p.ORIGDLVSALORDERLINEORDERLINE
LEFT JOIN SALESORDER s2 ON s2.CODE = s.SALESORDERCODE
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = p.ABSUNIQUEID AND a.FIELDNAME = 'OriginalPDCode'
LEFT JOIN PRODUCTIONRESERVATION p2 ON p2.ORDERCODE = p.CODE AND (p2.ITEMTYPEAFICODE = 'KGF' OR p2.ITEMTYPEAFICODE = 'FKG' OR p2.ITEMTYPEAFICODE = 'KFF')
WHERE
--    (p2.ITEMTYPEAFICODE = 'KGF' OR p2.ITEMTYPEAFICODE = 'FKG' OR p2.ITEMTYPEAFICODE = 'KFF' OR p2.ITEMTYPEAFICODE = 'WTR')
--    AND 
    (p.ITEMTYPEAFICODE = 'KFF' OR p.ITEMTYPEAFICODE = 'FKF' OR p.ITEMTYPEAFICODE = 'KGF') 
--    AND a.VALUESTRING IS NULL
--    AND p.ORIGDLVSALORDLINESALORDERCODE = 'DOM2300314' AND p.ORIGDLVSALORDERLINEORDERLINE = 20
--    AND p.CODE = '00219214'