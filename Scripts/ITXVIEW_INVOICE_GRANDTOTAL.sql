DROP VIEW ITXVIEW_INVOICE_GRANDTOTAL;
--CREATE VIEW ITXVIEW_INVOICE_GRANDTOTAL AS
SELECT
    SALESDOCUMENTPROVISIONALCODE,
    '100' AS SALESDOCUMENTCOMPANYCODE,
    SALDOCPROVISIONALCOUNTERCODE AS SALDOCPROVISIONALCOUNTERCODE,
    sum(USERPRIMARYQUANTITY) AS total_kg,
    sum(USERSECONDARYQUANTITY) AS total_yard,
    sum(BASESECONDARYQUANTITY) AS total_meter,
    sum(QTY_PCS) AS total_unit,
    CASE
        WHEN CURR = 'USD' THEN ROUND(SUM(JML_HARGA_YD), 2)
        WHEN CURR = 'IDR' THEN FLOOR(SUM(JML_HARGA_YD))
    END AS TOTAL_jml_harga_YD,
       CASE
        WHEN CURR = 'USD' THEN round(SUM(JML_HARGA_KG), 2)
        WHEN CURR = 'IDR' THEN FLOOR(SUM(JML_HARGA_KG))
    END AS TOTAL_jml_harga_kg,
   CASE
        WHEN CURR = 'USD' THEN round(SUM(JML_HARGA_M), 2)
        WHEN CURR = 'IDR' THEN FLOOR(SUM(JML_HARGA_M))
    END AS TOTAL_jml_harga_m,
       CASE
        WHEN CURR = 'USD' THEN round(SUM(JML_HARGA_UN), 2)
        WHEN CURR = 'IDR' THEN FLOOR(SUM(JML_HARGA_UN))
    END AS TOTAL_jml_harga_un
FROM
    ITXVIEW_ALLOCATION_2B iab 
--WHERE 
--	SALESDOCUMENTPROVISIONALCODE = 'ESP2300764'
GROUP BY
	SALESDOCUMENTPROVISIONALCODE,
	SALDOCPROVISIONALCOUNTERCODE,
	CURR