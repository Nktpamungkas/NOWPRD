SELECT
--	SUBCODE01,
--	SUBCODE02,
--	SUBCODE03,
	*
FROM
	VIEWPRODUCTIONRESERVATION v
WHERE 
	PRODUCTIONORDERCODE = '00025866'
--	AND GROUPSTEPNUMBER = '350'
ORDER BY
	GROUPSTEPNUMBER,
	'SEQUENCE' ASC