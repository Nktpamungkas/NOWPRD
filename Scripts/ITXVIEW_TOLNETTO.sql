DROP VIEW ITXVIEW_TOLNETTO;
--CREATE VIEW ITXVIEW_TOLNETTO AS 
SELECT
    p.CODE,
    s.SALESORDERLINESALESORDERCODE,
    s2.ORDPRNCUSTOMERSUPPLIERCODE,
    o.ABSUNIQUEID,
    s.USERPRIMARYQUANTITY,
    a.VALUEDECIMAL AS N,
    a2.VALUEDECIMAL AS P
FROM
    PRODUCTIONDEMAND p
LEFT JOIN SALESORDERDELIVERY s ON s.SALORDLINESALORDERCOMPANYCODE = p.COMPANYCODE
						    AND s.SALORDLINESALORDERCOUNTERCODE = p.DLVSALORDLINESALORDCNTCODE
						    AND s.SALESORDERLINESALESORDERCODE = p.DLVSALORDERLINESALESORDERCODE
						    AND s.SALESORDERLINEORDERLINE = p.DLVSALESORDERLINEORDERLINE
						    AND s.SALESORDERLINEORDERSUBLINE = p.DLVSALESORDERLINEORDERSUBLINE
						    AND s.SALORDLINECOMPONENTORDERLINE = p.DLVSALORDLINECMPORDERLINE
						    AND s.DELIVERYLINE = p.DELIVERYDELIVERYLINE
LEFT JOIN SALESORDER s2 ON s2.CODE = s.SALESORDERLINESALESORDERCODE
LEFT JOIN ORDERPARTNER o ON o.CUSTOMERSUPPLIERCODE = s2.ORDPRNCUSTOMERSUPPLIERCODE
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = o.ABSUNIQUEID AND NOT a.VALUEDECIMAL IS NULL AND a.FIELDNAME = 'ShippingToleranceN'
LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = o.ABSUNIQUEID AND NOT a2.VALUEDECIMAL IS NULL AND a2.FIELDNAME = 'ShippingToleranceP'