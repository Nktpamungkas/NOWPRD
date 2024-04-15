SELECT DISTINCT
	i.SALESORDERCODE,
	s2.DELIVERYDATE,
	TRIM(p.SUBCODE01) AS S1,
	TRIM(p.SUBCODE02) AS S2,
	TRIM(p.SUBCODE03) AS S3,
	TRIM(p.SUBCODE04) AS S4,
	TRIM(p.SUBCODE05) AS S5,
	TRIM(p.SUBCODE06) AS S6,
--	TRIM(p.SUBCODE07) AS S7,
--	TRIM(p.SUBCODE08) AS S8,
--	TRIM(p.SUBCODE09) AS S9,
--	TRIM(p.SUBCODE10) AS S10,
	ip.LANGGANAN || '(' || ip.BUYER || ')' AS LANGGANAN,
	p2.WORKCENTERCODE,
	p2.OPERATIONCODE,
	CASE
		WHEN i2.ITEMTYPE_DEMAND = 'KFF' THEN i2.USERPRIMARYQUANTITY 
		WHEN i2.ITEMTYPE_DEMAND = 'FKF' THEN i2.USERSECONDARYQUANTITY 
	END AS QTY,
	ir.TGLPOGREIGE AS TGLPOGREIGE_RAJUT,
	ibbr.TGLPOGREIGE AS TGLPOGREIGE_BOOKING_BLMREADY,
	ibbr2.TGLPOGREIGE AS TGLPOGREIGE_BOOKING_BLMREADY2,
	ibbr3.TGLPOGREIGE AS TGLPOGREIGE_BOOKING_BLMREADY3,
	ibbr4.TGLPOGREIGE AS TGLPOGREIGE_BOOKING_BLMREADY4,
	ibbr5.TGLPOGREIGE AS TGLPOGREIGE_BOOKING_BLMREADY5
FROM
	ITXVIEWBONORDER i 
LEFT JOIN PRODUCTIONDEMAND p ON p.CODE = i.DEMAND 
LEFT JOIN PRODUCTIONDEMANDSTEP p2 ON p2.PRODUCTIONDEMANDCODE = i.DEMAND 
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = p.ABSUNIQUEID AND a.FIELDNAME = 'OriginalPDCode'
LEFT JOIN ITXVIEW_PELANGGAN ip ON ip.CODE = p.ORIGDLVSALORDLINESALORDERCODE
LEFT JOIN ITXVIEWKGBRUTOBONORDER2 i2 ON i2.CODE = p.CODE 
LEFT JOIN SALESORDERDELIVERY s2 ON s2.SALESORDERLINESALESORDERCODE = p.DLVSALORDERLINESALESORDERCODE 
								AND s2.SALESORDERLINEORDERLINE = p.DLVSALESORDERLINEORDERLINE
LEFT JOIN ITXVIEW_RAJUT ir ON ir.ITEMTYPEAFICODE = 'KGF'
							AND ir.ORIGDLVSALORDLINESALORDERCODE = i.SALESORDERCODE 
							AND ir.SUBCODE01 = i.SUBCODE01 
							AND ir.SUBCODE02 = i.SUBCODE02 
							AND ir.SUBCODE03 = i.SUBCODE03 
							AND ir.SUBCODE04 = i.RESERVATION_SUBCODE04 
LEFT JOIN ITXVIEW_BOOKING_BLM_READY ibbr ON ibbr.ITEMTYPEAFICODE = 'KGF'
										AND ibbr.ORIGDLVSALORDLINESALORDERCODE = i.ADDITIONALDATA 
										AND ibbr.SUBCODE01 = i.SUBCODE01 
										AND ibbr.SUBCODE02 = i.SUBCODE02 
										AND ibbr.SUBCODE03 = i.SUBCODE03 
										AND ibbr.SUBCODE04 = i.RESERVATION_SUBCODE04
LEFT JOIN ITXVIEW_BOOKING_BLM_READY ibbr2 ON ibbr2.ITEMTYPEAFICODE = 'KGF'
										AND ibbr2.ORIGDLVSALORDLINESALORDERCODE = i.ADDITIONALDATA2 
										AND ibbr2.SUBCODE01 = i.SUBCODE01 
										AND ibbr2.SUBCODE02 = i.SUBCODE02 
										AND ibbr2.SUBCODE03 = i.SUBCODE03 
										AND ibbr2.SUBCODE04 = i.RESERVATION_SUBCODE04 
LEFT JOIN ITXVIEW_BOOKING_BLM_READY ibbr3 ON ibbr3.ITEMTYPEAFICODE = 'KGF'
										AND ibbr3.ORIGDLVSALORDLINESALORDERCODE = i.ADDITIONALDATA3
										AND ibbr3.SUBCODE01 = i.SUBCODE01 
										AND ibbr3.SUBCODE02 = i.SUBCODE02 
										AND ibbr3.SUBCODE03 = i.SUBCODE03 
										AND ibbr3.SUBCODE04 = i.RESERVATION_SUBCODE04 
LEFT JOIN ITXVIEW_BOOKING_BLM_READY ibbr4 ON ibbr4.ITEMTYPEAFICODE = 'KGF'
										AND ibbr4.ORIGDLVSALORDLINESALORDERCODE = i.ADDITIONALDATA4 
										AND ibbr4.SUBCODE01 = i.SUBCODE01 
										AND ibbr4.SUBCODE02 = i.SUBCODE02 
										AND ibbr4.SUBCODE03 = i.SUBCODE03 
										AND ibbr4.SUBCODE04 = i.RESERVATION_SUBCODE04 
LEFT JOIN ITXVIEW_BOOKING_BLM_READY ibbr5 ON ibbr5.ITEMTYPEAFICODE = 'KGF'
										AND ibbr5.ORIGDLVSALORDLINESALORDERCODE = i.ADDITIONALDATA5 
										AND ibbr5.SUBCODE01 = i.SUBCODE01 
										AND ibbr5.SUBCODE02 = i.SUBCODE02 
										AND ibbr5.SUBCODE03 = i.SUBCODE03 
										AND ibbr5.SUBCODE04 = i.RESERVATION_SUBCODE04 
WHERE
	(p2.WORKCENTERCODE = 'P3RS1' OR p2.WORKCENTERCODE = 'P3SU1' OR p2.WORKCENTERCODE = 'P3ST1' OR p2.WORKCENTERCODE = 'P3CP1')
--	AND CREATIONDATETIME_SALESORDER BETWEEN '2024-01-01' AND '2024-01-04'
	AND a.VALUESTRING IS NULL
	AND NOT p.ORIGDLVSALORDLINESALORDERCODE IS NULL
	AND i.SALESORDERCODE = 'DOM2400018'