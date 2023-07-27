DROP VIEW ITXVIEW_SURATJALAN_PPC_FOR_POSELESAI;
--CREATE VIEW ITXVIEW_SURATJALAN_PPC_FOR_POSELESAI AS
SELECT
    DISTINCT 
    s.PROGRESSSTATUS,
   	SALESDOCUMENT.DOCUMENTTYPETYPE,
    BUSINESSPARTNER.NUMBERID,
    BUSINESSPARTNER.LEGALNAME1,
    BUSINESSPARTNER.ADDRESSPHONENUMBER,
    BUSINESSPARTNER.ADDRESSFAXNUMBER,
    ALLOCATION.CODE,
    ALLOCATION.DECOSUBCODE01,
    ALLOCATION.DECOSUBCODE02,
    ALLOCATION.DECOSUBCODE03,
    ALLOCATION.DECOSUBCODE04,
    ALLOCATION.DECOSUBCODE05,
    ALLOCATION.DECOSUBCODE06,
    ALLOCATION.DECOSUBCODE07,
    ALLOCATION.DECOSUBCODE08,
    ALLOCATION.DECOSUBCODE09,
    ALLOCATION.DECOSUBCODE10,
    ALLOCATION.BASESECONDARYUOMCODE,
--    WRKDOCUMENTPRINT.DELIVERYPOINTADDRESSLINE1,
--    WRKDOCUMENTPRINT.DELIVERYPOINTADDRESSLINE2,
--    WRKDOCUMENTPRINT.DELIVERYPOINTADDRESSLINE3,
--    WRKDOCUMENTPRINT.DELIVERYPOINTPOSTALCODE,
--    WRKDOCUMENTPRINT.DELIVERYPOINTTOWN,
--    WRKDOCUMENTPRINT.DELIVERYPOINTDISTRICT,
    SALESDOCUMENT.SALESORDERCOUNTERCODE,
    SALESDOCUMENT.PROJECTCODE,
    SALESDOCUMENT.DEFINITIVEDOCUMENTDATE,
    SALESDOCUMENT.PROVISIONALCODE,
    SALESDOCUMENT.PROVISIONALDOCUMENTDATE,
    SALESDOCUMENT.ORDPRNCUSTOMERSUPPLIERCODE,
    SALESDOCUMENT.ORDERPARTNERBRANDCODE,
    SALESDOCUMENT.GOODSISSUEDATE,
    SALESDOCUMENT.ABSUNIQUEID,
    CASE
        WHEN SALESDOCUMENT.EXTERNALREFERENCE IS NULL THEN SALESDOCUMENTLINE.EXTERNALREFERENCE
        ELSE SALESDOCUMENT.EXTERNALREFERENCE
    END AS PO_NUMBER,
    SALESDOCUMENTLINE.ITEMTYPEAFICODE,
    SALESDOCUMENTLINE.SUBCODE01,
    SALESDOCUMENTLINE.SUBCODE02,
    SALESDOCUMENTLINE.SUBCODE03,
    SALESDOCUMENTLINE.SUBCODE04,
    SALESDOCUMENTLINE.SUBCODE05,
    SALESDOCUMENTLINE.SUBCODE06,
    SALESDOCUMENTLINE.SUBCODE07,
    SALESDOCUMENTLINE.SUBCODE08,
    SALESDOCUMENTLINE.SUBCODE09,
    SALESDOCUMENTLINE.SUBCODE10,
    SALESDOCUMENTLINE.ITEMDESCRIPTION,
    SALESDOCUMENTLINE.DLVSALORDERLINESALESORDERCODE,
    CASE
    	WHEN a.VALUESTRING IS NOT NULL THEN CAST(a.VALUESTRING as decimal(5)) 
    	ELSE CAST(SALESDOCUMENTLINE.DLVSALESORDERLINEORDERLINE as decimal(5))
    END DLVSALESORDERLINEORDERLINE,
    SALESDOCUMENT.PAYMENTMETHODCODE,
    SALESDOCUMENT.CURRENCYCODE,
    SALESDOCUMENTLINE.PRICE,
    SALESDOCUMENTLINE.PRICEUNITOFMEASURECODE,
    ORDERPARTNERBRAND.LONGDESCRIPTION
FROM
    SALESDOCUMENT SALESDOCUMENT
LEFT OUTER JOIN SALESDOCUMENTLINE SALESDOCUMENTLINE ON SALESDOCUMENTLINE.SALESDOCUMENTPROVISIONALCODE = SALESDOCUMENT.PROVISIONALCODE 
LEFT OUTER JOIN ORDERPARTNER ORDERPARTNER ON SALESDOCUMENT.COMPANYCODE = ORDERPARTNER.CUSTOMERSUPPLIERCOMPANYCODE
    AND SALESDOCUMENT.ORDERTYPE = ORDERPARTNER.CUSTOMERSUPPLIERTYPE AND SALESDOCUMENT.ORDPRNCUSTOMERSUPPLIERCODE = ORDERPARTNER.CUSTOMERSUPPLIERCODE
LEFT OUTER JOIN BUSINESSPARTNER BUSINESSPARTNER ON ORDERPARTNER.ORDERBUSINESSPARTNERNUMBERID = BUSINESSPARTNER.NUMBERID
LEFT OUTER JOIN CUSTOMERSUPPLIERDATA CUSTOMERSUPPLIERDATA ON CUSTOMERSUPPLIERDATA.BUSINESSPARTNERNUMBERID = BUSINESSPARTNER.NUMBERID
LEFT OUTER JOIN ALLOCATION ALLOCATION ON ALLOCATION.CUSTOMERCODE = CUSTOMERSUPPLIERDATA.CODE 
									AND ALLOCATION.PROJECTCODE = SALESDOCUMENTLINE.DLVSALORDERLINESALESORDERCODE 
									AND ALLOCATION.ORDERCODE = SALESDOCUMENT.PROVISIONALCODE
									AND ALLOCATION.ORDERLINE = SALESDOCUMENTLINE.ORDERLINE
LEFT OUTER JOIN DB2ADMIN.ORDERPARTNERBRAND ORDERPARTNERBRAND ON SALESDOCUMENT.ORDERPARTNERBRANDCODE = ORDERPARTNERBRAND.CODE
    AND SALESDOCUMENT.ORDPRNCUSTOMERSUPPLIERCODE = ORDERPARTNERBRAND.ORDPRNCUSTOMERSUPPLIERCODE
LEFT JOIN SALESORDERLINE s ON s.SALESORDERCODE = SALESDOCUMENTLINE.DLVSALORDERLINESALESORDERCODE 
							AND s.ORDERLINE = SALESDOCUMENTLINE.DLVSALESORDERLINEORDERLINE 
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = s.ABSUNIQUEID AND a.NAMENAME = 'SampleComments5'
WHERE
    ALLOCATION.ORIGINTRNTRANSACTIONNUMBER IS NULL
--    AND 
--        ALLOCATION.CODE = '000000447460'
--        SALESDOCUMENT.PROVISIONALCODE = 'PED2300276'
        
       