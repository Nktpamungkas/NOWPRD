DROP VIEW ITXVIEW_BOOKING_NEW; -- BOOKING READY NEW
--CREATE VIEW ITXVIEW_BOOKING_NEW AS
SELECT 
	DEMAND,
	SALESORDERCODE,
	ORDERLINE,
	LOTCODE,
	CODE,
	ONLY_PROJECTCODE,
	PROJECTCODE,
	TGLPOGREIGE,
	TGLRENCANA,
	LISTAGG(CASE WHEN SUMMARIZEDDESCRIPTION IS NULL THEN '' ELSE SUMMARIZEDDESCRIPTION END, ', ') || '-' || TRIM(ONLY_PROJECTCODE) AS SUMMARIZEDDESCRIPTION
FROM
	(SELECT 
		DISTINCT 
		p3.RESERVATIONLINE AS NO_URUT_BENANG,
		i.DEMAND,
		i.SALESORDERCODE,
		i.ORDERLINE,
		i.SUBCODE03,
		a2.LOTCODE,
		a2.CODE,
		CASE
			WHEN a2.PROJECTCODE IS NULL THEN TRIM(a2.LOTCODE)
			ELSE TRIM(a2.PROJECTCODE)
		END AS ONLY_PROJECTCODE,
		NULL AS TGLPOGREIGE,
		a2.CREATIONDATETIME AS TGLRENCANA,
		CASE
			WHEN a2.PROJECTCODE IS NULL THEN TRIM(a2.LOTCODE) || ' - ' || round(TRIM(a2.USERPRIMARYQUANTITY), 2) || ' ' || TRIM(a2.USERPRIMARYUOMCODE)
			ELSE TRIM(a2.LOTCODE) || ' - ' || round(TRIM(a2.USERPRIMARYQUANTITY), 2) || ' ' || TRIM(a2.USERPRIMARYUOMCODE)
		END AS PROJECTCODE,
		LISTAGG(TRIM(p4.LONGDESCRIPTION) || '(' || 
				CASE 
					WHEN TRIM(CAST(p4.COMMENTTEXT AS VARCHAR(1000))) IS NULL THEN '()' 
					ELSE TRIM(CAST(p4.COMMENTTEXT AS VARCHAR(1000))) 
				END || ')' || '(' || TRIM(a2.LOTCODE) || ')', ', ') AS SUMMARIZEDDESCRIPTION
	FROM 
		ITXVIEWBONORDER i 
	RIGHT JOIN ALLOCATION a ON a.ORDERCODE = i.DEMAND AND a.DETAILTYPE = 1
	RIGHT JOIN ALLOCATION a2 ON a2.CODE = a.CODE AND a2.DETAILTYPE = 0
	LEFT JOIN PRODUCTIONRESERVATION p3 ON p3.ORDERCODE = a2.LOTCODE
	LEFT JOIN PRODUCT p4 ON p4.ITEMTYPECODE = p3.ITEMTYPEAFICODE AND NOT p4.ITEMTYPECODE = 'DYC' AND NOT p4.ITEMTYPECODE = 'WTR' AND 
--							NOT p4.ITEMTYPECODE = 'KFF' AND
							p4.SUBCODE01 = p3.SUBCODE01 AND 
							p4.SUBCODE02 = p3.SUBCODE02 AND
							p4.SUBCODE03 = p3.SUBCODE03 AND 
							p4.SUBCODE04 = p3.SUBCODE04 AND
							p4.SUBCODE05 = p3.SUBCODE05 AND 
							p4.SUBCODE06 = p3.SUBCODE06 AND
							p4.SUBCODE07 = p3.SUBCODE07 
	LEFT JOIN PRODUCTIONRESERVATIONCOMMENT p4 ON p4.PRODUCTIONRESERVATIONORDERCODE = p3.ORDERCODE AND p4.PRORESERVATIONRESERVATIONLINE = p3.RESERVATIONLINE
	LEFT JOIN PRODUCTIONDEMAND p5 ON p5.CODE = a2.LOTCODE  
	LEFT JOIN ADSTORAGE a3 ON a3.UNIQUEID = p5.ABSUNIQUEID AND a3.FIELDNAME = 'RMPReqDate'
	LEFT JOIN ADSTORAGE a4 ON a4.UNIQUEID = p5.ABSUNIQUEID AND a4.FIELDNAME = 'RMPGreigeReqDateTo'
	WHERE 
		SALESORDERCODE = 'DOM2300726' 
		AND i.ORDERLINE = 60
	GROUP BY 
		i.DEMAND,
		p3.RESERVATIONLINE,
		i.SALESORDERCODE,
		i.ORDERLINE,
		i.SUBCODE03,
		a2.CREATIONDATETIME,
		a2.LOTCODE,
		a2.CODE,
		a2.PROJECTCODE,
		a2.USERPRIMARYQUANTITY,
		a2.USERPRIMARYUOMCODE
	ORDER BY p3.RESERVATIONLINE ASC)
GROUP BY 
	DEMAND,
	SALESORDERCODE,
	ORDERLINE,
	LOTCODE,
	CODE,
	ONLY_PROJECTCODE,
	PROJECTCODE,
	QTY_ALOKASI_BRUTO,
	TGLPOGREIGE,
	TGLRENCANA