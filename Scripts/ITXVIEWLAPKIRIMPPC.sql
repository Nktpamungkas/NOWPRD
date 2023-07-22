DROP VIEW ITXVIEWLAPKIRIMPPC;
--CREATE VIEW ITXVIEWLAPKIRIMPPC AS
SELECT
    DISTINCT 
    SALESDOCUMENT.PROVISIONALCODE,
    SALESDOCUMENT.DEFINITIVEDOCUMENTDATE,
    SALESDOCUMENT.ORDERPARTNERBRANDCODE,
    CASE
        WHEN SALESDOCUMENT.EXTERNALREFERENCE IS NULL THEN SALESDOCUMENTLINE.EXTERNALREFERENCE
        ELSE SALESDOCUMENT.EXTERNALREFERENCE
    END AS PO_NUMBER,
    SALESDOCUMENT.PROJECTCODE,
    SALESDOCUMENT.GOODSISSUEDATE,
    SALESDOCUMENT.ORDPRNCUSTOMERSUPPLIERCODE,
    SALESDOCUMENT.PAYMENTMETHODCODE,
    CASE
        WHEN TRIM(i.EXTERNALITEMCODE) IS NULL THEN TRIM(SALESDOCUMENTLINE.SUBCODE02) || '' || TRIM(SALESDOCUMENTLINE.SUBCODE03)
        ELSE TRIM(i.EXTERNALITEMCODE)
    END AS EXTERNALITEMCODE,    
    SALESDOCUMENTLINE.ITEMTYPEAFICODE,
    SALESDOCUMENTLINE.SUBCODE01,
    SALESDOCUMENTLINE.SUBCODE02,
    SALESDOCUMENTLINE.SUBCODE03,
    SALESDOCUMENTLINE.SUBCODE04,
    SALESDOCUMENTLINE.SUBCODE05,
    SALESDOCUMENTLINE.SUBCODE06,
    SALESDOCUMENTLINE.SUBCODE07,
    SALESDOCUMENTLINE.SUBCODE08,
    SALESDOCUMENTLINE.DLVSALORDERLINESALESORDERCODE,
    SALESDOCUMENTLINE.DLVSALESORDERLINEORDERLINE,
    SALESDOCUMENTLINE.ITEMDESCRIPTION,
    SALESDOCUMENTLINE.ORDERLINE,
    A.LOTCODE AS LOTCODE,
--    LISTAGG(TRIM(A.LOTCODE), ', ') AS LOTCODE,
--    DBL.PRODUCTIONDEMANDCODE,
    ITXVIEWALLOCATIONLAPKIRIMPPC.CODE
FROM
    SALESDOCUMENT SALESDOCUMENT
LEFT JOIN SALESDOCUMENTLINE SALESDOCUMENTLINE ON SALESDOCUMENT.PROVISIONALCODE = SALESDOCUMENTLINE.SALESDOCUMENTPROVISIONALCODE
LEFT JOIN ITXVIEWALLOCATIONLAPKIRIMPPC ITXVIEWALLOCATIONLAPKIRIMPPC ON ITXVIEWALLOCATIONLAPKIRIMPPC.ORDERCODE = SALESDOCUMENTLINE.SALESDOCUMENTPROVISIONALCODE AND ITXVIEWALLOCATIONLAPKIRIMPPC.ORDERLINE = SALESDOCUMENTLINE.ORDERLINE
LEFT JOIN (
    SELECT
        ALLOCATION.CODE,
        ALLOCATION.LOTCODE
    FROM
        ALLOCATION ALLOCATION 
    WHERE
        ALLOCATION.DETAILTYPE = '0' AND ALLOCATION.ORIGINTRNTRANSACTIONNUMBER IS NULL
    GROUP BY
        ALLOCATION.CODE,
        ALLOCATION.LOTCODE
) A ON ITXVIEWALLOCATIONLAPKIRIMPPC.CODE = A.CODE 
LEFT JOIN ITXVIEWORDERITEMLINKACTIVE i ON i.ORDPRNCUSTOMERSUPPLIERCODE = SALESDOCUMENT.ORDPRNCUSTOMERSUPPLIERCODE
    AND i.ITEMTYPEAFICODE = SALESDOCUMENTLINE.ITEMTYPEAFICODE
    AND i.SUBCODE01 = SALESDOCUMENTLINE.SUBCODE01
    AND i.SUBCODE02 = SALESDOCUMENTLINE.SUBCODE02
    AND i.SUBCODE03 = SALESDOCUMENTLINE.SUBCODE03
    AND i.SUBCODE04 = SALESDOCUMENTLINE.SUBCODE04
    AND i.SUBCODE05 = SALESDOCUMENTLINE.SUBCODE05
    AND i.SUBCODE06 = SALESDOCUMENTLINE.SUBCODE06
    AND i.SUBCODE07 = SALESDOCUMENTLINE.SUBCODE07
    AND i.SUBCODE08 = SALESDOCUMENTLINE.SUBCODE08
    AND i.SUBCODE09 = SALESDOCUMENTLINE.SUBCODE09
    AND i.SUBCODE10 = SALESDOCUMENTLINE.SUBCODE10
LEFT JOIN ITXVIEW_DEMANDBYLOTCODE DBL ON DBL.PRODUCTIONORDERCODE = A.LOTCODE AND DBL.DLVSALESORDERLINEORDERLINE = SALESDOCUMENTLINE.DLVSALESORDERLINEORDERLINE
WHERE SALESDOCUMENT.PROVISIONALCODE = 'DRP2300641'
GROUP BY
	A.LOTCODE,
--	DBL.PRODUCTIONDEMANDCODE,
    SALESDOCUMENT.PROVISIONALCODE,
    SALESDOCUMENT.DEFINITIVEDOCUMENTDATE,
    SALESDOCUMENT.ORDERPARTNERBRANDCODE,
    SALESDOCUMENT.EXTERNALREFERENCE,
    SALESDOCUMENTLINE.EXTERNALREFERENCE,
    SALESDOCUMENT.PROJECTCODE,
    SALESDOCUMENT.GOODSISSUEDATE,
    SALESDOCUMENT.ORDPRNCUSTOMERSUPPLIERCODE,
    SALESDOCUMENT.PAYMENTMETHODCODE,
    SALESDOCUMENTLINE.ITEMTYPEAFICODE,
    SALESDOCUMENTLINE.SUBCODE01,
    SALESDOCUMENTLINE.SUBCODE02,
    SALESDOCUMENTLINE.SUBCODE03,
    SALESDOCUMENTLINE.SUBCODE04,
    SALESDOCUMENTLINE.SUBCODE05,
    SALESDOCUMENTLINE.SUBCODE06,
    SALESDOCUMENTLINE.SUBCODE07,
    SALESDOCUMENTLINE.SUBCODE08,
    SALESDOCUMENTLINE.DLVSALORDERLINESALESORDERCODE,
    SALESDOCUMENTLINE.DLVSALESORDERLINEORDERLINE,
    SALESDOCUMENTLINE.ITEMDESCRIPTION,
    SALESDOCUMENTLINE.ORDERLINE,
    ITXVIEWALLOCATIONLAPKIRIMPPC.CODE,
    i.EXTERNALITEMCODE;