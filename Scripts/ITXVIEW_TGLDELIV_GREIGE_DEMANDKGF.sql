DROP VIEW ITXVIEW_TGLDELIV_GREIGE_DEMANDKGF;
--CREATE VIEW ITXVIEW_TGLDELIV_GREIGE_DEMANDKGF AS 
SELECT
    DISTINCT 
	s.SALESORDERCODE,
    s.ORDERLINE,
    a.VALUEDATE
FROM
    SALESORDERLINE s
LEFT JOIN PRODUCTIONDEMAND p ON p.ORIGDLVSALORDLINESALORDERCODE = s.SALESORDERCODE AND p.ORIGDLVSALORDERLINEORDERLINE = s.ORDERLINE AND p.ITEMTYPEAFICODE = 'KGF'
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = p.ABSUNIQUEID AND a.FIELDNAME = 'RMPGreigeReqDateTo'