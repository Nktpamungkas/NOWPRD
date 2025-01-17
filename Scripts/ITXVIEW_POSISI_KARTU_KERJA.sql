DROP VIEW ITXVIEW_POSISI_KARTU_KERJA;
--CREATE VIEW ITXVIEW_POSISI_KARTU_KERJA AS 
SELECT * FROM (SELECT
    p.PRODUCTIONORDERCODE,
    p.STEPNUMBER AS STEPNUMBER,
    CASE
        WHEN TRIM(p.PRODRESERVATIONLINKGROUPCODE) IS NULL OR TRIM(p.PRODRESERVATIONLINKGROUPCODE) = '' THEN TRIM(p.OPERATIONCODE)
        ELSE TRIM(p.PRODRESERVATIONLINKGROUPCODE)
    END AS OPERATIONCODE,
    TRIM(o.OPERATIONGROUPCODE) AS DEPT,
    o.LONGDESCRIPTION,
    CASE
        WHEN p.PROGRESSSTATUS = 0 THEN 'Entered'
        WHEN p.PROGRESSSTATUS = 1 THEN 'Planned'
        WHEN p.PROGRESSSTATUS = 2 THEN 'Progress'
        WHEN p.PROGRESSSTATUS = 3 THEN 'Closed'
    END AS STATUS_OPERATION,
    iptip.MULAI,
    CASE
        WHEN p.PROGRESSSTATUS = 3 THEN COALESCE(iptop.SELESAI, SUBSTRING(p.LASTUPDATEDATETIME, 1, 19) || '(Run Manual Closures)')
        ELSE iptop.SELESAI
    END AS SELESAI,
    p.PRODUCTIONDEMANDCODE,
    iptip.LONGDESCRIPTION AS OP1,
    iptop.LONGDESCRIPTION AS OP2,
    CASE
        WHEN a.VALUEBOOLEAN = 1 THEN 'Tidak Perlu Gerobak'
        ELSE 
            CASE
                WHEN LISTAGG(DISTINCT FLOOR(idqd.VALUEQUANTITY), ', ') = '1' THEN 'PLASTIK'
                WHEN LISTAGG(DISTINCT FLOOR(idqd.VALUEQUANTITY), ', ') = '2' THEN 'TONG'
                WHEN LISTAGG(DISTINCT FLOOR(idqd.VALUEQUANTITY), ', ') = '3' THEN 'DALAM MESIN'
                ELSE LISTAGG(DISTINCT FLOOR(idqd.VALUEQUANTITY), ', ')
            END
    END AS GEROBAK,
    idqd.WORKCENTERCODE 
FROM 
    PRODUCTIONDEMANDSTEP p 
LEFT JOIN OPERATION o ON o.CODE = p.OPERATIONCODE 
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = o.ABSUNIQUEID AND a.FIELDNAME = 'Gerobak'
LEFT JOIN ITXVIEW_POSISIKK_TGL_IN_PRODORDER iptip ON iptip.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE AND iptip.DEMANDSTEPSTEPNUMBER = p.STEPNUMBER
LEFT JOIN ITXVIEW_POSISIKK_TGL_OUT_PRODORDER iptop ON iptop.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE AND iptop.DEMANDSTEPSTEPNUMBER = p.STEPNUMBER
LEFT JOIN ITXVIEW_DETAIL_QA_DATA idqd ON idqd.PRODUCTIONDEMANDCODE = p.PRODUCTIONDEMANDCODE AND idqd.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE
                                    -- AND idqd.OPERATIONCODE = COALESCE(p.PRODRESERVATIONLINKGROUPCODE, p.OPERATIONCODE)
                                    AND idqd.OPERATIONCODE = CASE
                                                                WHEN TRIM(p.PRODRESERVATIONLINKGROUPCODE) IS NULL OR TRIM(p.PRODRESERVATIONLINKGROUPCODE) = '' THEN TRIM(p.OPERATIONCODE)
                                                                ELSE TRIM(p.PRODRESERVATIONLINKGROUPCODE)
                                                            END
                                    AND (idqd.VALUEINT = p.STEPNUMBER OR idqd.VALUEINT = p.GROUPSTEPNUMBER) 
                                    AND (idqd.CHARACTERISTICCODE = 'GRB1' OR
                                        idqd.CHARACTERISTICCODE = 'GRB2' OR
                                        idqd.CHARACTERISTICCODE = 'GRB3' OR
                                        idqd.CHARACTERISTICCODE = 'GRB4' OR
                                        idqd.CHARACTERISTICCODE = 'GRB5' OR
                                        idqd.CHARACTERISTICCODE = 'GRB6' OR
                                        idqd.CHARACTERISTICCODE = 'GRB7' OR
                                        idqd.CHARACTERISTICCODE = 'GRB8' OR
                                        idqd.CHARACTERISTICCODE = 'GRB9' OR
                                        idqd.CHARACTERISTICCODE = 'GRB10' OR
                                        idqd.CHARACTERISTICCODE = 'GRB11' OR
                                        idqd.CHARACTERISTICCODE = 'GRB12' OR
                                        idqd.CHARACTERISTICCODE = 'GRB13' OR
                                        idqd.CHARACTERISTICCODE = 'GRB14' OR
                                        idqd.CHARACTERISTICCODE = 'GRB15' OR
                                        idqd.CHARACTERISTICCODE = 'GRB16' OR
                                        idqd.CHARACTERISTICCODE = 'AREA')
                                    AND NOT (idqd.VALUEQUANTITY = 999 OR idqd.VALUEQUANTITY = 9999 OR idqd.VALUEQUANTITY = 99999 OR idqd.VALUEQUANTITY = 99 OR idqd.VALUEQUANTITY = 91)
--WHERE
--    p.PRODUCTIONORDERCODE  = '$prod_order' AND p.PRODUCTIONDEMANDCODE = '$demand'  
GROUP BY
    p.PRODUCTIONORDERCODE,
    p.STEPNUMBER,
    p.OPERATIONCODE,
    p.PRODRESERVATIONLINKGROUPCODE,
    o.OPERATIONGROUPCODE,
    o.LONGDESCRIPTION,
    p.PROGRESSSTATUS,
    iptip.MULAI,
    iptop.SELESAI,
    p.LASTUPDATEDATETIME,
    p.PRODUCTIONORDERCODE,
    p.PRODUCTIONDEMANDCODE,
    iptip.LONGDESCRIPTION,
    iptop.LONGDESCRIPTION,
    a.VALUEBOOLEAN,
    idqd.WORKCENTERCODE 
ORDER BY p.STEPNUMBER ASC)