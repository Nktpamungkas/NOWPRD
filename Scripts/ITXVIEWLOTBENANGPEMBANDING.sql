DROP VIEW ITXVIEWLOTBENANGPEMBANDING;
CREATE VIEW ITXVIEWLOTBENANGPEMBANDING AS 
SELECT 
	*
FROM 
	ADSTORAGE a 
WHERE
	a.FIELDNAME = 'LotBenang'