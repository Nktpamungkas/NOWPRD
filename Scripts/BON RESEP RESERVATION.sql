SELECT 
	r.GROUPLINE,
    r.PRODRESERVATIONLINKGROUPCODE,
    r.ITEMTYPEAFICODE AS IT,
    CASE
        WHEN r.ITEMTYPEAFICODE = 'KGF' THEN TRIM(r.SUBCODE01) || '-' || TRIM(r.SUBCODE02) || '-' || TRIM(r.SUBCODE03) || '-' || TRIM(r.SUBCODE04)
        WHEN r.ITEMTYPEAFICODE = 'DYC' THEN TRIM(r.SUBCODE01) || '-' || TRIM(r.SUBCODE02) || '-' || TRIM(r.SUBCODE03)
        WHEN r.ITEMTYPEAFICODE = 'RFD' THEN TRIM(r.SUBCODE01) || '-' || TRIM(r.SUFFIXCODE) 
        WHEN r.ITEMTYPEAFICODE = 'RFF' THEN TRIM(r.SUBCODE01) || '-' || TRIM(r.SUFFIXCODE) 
        WHEN r.ITEMTYPEAFICODE = 'WTR' THEN TRIM(r.SUBCODE01) 
    END AS ITEMCODE,
    CASE
    	WHEN p.LONGDESCRIPTION IS NULL THEN r2.LONGDESCRIPTION 
    	ELSE p.LONGDESCRIPTION 
    END AS LONGDESCRIPTION,
    r.USERPRIMARYQUANTITY,
    r.USERPRIMARYUOMCODE,
    r.USEDUSERPRIMARYQUANTITY,
    CASE
    	WHEN r.PROGRESSSTATUS = 0 THEN 'Entered'
    	WHEN r.PROGRESSSTATUS = 1 THEN 'Partially Used'
    	WHEN r.PROGRESSSTATUS = 2 THEN 'Closed'
    END AS PROGRESSSTATUS,
    r.WAREHOUSECODE,
    r.ISSUEDATE,
    r.PROJECTCODE 
FROM PRODUCTIONRESERVATION r
LEFT JOIN PRODUCT p ON p.SUBCODE01 = r.SUBCODE01 
                    AND p.SUBCODE02 = r.SUBCODE02 
                    AND p.SUBCODE03 = r.SUBCODE03
                    AND p.SUBCODE04 = r.SUBCODE04
                    AND p.ITEMTYPECODE = r.ITEMTYPEAFICODE
LEFT JOIN RECIPE r2 ON r2.SUBCODE01 = r.SUBCODE01 AND r2.SUFFIXCODE = r.SUFFIXCODE 
WHERE r.PRODUCTIONORDERCODE LIKE '%00034997%' ORDER BY r.GROUPLINE ASC