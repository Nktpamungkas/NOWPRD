SELECT  
	df.DEMAND,
	df.PRODUCTIONORDERCODE,
	df.STEPNUMBER,
	df.OPERATIONCODE,
	df.PROGRESSSTATUS,
	(SELECT
		ipkk.OP1
	FROM
		ITXVIEW_POSISI_KARTU_KERJA ipkk
	WHERE
		ipkk.PRODUCTIONORDERCODE = df.PRODUCTIONORDERCODE 
		AND ipkk.PRODUCTIONDEMANDCODE = df.DEMAND 
		AND ipkk.STEPNUMBER = df.STEPNUMBER 
	FETCH FIRST 1 ROW ONLY) AS OP1,
	p.EXTERNALREFERENCE 
FROM
	demandfilter df
LEFT JOIN PRODUCTIONDEMAND p ON p.CODE = df.DEMAND
WHERE
	df.progressstatus <> 'Closed'
	AND CAST(df.stepnumber AS INT) > (
		SELECT
			MIN(stepnumber)
		FROM
			demandfilter
		WHERE
			progressstatus = 'Closed'
	)
	AND CAST(df.stepnumber AS INT) < (
		SELECT
			MAX(stepnumber)
		FROM
			demandfilter
		WHERE
			progressstatus = 'Closed'
	)
	AND p.ITEMTYPEAFICODE IN ('KFF', 'FKF')
ORDER BY
	CAST(df.stepnumber AS INT)