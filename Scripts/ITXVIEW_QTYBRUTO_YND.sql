DROP VIEW ITXVIEW_QTYBRUTO_YND;
--CREATE VIEW ITXVIEW_QTYBRUTO_YND AS
SELECT
	s.TRANSACTIONNUMBER,
	a.*
FROM
	STOCKTRANSACTION s
RIGHT JOIN ADSTORAGE a ON a.UNIQUEID = s.ABSUNIQUEID AND a.FIELDNAME = 'QtyBruto'
WHERE 
	s.TRANSACTIONNUMBER = '000007673449'