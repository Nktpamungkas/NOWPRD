DROP VIEW ITXVIEW_PPA_DIT;
--CREATE VIEW ITXVIEW_PPA_DIT AS 
SELECT
	p.IDENTIFIEDDATE,
	p.PMBOMCODE,
	p.CREATIONDATETIME AS TGL_BUAT_BD,
	p.CODE AS NO_BD,
    p3.CODE AS NO_WO,
    'PPA' || SUBSTR(p3.CREATIONDATETIME, 3,2) ||SUBSTR(p3.CREATIONDATETIME, 6,2) || LTRIM(SUBSTR(p3.CODE, 6,6), '0')  AS NO_PPA,  
--    CASE
--    	WHEN d.LONGDESCRIPTION = 'ALL' THEN SUBSTR(a5.VALUESTRING, 1,3)
--    	ELSE SUBSTR(d.LONGDESCRIPTION, 1, 4)
--    END AS DEPT,
--    SUBSTR(a5.VALUESTRING, 1,3) AS DEPT,
    '' AS DEPT,
    p2.HALLNOCODE AS DEPT22,
    CASE
    	WHEN a17.VALUESTRING = 1 THEN 'MAYOR'
    	WHEN a17.VALUESTRING = 2 THEN 'MINOR'
    	ELSE ''
    END AS JENIS_KERUSAKAN,
    p2.LONGDESCRIPTION AS NAMA_APLIKASI,
    CASE
        WHEN a2.VALUESTRING = '1' THEN 'Baru'
        WHEN a2.VALUESTRING = '2' THEN 'Penambahan'
        WHEN a2.VALUESTRING = '3' THEN 'Perubahan'
        WHEN a2.VALUESTRING = '4' THEN 'Perbaikan'
    END AS JENIS_PERMOHONAN,
    SUBSTR(p3.STARTDATE, 1,10) AS TGL_MULAI,
    CASE
--        WHEN DAYOFWEEK_ISO(p3.STARTDATE) = 1 THEN SUBSTR(p3.STARTDATE  + 3 DAYS, 1,10)
--        WHEN DAYOFWEEK_ISO(p3.STARTDATE) = 2 THEN SUBSTR(p3.STARTDATE  + 3 DAYS, 1,10)
--        WHEN DAYOFWEEK_ISO(p3.STARTDATE) = 3 THEN SUBSTR(p3.STARTDATE  + 5 DAYS, 1,10)
--        WHEN DAYOFWEEK_ISO(p3.STARTDATE) = 4 THEN SUBSTR(p3.STARTDATE  + 5 DAYS, 1,10)
--        WHEN DAYOFWEEK_ISO(p3.STARTDATE) = 5 THEN SUBSTR(p3.STARTDATE  + 6 DAYS, 1,10)
	    WHEN DAYOFWEEK_ISO(a6.VALUEDATE) = 1 THEN SUBSTR(a6.VALUEDATE  + 3 DAYS, 1,10)
        WHEN DAYOFWEEK_ISO(a6.VALUEDATE) = 2 THEN SUBSTR(a6.VALUEDATE  + 3 DAYS, 1,10)
        WHEN DAYOFWEEK_ISO(a6.VALUEDATE) = 3 THEN SUBSTR(a6.VALUEDATE  + 5 DAYS, 1,10)
        WHEN DAYOFWEEK_ISO(a6.VALUEDATE) = 4 THEN SUBSTR(a6.VALUEDATE  + 5 DAYS, 1,10)
        WHEN DAYOFWEEK_ISO(a6.VALUEDATE) = 5 THEN SUBSTR(a6.VALUEDATE  + 5 DAYS, 1,10)
    END AS TGL_TARGET,
    p.SYMPTOM AS DESKRIPSI_PEMOHON,
    p.CREATIONUSER AS DIBUAT_OLEH,
    a4.MENUDESCR AS JABATAN_DIBUATOLEH,
    SUBSTR(p.CREATIONDATETIME, 1,10)  AS TGL_DIBUATOLEH,
    TIMESTAMP(SUBSTR(p.CREATIONDATETIME, 1,10)) AS TGL_DIBUATOLEH_CONV_DATE,
    u.LONGDESCRIPTION AS KEPALA_DEPT_PEMOHON,
    u.SEARCHDESCRIPTION AS JABATAN_KEPALA_DEPT,
    a6.VALUEDATE AS TGL_KEPALA_DEPT_PEMOHON,
    p3.ASSIGNEDBYUSERID AS DITERIMA_OLEH_DIT,
    a8.MENUDESCR AS JABATAN_DITERIMA_DIT,
--    p3.PLANNEDSCHDDATE AS TGL_DITERIMA_DIT,
    a6.VALUEDATE AS TGL_DITERIMA_DIT,
    u2.LONGDESCRIPTION AS DIKETAHUI_OLEH_DIT,
    u2.SEARCHDESCRIPTION AS JABATAN_DEPT_DIT,
	a10.VALUEDATE AS TGL_DIKETAHUI_DIT,
	SUBSTR(p3.ENDDATE, 1,10) AS TGL_SELESAI,
	p3.ASSIGNEDTOUSERID AS PROGRAMMER,
	a11.SENDEREMAIL AS EMAIL_PROGRAMMER,
	a13.MENUDESCR AS JABATAN_PROGRAMMER,
	u3.LONGDESCRIPTION AS KEPALA_DEPT_USER_SELESAI,
	u3.SEARCHDESCRIPTION AS JABATAN_DEPT_USER_SELESAI,
	u4.LONGDESCRIPTION AS KEPALA_DEPT_DIT_SELESAI,
	u4.SEARCHDESCRIPTION AS JABATAN_DEPT_DIT_SELESAI,
	CASE
    	WHEN p3.STATUS = 3 THEN 'Done'
    	WHEN p3.STATUS = 2 THEN 'In Progress'
    END AS STATUS
FROM
    PMBREAKDOWNENTRY p
LEFT JOIN DEPARTMENT d ON d.CODE = p.DEPARTMENTCODE
LEFT JOIN PMBOM p2 ON p2.CODE = p.PMBOMCODE
RIGHT JOIN PMWORKORDER p3 ON p3.PMBREAKDOWNENTRYCODE = p.CODE AND NOT p3.ASSIGNEDTOUSERID IS NULL
LEFT JOIN ABSUSERDEF a ON a.USERID = p3.ASSIGNEDTOUSERID
LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = p.ABSUNIQUEID AND a2.FIELDNAME = 'JenisPermohonan'
LEFT JOIN ABSUIINITIALMENU a3 ON a3.USERUSERID = p.CREATIONUSER
LEFT JOIN ABSUIMENU a4 ON a4.CODE = a3.MENU4CODE
LEFT JOIN ADSTORAGE a5 ON a5.UNIQUEID = p.ABSUNIQUEID AND a5.FIELDNAME = 'ApprovalDeptUserCode'
LEFT JOIN ADSTORAGE a6 ON a6.UNIQUEID = p.ABSUNIQUEID AND a6.FIELDNAME = 'TglApprvDeptUser'
LEFT JOIN USERGENERICGROUP u ON u.CODE = a5.VALUESTRING AND u.USERGENERICGROUPTYPECODE = 'HED'
LEFT JOIN ABSUIINITIALMENU a7 ON a7.USERUSERID = p3.ASSIGNEDBYUSERID
LEFT JOIN ABSUIMENU a8 ON a8.CODE = a7.MENU4CODE 
LEFT JOIN ADSTORAGE a9 ON a9.UNIQUEID = p.ABSUNIQUEID AND a9.FIELDNAME = 'ApprovalDeptDITCode'
LEFT JOIN ADSTORAGE a10 ON a10.UNIQUEID = p.ABSUNIQUEID AND a10.FIELDNAME = 'TglApprvDeptDIT'
LEFT JOIN USERGENERICGROUP u2 ON u2.CODE = a9.VALUESTRING AND u2.USERGENERICGROUPTYPECODE = 'DIT'
LEFT JOIN ABSUSERDEF a11 ON a11.USERID = p3.ASSIGNEDTOUSERID 
LEFT JOIN ABSUIINITIALMENU a12 ON a12.USERUSERID = p3.ASSIGNEDTOUSERID
LEFT JOIN ABSUIMENU a13 ON a13.CODE = a12.MENU4CODE
LEFT JOIN ADSTORAGE a14 ON a14.UNIQUEID = p3.ABSUNIQUEID AND a14.FIELDNAME = 'ApprovalDeptUserCode'
LEFT JOIN USERGENERICGROUP u3 ON u3.CODE = a14.VALUESTRING AND u3.USERGENERICGROUPTYPECODE = 'HED'
LEFT JOIN ADSTORAGE a15 ON a15.UNIQUEID = p3.ABSUNIQUEID AND a15.FIELDNAME = 'ApprovalDeptDITCode'
LEFT JOIN ADSTORAGE a16 ON a16.UNIQUEID = p3.ABSUNIQUEID AND a16.FIELDNAME = 'TglApprvDeptDIT'
LEFT JOIN USERGENERICGROUP u4 ON u4.CODE = a15.VALUESTRING AND u4.USERGENERICGROUPTYPECODE = 'DIT'
LEFT JOIN ADSTORAGE a17 ON a17.UNIQUEID = p3.ABSUNIQUEID AND a17.FIELDNAME = 'JenisKerusakan'
WHERE
    p.BREAKDOWNTYPE = 'SF'
--    AND p.IDENTIFIEDDATE BETWEEN '2024-05-01' AND '2024-05-31'
--    AND a4.MENUDESCR IS NULL 
--    AND p.CODE = 'BDIT240001723'
--ORDER BY
--	p3.CODE ASC