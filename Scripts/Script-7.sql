SELECT 
	p.ORDERLINE AS DLVSALESORDERLINEORDERLINE,
	p.ITEMTYPEAFICODE AS ITEMTYPEAFICODE,
	p.ITEMDESCRIPTION AS WARNA,
	trim(p.SUBCODE01) AS SUBCODE01, trim(p.SUBCODE02) AS SUBCODE02, trim(p.SUBCODE03) AS SUBCODE03, trim(p.SUBCODE04) AS SUBCODE04, trim(p.SUBCODE05) AS SUBCODE05, trim(p.SUBCODE06) AS SUBCODE06, trim(p.SUBCODE07) AS SUBCODE07, trim(p.SUBCODE08) AS SUBCODE08,
	trim(p.SUBCODE09) AS SUBCODE09, trim(p.SUBCODE10) AS SUBCODE10
FROM SALESORDERLINE p
WHERE p.SALESORDERCODE = 'LAB2300517' AND p.ORDERLINE = '10'
GROUP BY 
	p.ORDERLINE,p.SUBCODE01,p.SUBCODE02,p.SUBCODE03,p.SUBCODE04,p.SUBCODE05,p.SUBCODE06,p.SUBCODE07,p.SUBCODE08,p.SUBCODE09,p.SUBCODE10,p.ITEMTYPEAFICODE,p.ITEMDESCRIPTION
	
	
SELECT
	CASE
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 1 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN ITXVIEW_COLORREMARKS.VALUESTRING
				ELSE SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, 1, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) -1)
			END			
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 2 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN ITXVIEW_COLORREMARKS.VALUESTRING
				ELSE SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, 1, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) -1)
			END	
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 3 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN ITXVIEW_COLORREMARKS.VALUESTRING
				ELSE SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, 1, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) -1)
			END	
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 4 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN ITXVIEW_COLORREMARKS.VALUESTRING
				ELSE SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, 1, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) -1)
			END	
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 5 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN ITXVIEW_COLORREMARKS.VALUESTRING
				ELSE SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, 1, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) -1)
			END	
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 6 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN ITXVIEW_COLORREMARKS.VALUESTRING
				ELSE SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, 1, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) -1)
			END	
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 7 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN ITXVIEW_COLORREMARKS.VALUESTRING
				ELSE SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, 1, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) -1)
			END	
	END AS LABDIPNO,
	CASE
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 1 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN 'Labdip - ' || TRIM(ITXVIEW_COLORREMARKS.VALUESTRING)
				ELSE 'Labdip - ' || SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING), 50) 
			END	
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 2 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN 'First Lot - ' || TRIM(ITXVIEW_COLORREMARKS.VALUESTRING)
				ELSE 'First Lot - ' || SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING), 50) 
			END	
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 3 THEN   
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN 'Original - ' || TRIM(ITXVIEW_COLORREMARKS.VALUESTRING)
				ELSE 'Original - ' || SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING), 50)
			END	
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 4 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN 'Previous Order - ' || TRIM(ITXVIEW_COLORREMARKS.VALUESTRING)
				ELSE 'Previous Order - ' || SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING), 50) 
			END
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 5 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN 'Master Color - ' || TRIM(ITXVIEW_COLORREMARKS.VALUESTRING)
				ELSE 'Master Color - ' || SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING), 50)
			END
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 6 THEN  
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN 'Lampiran Buyer - ' || TRIM(ITXVIEW_COLORREMARKS.VALUESTRING)
				ELSE 'Lampiran Buyer - ' || SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING), 50) 
			END
		WHEN ITXVIEW_COLORSTANDARD.VALUESTRING = 7 THEN 
			CASE
				WHEN LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING) = '0' THEN 'Body - ' || TRIM(ITXVIEW_COLORREMARKS.VALUESTRING)
				ELSE 'Body - ' || SUBSTR(ITXVIEW_COLORREMARKS.VALUESTRING, LOCATE('(', ITXVIEW_COLORREMARKS.VALUESTRING), 50)
			END
	END AS STDCCKWARNA,
	ITXVIEW_COLORREMARKS.VALUESTRING
FROM
	SALESORDERLINE SALESORDERLINE
LEFT JOIN ITXVIEW_COLORSTANDARD ITXVIEW_COLORSTANDARD ON SALESORDERLINE.ABSUNIQUEID = ITXVIEW_COLORSTANDARD.UNIQUEID
LEFT JOIN ITXVIEW_COLORREMARKS ITXVIEW_COLORREMARKS ON ITXVIEW_COLORSTANDARD.UNIQUEID = ITXVIEW_COLORREMARKS.UNIQUEID
WHERE TRIM(SALESORDERLINE.SALESORDERCODE) = 'LAB2300517' AND TRIM(SALESORDERLINE.ORDERLINE) = '10'