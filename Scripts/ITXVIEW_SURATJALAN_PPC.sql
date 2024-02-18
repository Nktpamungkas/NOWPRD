DROP VIEW ITXVIEW_SURATJALAN_PPC;
--CREATE VIEW ITXVIEW_SURATJALAN_PPC AS
SELECT
    DISTINCT 
    SUBSTR(SALESDOCUMENTLINE.DLVSALORDERLINESALESORDERCODE, 1,3) AS TIPE,
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
    SALESDOCUMENT.PROJECTCODE,
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
    TRIM(SALESDOCUMENTLINE.SUBCODE05) AS SUBCODE05,
    SALESDOCUMENTLINE.SUBCODE06,
    SALESDOCUMENTLINE.SUBCODE07,
    SALESDOCUMENTLINE.SUBCODE08,
    SALESDOCUMENTLINE.SUBCODE09,
    SALESDOCUMENTLINE.SUBCODE10,
    SALESDOCUMENTLINE.ITEMDESCRIPTION,
    SALESDOCUMENTLINE.DLVSALORDERLINESALESORDERCODE,
    CASE
        WHEN a.VALUESTRING IS NOT NULL THEN CAST(
            a.VALUESTRING AS decimal(5)
        )
        ELSE CAST(
            SALESDOCUMENTLINE.DLVSALESORDERLINEORDERLINE AS decimal(5)
        )
    END DLVSALESORDERLINEORDERLINE,
    SALESDOCUMENT.PAYMENTMETHODCODE,
    SALESDOCUMENT.CURRENCYCODE,
    SALESDOCUMENTLINE.PRICE,
    SALESDOCUMENTLINE.PRICEUNITOFMEASURECODE,
    ORDERPARTNERBRAND.LONGDESCRIPTION
FROM
    BUSINESSPARTNER BUSINESSPARTNER
LEFT JOIN CUSTOMERSUPPLIERDATA CUSTOMERSUPPLIERDATA ON CUSTOMERSUPPLIERDATA.BUSINESSPARTNERNUMBERID = BUSINESSPARTNER.NUMBERID
LEFT JOIN ALLOCATION ALLOCATION ON ALLOCATION.CUSTOMERCODE = CUSTOMERSUPPLIERDATA.CODE
RIGHT JOIN WRKDOCUMENTPRINT WRKDOCUMENTPRINT ON  WRKDOCUMENTPRINT.SALESDOCUMENTPROVISIONALCODE = ALLOCATION.ORDERCODE
RIGHT JOIN SALESDOCUMENT SALESDOCUMENT ON SALESDOCUMENT.PROVISIONALCODE = WRKDOCUMENTPRINT.SALESDOCUMENTPROVISIONALCODE 
LEFT JOIN SALESDOCUMENTLINE SALESDOCUMENTLINE ON ALLOCATION.ORDERCODE = SALESDOCUMENTLINE.SALESDOCUMENTPROVISIONALCODE
    AND ALLOCATION.ORDERLINE = SALESDOCUMENTLINE.ORDERLINE 
    AND ALLOCATION.ITEMTYPECODE = SALESDOCUMENTLINE.ITEMTYPEAFICODE
    AND ALLOCATION.DECOSUBCODE01 = SALESDOCUMENTLINE.SUBCODE01
    AND ALLOCATION.DECOSUBCODE02 = SALESDOCUMENTLINE.SUBCODE02
    AND ALLOCATION.DECOSUBCODE03 = SALESDOCUMENTLINE.SUBCODE03
    AND ALLOCATION.DECOSUBCODE04 = SALESDOCUMENTLINE.SUBCODE04
    AND ALLOCATION.DECOSUBCODE05 = SALESDOCUMENTLINE.SUBCODE05
    AND ALLOCATION.DECOSUBCODE06 = SALESDOCUMENTLINE.SUBCODE06
    AND ALLOCATION.DECOSUBCODE07 = SALESDOCUMENTLINE.SUBCODE07
    AND ALLOCATION.DECOSUBCODE08 = SALESDOCUMENTLINE.SUBCODE08
    AND ALLOCATION.DECOSUBCODE09 = SALESDOCUMENTLINE.SUBCODE09
    AND ALLOCATION.DECOSUBCODE10 = SALESDOCUMENTLINE.SUBCODE10
LEFT OUTER JOIN ORDERPARTNERBRAND ORDERPARTNERBRAND ON SALESDOCUMENT.ORDERPARTNERBRANDCODE = ORDERPARTNERBRAND.CODE
    AND SALESDOCUMENT.ORDPRNCUSTOMERSUPPLIERCODE = ORDERPARTNERBRAND.ORDPRNCUSTOMERSUPPLIERCODE
LEFT JOIN SALESORDERLINE s ON s.SALESORDERCODE = SALESDOCUMENTLINE.DLVSALORDERLINESALESORDERCODE AND s.ORDERLINE = SALESDOCUMENTLINE.DLVSALESORDERLINEORDERLINE
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = s.ABSUNIQUEID AND a.NAMENAME = 'SampleComments5'
WHERE
    ALLOCATION.ORIGINTRNTRANSACTIONNUMBER IS NULL
    AND SALESDOCUMENT.PROVISIONALCODE = 'PCA2400002'
--    AND SALESDOCUMENTLINE.DLVSALORDERLINESALESORDERCODE = 'DOM2300265'