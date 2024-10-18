SELECT
	VIEWPRODUCTIONRESERVATION.COMPANYCODE,
	VIEWPRODUCTIONRESERVATION.GROUPSTEPNUMBER,
	VIEWPRODUCTIONRESERVATION.GROUPLINE,
	VIEWPRODUCTIONRESERVATION.SUBCODE01,
	VIEWPRODUCTIONRESERVATION.PICKUPQUANTITY,
	VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE,
	VIEWPRODUCTIONRESERVATION.PRODRESERVATIONLINKGROUPCODE,
	VIEWPRODUCTIONRESERVATION.SUFFIXCODE,
	ITXVIEWRESEP.SUBCODE01,
	ITXVIEWRESEP.RECIPENUMBERID,
	ITXVIEWRESEP.SUFFIXCODE,
	ITXVIEWRESEP.GROUPNUMBER,
	ITXVIEWRESEP.CODE,
	ITXVIEWRESEP.SUBCODE,
	ITXVIEWRESEP.CONSUMPTION,
	ITXVIEWRESEP.COMMENTLINE,
	ITXVIEWRESEP.LONGDESCRIPTION,
	ITXVIEWRESEP.CONSUMPTIONTYPE,
	ITXVIEWRESEP.RECIPESUBCODE01,
	ITXVIEWRESEP.SUBCODE02,
	ITXVIEWRESEP.SUBCODE03,
	ITXVIEWRESEP.RECIPETYPE,
	ITXVIEWRESEP.PICKUPPERCENTAGE,
	ITXVIEWRESEP.RESIDUALBATHVOLUME
FROM
	DB2ADMIN.VIEWPRODUCTIONRESERVATION VIEWPRODUCTIONRESERVATION
LEFT 
       OUTER JOIN DB2ADMIN.ITXVIEWRESEP ITXVIEWRESEP ON
	VIEWPRODUCTIONRESERVATION.SUFFIXCODE = ITXVIEWRESEP.SUFFIXCODE_RESERVATION
	AND 
       VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE = ITXVIEWRESEP.PRODUCTIONORDERCODE
	AND 
       VIEWPRODUCTIONRESERVATION.SUBCODE01 = ITXVIEWRESEP.SUBCODE01_RESERVATION
	AND 
       VIEWPRODUCTIONRESERVATION.COMPANYCODE = ITXVIEWRESEP.COMPANYCODE
WHERE 
	VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE = '00175073'
--	AND VIEWPRODUCTIONRESERVATION.GROUPLINE = '305'
ORDER BY
	ITXVIEWRESEP.GROUPNUMBER,
	ITXVIEWRESEP.SEQUENCE