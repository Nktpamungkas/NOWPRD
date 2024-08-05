SELECT 
	p3.LONGDESCRIPTION AS NAMA_PROGRAM,
	SUBSTR(a2.VALUESTRING, 1,3) AS DEPT,
	TRIM(p.DEFAULTASSIGNEDTOUSERID) AS STAFF,
	CASE
		WHEN p3.LONGDESCRIPTION LIKE '%.rpt%' THEN 'Report NOW'
		ELSE 'Web Base'
	END	AS JENIS_RPGORAM,
	REPLACE(p.SYMPTOM, CHR(10), '') AS REVISI_PERUBAHAN,
	VARCHAR_FORMAT(p2.STARTDATE, 'mm/dd/YYYY') AS TGL_MULAI,
	VARCHAR_FORMAT(p2.ENDDATE, 'mm/dd/YYYY') AS TGL_SELESAI
FROM
	PMBREAKDOWNENTRY p 
LEFT JOIN PMWORKORDER p2 ON p2.PMBREAKDOWNENTRYCODE = p.CODE 
LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = p.ABSUNIQUEID AND a2.FIELDNAME = 'ApprovalDeptUserCode'
LEFT JOIN PMBOM p3 ON p3.CODE = p.PMBOMCODE
WHERE 
	p.BREAKDOWNTYPE = 'SF'
	AND NOT a2.VALUESTRING IS NULL
	AND p.IDENTIFIEDDATE BETWEEN '2024-07-01' AND '2024-07-31'