DROP VIEW ITXVIEWSETTING_MESIN_KNT;
CREATE VIEW ITXVIEWSETTING_MESIN_KNT AS
SELECT DISTINCT 
	PRODUCTIONDEMAND.CODE AS PRODUCTIONDEMAND,
	PRODUCTIONDEMANDSTEP.PRODUCTIONORDERCODE,
	COALESCE(ip2.LANGGANAN, ip.LANGGANAN) AS LANGGANAN,
	COALESCE(PRODUCTIONDEMAND.PROJECTCODE, SALESORDER.CODE) AS NO_ORDER,
	PRODUCTIONDEMAND.SUBCODE03 AS ARTICLE_CODE,
	PRODUCT.ABSUNIQUEID,
	'ITTI /' ||u.SEARCHDESCRIPTION AS PABRIK_NO_MESIN,
	PRODUCT.LONGDESCRIPTION,
	PRODUCTIONDEMAND.ENTEREDUSERPRIMARYQUANTITY AS QTY,
	a2.VALUEDECIMAL AS GAUGE,
	a3.VALUEDECIMAL AS DIAMETER,
	a4.VALUEDECIMAL AS WIDHT,
	a5.VALUEDECIMAL AS GSM,
--	Panjang Benang
	a6.VALUEDECIMAL AS PanjangBenang,
	a7.VALUEDECIMAL AS PanjangBenang1,
	a8.VALUEDECIMAL AS PanjangBenang2,
	a9.VALUEDECIMAL AS PanjangBenang3,
	a10.VALUEDECIMAL AS PanjangBenang4,
	a11.VALUEDECIMAL AS PanjangBenang5,
	a12.VALUEDECIMAL AS PanjangBenang6,
	a13.VALUEDECIMAL AS PanjangBenang7,
--	Komposisi 
	a14.VALUEDECIMAL AS PemakaianBenang,
	a15.VALUEDECIMAL AS PemakaianBenang1,
	a16.VALUEDECIMAL AS PemakaianBenang2,
	a17.VALUEDECIMAL AS PemakaianBenang3,
	a18.VALUEDECIMAL AS PemakaianBenang4,
	a19.VALUEDECIMAL AS PemakaianBenang5,
	a20.VALUEDECIMAL AS PemakaianBenang6,
	a21.VALUEDECIMAL AS PemakaianBenang7,
	'1. ' || imkb.SUMMARIZEDDESCRIPTION AS BENANG,
	'2. ' || imkb2.SUMMARIZEDDESCRIPTION AS BENANG2,
	'3. ' || imkb3.SUMMARIZEDDESCRIPTION AS BENANG3,
	'4. ' || imkb4.SUMMARIZEDDESCRIPTION AS BENANG4,
	'5. ' || imkb5.SUMMARIZEDDESCRIPTION AS BENANG5,
	'6. ' || imkb6.SUMMARIZEDDESCRIPTION AS BENANG6,
	'7. ' || imkb7.SUMMARIZEDDESCRIPTION AS BENANG7,
	'8. ' || imkb8.SUMMARIZEDDESCRIPTION AS BENANG8,
	imkb.SUBCODE01,
	imkb.SUBCODE02,
	imkb.SUBCODE03,
	imkb.SUBCODE04,
	imkb.SUBCODE05,
	imkb.SUBCODE06,
	imkb.SUBCODE07,
	imkb.SUBCODE08,
	imkb.SUBCODE09,
	imkb2.SUBCODE01 AS SUBCODE01_2,
	imkb2.SUBCODE02 AS SUBCODE02_2,
	imkb2.SUBCODE03 AS SUBCODE03_2,
	imkb2.SUBCODE04 AS SUBCODE04_2,
	imkb2.SUBCODE05 AS SUBCODE05_2,
	imkb2.SUBCODE06 AS SUBCODE06_2,
	imkb2.SUBCODE07 AS SUBCODE07_2,
	imkb2.SUBCODE08 AS SUBCODE08_2,
	imkb2.SUBCODE09 AS SUBCODE09_2,
	imkb3.SUBCODE01 AS SUBCODE01_3,
	imkb3.SUBCODE02 AS SUBCODE02_3,
	imkb3.SUBCODE03 AS SUBCODE03_3,
	imkb3.SUBCODE04 AS SUBCODE04_3,
	imkb3.SUBCODE05 AS SUBCODE05_3,
	imkb3.SUBCODE06 AS SUBCODE06_3,
	imkb3.SUBCODE07 AS SUBCODE07_3,
	imkb3.SUBCODE08 AS SUBCODE08_3,
	imkb3.SUBCODE09 AS SUBCODE09_3,
	imkb4.SUBCODE01 AS SUBCODE01_4,
	imkb4.SUBCODE02 AS SUBCODE02_4,
	imkb4.SUBCODE03 AS SUBCODE03_4,
	imkb4.SUBCODE04 AS SUBCODE04_4,
	imkb4.SUBCODE05 AS SUBCODE05_4,
	imkb4.SUBCODE06 AS SUBCODE06_4,
	imkb4.SUBCODE07 AS SUBCODE07_4,
	imkb4.SUBCODE08 AS SUBCODE08_4,
	imkb4.SUBCODE09 AS SUBCODE09_4,
	a22.VALUEDECIMAL AS FEEDERS,
	a23.VALUEDECIMAL AS NEEDLES,
	a24.VALUEDECIMAL AS SPEED,
	a25.VALUEDECIMAL AS TEN_ROTATION,
	a26.VALUEDECIMAL AS ROTATION,
	a27.VALUEDECIMAL AS KG_HOUR,
	a28.VALUEDECIMAL AS STDQTY,
	a29.VALUEDECIMAL AS COTTON,
	a30.VALUEDECIMAL AS POLY,
	a31.VALUEDECIMAL AS SPANDEX,
	a32.VALUEDECIMAL AS RAYON,
	a33.VALUEDECIMAL AS NYLON,
	a34.VALUEDECIMAL AS LAINLAIN
FROM
    PRODUCTIONDEMAND PRODUCTIONDEMAND
LEFT JOIN (
        SELECT
            DISTINCT PRODUCTIONDEMANDCODE,
            PRODUCTIONORDERCODE
        FROM
            PRODUCTIONDEMANDSTEP PRODUCTIONDEMANDSTEP
    ) PRODUCTIONDEMANDSTEP ON
    PRODUCTIONDEMAND.CODE = PRODUCTIONDEMANDSTEP.PRODUCTIONDEMANDCODE
LEFT JOIN SALESORDER SALESORDER ON PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE = SALESORDER.CODE
LEFT JOIN ITXVIEW_PELANGGAN ip ON ip.CODE = PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE AND ip.ORDPRNCUSTOMERSUPPLIERCODE = SALESORDER.ORDPRNCUSTOMERSUPPLIERCODE 
LEFT JOIN ITXVIEW_PELANGGAN ip2 ON ip2.ORDPRNCUSTOMERSUPPLIERCODE = PRODUCTIONDEMAND.CUSTOMERCODE 
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a.FIELDNAME = 'MachineNoCode'
LEFT JOIN USERGENERICGROUP u ON u.USERGENERICGROUPTYPECODE = 'MCK' AND u.CODE = a.VALUESTRING 
LEFT JOIN PRODUCT PRODUCT ON PRODUCT.ITEMTYPECODE = PRODUCTIONDEMAND.ITEMTYPEAFICODE
    AND PRODUCT.SUBCODE01 = PRODUCTIONDEMAND.SUBCODE01
    AND PRODUCT.SUBCODE02 = PRODUCTIONDEMAND.SUBCODE02
    AND PRODUCT.SUBCODE03 = PRODUCTIONDEMAND.SUBCODE03
    AND PRODUCT.SUBCODE04 = PRODUCTIONDEMAND.SUBCODE04
    AND PRODUCT.SUBCODE05 = PRODUCTIONDEMAND.SUBCODE05
    AND PRODUCT.SUBCODE06 = PRODUCTIONDEMAND.SUBCODE06
    AND PRODUCT.SUBCODE07 = PRODUCTIONDEMAND.SUBCODE07
    AND PRODUCT.SUBCODE08 = PRODUCTIONDEMAND.SUBCODE08
    AND PRODUCT.SUBCODE09 = PRODUCTIONDEMAND.SUBCODE09
    AND PRODUCT.SUBCODE10 = PRODUCTIONDEMAND.SUBCODE10
LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = PRODUCT.ABSUNIQUEID AND a2.FIELDNAME = 'Gauge'
LEFT JOIN ADSTORAGE a3 ON a3.UNIQUEID = PRODUCT.ABSUNIQUEID AND a3.FIELDNAME = 'Diameter'
LEFT JOIN ADSTORAGE a4 ON a4.UNIQUEID = PRODUCT.ABSUNIQUEID AND a4.FIELDNAME = 'Width'
LEFT JOIN ADSTORAGE a5 ON a5.UNIQUEID = PRODUCT.ABSUNIQUEID AND a5.FIELDNAME = 'GSM'
-- Panjang Benang
LEFT JOIN ADSTORAGE a6 ON a6.UNIQUEID = PRODUCT.ABSUNIQUEID AND a6.FIELDNAME = 'PanjangBenang1'
LEFT JOIN ADSTORAGE a7 ON a7.UNIQUEID = PRODUCT.ABSUNIQUEID AND a7.FIELDNAME = 'PanjangBenang2'
LEFT JOIN ADSTORAGE a8 ON a8.UNIQUEID = PRODUCT.ABSUNIQUEID AND a8.FIELDNAME = 'PanjangBenang3'
LEFT JOIN ADSTORAGE a9 ON a9.UNIQUEID = PRODUCT.ABSUNIQUEID AND a9.FIELDNAME = 'PanjangBenang4'
LEFT JOIN ADSTORAGE a10 ON a10.UNIQUEID = PRODUCT.ABSUNIQUEID AND a10.FIELDNAME = 'PanjangBenang5'
LEFT JOIN ADSTORAGE a11 ON a11.UNIQUEID = PRODUCT.ABSUNIQUEID AND a11.FIELDNAME = 'PanjangBenang6'
LEFT JOIN ADSTORAGE a12 ON a12.UNIQUEID = PRODUCT.ABSUNIQUEID AND a12.FIELDNAME = 'PanjangBenang7'
LEFT JOIN ADSTORAGE a13 ON a13.UNIQUEID = PRODUCT.ABSUNIQUEID AND a13.FIELDNAME = 'PanjangBenang8'
-- Komposisi
LEFT JOIN ADSTORAGE a14 ON a14.UNIQUEID = PRODUCT.ABSUNIQUEID AND a14.FIELDNAME = 'PemakaianBenang1'
LEFT JOIN ADSTORAGE a15 ON a15.UNIQUEID = PRODUCT.ABSUNIQUEID AND a15.FIELDNAME = 'PemakaianBenang2'
LEFT JOIN ADSTORAGE a16 ON a16.UNIQUEID = PRODUCT.ABSUNIQUEID AND a16.FIELDNAME = 'PemakaianBenang3'
LEFT JOIN ADSTORAGE a17 ON a17.UNIQUEID = PRODUCT.ABSUNIQUEID AND a17.FIELDNAME = 'PemakaianBenang4'
LEFT JOIN ADSTORAGE a18 ON a18.UNIQUEID = PRODUCT.ABSUNIQUEID AND a18.FIELDNAME = 'PemakaianBenang5'
LEFT JOIN ADSTORAGE a19 ON a19.UNIQUEID = PRODUCT.ABSUNIQUEID AND a19.FIELDNAME = 'PemakaianBenang6'
LEFT JOIN ADSTORAGE a20 ON a20.UNIQUEID = PRODUCT.ABSUNIQUEID AND a20.FIELDNAME = 'PemakaianBenang7'
LEFT JOIN ADSTORAGE a21 ON a21.UNIQUEID = PRODUCT.ABSUNIQUEID AND a21.FIELDNAME = 'PemakaianBenang8'
LEFT JOIN ITXVIEWSETTING_MESIN_KNT_BENANG imkb ON imkb.ORDERCODE = PRODUCTIONDEMAND.CODE AND imkb.RESERVATIONLINE = 1
LEFT JOIN ITXVIEWSETTING_MESIN_KNT_BENANG imkb2 ON imkb2.ORDERCODE = PRODUCTIONDEMAND.CODE AND imkb2.RESERVATIONLINE = 2
LEFT JOIN ITXVIEWSETTING_MESIN_KNT_BENANG imkb3 ON imkb3.ORDERCODE = PRODUCTIONDEMAND.CODE AND imkb3.RESERVATIONLINE = 3
LEFT JOIN ITXVIEWSETTING_MESIN_KNT_BENANG imkb4 ON imkb4.ORDERCODE = PRODUCTIONDEMAND.CODE AND imkb4.RESERVATIONLINE = 4
LEFT JOIN ITXVIEWSETTING_MESIN_KNT_BENANG imkb5 ON imkb5.ORDERCODE = PRODUCTIONDEMAND.CODE AND imkb5.RESERVATIONLINE = 5
LEFT JOIN ITXVIEWSETTING_MESIN_KNT_BENANG imkb6 ON imkb6.ORDERCODE = PRODUCTIONDEMAND.CODE AND imkb6.RESERVATIONLINE = 6
LEFT JOIN ITXVIEWSETTING_MESIN_KNT_BENANG imkb7 ON imkb7.ORDERCODE = PRODUCTIONDEMAND.CODE AND imkb7.RESERVATIONLINE = 7
LEFT JOIN ITXVIEWSETTING_MESIN_KNT_BENANG imkb8 ON imkb8.ORDERCODE = PRODUCTIONDEMAND.CODE AND imkb8.RESERVATIONLINE = 8
LEFT JOIN ADSTORAGE a22 ON a22.UNIQUEID = PRODUCT.ABSUNIQUEID AND a22.FIELDNAME = 'FEEDERS'
LEFT JOIN ADSTORAGE a23 ON a23.UNIQUEID = PRODUCT.ABSUNIQUEID AND a23.FIELDNAME = 'NEEDLES'
LEFT JOIN ADSTORAGE a24 ON a24.UNIQUEID = PRODUCT.ABSUNIQUEID AND a24.FIELDNAME = 'RPM'
LEFT JOIN ADSTORAGE a25 ON a25.UNIQUEID = PRODUCT.ABSUNIQUEID AND a25.FIELDNAME = '10ROTATION'
LEFT JOIN ADSTORAGE a26 ON a26.UNIQUEID = PRODUCT.ABSUNIQUEID AND a26.FIELDNAME = 'ROTATION'
LEFT JOIN ADSTORAGE a27 ON a27.UNIQUEID = PRODUCT.ABSUNIQUEID AND a27.FIELDNAME = 'ProductionRate'
LEFT JOIN ADSTORAGE a28 ON a28.UNIQUEID = PRODUCT.ABSUNIQUEID AND a28.FIELDNAME = 'StdrQty'
LEFT JOIN ADSTORAGE a29 ON a29.UNIQUEID = PRODUCT.ABSUNIQUEID AND a29.FIELDNAME = '1row'
LEFT JOIN ADSTORAGE a30 ON a30.UNIQUEID = PRODUCT.ABSUNIQUEID AND a30.FIELDNAME = '2row'
LEFT JOIN ADSTORAGE a31 ON a31.UNIQUEID = PRODUCT.ABSUNIQUEID AND a31.FIELDNAME = '3row'
LEFT JOIN ADSTORAGE a32 ON a32.UNIQUEID = PRODUCT.ABSUNIQUEID AND a32.FIELDNAME = '4row'
LEFT JOIN ADSTORAGE a33 ON a33.UNIQUEID = PRODUCT.ABSUNIQUEID AND a33.FIELDNAME = '5row'
LEFT JOIN ADSTORAGE a34 ON a34.UNIQUEID = PRODUCT.ABSUNIQUEID AND a34.FIELDNAME = '6row'
--WHERE 
--	PRODUCTIONDEMAND.CODE = '00321988'
	
	
-- JENIS BENANG
DROP VIEW ITXVIEWSETTING_MESIN_KNT_BENANG;
--CREATE VIEW ITXVIEWSETTING_MESIN_KNT_BENANG AS
SELECT * FROM (SELECT
	p.ORDERCODE,
	p.RESERVATIONLINE,
	REPLACE(REPLACE(REPLACE(FULLITEMKEYDECODER.ORDERITEMCODE, '    ', ' '), '   ', ' '), '  ', '') AS ORDERITEMCODE,
	TRIM(FULLITEMKEYDECODER.SUMMARIZEDDESCRIPTION) AS SUMMARIZEDDESCRIPTION,
	p.SUBCODE01,
	p.SUBCODE02,
	p.SUBCODE03,
	p.SUBCODE04,
	p.SUBCODE05,
	p.SUBCODE06,
	p.SUBCODE07,
	p.SUBCODE08,
	p.SUBCODE09
FROM
	PRODUCTIONRESERVATION p
LEFT JOIN FULLITEMKEYDECODER FULLITEMKEYDECODER ON
	    FULLITEMKEYDECODER.ITEMTYPECODE = p.ITEMTYPEAFICODE
	    AND FULLITEMKEYDECODER.SUBCODE01 = p.SUBCODE01
	    AND FULLITEMKEYDECODER.SUBCODE02 = p.SUBCODE02
	    AND FULLITEMKEYDECODER.SUBCODE03 = p.SUBCODE03
	    AND FULLITEMKEYDECODER.SUBCODE04 = p.SUBCODE04
	    AND FULLITEMKEYDECODER.SUBCODE05 = p.SUBCODE05
	    AND FULLITEMKEYDECODER.SUBCODE06 = p.SUBCODE06
	    AND FULLITEMKEYDECODER.SUBCODE07 = p.SUBCODE07
	    AND FULLITEMKEYDECODER.SUBCODE08 = p.SUBCODE08
	    AND FULLITEMKEYDECODER.SUBCODE09 = p.SUBCODE09
WHERE
	ORDERCODE = '00321988'
ORDER BY 
	p.RESERVATIONLINE ASC)
	
--LOT
DROP VIEW ITXVIEWSETTING_MESIN_LOT;
--CREATE VIEW ITXVIEWSETTING_MESIN_LOT AS
SELECT 
	ROW_NUMBER() OVER (PARTITION BY PRODUCTIONORDERCODE ORDER BY PRODUCTIONORDERCODE) AS NOMORURUT, * 
FROM (
SELECT
	DISTINCT
	PRODUCTIONORDERCODE,
	LOTCODE,
	DECOSUBCODE01,
	DECOSUBCODE02,
	DECOSUBCODE03,
	DECOSUBCODE04,
	DECOSUBCODE05,
	DECOSUBCODE06,
	DECOSUBCODE07,
	DECOSUBCODE08,
	DECOSUBCODE09
FROM
	STOCKTRANSACTION s
WHERE 
	TEMPLATECODE = '120'
	AND (LOGICALWAREHOUSECODE = 'P501' OR LOGICALWAREHOUSECODE = 'M904')
	AND TEMPLATECODE = '120'
	AND TRANSACTIONDETAILNUMBER = '1'
--	AND PRODUCTIONORDERCODE = '00186828'
--	AND DECOSUBCODE01 = 'NE30/1              '
--	AND DECOSUBCODE02 = 'CB        '
--	AND DECOSUBCODE03 = '100       '
--	AND DECOSUBCODE04 = 'CMP       '
--	AND DECOSUBCODE05 = 'Z         '
--	AND DECOSUBCODE06 = '-         '
--	AND DECOSUBCODE07 = '-         '
--	AND DECOSUBCODE08 = '-         '
)