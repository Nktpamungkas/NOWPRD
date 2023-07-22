SELECT 
	NO_ORDER,
	PO_NUMBER,
	LEGALNAME1,
	KODE_ITEM,
	WARNA,
	QTY_KEBUTUHAN_KG,
	QTY_KEBUTUHAN_YD_MTR,
	SUM(QTY_PACKING_KG) AS QTY_PACKING_KG,
	SUM(QTY_PACKING_YD_MTR) AS QTY_PACKING_YD_MTR,
	QTY_KEBUTUHAN_KG - SUM(QTY_KIRIM_KG) AS QTY_KURANG_KG,
	QTY_KEBUTUHAN_YD_MTR - SUM(QTY_YD_MTR) AS QTY_KURANG_YD_MTR,
	NO_SJ,
	TGL_KIRIM,
	SUM(QTY_KIRIM_KG) AS QTY_KIRIM_KG,
	SUM(QTY_YD_MTR) AS QTY_YD_MTR
FROM 
	(SELECT 
		isp.DLVSALORDERLINESALESORDERCODE AS NO_ORDER,
		isp.PO_NUMBER,
		isp.LEGALNAME1,
		TRIM(isp.DECOSUBCODE01) || '-' || TRIM(isp.DECOSUBCODE02) || '-' ||
		TRIM(isp.DECOSUBCODE03) || '-' || TRIM(isp.DECOSUBCODE04) || '-' ||
		TRIM(isp.DECOSUBCODE05) || '-' || TRIM(isp.DECOSUBCODE06) || '-' ||
		TRIM(isp.DECOSUBCODE07) || '-' || TRIM(isp.DECOSUBCODE08) || '-' ||
		TRIM(isp.DECOSUBCODE09) || '-' || TRIM(isp.DECOSUBCODE10) AS KODE_ITEM,
		i.WARNA,
		ik.QTY_KEBUTUHAN_KG,
		ik.QTY_KEBUTUHAN_YD_MTR,
		QTY_PACKING_KG,
		QTY_PACKING_YD_MTR,
		SUM(iasp.BASEPRIMARYQUANTITY) AS QTY_KIRIM_KG,
		CASE
			WHEN isp.PRICEUNITOFMEASURECODE = 'yd' THEN SUM(iasp.BASESECONDARYQUANTITY)
			WHEN isp.PRICEUNITOFMEASURECODE = 'kg' THEN SUM(iasp.BASESECONDARYQUANTITY)
			WHEN isp.PRICEUNITOFMEASURECODE = 'm'  THEN SUM(round(iasp.BASESECONDARYQUANTITY, 2) * 0.9144)
		END AS QTY_YD_MTR,
		isp.PROVISIONALCODE AS NO_SJ,
		isp.GOODSISSUEDATE AS TGL_KIRIM
	FROM
		ITXVIEW_SURATJALAN_PPC isp 
	LEFT JOIN ITXVIEW_ALLOCATION_SURATJALAN_PPC iasp ON iasp.CODE = isp.CODE
	LEFT JOIN ITXVIEWCOLOR i ON i.ITEMTYPECODE = isp.ITEMTYPEAFICODE AND 
								i.SUBCODE01 = isp.DECOSUBCODE01 AND 
								i.SUBCODE02 = isp.DECOSUBCODE02 AND 
								i.SUBCODE03 = isp.DECOSUBCODE03 AND 
								i.SUBCODE04 = isp.DECOSUBCODE04 AND 
								i.SUBCODE05 = isp.DECOSUBCODE05 AND 
								i.SUBCODE06 = isp.DECOSUBCODE06 AND 
								i.SUBCODE07 = isp.DECOSUBCODE07 AND 
								i.SUBCODE08 = isp.DECOSUBCODE08 AND 
								i.SUBCODE09 = isp.DECOSUBCODE09 AND 
								i.SUBCODE10 = isp.DECOSUBCODE10
	LEFT JOIN 
		(SELECT
			ik.PROJECTCODE,
			ik.ORIGDLVSALORDERLINEORDERLINE,
			SUM(ik.USERPRIMARYQUANTITY) AS QTY_KEBUTUHAN_KG,
			SUM(ik.USERSECONDARYQUANTITY) AS QTY_KEBUTUHAN_YD_MTR
		FROM
			ITXVIEW_KGBRUTO ik
		WHERE 
			ik.VALUESTRING IS NULL
		GROUP BY 
			ik.PROJECTCODE,
			ik.ORIGDLVSALORDERLINEORDERLINE) ik ON ik.PROJECTCODE = isp.DLVSALORDERLINESALESORDERCODE AND ik.ORIGDLVSALORDERLINEORDERLINE = isp.DLVSALESORDERLINEORDERLINE
	LEFT JOIN 
		(SELECT 
			QTY_PACKING.PRODUCTIONORDERCODE,
			QTY_PACKING.DLVSALESORDERLINEORDERLINE,
			SUM(QTY_PACKING_KG) AS QTY_PACKING_KG,
			SUM(QTY_PACKING_YD_MTR) AS QTY_PACKING_YD_MTR
		FROM 
			(SELECT 
				p.PRODUCTIONORDERCODE,
				p.PRODUCTIONDEMANDCODE,
				p2.DLVSALESORDERLINEORDERLINE,
				p2.ENTEREDUSERPRIMARYQUANTITY AS QTY_PACKING_KG,
				p2.ENTEREDUSERSECONDARYQUANTITY AS QTY_PACKING_YD_MTR
			 FROM 
			 	PRODUCTIONDEMANDSTEP p
			 LEFT JOIN PRODUCTIONDEMAND p2 ON p2.CODE = p.PRODUCTIONDEMANDCODE
			 GROUP BY 
			 	p.PRODUCTIONORDERCODE,p2.DLVSALESORDERLINEORDERLINE,
			 	p.PRODUCTIONDEMANDCODE,p2.ENTEREDUSERPRIMARYQUANTITY,p2.ENTEREDUSERSECONDARYQUANTITY) QTY_PACKING
		GROUP BY 
			QTY_PACKING.PRODUCTIONORDERCODE,
			QTY_PACKING.DLVSALESORDERLINEORDERLINE) QTY_PACKING 
			 ON QTY_PACKING.PRODUCTIONORDERCODE = iasp.LOTCODE AND QTY_PACKING.DLVSALESORDERLINEORDERLINE = isp.DLVSALESORDERLINEORDERLINE
	WHERE 
		isp.DLVSALORDERLINESALESORDERCODE = 'DOM2300314'
	GROUP BY 
		isp.DLVSALORDERLINESALESORDERCODE,
		isp.PO_NUMBER,
		isp.LEGALNAME1,
		isp.DECOSUBCODE01,
		isp.DECOSUBCODE02,
		isp.DECOSUBCODE03,
		isp.DECOSUBCODE04,
		isp.DECOSUBCODE05,
		isp.DECOSUBCODE06,
		isp.DECOSUBCODE07,
		isp.DECOSUBCODE08,
		isp.DECOSUBCODE09,
		isp.DECOSUBCODE10,
		i.WARNA,
		ik.QTY_KEBUTUHAN_KG,
		ik.QTY_KEBUTUHAN_YD_MTR,
		QTY_PACKING_KG,
		QTY_PACKING_YD_MTR,
		isp.PRICEUNITOFMEASURECODE,
		isp.PROVISIONALCODE,
		isp.GOODSISSUEDATE)
GROUP BY
	NO_ORDER,
	PO_NUMBER,
	LEGALNAME1,
	KODE_ITEM,
	WARNA,
	QTY_KEBUTUHAN_KG,
	QTY_KEBUTUHAN_YD_MTR,
	NO_SJ,
	TGL_KIRIM