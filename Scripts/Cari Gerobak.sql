SELECT 
    PRODUCTIONORDERCODE,
    REPLACE(LISTAGG( '`'|| PRODUCTIONDEMANDCODE || '`', ', '), '`', '''')  AS PRODUCTIONDEMANDCODE2,
    LISTAGG(PRODUCTIONDEMANDCODE, ', ')  AS PRODUCTIONDEMANDCODE,
    STEPNUMBER,
    OPERATIONCODE,
    STATUS_OPERATION,
    OPERATIONGROUPCODE
FROM
    (SELECT	
        TRIM(p.PRODUCTIONORDERCODE) AS PRODUCTIONORDERCODE,
        TRIM(p.PRODUCTIONDEMANDCODE) AS PRODUCTIONDEMANDCODE,
        p.STEPNUMBER,
        TRIM(p.OPERATIONCODE) AS OPERATIONCODE,
        CASE
            WHEN p.PROGRESSSTATUS = 0 THEN 'Entered'
            WHEN p.PROGRESSSTATUS = 1 THEN 'Planned'
            WHEN p.PROGRESSSTATUS = 2 THEN 'Progress'
            WHEN p.PROGRESSSTATUS = 3 THEN 'Closed'
        END AS STATUS_OPERATION,
        TRIM(o.OPERATIONGROUPCODE) AS OPERATIONGROUPCODE,
        ROW_NUMBER() OVER (PARTITION BY p.PRODUCTIONORDERCODE, p.PRODUCTIONDEMANDCODE ORDER BY p.STEPNUMBER) AS RN
    FROM
        PRODUCTIONDEMANDSTEP p
    LEFT JOIN OPERATION o ON o.CODE = p.OPERATIONCODE 
    WHERE 
		TRIM(p.PROGRESSSTATUS) IN ('2', '0')
		AND  TRIM(o.OPERATIONGROUPCODE) = 'QC'
		AND p.PRODUCTIONDEMANDCODE = '00183817'
        -- AND p.PRODUCTIONDEMANDCODE = '00219204'
        -- AND p.PRODUCTIONDEMANDCODE = '00221530'
        -- AND p.PRODUCTIONDEMANDCODE = '00227787'
        -- AND p.PRODUCTIONDEMANDCODE = '00213125'
        AND p.CREATIONDATETIME >= '2023-11-01'
        AND NOT p.PRODUCTIONORDERCODE IS NULL)
WHERE
    RN = 1
    AND NOT OPERATIONCODE = 'BAT1'
GROUP BY 
    PRODUCTIONORDERCODE,
    STEPNUMBER,
    OPERATIONCODE,
    STATUS_OPERATION,
    OPERATIONGROUPCODE
    
SELECT
    p.STEPNUMBER AS STEPNUMBER,
    TRIM(p.OPERATIONCODE) AS OPERATIONCODE,
    TRIM(o.OPERATIONGROUPCODE) AS DEPT,
    o.LONGDESCRIPTION,
    CASE
        WHEN p.PROGRESSSTATUS = 0 THEN 'Entered'
        WHEN p.PROGRESSSTATUS = 1 THEN 'Planned'
        WHEN p.PROGRESSSTATUS = 2 THEN 'Progress'
        WHEN p.PROGRESSSTATUS = 3 THEN 'Closed'
    END AS STATUS_OPERATION,
    iptip.MULAI,
    iptop.SELESAI,
    p.PRODUCTIONORDERCODE,
    p.PRODUCTIONDEMANDCODE,
    iptip.LONGDESCRIPTION AS OP1,
    iptop.LONGDESCRIPTION AS OP2,
    CASE
    	WHEN TRIM(p.OPERATIONCODE) = 'DYE2' THEN 'Poly'
    	WHEN TRIM(p.OPERATIONCODE) = 'DYE4' THEN 'Cotton'
    	ELSE LISTAGG(FLOOR(idqd.VALUEQUANTITY), ', ')
    END AS GEROBAK
FROM 
    PRODUCTIONDEMANDSTEP p 
LEFT JOIN OPERATION o ON o.CODE = p.OPERATIONCODE 
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = o.ABSUNIQUEID AND a.FIELDNAME = 'Gerobak'
LEFT JOIN ITXVIEW_POSISIKK_TGL_IN_PRODORDER iptip ON iptip.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE AND iptip.DEMANDSTEPSTEPNUMBER = p.STEPNUMBER
LEFT JOIN ITXVIEW_POSISIKK_TGL_OUT_PRODORDER iptop ON iptop.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE AND iptop.DEMANDSTEPSTEPNUMBER = p.STEPNUMBER
LEFT JOIN ITXVIEW_DETAIL_QA_DATA idqd ON idqd.PRODUCTIONDEMANDCODE = p.PRODUCTIONDEMANDCODE AND idqd.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE
                                    AND idqd.OPERATIONCODE = p.OPERATIONCODE 
                                    AND (idqd.CHARACTERISTICCODE = 'GRB1' OR
                                        idqd.CHARACTERISTICCODE = 'GRB2' OR
                                        idqd.CHARACTERISTICCODE = 'GRB3' OR
                                        idqd.CHARACTERISTICCODE = 'GRB4' OR
                                        idqd.CHARACTERISTICCODE = 'GRB5' OR
                                        idqd.CHARACTERISTICCODE = 'GRB6' OR
                                        idqd.CHARACTERISTICCODE = 'GRB7' OR
                                        idqd.CHARACTERISTICCODE = 'GRB8')
                                    AND NOT (idqd.VALUEQUANTITY = 9 OR idqd.VALUEQUANTITY = 999 OR idqd.VALUEQUANTITY = 1 OR idqd.VALUEQUANTITY = 9999 OR idqd.VALUEQUANTITY = 99999 OR idqd.VALUEQUANTITY = 99 OR idqd.VALUEQUANTITY = 91)
WHERE
    p.PRODUCTIONORDERCODE  = '00099352'
    AND p.PRODUCTIONDEMANDCODE IN ('00183817')
    -- AND NOT idqd.VALUEQUANTITY IS NULL
    AND p.STEPNUMBER < '601'
    AND a.VALUEBOOLEAN IS NULL
GROUP BY
    p.PRODUCTIONORDERCODE,
    p.STEPNUMBER,
    p.OPERATIONCODE,
    o.LONGDESCRIPTION,
    o.OPERATIONGROUPCODE,
    p.PROGRESSSTATUS,
    iptip.MULAI,
    iptop.SELESAI,
    p.PRODUCTIONORDERCODE,
    p.PRODUCTIONDEMANDCODE,
    iptip.LONGDESCRIPTION,
    iptop.LONGDESCRIPTION
ORDER BY 
    p.STEPNUMBER
DESC
LIMIT 1
    
SELECT
    CASE
    	WHEN TRIM(p.OPERATIONCODE) = 'DYE2' OR TRIM(p.OPERATIONCODE) = 'DYE4' THEN '0'
    	WHEN TRIM(p.OPERATIONCODE) = 'DYE4' THEN '0'
    	ELSE COUNT(*)
    END AS GEROBAK
FROM 
    PRODUCTIONDEMANDSTEP p 
LEFT JOIN OPERATION o ON o.CODE = p.OPERATIONCODE 
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = o.ABSUNIQUEID AND a.FIELDNAME = 'Gerobak'
--LEFT JOIN ITXVIEW_POSISIKK_TGL_IN_PRODORDER iptip ON iptip.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE AND iptip.DEMANDSTEPSTEPNUMBER = p.STEPNUMBER
--LEFT JOIN ITXVIEW_POSISIKK_TGL_OUT_PRODORDER iptop ON iptop.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE AND iptop.DEMANDSTEPSTEPNUMBER = p.STEPNUMBER
LEFT JOIN ITXVIEW_DETAIL_QA_DATA idqd ON idqd.PRODUCTIONDEMANDCODE = p.PRODUCTIONDEMANDCODE AND idqd.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE
                                    AND idqd.OPERATIONCODE = p.OPERATIONCODE 
                                    AND (idqd.CHARACTERISTICCODE = 'GRB1' OR
                                        idqd.CHARACTERISTICCODE = 'GRB2' OR
                                        idqd.CHARACTERISTICCODE = 'GRB3' OR
                                        idqd.CHARACTERISTICCODE = 'GRB4' OR
                                        idqd.CHARACTERISTICCODE = 'GRB5' OR
                                        idqd.CHARACTERISTICCODE = 'GRB6' OR
                                        idqd.CHARACTERISTICCODE = 'GRB7' OR
                                        idqd.CHARACTERISTICCODE = 'GRB8')
                                    AND NOT (idqd.VALUEQUANTITY = 9 OR idqd.VALUEQUANTITY = 999 OR idqd.VALUEQUANTITY = 1 OR idqd.VALUEQUANTITY = 9999 OR idqd.VALUEQUANTITY = 99999 OR idqd.VALUEQUANTITY = 99 OR idqd.VALUEQUANTITY = 91)
WHERE
    p.PRODUCTIONORDERCODE  = '00099352'
    AND p.PRODUCTIONDEMANDCODE IN ('00183817')
    AND p.STEPNUMBER = '550'
    AND a.VALUEBOOLEAN IS NULL
GROUP BY
    p.PRODUCTIONORDERCODE,
    p.STEPNUMBER,
    p.OPERATIONCODE,
    o.LONGDESCRIPTION,
    o.OPERATIONGROUPCODE,
    p.PROGRESSSTATUS,
--    iptip.MULAI,
--    iptop.SELESAI,
    p.PRODUCTIONORDERCODE,
    p.PRODUCTIONDEMANDCODE
--    iptip.LONGDESCRIPTION,
--    iptop.LONGDESCRIPTION
ORDER BY 
    p.STEPNUMBER
DESC