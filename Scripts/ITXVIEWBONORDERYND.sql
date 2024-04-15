DROP VIEW ITXVIEWBONORDERYND;
--CREATE VIEW ITXVIEWBONORDERYND AS 
SELECT
    PRODUCTIONDEMAND.CODE,
--    p.CODE AS DEMAND_DYR,
    PRODUCTIONDEMAND.CODE AS DEMAND_DYR,
    PRODUCTIONDEMAND.ITEMTYPEAFICODE,
    PRODUCTIONDEMAND.SUBCODE01,
    PRODUCTIONDEMAND.SUBCODE02,
    PRODUCTIONDEMAND.SUBCODE03,
    PRODUCTIONDEMAND.SUBCODE04,
    PRODUCTIONDEMAND.SUBCODE05,
    PRODUCTIONDEMAND.SUBCODE06,
    PRODUCTIONDEMAND.SUBCODE07,
    PRODUCTIONDEMAND.SUBCODE08,
    PRODUCTIONDEMAND.SUBCODE09,
    PRODUCTIONDEMAND.SUBCODE10,
    PRODUCTIONDEMAND.RESERVATIONORDERCODE,
    PRODUCTIONDEMAND.ORDERDATE,
    PRODUCTIONDEMAND.FINALPLANNEDDATE,
    PRODUCTIONDEMAND.USERPRIMARYQUANTITY,
    PRODUCTIONDEMAND.USERPRIMARYUOMCODE,
    BUSINESSPARTNER.LEGALNAME1 AS LANGGANAN,
    ORDERPARTNERBRAND.LONGDESCRIPTION AS BUYER,
    USERGENERICGROUP.LONGDESCRIPTION,
    SALESORDER.CREATIONUSER,
    A.SUMMARIZEDDESCRIPTION,
    ad.VALUEINT AS QTY_RESERV,
    a.VALUEDATE AS tgl_delivery
FROM
    PRODUCTIONDEMAND PRODUCTIONDEMAND
LEFT JOIN ORDERPARTNER ORDERPARTNER ON PRODUCTIONDEMAND.CUSTOMERCODE = ORDERPARTNER.CUSTOMERSUPPLIERCODE
LEFT JOIN BUSINESSPARTNER BUSINESSPARTNER ON ORDERPARTNER.ORDERBUSINESSPARTNERNUMBERID = BUSINESSPARTNER.NUMBERID
LEFT JOIN SALESORDER SALESORDER ON PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE = SALESORDER.CODE
LEFT JOIN SALESORDERLINE SALESORDERLINE ON SALESORDER.CODE = SALESORDERLINE.SALESORDERCODE
LEFT JOIN ORDERPARTNERBRAND ORDERPARTNERBRAND ON SALESORDER.ORDPRNCUSTOMERSUPPLIERCODE = ORDERPARTNERBRAND.ORDPRNCUSTOMERSUPPLIERCODE
    AND SALESORDER.ORDERPARTNERBRANDCODE = ORDERPARTNERBRAND.CODE
LEFT JOIN USERGENERICGROUP USERGENERICGROUP ON PRODUCTIONDEMAND.SUBCODE08 = USERGENERICGROUP.CODE
LEFT JOIN (
    SELECT
        PRODUCTIONRESERVATION.ORDERCODE,
        PRODUCTIONRESERVATION.ITEMTYPEAFICODE,
        PRODUCTIONRESERVATION.SUBCODE01,
        PRODUCTIONRESERVATION.SUBCODE02,
        PRODUCTIONRESERVATION.SUBCODE03,
        PRODUCTIONRESERVATION.SUBCODE04,
        PRODUCTIONRESERVATION.SUBCODE05,
        PRODUCTIONRESERVATION.USERPRIMARYQUANTITY,
        PRODUCTIONRESERVATION.USERPRIMARYUOMCODE,
        FULLITEMKEYDECODER.SUMMARIZEDDESCRIPTION
    FROM
        PRODUCTIONRESERVATION PRODUCTIONRESERVATION
    LEFT JOIN FULLITEMKEYDECODER FULLITEMKEYDECODER ON
        PRODUCTIONRESERVATION.FULLITEMIDENTIFIER = FULLITEMKEYDECODER.IDENTIFIER
    WHERE
        PRODUCTIONRESERVATION.ITEMTYPEAFICODE = 'GYR' OR PRODUCTIONRESERVATION.ITEMTYPEAFICODE = 'DYR'
) A ON PRODUCTIONDEMAND.CODE = A.ORDERCODE
LEFT JOIN PRODUCTIONDEMAND p ON p.ORIGDLVSALORDLINESALORDERCODE = PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE
							AND p.ORIGDLVSALORDERLINEORDERLINE = PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE 
							AND p.ITEMTYPEAFICODE ='DYR'
LEFT JOIN ADSTORAGE ad ON ad.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND ad.FIELDNAME = 'QTYPermintaanRMP'
LEFT JOIN ADSTORAGE a ON a.UNIQUEID = PRODUCTIONDEMAND.ABSUNIQUEID AND a.FIELDNAME = 'DeliveryCelup'
WHERE 
	PRODUCTIONDEMAND.CODE = '00240205'
GROUP BY
    PRODUCTIONDEMAND.CODE,
    p.CODE,
    PRODUCTIONDEMAND.ITEMTYPEAFICODE,
    PRODUCTIONDEMAND.SUBCODE01,
    PRODUCTIONDEMAND.SUBCODE02,
    PRODUCTIONDEMAND.SUBCODE03,
    PRODUCTIONDEMAND.SUBCODE04,
    PRODUCTIONDEMAND.SUBCODE05,
    PRODUCTIONDEMAND.SUBCODE06,
    PRODUCTIONDEMAND.SUBCODE07,
    PRODUCTIONDEMAND.SUBCODE08,
    PRODUCTIONDEMAND.SUBCODE09,
    PRODUCTIONDEMAND.SUBCODE10,
    PRODUCTIONDEMAND.RESERVATIONORDERCODE,
    PRODUCTIONDEMAND.ORDERDATE,
    PRODUCTIONDEMAND.FINALPLANNEDDATE,
    PRODUCTIONDEMAND.USERPRIMARYQUANTITY,
    PRODUCTIONDEMAND.USERPRIMARYUOMCODE,
    BUSINESSPARTNER.LEGALNAME1,
    ORDERPARTNERBRAND.LONGDESCRIPTION,
    USERGENERICGROUP.LONGDESCRIPTION,
    A.SUMMARIZEDDESCRIPTION,
    ad.VALUEINT,
    a.VALUEDATE,
    SALESORDER.CREATIONUSER;