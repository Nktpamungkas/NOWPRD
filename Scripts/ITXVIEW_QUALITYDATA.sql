DROP VIEW ITXVIEW_QUALITYDATA;
--CREATE VIEW ITXVIEW_QUALITYDATA AS
SELECT
    q.PRODUCTIONORDERCODE,
    trim(q2.CHARACTERISTICCODE) AS CHARACTERISTICCODE,
    q2.VALUEQUANTITY
FROM
    QUALITYDOCUMENT q
LEFT JOIN QUALITYDOCLINE q2 ON q2.QUALITYDOCUMENTHEADERNUMBERID = q.HEADERNUMBERID AND q2.QUALITYDOCPRODUCTIONORDERCODE = q.PRODUCTIONORDERCODE
WHERE NOT q.PRODUCTIONORDERCODE IS NULL AND NOT q.PRODUCTIONORDERCODE = '' AND NOT q2.VALUEQUANTITY IS NULL
GROUP BY 
	q.PRODUCTIONORDERCODE,
    q2.CHARACTERISTICCODE,
    q2.VALUEQUANTITY