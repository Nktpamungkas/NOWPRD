SELECT
	p.CODE,
	REPLACE(p.SYMPTOM, CHR(10), '') AS TASK,
	p3.LONGDESCRIPTION AS PROJECT,
	SUBSTR(a2.VALUESTRING, 1,3) AS DEPT,
	TRIM(p.DEFAULTASSIGNEDTOUSERID) AS PIC,
	CASE
		WHEN p.PRIORITYLEVEL = 2 THEN 'Medium'
		WHEN p.PRIORITYLEVEL = 1 THEN 'High'
		WHEN p.PRIORITYLEVEL = 0 THEN 'High'
		ELSE ''
	END	AS PRIORITY,
	VARCHAR_FORMAT(p2.STARTDATE, 'mm/dd/YYYY') AS START,
	CASE
		WHEN p2.ENDDATE IS NULL THEN 
			CASE
				WHEN DAYOFWEEK_ISO(p2.STARTDATE) = 1 THEN VARCHAR_FORMAT(SUBSTR(p2.STARTDATE  + 3 DAYS, 1,10), 'mm/dd/YYYY')
		        WHEN DAYOFWEEK_ISO(p2.STARTDATE) = 2 THEN VARCHAR_FORMAT(SUBSTR(p2.STARTDATE  + 3 DAYS, 1,10), 'mm/dd/YYYY')
		        WHEN DAYOFWEEK_ISO(p2.STARTDATE) = 3 THEN VARCHAR_FORMAT(SUBSTR(p2.STARTDATE  + 5 DAYS, 1,10), 'mm/dd/YYYY')
		        WHEN DAYOFWEEK_ISO(p2.STARTDATE) = 4 THEN VARCHAR_FORMAT(SUBSTR(p2.STARTDATE  + 5 DAYS, 1,10), 'mm/dd/YYYY')
		        WHEN DAYOFWEEK_ISO(p2.STARTDATE) = 5 THEN VARCHAR_FORMAT(SUBSTR(p2.STARTDATE  + 5 DAYS, 1,10), 'mm/dd/YYYY')
			END			
		ELSE
		VARCHAR_FORMAT(p2.ENDDATE, 'mm/dd/YYYY')
	END AS STOP,
	'' AS WORKDAYS,
	CASE
		WHEN p2.STARTDATE IS NOT NULL AND p2.ENDDATE IS NULL THEN 'In Progress'
		WHEN p2.STARTDATE IS NOT NULL AND p2.ENDDATE IS NOT NULL THEN 'Complete'
		WHEN p2.STARTDATE IS NULL AND p2.ENDDATE IS NULL THEN 'Not Started'
		ELSE 'Pending'
	END
--	,p.REMARKS
--	,p2.REMARKS 
FROM
	PMBREAKDOWNENTRY p 
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = p.ABSUNIQUEID AND a.FIELDNAME = 'ApprovalDeptUserCode'
LEFT JOIN PMWORKORDER p2 ON p2.PMBREAKDOWNENTRYCODE = p.CODE 
LEFT JOIN PMBOM p3 ON p3.CODE = p.PMBOMCODE 
LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = p.ABSUNIQUEID AND a2.FIELDNAME = 'ApprovalDeptUserCode'
WHERE 
	p.BREAKDOWNTYPE = 'SF'
	AND NOT a2.VALUESTRING IS NULL
	AND p.IDENTIFIEDDATE >= '2024-07-01'
ORDER BY 
	p.IDENTIFIEDDATE ASC