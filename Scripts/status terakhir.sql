SELECT 
    p.PRODUCTIONORDERCODE, p.PRODUCTIONDEMANDCODE, p.GROUPSTEPNUMBER, p.OPERATIONCODE, p.LONGDESCRIPTION, p.PROGRESSSTATUS, wc.LONGDESCRIPTION AS DEPT, p.WORKCENTERCODE,
    CASE
		WHEN p.PROGRESSSTATUS = 0 THEN 'Entered'
		WHEN p.PROGRESSSTATUS = 1 THEN 'Planned'
		WHEN p.PROGRESSSTATUS = 2 THEN 'Progress'
		WHEN p.PROGRESSSTATUS = 3 THEN 'Closed'
	END AS STATUS_OPERATION
FROM 
	PRODUCTIONDEMANDSTEP p
LEFT JOIN WORKCENTER wc ON wc.CODE = p.WORKCENTERCODE
WHERE 
	p.PRODUCTIONORDERCODE = '00033060' AND p.PRODUCTIONDEMANDCODE = '00077917' AND p.PROGRESSSTATUS = 0
--		AND p.GROUPSTEPNUMBER = ( SELECT MIN(GROUPSTEPNUMBER) FROM PRODUCTIONDEMANDSTEP WHERE PRODUCTIONORDERCODE = '00035795')
ORDER BY p.GROUPSTEPNUMBER ASC LIMIT 1