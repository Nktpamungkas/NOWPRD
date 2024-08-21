-- DB2ADMIN.ITXVIEWBONORDER source
DROP VIEW ITXVIEWBONORDER;
--CREATE VIEW ITXVIEWBONORDER AS 
SELECT * FROM (
SELECT
    DISTINCT
    SALESORDER.CREATIONDATETIME AS CREATIONDATETIME_SALESORDER,
    SALESORDERLINE.LINESTATUS,
    a33.VALUESTRING AS PRODUCTIONORDER_AKW,
    PRODUCTIONDEMAND.CODE AS DEMAND,
    SALESORDER.CODE AS SALESORDERCODE,
    SALESORDERLINE.ORDERLINE,
    BUSINESSPARTNER.POSTALCODE AS ORDERPARTNERPOSTALCODE,
    BUSINESSPARTNER.TOWN AS ORDERPARTNERTOWN,
    BUSINESSPARTNER.DISTRICT AS ORDERPARTNERDISTRICT,
    TERMSOFSHIPPING.LONGDESCRIPTION AS TERMSOFSHPLONGDESCRIPTION,
    PAYMENTMETHOD.LONGDESCRIPTION AS PAYMENTMETHODLONGDESCRIPTION,
    SALESORDERLINE.EXTERNALREFERENCE,
    SALESORDERLINE.INTERNALREFERENCE AS INTERNALREFERENCE_SALESORDERLINE,
    SALESORDERLINE.ITEMTYPEAFICODE,
    SALESORDERLINE.SUBCODE01,
    SALESORDERLINE.SUBCODE02,
    SALESORDERLINE.SUBCODE03,
    SALESORDERLINE.SUBCODE04,
    COALESCE(p.SUBCODE02, SALESORDERLINE.SUBCODE02) AS RESERVATION_SUBCODE02,
    COALESCE(p.SUBCODE03, SALESORDERLINE.SUBCODE03) AS RESERVATION_SUBCODE03,
    COALESCE(p.SUBCODE04, SALESORDERLINE.SUBCODE04) AS RESERVATION_SUBCODE04,
    SALESORDERLINE.SUBCODE05,
    SALESORDERLINE.SUBCODE06,
    SALESORDERLINE.SUBCODE07,
    SALESORDERLINE.SUBCODE08,
    SALESORDERLINE.SUBCODE09,
    SALESORDERLINE.SUBCODE10,
    SALESORDERLINE.USERPRIMARYUOMCODE,
    SALESORDERLINE.USERPRIMARYQUANTITY,
    SALESORDERLINE.USERSECONDARYUOMCODE,
    SALESORDERLINE.USERSECONDARYQUANTITY,
    SALESORDERLINE.BASESECONDARYQUANTITY,
    SALESORDERLINE.BASEPRIMARYQUANTITY,
    SALESORDERLINE.NETVALUE,
    i.WARNA,
    SALESORDERLINE.ABSUNIQUEID AS ABSUNIQUEID_SALESORDERLINE,
    SALESORDER.CODE,
    SALESORDER.ORDERDATE,
    SALESORDER.ORDPRNCUSTOMERSUPPLIERCODE,
    SALESORDER.ORDERPARTNERBRANDCODE,
    SALESORDER.DESCRIPTION,
    SALESORDER.INTERNALREFERENCE AS INTERNALREFERENCE_SALESORDER,
    SALESORDER.STATISTICALGROUPCODE,
    SALESORDER.CREATIONUSER,
    SALESORDER.ABSUNIQUEID AS ABSUNIQUEID_SALESORDER,
    ORDERPARTNER.ABSUNIQUEID AS ABSUNIQUEID_ORDERPARTNER,
    BUSINESSPARTNER.LEGALNAME1,
    BUSINESSPARTNER.PERSON,
    BUSINESSPARTNER.PHONENUMBER,
    BUSINESSPARTNER.FAXNUMBER,
    ADDRESS.ADDRESSEE,
    ADDRESS.ADDRESSLINE1,
    ADDRESS.ADDRESSLINE2,
    ADDRESS.TOWN,
    ADDRESS.DISTRICT,
    ADDRESS.ADDRESSPHONENUMBER,
    ADDRESS.ADDRESSFAXNUMBER,
    COUNTRY.LONGDESCRIPTION,
    COUNTRY_1.LONGDESCRIPTION AS LONGDESCRIPTION_1,
    BUSINESSPARTNER.TAXREGISTRATIONNUMBER,
    BUSINESSPARTNER.FISCALCODE,
    PRODUCTIONDEMAND.ABSUNIQUEID,
    a2.VALUESTRING AS ADDITIONALDATA,
    a7.VALUEDECIMAL AS QTY,
    a3.VALUESTRING AS ADDITIONALDATA2,
    a8.VALUEDECIMAL AS QTY2,
    a4.VALUESTRING AS ADDITIONALDATA3,
    a9.VALUEDECIMAL AS QTY3,
    a5.VALUESTRING AS ADDITIONALDATA4,
    a10.VALUEDECIMAL AS QTY4,
    a6.VALUESTRING AS ADDITIONALDATA5,
    a11.VALUEDECIMAL AS QTY5,
    a35.VALUESTRING AS ADDITIONALDATA6,
    a38.VALUEDECIMAL AS QTY7,
    a18.VALUESTRING AS LEGACYORDER,
    a19.VALUEDECIMAL AS QTY6,
    a12.VALUEDATE AS DATE_AKTUAL,
    a27.VALUEDATE AS DATE_AKTUAL_TO,
    a13.VALUEDATE AS DATE_AKTUAL2,
    a28.VALUEDATE AS DATE_AKTUAL_TO2,
    a14.VALUEDATE AS DATE_AKTUAL3,
    a29.VALUEDATE AS DATE_AKTUAL_TO3,
    a15.VALUEDATE AS DATE_AKTUAL4,
    a30.VALUEDATE AS DATE_AKTUAL_TO4,
    a16.VALUEDATE AS DATE_AKTUAL5,
    a31.VALUEDATE AS DATE_AKTUAL_TO5,
    a20.VALUEDATE AS DATE_AKTUAL6,
    a32.VALUEDATE AS DATE_AKTUAL_TO6,
    a39.VALUEDATE AS DATE_AKTUAL7,
    a40.VALUEDATE AS DATE_AKTUAL_TO7,
    CASE
        WHEN a17.VALUESTRING = '1' THEN 'AKJ'
        WHEN a17.VALUESTRING = '2' THEN 'AKW'
        ELSE 'NON AKJ'
    END AS AKJ,
    CASE
        WHEN BUSINESSPARTNER.LEGALNAME1 LIKE '%SINTEX%' THEN 'With Shipping'
        WHEN BUSINESSPARTNER.LEGALNAME1 LIKE '%MAS%' THEN 'With Shipping'
        WHEN BUSINESSPARTNER.LEGALNAME1 LIKE '%INQUBE%' THEN 'With Shipping'
        ELSE 'Without Shipping'
    END AS shipping_mark,
    a21.VALUESTRING AS PROD_ORDER_AKJ,
    a22.VALUESTRING AS SALESORDER_AKJ,
    a23.VALUESTRING AS PROD_ORDER_AKJ2,
    a24.VALUESTRING AS SALESORDER_AKJ2,
    a25.VALUESTRING AS PROD_ORDER_AKJ3,
    a26.VALUESTRING AS SALESORDER_AKJ3,
    a34.VALUESTRING AS NOTETAS
FROM
    SALESORDER SALESORDER
LEFT OUTER JOIN SALESORDERLINE SALESORDERLINE ON SALESORDERLINE.SALESORDERCODE = SALESORDER.CODE AND SALESORDERLINE.LINESTATUS = 1
LEFT OUTER JOIN PAYMENTMETHOD PAYMENTMETHOD ON PAYMENTMETHOD.CODE = SALESORDERLINE.PAYMENTMETHODCODE
LEFT OUTER JOIN TERMSOFSHIPPING TERMSOFSHIPPING ON TERMSOFSHIPPING.CODE = SALESORDER.TERMSOFSHIPPINGCODE
LEFT OUTER JOIN ORDERPARTNERBANK ORDERPARTNERBANK ON SALESORDER.COMPANYCODE = ORDERPARTNERBANK.ORDPRNCSMSUPPLIERCOMPANYCODE AND SALESORDER.ORDPRNCUSTOMERSUPPLIERCODE = ORDERPARTNERBANK.ORDPRNCUSTOMERSUPPLIERCODE AND SALESORDER.ORDERPARTNERBANKIDENTIFIER = ORDERPARTNERBANK.IDENTIFIER
LEFT OUTER JOIN BANK BANK ON ORDERPARTNERBANK.BANKBRANCHCODE = BANK.BRANCHCODE AND ORDERPARTNERBANK.BANKCODE = BANK.CODE
LEFT OUTER JOIN ORDERPARTNER ORDERPARTNER ON SALESORDER.COMPANYCODE = ORDERPARTNER.CUSTOMERSUPPLIERCOMPANYCODE AND SALESORDER.ORDERTYPE = ORDERPARTNER.CUSTOMERSUPPLIERTYPE AND SALESORDER.ORDPRNCUSTOMERSUPPLIERCODE = ORDERPARTNER.CUSTOMERSUPPLIERCODE
LEFT OUTER JOIN BUSINESSPARTNER BUSINESSPARTNER ON ORDERPARTNER.ORDERBUSINESSPARTNERNUMBERID = BUSINESSPARTNER.NUMBERID
LEFT OUTER JOIN SALESORDERTEMPLATE SALESORDERTEMPLATE ON SALESORDER.TEMPLATECODE = SALESORDERTEMPLATE.CODE AND SALESORDER.COMPANYCODE = SALESORDERTEMPLATE.COMPANYCODE
LEFT OUTER JOIN AGENT AGENT ON SALESORDER.COMPANYCODE = AGENT.COMPANYCODE AND SALESORDER.AGENT1CODE = AGENT.CODE
LEFT OUTER JOIN ADDRESS ADDRESS ON SALESORDER.DELIVERYPOINTUNIQUEID = ADDRESS.UNIQUEID AND SALESORDER.DELIVERYPOINTCODE = ADDRESS.CODE
LEFT OUTER JOIN COUNTRY COUNTRY ON ADDRESS.COUNTRYCODE = COUNTRY.CODE
LEFT OUTER JOIN COUNTRY COUNTRY_1 ON BUSINESSPARTNER.COUNTRYCODE = COUNTRY_1.CODE
LEFT OUTER JOIN PRODUCTIONDEMAND ON PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE = SALESORDERLINE.SALESORDERCODE AND PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE = SALESORDERLINE.ORDERLINE
LEFT JOIN ADSTORAGE a2 ON a2.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a2.FIELDNAME = 'ProAllow'
LEFT JOIN ADSTORAGE a3 ON a3.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a3.FIELDNAME = 'ProAllow2'
LEFT JOIN ADSTORAGE a4 ON a4.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a4.FIELDNAME = 'ProAllow3'
LEFT JOIN ADSTORAGE a5 ON a5.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a5.FIELDNAME = 'ProAllow4'
LEFT JOIN ADSTORAGE a6 ON a6.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a6.FIELDNAME = 'ProAllow5'
LEFT JOIN ADSTORAGE a35 ON a35.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a35.FIELDNAME = 'ProAllow7'
LEFT JOIN ADSTORAGE a7 ON a7.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a7.FIELDNAME = 'ProAllowQty'
LEFT JOIN ADSTORAGE a8 ON a8.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a8.FIELDNAME = 'ProAllowQty2'
LEFT JOIN ADSTORAGE a9 ON a9.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a9.FIELDNAME = 'ProAllowQty3'
LEFT JOIN ADSTORAGE a10 ON a10.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a10.FIELDNAME = 'ProAllowQty4'
LEFT JOIN ADSTORAGE a11 ON a11.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a11.FIELDNAME = 'ProAllowQty5'
LEFT JOIN ADSTORAGE a38 ON a38.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a38.FIELDNAME = 'ProAllowQty7'
LEFT JOIN ADSTORAGE a12 ON a12.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a12.FIELDNAME = 'ProAllowDate'
LEFT JOIN ADSTORAGE a13 ON a13.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a13.FIELDNAME = 'ProAllowDate2'
LEFT JOIN ADSTORAGE a14 ON a14.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a14.FIELDNAME = 'ProAllowDate3'
LEFT JOIN ADSTORAGE a15 ON a15.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a15.FIELDNAME = 'ProAllowDate4'
LEFT JOIN ADSTORAGE a16 ON a16.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a16.FIELDNAME = 'ProAllowDate5'
LEFT JOIN ADSTORAGE a39 ON a39.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a39.FIELDNAME = 'ProAllowDate7'
LEFT JOIN ADSTORAGE a17 ON a17.UNIQUEID = SALESORDERLINE.ABSUNIQUEID AND a17.FIELDNAME = 'KainAKJ'
LEFT JOIN ADSTORAGE a18 ON a18.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a18.FIELDNAME = 'LegacyOrder'
LEFT JOIN ADSTORAGE a19 ON a19.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a19.FIELDNAME = 'ProAllowQty6'
LEFT JOIN ADSTORAGE a20 ON a20.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a20.FIELDNAME = 'ProAllowDate6'
LEFT JOIN ITXVIEWCOLOR i ON i.ITEMTYPECODE = SALESORDERLINE.ITEMTYPEAFICODE
    AND i.SUBCODE01 = SALESORDERLINE.SUBCODE01
    AND i.SUBCODE02 = SALESORDERLINE.SUBCODE02
    AND i.SUBCODE03 = SALESORDERLINE.SUBCODE03
    AND i.SUBCODE04 = SALESORDERLINE.SUBCODE04
    AND i.SUBCODE05 = SALESORDERLINE.SUBCODE05
    AND i.SUBCODE06 = SALESORDERLINE.SUBCODE06
    AND i.SUBCODE07 = SALESORDERLINE.SUBCODE07
    AND i.SUBCODE08 = SALESORDERLINE.SUBCODE08
    AND i.SUBCODE09 = SALESORDERLINE.SUBCODE09
    AND i.SUBCODE10 = SALESORDERLINE.SUBCODE10
LEFT JOIN PRODUCTIONRESERVATION p ON
    p.ORDERCODE = PRODUCTIONDEMAND.CODE
    AND (
        p.ITEMTYPEAFICODE = 'KGF'
            OR p.ITEMTYPEAFICODE = 'KFF'
    )
LEFT JOIN ADSTORAGE a21 ON a21.UNIQUEID = SALESORDERLINE.ABSUNIQUEID AND a21.FIELDNAME = 'PrevProdOrderCode'
LEFT JOIN ADSTORAGE a22 ON a22.UNIQUEID = SALESORDERLINE.ABSUNIQUEID AND a22.FIELDNAME = 'PrevSalesOrderCode'
LEFT JOIN ADSTORAGE a23 ON a23.UNIQUEID = SALESORDERLINE.ABSUNIQUEID AND a23.FIELDNAME = 'PrevProdOrder2Code'
LEFT JOIN ADSTORAGE a24 ON a24.UNIQUEID = SALESORDERLINE.ABSUNIQUEID AND a24.FIELDNAME = 'PrevSalesOrder2Code'
LEFT JOIN ADSTORAGE a25 ON a25.UNIQUEID = SALESORDERLINE.ABSUNIQUEID AND a25.FIELDNAME = 'PrevProdOrder3Code'
LEFT JOIN ADSTORAGE a26 ON a26.UNIQUEID = SALESORDERLINE.ABSUNIQUEID AND a26.FIELDNAME = 'PrevSalesOrder3Code'
LEFT JOIN ADSTORAGE a27 ON a27.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a27.FIELDNAME = 'ProAllowDateto'
LEFT JOIN ADSTORAGE a28 ON a28.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a28.FIELDNAME = 'ProAllowDate2to'
LEFT JOIN ADSTORAGE a29 ON a29.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a29.FIELDNAME = 'ProAllowDate3to'
LEFT JOIN ADSTORAGE a30 ON a30.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a30.FIELDNAME = 'ProAllowDate4to'
LEFT JOIN ADSTORAGE a31 ON a31.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a31.FIELDNAME = 'ProAllowDate5to'
LEFT JOIN ADSTORAGE a32 ON a32.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a32.FIELDNAME = 'ProAllowDate6to'
LEFT JOIN ADSTORAGE a40 ON a40.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a40.FIELDNAME = 'ProAllowDate7to'
LEFT JOIN ADSTORAGE a33 ON a33.UNIQUEID = SALESORDERLINE.ABSUNIQUEID AND a33.FIELDNAME = 'PrevProdOrderCode'
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
LEFT JOIN ADSTORAGE a34 ON a34.UNIQUEID = PRODUCT.ABSUNIQUEID AND a34.FIELDNAME = 'NoteTas'
WHERE
--        	SALESORDER.CODE = 'SAM2400289' AND 
--        	SALESORDERLINE.ORDERLINE = '60' AND 
    SALESORDERLINE.LINESTATUS = 1
    AND
    SALESORDER.CODE IS NOT NULL
    ORDER BY PRODUCTIONDEMAND.CODE ASC)