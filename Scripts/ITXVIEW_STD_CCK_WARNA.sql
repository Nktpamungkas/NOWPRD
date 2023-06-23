DROP VIEW ITXVIEW_STD_CCK_WARNA;
--CREATE VIEW ITXVIEW_STD_CCK_WARNA AS
SELECT
    s2.SALESORDERCODE,
    s2.ORDERLINE,
    a.NAMENAME,
    CASE
    	WHEN a.VALUESTRING = '1' THEN 'Labdip - ' || a2.VALUESTRING
    	WHEN a.VALUESTRING = '2' THEN 'First Lot - ' || a2.VALUESTRING
    	WHEN a.VALUESTRING = '3' THEN 'Original - ' || a2.VALUESTRING
    	WHEN a.VALUESTRING = '4' THEN 'Previous Order - ' || a2.VALUESTRING
    	WHEN a.VALUESTRING = '5' THEN 'Master Color - ' || a2.VALUESTRING
    	WHEN a.VALUESTRING = '6' THEN 'Lampiran Buyer - ' || a2.VALUESTRING
    	WHEN a.VALUESTRING = '7' THEN 'Body - ' || a2.VALUESTRING
    	ELSE '-'
    END AS STANDART_COCOK_WARNA    
FROM
    SALESORDER s
LEFT JOIN SALESORDERLINE s2 ON s.CODE = s2.SALESORDERCODE
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = s2.ABSUNIQUEID AND a.NAMENAME = 'ColorStandard' 
LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = s2.ABSUNIQUEID AND a2.NAMENAME = 'ColorRemarks'
--WHERE 
--	s2.SALESORDERCODE = 'SAM2200151' AND s2.ORDERLINE = 10
    