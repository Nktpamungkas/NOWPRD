-- DB2ADMIN.ITXVIEWRESEP1 source

CREATE VIEW ITXVIEWRESEP1 AS 
SELECT
    RECIPENUMBERID,
    r.SUFFIXCODE,
    GROUPNUMBER,
    SEQUENCE,
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