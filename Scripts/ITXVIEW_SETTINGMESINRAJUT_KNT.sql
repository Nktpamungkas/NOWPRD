DROP VIEW ITXVIEW_SETTINGMESINRAJUT_KNT;
--CREATE VIEW ITXVIEW_SETTINGMESINRAJUT_KNT AS
SELECT
	DISTINCT 
    PRODUCTIONDEMAND.COMPANYCODE,
    PRODUCTIONDEMAND.COUNTERCODE,
    PRODUCTIONDEMAND.CODE,
    PRODUCTIONDEMAND.ORDERDATE,
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
    PRODUCTIONDEMAND.BASEPRIMARYUOMCODE,
    PRODUCTIONDEMAND.BASEPRIMARYQUANTITY,
    PRODUCTIONDEMAND.FINALPLANNEDDATE,
    PRODUCTIONDEMAND.RESERVATIONORDERCODE,
    SCHEDULESOFSTEPSPLITS.SCHEDULEDRESOURCECODE,
    FULLITEMKEYDECODER.SUMMARIZEDDESCRIPTION,
    BUSINESSPARTNER.LEGALNAME1
FROM
    PRODUCTIONDEMAND PRODUCTIONDEMAND
LEFT OUTER JOIN SCHEDULESOFSTEPSPLITS SCHEDULESOFSTEPSPLITS ON PRODUCTIONDEMAND.CODE = SCHEDULESOFSTEPSPLITS.CODE
LEFT OUTER JOIN FULLITEMKEYDECODER FULLITEMKEYDECODER ON PRODUCTIONDEMAND.FULLITEMIDENTIFIER = FULLITEMKEYDECODER.IDENTIFIER
LEFT OUTER JOIN ORDERPARTNER ORDERPARTNER ON PRODUCTIONDEMAND.CUSTOMERCODE = ORDERPARTNER.CUSTOMERSUPPLIERCODE
LEFT OUTER JOIN BUSINESSPARTNER BUSINESSPARTNER ON ORDERPARTNER.ORDERBUSINESSPARTNERNUMBERID = BUSINESSPARTNER.NUMBERID
LEFT OUTER JOIN ROUTING ROUTING ON PRODUCTIONDEMAND.ROUTINGNUMBERID = ROUTING.NUMBERID
--WHERE 
--	PRODUCTIONDEMAND.CODE = '00191219'
    