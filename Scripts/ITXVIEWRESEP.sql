DROP VIEW ITXVIEWRESEP;
--CREATE VIEW ITXVIEWRESEP AS   
SELECT
	VIEWPRODUCTIONRESERVATION.COMPANYCODE,
   	VIEWPRODUCTIONRESERVATION.GROUPLINE,
   	VIEWPRODUCTIONRESERVATION.PRODRESERVATIONLINKGROUPCODE,
   VIEWPRODUCTIONRESERVATION.SUBCODE01 AS SUBCODE01_RESERVATION,
   VIEWPRODUCTIONRESERVATION.PICKUPQUANTITY,
   VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE,
   VIEWPRODUCTIONRESERVATION.SUFFIXCODE AS SUFFIXCODE_RESERVATION,
--   ITXVIEWRESEP1.RECIPENUMBERID,
--   ITXVIEWRESEP1.SUFFIXCODE,
--   ITXVIEWRESEP1.GROUPNUMBER,
--   ITXVIEWRESEP1.CODE,
--   ITXVIEWRESEP1.SUBCODE,
--   ITXVIEWRESEP1.CONSUMPTION,
--   ITXVIEWRESEP1.COMMENTLINE,
--   ITXVIEWRESEP1.LONGDESCRIPTION,
--   ITXVIEWRESEP1.RECIPESUBCODE01,
--   ITXVIEWRESEP1.SUBCODE01,
--   ITXVIEWRESEP1.SUBCODE02,
--   ITXVIEWRESEP1.SUBCODE03,
--   ITXVIEWRESEP1.CONSUMPTIONTYPE,
   RECIPE.RECIPETYPE,
   RECIPE.PICKUPPERCENTAGE,
   RECIPE.RESIDUALBATHVOLUME
FROM
    VIEWPRODUCTIONRESERVATION VIEWPRODUCTIONRESERVATION
LEFT JOIN RECIPE RECIPE ON VIEWPRODUCTIONRESERVATION.SUFFIXCODE = RECIPE.SUFFIXCODE AND VIEWPRODUCTIONRESERVATION.SUBCODE01 = RECIPE.SUBCODE01
--LEFT JOIN ITXVIEWRESEP1 ON RECIPE.NUMBERID = ITXVIEWRESEP1.RECIPENUMBERID
WHERE
	VIEWPRODUCTIONRESERVATION.SUBCODE01 = '22090291L'
	
   

DROP VIEW ITXVIEWRESEP1;
--CREATE VIEW ITXVIEWRESEP1 AS 
SELECT
    RECIPENUMBERID,
    r.SUFFIXCODE,
    GROUPNUMBER,
    TRIM(r.ITEMTYPEAFICODE) AS ITEMTYPEAFICODE,
    RECIPESUBCODE01,
    CASE
        WHEN TRIM(r.ITEMTYPEAFICODE) = 'RFF' THEN TRIM(r.SUBCODE01)
        WHEN TRIM(r.ITEMTYPEAFICODE) = 'RFD' THEN TRIM(r.SUBCODE01)
        ELSE ''
    END AS CODE,
    CASE
        WHEN TRIM(r.ITEMTYPEAFICODE) = 'DYC' THEN TRIM(r.SUBCODE01) || '-' || TRIM(r.SUBCODE02) || '-' || TRIM(r.SUBCODE03)
        WHEN TRIM(r.ITEMTYPEAFICODE) = 'PST' THEN TRIM(r.SUBCODE01) || '-' || TRIM(r.SUBCODE02) || '-' || TRIM(r.SUBCODE03)
        ELSE ''
    END AS SUBCODE,
    TRIM(r.COMMENTLINE) AS COMMENTLINE,
    TRIM(p.LONGDESCRIPTION) AS LONGDESCRIPTION,
    CONSUMPTION,
    r.COMPONENTUOMCODE,
    r.CONSUMPTIONTYPE,
    TRIM(r.SUBCODE01) AS SUBCODE01,
    TRIM(r.SUBCODE02) AS SUBCODE02,
    TRIM(r.SUBCODE03) AS SUBCODE03
FROM
    RECIPECOMPONENT r
LEFT JOIN PRODUCT p ON
    p.ITEMTYPECODE = r.ITEMTYPEAFICODE
    AND p.SUBCODE01 = r.SUBCODE01
    AND p.SUBCODE02 = r.SUBCODE02
    AND p.SUBCODE03 = r.SUBCODE03
    --LEFT JOIN VIEWPRODUCTIONRESERVATION v ON v.SUBCODE01 = r.SUBCODE01 
    --										AND v.SUBCODE02= r.SUBCODE02 
    --										AND v.SUBCODE03 = r.SUBCODE03
    --										AND v.PRODUCTIONORDERCODE = r.RECIPESUBCODE01;
    
    
DROP VIEW ITXVIEWRESEP2;
--CREATE VIEW ITXVIEWRESEP2 AS
SELECT
    r.RECIPESUBCODE01,
    r.RECIPESUFFIXCODE,
    r.GROUPNUMBER,
    TRIM(r.ITEMTYPEAFICODE) AS ITEMTYPEAFICODE,
    CASE
        WHEN TRIM(r.ITEMTYPEAFICODE) = 'RFF' THEN TRIM(r.SUBCODE01)
        WHEN TRIM(r.ITEMTYPEAFICODE) = 'RFD' THEN TRIM(r.SUBCODE01)
        ELSE ''
    END AS CODE,
    CASE
        WHEN TRIM(r.ITEMTYPEAFICODE) = 'DYC' THEN TRIM(r.SUBCODE01) || '-' || TRIM(r.SUBCODE02) || '-' || TRIM(r.SUBCODE03)
        WHEN TRIM(r.ITEMTYPEAFICODE) = 'PST' THEN TRIM(r.SUBCODE01) || '-' || TRIM(r.SUBCODE02) || '-' || TRIM(r.SUBCODE03)
        ELSE ''
    END AS SUBCODE,
    TRIM(r.COMMENTLINE) AS COMMENTLINE,
    TRIM(p.LONGDESCRIPTION) AS LONGDESCRIPTION,
    r.CONSUMPTION,
    r.COMPONENTUOMCODE,
    r.CONSUMPTIONTYPE,
    TRIM(r.SUBCODE01) AS SUBCODE01,
    TRIM(r.SUBCODE02) AS SUBCODE02,
    TRIM(r.SUBCODE03) AS SUBCODE03
FROM
    RECIPECOMPONENT r
LEFT JOIN PRODUCT p ON
    p.ITEMTYPECODE = r.ITEMTYPEAFICODE
    AND p.SUBCODE01 = r.SUBCODE01
    AND p.SUBCODE02 = r.SUBCODE02
    AND p.SUBCODE03 = r.SUBCODE03
    --ORDER BY r.GROUPNUMBER
    --WHERE r.RECIPESUBCODE01 = 'SC0001++';