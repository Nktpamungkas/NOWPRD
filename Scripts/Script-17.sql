SELECT DISTINCT 
    i.DEAMAND AS DEMAND,
--    LISTAGG(TRIM(i.PRODUCTIONORDERCODE), ', ') AS ORDER,
    i.PRODUCTIONORDERCODE,
    ip.LANGGANAN AS PELANGGAN,
    i.PROJECTCODE AS NOMOR_ORDER,
    (trim( i.SUBCODE02 ) || trim( i.SUBCODE03 )) AS HANGER,
    trim( i.ITEMDESCRIPTION ) AS JENISKAIN,
    trim( i.WARNA ) AS WARNA,
    trim (i.SUBCODE05) AS NO_WARNA,
    trim(ik.EXTERNALREFERENCE) AS NO_PO,
    i.LOT
FROM 
    ITXVIEWKK i
LEFT JOIN ITXVIEW_PELANGGAN ip ON ip.ORDPRNCUSTOMERSUPPLIERCODE  = i.ORDPRNCUSTOMERSUPPLIERCODE AND ip.CODE = i.PROJECTCODE
LEFT JOIN ITXVIEW_KGBRUTO ik ON ik.PROJECTCODE = i.PROJECTCODE AND ik.ORIGDLVSALORDERLINEORDERLINE = i.ORIGDLVSALORDERLINEORDERLINE AND ik.CODE = i.DEAMAND
WHERE i.DEAMAND LIKE '%00213336%'
GROUP BY 
    i.DEAMAND,
    i.PRODUCTIONORDERCODE,
    ip.LANGGANAN,
    i.PROJECTCODE,
    i.SUBCODE02,
    i.SUBCODE03,
    i.ITEMDESCRIPTION,
    i.WARNA,
    i.SUBCODE05,
    ik.EXTERNALREFERENCE,
    i.LOT