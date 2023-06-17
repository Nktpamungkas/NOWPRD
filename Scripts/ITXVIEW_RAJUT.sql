DROP VIEW ITXVIEW_RAJUT; -- RAJUT, BOOKING BELUM READY
--CREATE VIEW ITXVIEW_RAJUT AS
SELECT DISTINCT
	CODE,
	ORIGDLVSALORDLINESALORDERCODE,
	ITEMTYPEAFICODE,
--	LISTAGG(TRIM(LONGDESCRIPTION) || '(' || TRIM(BUYER) || ')', ', ') AS SUMMARIZEDDESCRIPTION,
	LISTAGG(TRIM(LONGDESCRIPTION) || '(' || CASE WHEN TRIM(BUYER) IS NULL THEN '()' ELSE TRIM(BUYER) END || ')' || '(' || TRIM(CODE) || '-' || TRIM(ORIGDLVSALORDLINESALORDERCODE) || ')', ', ') AS SUMMARIZEDDESCRIPTION,
	SUBCODE01,
	SUBCODE02,
	SUBCODE03,
	SUBCODE04,
	TGLRENCANA,
	TGLPOGREIGE
FROM (SELECT DISTINCT 
			p.ORIGDLVSALORDLINESALORDERCODE,
			p.CODE,
			p2.RESERVATIONLINE AS NO_URUT_BENANG,
			TRIM(p4.LONGDESCRIPTION) AS LONGDESCRIPTION, 
			TRIM(CAST(p3.COMMENTTEXT AS VARCHAR(1000))) AS BUYER,
			p.SUBCODE01,
			p.SUBCODE02,
			p.SUBCODE03,
			p.SUBCODE04,
			p.ITEMTYPEAFICODE,
			a1.VALUEDATE AS TGLRENCANA,
			a2.VALUEDATE AS TGLPOGREIGE			
		FROM 
			PRODUCTIONDEMAND p 
		LEFT JOIN PRODUCTIONRESERVATION p2 ON p2.ORDERCODE = p.CODE 
		LEFT JOIN PRODUCT p4 ON p4.ITEMTYPECODE = p2.ITEMTYPEAFICODE AND 
								p4.SUBCODE01 = p2.SUBCODE01 AND p4.SUBCODE02 = p2.SUBCODE02 AND
								p4.SUBCODE03 = p2.SUBCODE03 AND p4.SUBCODE04 = p2.SUBCODE04 AND
								p4.SUBCODE05 = p2.SUBCODE05 AND p4.SUBCODE06 = p2.SUBCODE06 AND
								p4.SUBCODE07 = p2.SUBCODE07 AND p4.SUBCODE07 = p2.SUBCODE07 
		LEFT JOIN PRODUCTIONRESERVATIONCOMMENT p3 ON p3.PRODUCTIONRESERVATIONORDERCODE = p2.ORDERCODE AND p2.RESERVATIONLINE = p3.PRORESERVATIONRESERVATIONLINE
		LEFT JOIN ADSTORAGE a1 ON a1.UNIQUEID = p.ABSUNIQUEID AND a1.FIELDNAME = 'RMPReqDate'
		LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = p.ABSUNIQUEID AND a2.FIELDNAME = 'RMPGreigeReqDateTo'
		WHERE 
			p.SUBCODE01 = 'CVCX' 
			AND p.SUBCODE02 = 'R22' 
			AND p.SUBCODE03 = '20106'
			AND p.SUBCODE04 = 'L01' 
			AND p.ORIGDLVSALORDLINESALORDERCODE = 'SME2300246'
			AND p.ITEMTYPEAFICODE ='KGF'
		ORDER BY p2.RESERVATIONLINE ASC
		)
GROUP BY 
	CODE,
	SUBCODE01,
	SUBCODE02,
	SUBCODE03,
	SUBCODE04,
	ORIGDLVSALORDLINESALORDERCODE,
	TGLRENCANA,
	TGLPOGREIGE,
--	ORIGDLVSALORDERLINEORDERLINE,
	ITEMTYPEAFICODE