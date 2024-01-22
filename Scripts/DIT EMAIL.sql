-- 1
SELECT 
    TRIM(p.CODE) AS CODE,
    p.SYMPTOM AS GEJALA,
    TRIM(p.CREATIONUSER) AS CREATIONUSER,
    TRIM(d.LONGDESCRIPTION) AS DEPT,
    TRIM(p2.CODE) AS KODE_MESIN,
    TRIM(p2.LONGDESCRIPTION) AS NAMA_MESIN,
    TRIM(p2.GENERICDATA1) || ' ' || TRIM(p2.GENERICDATA2) || ' ' || TRIM(p2.GENERICDATA3) || ' ' || TRIM(p2.GENERICDATA4) AS DESC_MESIN 
FROM
    PMBREAKDOWNENTRY p
LEFT JOIN DEPARTMENT d ON d.CODE = p.DEPARTMENTCODE
LEFT JOIN PMBOM p2 ON p2.CODE = p.PMBOMCODE 
WHERE
	p.BREAKDOWNTYPE = 'SF'
--    (p.BREAKDOWNTYPE = 'HD'
--    OR p.BREAKDOWNTYPE = 'NW'
--    OR p.BREAKDOWNTYPE = 'EM')
	
-- 2
SELECT 
	p.BREAKDOWNTYPE,
	TRIM(p.CODE) AS CODE,
	TRIM(p.CREATIONUSER) AS CREATIONUSER,
    TRIM(p3.ASSIGNEDBYUSERID) AS TUGASDIBUAT_OLEH,
	TRIM(p3.ASSIGNEDTOUSERID) AS DITUGASKAN_KPD,
    p.SYMPTOM AS GEJALA,
    TRIM(d.LONGDESCRIPTION) AS DEPT,
    TRIM(p2.CODE) AS KODE_MESIN,
    TRIM(p2.LONGDESCRIPTION) AS NAMA_MESIN,
    TRIM(p2.GENERICDATA1) || ' ' || TRIM(p2.GENERICDATA2) || ' ' || TRIM(p2.GENERICDATA3) || ' ' || TRIM(p2.GENERICDATA4) AS DESC_MESIN,
    TRIM(a.SENDEREMAIL) AS EMAIL,
    p.STATUS,
    u.LONGDESCRIPTION AS APPROVE_DIT
FROM
    PMBREAKDOWNENTRY p
LEFT JOIN DEPARTMENT d ON d.CODE = p.DEPARTMENTCODE
LEFT JOIN PMBOM p2 ON p2.CODE = p.PMBOMCODE 
RIGHT JOIN PMWORKORDER p3 ON p3.PMBREAKDOWNENTRYCODE = p.CODE AND NOT p3.ASSIGNEDTOUSERID IS NULL
LEFT JOIN ABSUSERDEF a ON a.USERID = p3.ASSIGNEDTOUSERID 
LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = p3.ABSUNIQUEID AND a2.FIELDNAME = 'ApprovalDeptDITCode'
LEFT JOIN USERGENERICGROUP u ON u.CODE = a2.VALUESTRING 
WHERE
    p.BREAKDOWNTYPE = 'SF'
--	p.BREAKDOWNTYPE = 'HD'
--	OR p.BREAKDOWNTYPE = 'NW'
--	OR p.BREAKDOWNTYPE = 'EM')
	AND NOT a.SENDEREMAIL IS NULL
	AND p.STATUS = 3
	AND u.LONGDESCRIPTION IS NULL

-- DAFTAR EMAIL SUPPORT, PROGRAMMER
SELECT
	TRIM(FULLNAME) AS FULLNAME,
	TRIM(a.SENDEREMAIL) AS EMAIL
FROM
	ABSUSERDEF a
WHERE	
--	(TRIM(a.CUSTOMCSS) = 'IT PROGRAMMER' OR TRIM(a.CUSTOMCSS) = 'ALL') 
--	(TRIM(a.CUSTOMCSS) = 'IT SUPPORT' OR TRIM(a.CUSTOMCSS) = 'ALL') 
	(TRIM(a.CUSTOMCSS) = 'Manager DIT' OR TRIM(a.CUSTOMCSS) = 'Ast. Manager DIT' OR TRIM(a.CUSTOMCSS) = 'ALL')
	AND NOT a.SENDEREMAIL IS NULL