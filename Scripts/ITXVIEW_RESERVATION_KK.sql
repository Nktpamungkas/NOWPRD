DROP VIEW ITXVIEW_RESERVATION_KK;
--CREATE VIEW ITXVIEW_RESERVATION_KK AS 
SELECT
	*
FROM 
	PRODUCTIONRESERVATION 
WHERE 
	(ITEMTYPEAFICODE = 'KGF' OR ITEMTYPEAFICODE = 'KFF') 
--	AND ORDERCODE = '00135650'