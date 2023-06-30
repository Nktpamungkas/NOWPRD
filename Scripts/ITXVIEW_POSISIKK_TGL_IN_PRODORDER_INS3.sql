DROP VIEW ITXVIEW_POSISIKK_TGL_IN_PRODORDER_INS3;
--CREATE VIEW ITXVIEW_POSISIKK_TGL_IN_PRODORDER_INS3 AS
SELECT
	DISTINCT 
    v.PRODUCTIONORDERCODE,
    p2.OPERATIONCODE,
	p.PROPROGRESSPROGRESSNUMBER,
	p.DEMANDSTEPSTEPNUMBER,
	p2.PROGRESSTEMPLATECODE,
	(p2.PROGRESSPARTIALENDDATE || ' ' || p2.PROGRESSPARTIALENDTIME) AS MULAI
FROM
	PRODUCTIONDEMANDSTEP v
LEFT JOIN PRODUCTIONPROGRESSSTEPUPDATED p ON p.DEMANDSTEPPRODUCTIONDEMANDCODE = v.PRODUCTIONDEMANDCODE
RIGHT JOIN PRODUCTIONPROGRESS p2 ON p2.PROGRESSNUMBER = p.PROPROGRESSPROGRESSNUMBER AND p2.PROGRESSTEMPLATECODE = 'P01' AND p2.OPERATIONCODE = 'INS3'
--WHERE 
--	v.PRODUCTIONORDERCODE  = '00078961' 
--		AND p.DEMANDSTEPSTEPNUMBER = '600'	

	