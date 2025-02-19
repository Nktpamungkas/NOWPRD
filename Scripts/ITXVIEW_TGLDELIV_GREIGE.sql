DROP VIEW ITXVIEW_TGLDELIV_GREIGE;
--CREATE VIEW ITXVIEW_TGLDELIV_GREIGE AS 
SELECT
    DISTINCT 
	s.SALESORDERCODE,
    s.ORDERLINE,
    a_project1.VALUESTRING AS OPN1,
    a2_project1.VALUEDATE AS DATE1,
    a_project2.VALUESTRING AS OPN2,
    a2_project2.VALUEDATE AS DATE2,
    a_project3.VALUESTRING AS OPN3,
    a2_project3.VALUEDATE AS DATE3,
    a_project4.VALUESTRING AS OPN4,
    a2_project4.VALUEDATE AS DATE4
FROM
    SALESORDERLINE s
LEFT JOIN PRODUCTIONDEMAND p ON p.ORIGDLVSALORDLINESALORDERCODE = s.SALESORDERCODE AND p.ORIGDLVSALORDERLINEORDERLINE = s.ORDERLINE
    -- FROM PROJECT 1
LEFT JOIN ADSTORAGE a_project1 ON a_project1.UNIQUEID = p.ABSUNIQUEID AND a_project1.FIELDNAME = 'ProAllow'
LEFT JOIN PRODUCTIONDEMAND p2_project1 ON p2_project1.ORIGDLVSALORDLINESALORDERCODE = a_project1.VALUESTRING
LEFT JOIN ADSTORAGE a2_project1 ON a2_project1.UNIQUEID = p2_project1.ABSUNIQUEID AND a2_project1.FIELDNAME = 'RMPGreigeReqDateTo'
    -- FROM PROJECT 2 
LEFT JOIN ADSTORAGE a_project2 ON a_project2.UNIQUEID = p.ABSUNIQUEID AND a_project2.FIELDNAME = 'ProAllow2'
LEFT JOIN PRODUCTIONDEMAND p2_project2 ON p2_project2.ORIGDLVSALORDLINESALORDERCODE = a_project2.VALUESTRING
LEFT JOIN ADSTORAGE a2_project2 ON a2_project2.UNIQUEID = p2_project2.ABSUNIQUEID AND a2_project2.FIELDNAME = 'RMPGreigeReqDateTo'
    -- FROM PROJECT 3 
LEFT JOIN ADSTORAGE a_project3 ON a_project3.UNIQUEID = p.ABSUNIQUEID AND a_project3.FIELDNAME = 'ProAllow3'
LEFT JOIN PRODUCTIONDEMAND p2_project3 ON p2_project3.ORIGDLVSALORDLINESALORDERCODE = a_project3.VALUESTRING
LEFT JOIN ADSTORAGE a2_project3 ON a2_project3.UNIQUEID = p2_project3.ABSUNIQUEID AND a2_project3.FIELDNAME = 'RMPGreigeReqDateTo'
    -- FROM PROJECT 4 
LEFT JOIN ADSTORAGE a_project4 ON a_project4.UNIQUEID = p.ABSUNIQUEID AND a_project4.FIELDNAME = 'ProAllow4'
LEFT JOIN PRODUCTIONDEMAND p2_project4 ON p2_project4.ORIGDLVSALORDLINESALORDERCODE = a_project4.VALUESTRING
LEFT JOIN ADSTORAGE a2_project4 ON a2_project4.UNIQUEID = p2_project4.ABSUNIQUEID AND a2_project4.FIELDNAME = 'RMPGreigeReqDateTo';

LEFT JOIN PRODUCTIONDEMAND p2 ON p2.ORIGDLVSALORDLINESALORDERCODE = s.SALESORDERCODE AND p2.ORIGDLVSALORDERLINEORDERLINE = s.ORDERLINE AND p2.ITEMTYPEAFICODE = 'KGF'
LEFT JOIN ADSTORAGE a_demandkgf ON a_demandkgf.UNIQUEID = p.ABSUNIQUEID AND a_demandkgf.FIELDNAME = 'RMPGreigeReqDateTo'