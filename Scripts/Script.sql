SELECT 
	SUBSTR(a.VALUESTRING, 5) AS OriginalPdCode,
	TRIM(p.CODE) AS DEMAND
FROM
	 ADSTORAGE a
LEFT JOIN PRODUCTIONDEMAND p ON p.ABSUNIQUEID = a.UNIQUEID 
WHERE
 	SUBSTR(a.VALUESTRING, 5) IN ('00140432')
 	AND a.FIELDNAME = 'OriginalPDCode'
 	
SELECT DISTINCT 
    p.PRODUCTIONORDERCODE,
    p.PRODUCTIONDEMANDCODE,
    isp.CODE,
    isp.PROVISIONALCODE AS SURAT_JALAN
FROM 
    PRODUCTIONDEMANDSTEP p
LEFT JOIN PRODUCTIONDEMAND p2 ON p2.CODE = p.PRODUCTIONDEMANDCODE
LEFT JOIN ITXVIEW_ALLOCATION_SURATJALAN_PPC iasp ON iasp.LOTCODE = p.PRODUCTIONORDERCODE 
RIGHT JOIN ITXVIEW_SURATJALAN_PPC_FOR_POSELESAI isp ON isp.CODE = iasp.CODE 
WHERE
    p.PRODUCTIONDEMANDCODE IN ('00156864','00158630','00159315','00159739')
    
    
SELECT 
--    isp.CODE,
--    isp.GOODSISSUEDATE AS TGL_KIRIM,
--    CASE
--        WHEN isp.PAYMENTMETHODCODE = 'FOC' THEN isp.PAYMENTMETHODCODE
--        ELSE ''
--    END AS FOC,
    SUM(iasp.BASEPRIMARYQUANTITY) AS QTY_KIRIM_KG,
    CASE
        WHEN isp.PRICEUNITOFMEASURECODE = 'yd' THEN SUM(iasp.BASESECONDARYQUANTITY) 
        WHEN isp.PRICEUNITOFMEASURECODE = 'kg' THEN SUM(iasp.BASESECONDARYQUANTITY)
        WHEN isp.PRICEUNITOFMEASURECODE = 'm' THEN SUM(round(iasp.BASESECONDARYQUANTITY * 0.9144, 2))
    END AS QTY_KIRIM_YARD_MTR
FROM 
    ITXVIEW_SURATJALAN_PPC_FOR_POSELESAI isp 
LEFT JOIN ITXVIEW_ALLOCATION_SURATJALAN_PPC iasp ON iasp.CODE = isp.CODE 
WHERE 
    isp.CODE IN ('000000450741','000000452779')
GROUP BY
--    isp.CODE,
--    isp.GOODSISSUEDATE,
--    isp.PAYMENTMETHODCODE,
    isp.PRICEUNITOFMEASURECODE
    
    
    
    
SELECT 12345.45;