SELECT
	CASE
		WHEN s.PRODUCTIONORDERCODE IS NULL THEN s.ORDERCODE 
		ELSE s.PRODUCTIONORDERCODE 
	END AS PRODUCTIONORDERCODE,
	CASE
		WHEN s.TEMPLATECODE = '120' THEN TRIM(s.DECOSUBCODE01) || '-' || TRIM(s.DECOSUBCODE02) || '-' || TRIM(s.DECOSUBCODE03) 
		ELSE s.TEMPLATECODE 
	END	AS KODE_OBAT,
	s.USERPRIMARYQUANTITY AS AKTUAL_QTY,
	p.LONGDESCRIPTION 
FROM
	STOCKTRANSACTION s
LEFT JOIN PRODUCT p ON p.ITEMTYPECODE = s.ITEMTYPECODE 
					AND p.SUBCODE01 = s.DECOSUBCODE01 
					AND p.SUBCODE02 = s.DECOSUBCODE02 
					AND p.SUBCODE03 = s.DECOSUBCODE03
WHERE 
	s.ITEMTYPECODE = 'DYC'
	AND s.LOGICALWAREHOUSECODE = 'M510'
	AND s.TRANSACTIONDATE = '2023-08-22'
ORDER BY 
	s.PRODUCTIONORDERCODE ASC
	
	
	
SELECT 
	p.PRODUCTIONORDERCODE,
	p.GROUPSTEPNUMBER,
	p.USERPRIMARYQUANTITY,
	p2.LONGDESCRIPTION AS KETERANGAN
FROM
	PRODUCTIONRESERVATION p
LEFT JOIN PRODRESERVATIONLINKGROUP p2 ON p2.CODE = p.PRODRESERVATIONLINKGROUPCODE 
WHERE
	p.PRODUCTIONORDERCODE = '00081114'