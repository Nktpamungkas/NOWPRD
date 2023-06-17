-- DB2ADMIN.ITXVIEW_KK_TAS source
DROP VIEW ITXVIEW_KK_TAS;
CREATE VIEW ITXVIEW_KK_TAS AS
SELECT
    P1.CODE AS NO_PROD_ORDER,
    P3.PRODUCTIONDEMANDCODE AS NO_DEMAND,
    P2.PROJECTCODE,
    P2.ORIGDLVSALORDLINESALORDERCODE,
    P2.ORIGDLVSALORDERLINEORDERLINE,
    TRIM(P2.SUBCODE02) || '-' || TRIM(P2.SUBCODE03) AS NO_HANGER,
    PRODUCT.LONGDESCRIPTION AS JENIS_KAIN,
    ITXVIEW_SUB_KK_TAS.SUBCODE03 AS ARTICLE_CODE,
    ITXVIEW_SUB_KK_TAS.QTY,
    ITXVIEW_SUB_KK_TAS.QTY2,
    ITXVIEW_SUB_KK_TAS.SATUAN,
    trim(ITXVIEW_SUB_KK_TAS.SUBCODE05) NO_WARNA,
    trim(ITXVIEW_SUB_KK_TAS.SUBCODE05) || ' ' || '(' || USERGENERICGROUP.LONGDESCRIPTION || ')' AS WARNA,
    BP.ADDRESSLINE1 AS TEMPAT_KIRIM,
    ADS_LEBAR.VALUEDECIMAL AS LEBAR,
    ADS_GRAMASI.VALUEDECIMAL AS GRAMASI,
    ITXVIEW_JENISBENANG.DESCRIP AS JENIS_BENANG,
    ADS_TGL_KIRIM.VALUEDATE AS TGL_KIRIM,
    ADS_NOTE.VALUESTRING AS NOTE1,
    ADS_NOTES.VALUESTRING AS NOTE2,
    CASE
        WHEN TRIM(ADS_NOTES.VALUESTRING) IS NULL THEN TRIM(ADS_NOTE.VALUESTRING)
        WHEN TRIM(ADS_NOTE.VALUESTRING) IS NULL THEN TRIM(ADS_NOTES.VALUESTRING)
        ELSE TRIM(ADS_NOTE.VALUESTRING) || ' ' || TRIM(ADS_NOTES.VALUESTRING)
    END AS NOTES,
    ADS_BUYER.VALUESTRING AS BUYER,
    ADS_TRACKINGDEV.VALUESTRING AS TRACKINGDEV,
    ITXVIEW_SUB_KK_TAS.ABSUNIQUEID
FROM
    PRODUCTIONORDER P1
LEFT JOIN PRODUCTIONDEMANDSTEP P3 ON P1.CODE = P3.PRODUCTIONORDERCODE
LEFT JOIN PRODUCTIONDEMAND P2 ON P2.CODE = P3.PRODUCTIONDEMANDCODE
LEFT JOIN ITXVIEW_SUB_KK_TAS ITXVIEW_SUB_KK_TAS ON P3.PRODUCTIONDEMANDCODE = ITXVIEW_SUB_KK_TAS.NO_DEMAND
LEFT JOIN CUSTOMERSUPPLIERDATA CSD ON ITXVIEW_SUB_KK_TAS.CUSTOMERCODE = CSD.CODE
LEFT JOIN BUSINESSPARTNER BP ON CSD.BUSINESSPARTNERNUMBERID = BP.NUMBERID
LEFT JOIN ITXVIEW_JENISBENANG ITXVIEW_JENISBENANG ON ITXVIEW_SUB_KK_TAS.SUBCODE01 = ITXVIEW_JENISBENANG.SUBCODE01
    AND ITXVIEW_SUB_KK_TAS.SUBCODE02 = ITXVIEW_JENISBENANG.SUBCODE02
    AND ITXVIEW_SUB_KK_TAS.SUBCODE03 = ITXVIEW_JENISBENANG.SUBCODE03
    AND ITXVIEW_SUB_KK_TAS.SUBCODE04 = ITXVIEW_JENISBENANG.SUBCODE04
LEFT JOIN PRODUCT PRODUCT ON ITXVIEW_SUB_KK_TAS.SUBCODE01 = PRODUCT.SUBCODE01
    AND ITXVIEW_SUB_KK_TAS.SUBCODE02 = PRODUCT.SUBCODE02
    AND ITXVIEW_SUB_KK_TAS.SUBCODE03 = PRODUCT.SUBCODE03
    AND ITXVIEW_SUB_KK_TAS.SUBCODE04 = PRODUCT.SUBCODE04
    AND ITXVIEW_SUB_KK_TAS.SUBCODE05 = PRODUCT.SUBCODE05
    AND ITXVIEW_SUB_KK_TAS.SUBCODE06 = PRODUCT.SUBCODE06
LEFT JOIN ADSTORAGE ADS_LEBAR ON PRODUCT.ABSUNIQUEID = ADS_LEBAR.UNIQUEID AND ADS_LEBAR.NAMENAME = 'Width'
LEFT JOIN ADSTORAGE ADS_GRAMASI ON PRODUCT.ABSUNIQUEID = ADS_GRAMASI.UNIQUEID AND ADS_GRAMASI.NAMENAME = 'GSM'
LEFT JOIN USERGENERICGROUP USERGENERICGROUP ON ITXVIEW_SUB_KK_TAS.SUBCODE05 = USERGENERICGROUP.CODE
LEFT JOIN (
    SELECT
        *
    FROM
        ADSTORAGE ADS_TGL_KIRIM
    WHERE
        ADS_TGL_KIRIM.NAMENAME = 'DevSamDelivery') ADS_TGL_KIRIM ON
    ITXVIEW_SUB_KK_TAS.ABSUNIQUEID = ADS_TGL_KIRIM.UNIQUEID
LEFT JOIN (
    SELECT
        *
    FROM
        ADSTORAGE ADS_NOTE
    WHERE
        ADS_NOTE.NAMENAME = 'NoteDevSam') ADS_NOTE ON
    ITXVIEW_SUB_KK_TAS.ABSUNIQUEID = ADS_NOTE.UNIQUEID
LEFT JOIN (
    SELECT
        *
    FROM
        ADSTORAGE ADS_NOTES
    WHERE
        ADS_NOTES.NAMENAME = 'NotesDevSam') ADS_NOTES ON
    ITXVIEW_SUB_KK_TAS.ABSUNIQUEID = ADS_NOTES.UNIQUEID
LEFT JOIN (
    SELECT
        *
    FROM
        ADSTORAGE ADS_BUYER
    WHERE
        ADS_BUYER.NAMENAME = 'BuyerDevSam') ADS_BUYER ON
    ITXVIEW_SUB_KK_TAS.ABSUNIQUEID = ADS_BUYER.UNIQUEID
LEFT JOIN (
    SELECT
        *
    FROM
        ADSTORAGE ADS_TRACKINGDEV
    WHERE
        ADS_TRACKINGDEV.NAMENAME = 'NoTrackingDev') ADS_TRACKINGDEV ON
    ITXVIEW_SUB_KK_TAS.ABSUNIQUEID = ADS_TRACKINGDEV.UNIQUEID
GROUP BY
    P1.CODE,
    P3.PRODUCTIONDEMANDCODE,
    P2.PROJECTCODE,
    P2.ORIGDLVSALORDLINESALORDERCODE,
    P2.ORIGDLVSALORDERLINEORDERLINE,
    P2.SUBCODE02,
    P2.SUBCODE03,
    PRODUCT.LONGDESCRIPTION,
    P2.SUBCODE03,
    BP.LEGALNAME1,
    USERGENERICGROUP.LONGDESCRIPTION,
    ADS_LEBAR.VALUEDECIMAL,
    ADS_GRAMASI.VALUEDECIMAL,
    BP.ADDRESSLINE1,
    ITXVIEW_JENISBENANG.DESCRIP,
    ADS_TGL_KIRIM.VALUEDATE,
    ADS_NOTE.VALUESTRING,
    ADS_NOTES.VALUESTRING,
    ADS_BUYER.VALUESTRING,
    ADS_TRACKINGDEV.VALUESTRING,
    ITXVIEW_SUB_KK_TAS.SUBCODE03,
    ITXVIEW_SUB_KK_TAS.SUBCODE05,
    ITXVIEW_SUB_KK_TAS.QTY,
    ITXVIEW_SUB_KK_TAS.QTY2,
    ITXVIEW_SUB_KK_TAS.SATUAN,
    ITXVIEW_SUB_KK_TAS.ABSUNIQUEID;