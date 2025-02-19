DROP VIEW ITXVIEW_PI_BIAYATAMBAHAN;
--CREATE VIEW ITXVIEW_PI_BIAYATAMBAHAN AS
SELECT
	s.SALESORDERCODE,
	SUM(i.VALUE) AS BIAYA_TAMBAHAN,
	'Total Surcharge MOQ' AS JUDUL
FROM 
	SALESORDERLINE s 
LEFT JOIN INDTAXDETAIL i ON i.ABSUNIQUEID = s.ABSUNIQUEID AND ( i.ITAXCODE  = 'SUR' OR  i.ITAXCODE = 'OH1' OR i.ITAXCODE ='SCR')
--WHERE 
--	s.SALESORDERCODE = 'DOM2201523'
GROUP BY 
	s.SALESORDERCODE