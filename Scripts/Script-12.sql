DROP VIEW ITXVIEW_BENANGAKTUAL1;
--CREATE VIEW ITXVIEW_BENANGAKTUAL1 AS
SELECT DISTINCT
    TRIM(p.PRODUCTIONORDERCODE) AS PRODUCTIONORDERCODE,
    TRIM(s.ORDERCODE) AS ORDERCODE 
FROM  
    STOCKTRANSACTION s 
LEFT JOIN STOCKTRANSACTION s2 ON s2.ITEMELEMENTCODE = s.ITEMELEMENTCODE AND s2.TEMPLATECODE = '204'
LEFT JOIN PRODUCTIONRESERVATION p ON p.ORDERCODE = s2.LOTCODE 
WHERE
    s.TEMPLATECODE = '120' 
--    AND 
--    s.ORDERCODE = '00102963' -- PRODUCTION ORDER 
    AND SUBSTR(s.ITEMELEMENTCODE, 1,1) = '0'

DROP VIEW ITXVIEW_BENANGAKTUAL2;
--CREATE VIEW ITXVIEW_BENANGAKTUAL2 AS     
SELECT
	ORDERCODE,
	SHORTNAME,
	LONGDESCRIPTION,
	LISTAGG(TRIM(LOTCODE), ', ') AS LOTCODE	
FROM
(SELECT DISTINCT
			s.ORDERCODE,
			b.SHORTNAME,
            CASE
                WHEN LOCATE('+', s.LOTCODE) > 1 THEN SUBSTR(s.LOTCODE, 1, LOCATE('+', s.LOTCODE)-1)
                ELSE s.LOTCODE
            END AS LOTCODE,
            p2.LONGDESCRIPTION
        FROM
            STOCKTRANSACTION s
        LEFT JOIN PRODUCT p2 ON p2.ITEMTYPECODE = s.ITEMTYPECODE AND NOT 
                                    p2.ITEMTYPECODE = 'DYC' AND NOT 
                                    p2.ITEMTYPECODE = 'WTR' AND 
                                    p2.SUBCODE01 = s.DECOSUBCODE01  AND 
                                    p2.SUBCODE02 = s.DECOSUBCODE02 AND
                                    p2.SUBCODE03 = s.DECOSUBCODE03 AND 
                                    p2.SUBCODE04 = s.DECOSUBCODE04 AND
                                    p2.SUBCODE05 = s.DECOSUBCODE05 AND 
                                    p2.SUBCODE06 = s.DECOSUBCODE06 AND
                                    p2.SUBCODE07 = s.DECOSUBCODE07 
		LEFT JOIN LOT l ON l.CODE = s.LOTCODE AND NOT l.SUPPLIERCODE IS NULL
		LEFT JOIN CUSTOMERSUPPLIERDATA c ON c.CODE = l.SUPPLIERCODE 
		LEFT JOIN BUSINESSPARTNER b ON b.NUMBERID = c.BUSINESSPARTNERNUMBERID
        WHERE
            s.ORDERCODE IN ('00070050')
            AND 
            (s.TEMPLATECODE = '125' OR s.TEMPLATECODE = '120'))
GROUP BY
    LONGDESCRIPTION,    
    SHORTNAME,
    ORDERCODE