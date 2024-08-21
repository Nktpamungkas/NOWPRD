SELECT DISTINCT 
    p.PRODUCTIONORDERCODE,
    p.PRODUCTIONDEMANDCODE,
    p.STEPNUMBER,
    TRIM(p.OPERATIONCODE) AS OPERATIONCODE,
    TIMESTAMP(iptip.MULAI) AS MULAI,
    TIMESTAMP(iptop.SELESAI) AS SELESAI
FROM 
    PRODUCTIONDEMANDSTEP p 
LEFT JOIN ITXVIEW_POSISIKK_TGL_IN_PRODORDER iptip ON iptip.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE AND iptip.DEMANDSTEPSTEPNUMBER = p.STEPNUMBER
LEFT JOIN ITXVIEW_POSISIKK_TGL_OUT_PRODORDER iptop ON iptop.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE AND iptop.DEMANDSTEPSTEPNUMBER = p.STEPNUMBER
WHERE
    p.PRODUCTIONORDERCODE  = '00157859' 
    AND p.PRODUCTIONDEMANDCODE = '00275405'
--    AND NOT iptip.MULAI IS NULL
ORDER BY p.STEPNUMBER ASC