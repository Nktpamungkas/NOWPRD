--CREATE VIEW ITXVIEWPROD_SUFFIX AS
SELECT p.CREATIONDATETIME,
	i.DEAMAND,
    p.PRODUCTIONORDERCODE,
    i2.USEDUSERPRIMARYQUANTITY AS QTY_BAGIKAIN,
    p.SUBCODE01, 
    p.SUFFIXCODE  
FROM 
    PRODUCTIONORDERRESERVATION p
LEFT JOIN ITXVIEWKK i ON i.PRODUCTIONORDERCODE = p.PRODUCTIONORDERCODE 
LEFT JOIN PRODUCTIONRESERVATION i2 ON i2.ORDERCODE = i.DEAMAND AND i2.ITEMTYPEAFICODE = 'KGF'
--WHERE p.SUFFIXCODE LIKE '%22100504D-S3%' 
--ORDER BY p.PRODUCTIONORDERCODE DESC