DROP VIEW ITXVIEW_POSISIKK_MUTASI;
--CREATE VIEW ITXVIEW_POSISIKK_MUTASI AS
SELECT 
	DISTINCT 
	p.PROGRESSSTARTPROCESSDATE,
	p.OPERATIONCODE,
	p.PRODUCTIONORDERCODE,
	p2.DEMANDSTEPPRODUCTIONDEMANDCODE
FROM
	 PRODUCTIONPROGRESS p
LEFT JOIN PRODUCTIONPROGRESSSTEPUPDATED p2 ON p2.PROPROGRESSPROGRESSNUMBER = p.PROGRESSNUMBER AND p.PROGRESSTEMPLATECODE = 'S01'
WHERE
--	p.PROGRESSSTARTPROCESSDATE BETWEEN '2023-10-01' AND '2023-10-01'
--	AND
	p.OPERATIONCODE ='GKJ1'
	