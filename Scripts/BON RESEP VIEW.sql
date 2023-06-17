--CREATE VIEW ITXVIEWRESEP AS   
SELECT VIEWPRODUCTIONRESERVATION.COMPANYCODE,
       VIEWPRODUCTIONRESERVATION.GROUPLINE,
       VIEWPRODUCTIONRESERVATION.SUBCODE01 AS SUBCODE01_RESERVATION,
       VIEWPRODUCTIONRESERVATION.PICKUPQUANTITY,
       VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE,
       VIEWPRODUCTIONRESERVATION.SUFFIXCODE AS SUFFIXCODE_RESERVATION,
       ITXVIEWRESEP1.RECIPENUMBERID,
       ITXVIEWRESEP1.SUFFIXCODE,
       ITXVIEWRESEP1.GROUPNUMBER,
       ITXVIEWRESEP1.CODE,
       ITXVIEWRESEP1.SUBCODE,
       ITXVIEWRESEP1.CONSUMPTION,
       ITXVIEWRESEP1.COMMENTLINE,
       ITXVIEWRESEP1.LONGDESCRIPTION,
       ITXVIEWRESEP1.RECIPESUBCODE01,
       ITXVIEWRESEP1.SUBCODE01,
       ITXVIEWRESEP1.SUBCODE02,
       ITXVIEWRESEP1.SUBCODE03,
       ITXVIEWRESEP1.CONSUMPTIONTYPE,
       RECIPE.RECIPETYPE,
       RECIPE.PICKUPPERCENTAGE,
       RECIPE.RESIDUALBATHVOLUME
FROM  VIEWPRODUCTIONRESERVATION VIEWPRODUCTIONRESERVATION  
LEFT JOIN RECIPE RECIPE ON RECIPE.SUBCODE01 = VIEWPRODUCTIONRESERVATION.SUBCODE01 
						AND RECIPE.SUFFIXCODE = VIEWPRODUCTIONRESERVATION.SUFFIXCODE
LEFT JOIN ITXVIEWRESEP1 ON ITXVIEWRESEP1.RECIPENUMBERID = RECIPE.NUMBERID
WHERE VIEWPRODUCTIONRESERVATION.SUBCODE01 = '19147/200903D/D' AND VIEWPRODUCTIONRESERVATION.SUFFIXCODE  = '22090618D'


SELECT RECIPE.RECIPETYPE,RECIPE.PICKUPPERCENTAGE,RECIPE.RESIDUALBATHVOLUME,
       ITXVIEWRESEP1.RECIPENUMBERID,ITXVIEWRESEP1.GROUPNUMBER,
       ITXVIEWRESEP1.CONSUMPTION,ITXVIEWRESEP1.COMPONENTUOMCODE,
       ITXVIEWRESEP1.CONSUMPTIONTYPE,ITXVIEWRESEP1.SUBCODE01,ITXVIEWRESEP1.SUBCODE02,
       ITXVIEWRESEP1.SUBCODE03 
FROM DB2ADMIN.RECIPE RECIPE LEFT OUTER JOIN DB2ADMIN.ITXVIEWRESEP1 
       ITXVIEWRESEP1 ON RECIPE.NUMBERID=ITXVIEWRESEP1.RECIPENUMBERID
WHERE ITXVIEWRESEP1.RECIPENUMBERID = '29742'