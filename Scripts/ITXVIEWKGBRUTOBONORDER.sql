DROP VIEW ITXVIEWKGBRUTOBONORDER;
--CREATE VIEW ITXVIEWKGBRUTOBONORDER AS
SELECT
    PRODUCTIONDEMAND.PROJECTCODE,
    PRODUCTIONDEMAND.CODE,
    PRODUCTIONDEMAND.ITEMTYPEAFICODE AS ITEMTYPE_DEMAND,
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
    PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE,
    PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE,
    PRODUCTIONRESERVATION.ITEMTYPEAFICODE AS ITEMTYPE_RESERVATION,
    PRODUCTIONRESERVATION.USERPRIMARYUOMCODE,
    PRODUCTIONRESERVATION.USERPRIMARYQUANTITY
FROM
    PRODUCTIONDEMAND PRODUCTIONDEMAND
LEFT OUTER JOIN PRODUCTIONRESERVATION PRODUCTIONRESERVATION ON
    PRODUCTIONDEMAND.CODE = PRODUCTIONRESERVATION.ORDERCODE
WHERE
    PRODUCTIONDEMAND.ITEMTYPEAFICODE = 'KFF'
    AND PRODUCTIONRESERVATION.ITEMTYPEAFICODE = 'KGF'
--    AND PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE = 'DOM2300726' 
--    AND PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE = '60'