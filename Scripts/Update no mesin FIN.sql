SELECT
	DISTINCT 
	SUBSTR(TRIM(p.WORKCENTERCODE), 1, 4) AS WORKCENTERCODE,
	SUBSTR(TRIM(p.WORKCENTERCODE), 1,4) AS WORKCENTERCODE_CODE,
	w.OPERATIONCODE,
	w2.LONGDESCRIPTION
FROM
	WORKCENTERANDOPERATTRIBUTES w
LEFT JOIN OPERATION o ON o.CODE = w.OPERATIONCODE 
LEFT JOIN PRODUCTIONDEMANDSTEP p ON p.OPERATIONCODE = o.CODE 
LEFT JOIN WORKCENTER w2 ON w2.CODE = p.WORKCENTERCODE 
WHERE
	NOT w.LONGDESCRIPTION = 'JANGAN DIPAKE'
	AND TRIM(o.OPERATIONGROUPCODE) = 'FIN'
	
	
SELECT
	SUBSTR(TRIM(CODE), 3, 2) ||	SUBSTR(TRIM(CODE), LENGTH(TRIM(CODE)) - 1, 2) NO_MESIN, 
	TRIM(CODE) AS CODE,
	LONGDESCRIPTION,
	SHORTDESCRIPTION,
	SEARCHDESCRIPTION,
	SUBSTR(CREATIONDATETIME, 1, 10) || ' ' || SUBSTR(CREATIONDATETIME, 12, 2) || ':' || SUBSTR(CREATIONDATETIME, 15, 2) || ':' || SUBSTR(CREATIONDATETIME, 18, 2) AS CREATIONDATETIME,
	CREATIONUSER 
FROM
	RESOURCES r
WHERE
	SUBSTR(CODE, 1,4) IN ('P3BC','P3CP','P3DR','P3IN','P3LI','P3NC','P3PA','P3QC','P3SM','P3ST','P3WT')
ORDER BY
	SUBSTR(TRIM(CODE), 3, 2) ||	SUBSTR(TRIM(CODE), LENGTH(TRIM(CODE)) - 1, 2) ASC, CODE ASC