DROP VIEW ITXVIEW_BOOKING_BLM_READY; -- BOOKING BELUM READY
--CREATE VIEW ITXVIEW_BOOKING_BLM_READY AS
SELECT DISTINCT
	ORIGDLVSALORDLINESALORDERCODE,
	ITEMTYPEAFICODE,
	LISTAGG(TRIM(LONGDESCRIPTION) || '(' || TRIM(BUYER) || ')', ', ') AS SUMMARIZEDDESCRIPTION,
	SUBCODE01,
	SUBCODE02,
	SUBCODE03,
	TGLRENCANA,
	TGLPOGREIGE
FROM (SELECT DISTINCT 
			p.ORIGDLVSALORDLINESALORDERCODE,
--			p.CODE,
			p2.RESERVATIONLINE AS NO_URUT_BENANG,
			TRIM(p4.LONGDESCRIPTION) AS LONGDESCRIPTION, 
			TRIM(CAST(p3.COMMENTTEXT AS VARCHAR(1000))) AS BUYER,
			p.SUBCODE01,
			p.SUBCODE02,
			p.SUBCODE03,
			p.ITEMTYPEAFICODE,
			a7.VALUEDATE AS TGLRENCANA,
			a8.VALUEDATE AS TGLPOGREIGE
		FROM 
			PRODUCTIONDEMAND p 
		LEFT JOIN PRODUCTIONRESERVATION p2 ON p2.ORDERCODE = p.CODE 
		LEFT JOIN PRODUCT p4 ON  p4.ITEMTYPECODE = p2.ITEMTYPEAFICODE AND
								p4.SUBCODE01 = p2.SUBCODE01 AND 
								p4.SUBCODE02 = p2.SUBCODE02 AND
								p4.SUBCODE03 = p2.SUBCODE03 AND 
								p4.SUBCODE04 = p2.SUBCODE04 AND
								p4.SUBCODE05 = p2.SUBCODE05 AND 
								p4.SUBCODE06 = p2.SUBCODE06 AND
								p4.SUBCODE07 = p2.SUBCODE07 
		LEFT JOIN PRODUCTIONRESERVATIONCOMMENT p3 ON p3.PRODUCTIONRESERVATIONORDERCODE = p2.ORDERCODE AND p2.RESERVATIONLINE = p3.PRORESERVATIONRESERVATIONLINE
		LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = p.ABSUNIQUEID AND a2.FIELDNAME = 'ProAllow'
		LEFT JOIN ADSTORAGE a3 ON a3.UNIQUEID = p.ABSUNIQUEID AND a3.FIELDNAME = 'ProAllow2'
		LEFT JOIN ADSTORAGE a4 ON a4.UNIQUEID = p.ABSUNIQUEID AND a4.FIELDNAME = 'ProAllow3'
		LEFT JOIN ADSTORAGE a5 ON a5.UNIQUEID = p.ABSUNIQUEID AND a5.FIELDNAME = 'ProAllow4'
		LEFT JOIN ADSTORAGE a6 ON a6.UNIQUEID = p.ABSUNIQUEID AND a6.FIELDNAME = 'ProAllow5'
		LEFT JOIN ADSTORAGE a7 ON a7.UNIQUEID = p.ABSUNIQUEID AND a7.FIELDNAME = 'RMPReqDate'
		LEFT JOIN ADSTORAGE a8 ON a8.UNIQUEID = p.ABSUNIQUEID AND a8.FIELDNAME = 'RMPGreigeReqDateTo'
		WHERE 
			p.SUBCODE01 = 'TX' 
			AND p.SUBCODE02 = 'SJS' 
			AND p.SUBCODE03 = '23054'
			AND p.ORIGDLVSALORDLINESALORDERCODE = 'SAM2300253' -- NGAMBIL DARI ADDITIONAL DATA 
			AND p.ITEMTYPEAFICODE ='KGF'
		ORDER BY p2.RESERVATIONLINE ASC
		)
GROUP BY 
	ORIGDLVSALORDLINESALORDERCODE,
	SUBCODE01,
	SUBCODE02,
	SUBCODE03,
--	ORIGDLVSALORDERLINEORDERLINE,
	TGLRENCANA,
	TGLPOGREIGE,
	ITEMTYPEAFICODE