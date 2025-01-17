DROP VIEW ITXVIEWCOLOR;
--CREATE VIEW ITXVIEWCOLOR AS 
SELECT
    ITEMTYPECODE,
    SUBCODE01,
    SUBCODE02,
    SUBCODE03,
    SUBCODE04,
    SUBCODE05,
    SUBCODE06,
    SUBCODE07,
    SUBCODE08,
    SUBCODE09,
    SUBCODE10,
    CAST(CASE
	        WHEN WARNA = 'NULL' THEN WARNA_FKF
	        ELSE WARNA
	    END AS VARCHAR(500)) AS WARNA,
    WARNA_DASAR
FROM
    (
    SELECT
        PRODUCT.ITEMTYPECODE AS ITEMTYPECODE,
        PRODUCT.SUBCODE01 AS SUBCODE01,
        PRODUCT.SUBCODE02 AS SUBCODE02,
        PRODUCT.SUBCODE03 AS SUBCODE03,
        PRODUCT.SUBCODE04 AS SUBCODE04,
        PRODUCT.SUBCODE05 AS SUBCODE05,
        PRODUCT.SUBCODE06 AS SUBCODE06,
        PRODUCT.SUBCODE07 AS SUBCODE07,
        PRODUCT.SUBCODE08 AS SUBCODE08,
        PRODUCT.SUBCODE09 AS SUBCODE09,
        PRODUCT.SUBCODE10 AS SUBCODE10,
        CASE
            WHEN PRODUCT.ITEMTYPECODE = 'KFF' AND PRODUCT.SUBCODE07 = '-' THEN A.LONGDESCRIPTION
            WHEN PRODUCT.ITEMTYPECODE = 'KFF' AND PRODUCT.SUBCODE07 <> '-' OR PRODUCT.SUBCODE07 <> '' THEN B.COLOR_PRT
            ELSE 'NULL'
        END AS WARNA,
        CASE
            WHEN PRODUCT.ITEMTYPECODE = 'FKF' AND LOCATE('-', PRODUCT.LONGDESCRIPTION) = 0 THEN PRODUCT.LONGDESCRIPTION
            WHEN PRODUCT.ITEMTYPECODE = 'FKF' AND LOCATE('-', PRODUCT.LONGDESCRIPTION) > 0 THEN SUBSTR(PRODUCT.LONGDESCRIPTION , 1, LOCATE('-', PRODUCT.LONGDESCRIPTION)-1)
            ELSE 'NULL'
        END AS WARNA_FKF,
        WARNA_DASAR
    FROM
        PRODUCT PRODUCT
    LEFT JOIN(
        SELECT
            CAST(SUBSTR(RECIPE.SUBCODE01, 1, LOCATE('/', RECIPE.SUBCODE01)-1) AS CHARACTER(10)) AS ARTIKEL,
            CAST(SUBSTR(RECIPE.SUBCODE01, LOCATE('/', RECIPE.SUBCODE01)+ 1, 7) AS CHARACTER(10)) AS NO_WARNA,
            SUBSTR(SUBSTR(RECIPE.SUBCODE01, LOCATE('/', RECIPE.SUBCODE01)+ 1), LOCATE('/', SUBSTR(RECIPE.SUBCODE01, LOCATE('/', RECIPE.SUBCODE01)+ 1))+ 1) AS CELUP,
            RECIPE.LONGDESCRIPTION,
            RECIPE.SHORTDESCRIPTION,
            RECIPE.SEARCHDESCRIPTION,
            RECIPE.NUMBERID,
            PRODUCT.SUBCODE03,
            PRODUCT.SUBCODE05,
            PRODUCT.LONGDESCRIPTION AS PRODUCT_LONG
        FROM
            RECIPE RECIPE
        LEFT JOIN PRODUCT PRODUCT ON SUBSTR(RECIPE.SUBCODE01, 1, LOCATE('/', RECIPE.SUBCODE01)-1) = PRODUCT.SUBCODE03
            					AND SUBSTR(RECIPE.SUBCODE01, LOCATE('/', RECIPE.SUBCODE01)+ 1, 7) = PRODUCT.SUBCODE05
        WHERE
            RECIPE.ITEMTYPECODE = 'RFD' AND LOCATE('/', RECIPE.SUBCODE01) > 0 AND RECIPE.SUFFIXCODE = '001'
--            AND RECIPE.CREATIONDATETIME <= '2024-11-07-23.11.00.000000' 
--            AND NOT PRODUCT.SUBCODE03 IS NULL AND NOT PRODUCT.SUBCODE05 IS NULL
--            AND NOT RECIPE.SEARCHDESCRIPTION LIKE '%DELETE%' AND NOT RECIPE.SEARCHDESCRIPTION LIKE '%delete%'
            ) A ON PRODUCT.SUBCODE03 = A.SUBCODE03 AND PRODUCT.SUBCODE05 = A.SUBCODE05
    LEFT JOIN(
        SELECT
            DESIGN.SUBCODE01,
            DESIGNCOMPONENT.VARIANTCODE,
            DESIGNCOMPONENT.LONGDESCRIPTION AS COLOR_PRT,
            DESIGNCOMPONENT.SHORTDESCRIPTION AS WARNA_DASAR
        FROM
            DESIGN DESIGN
        LEFT JOIN DESIGNCOMPONENT DESIGNCOMPONENT ON DESIGN.NUMBERID = DESIGNCOMPONENT.DESIGNNUMBERID
            AND DESIGN.SUBCODE01 = DESIGNCOMPONENT.DESIGNSUBCODE01) B ON PRODUCT.SUBCODE07 = B.SUBCODE01 AND PRODUCT.SUBCODE08 = B.VARIANTCODE
    WHERE
        (PRODUCT.ITEMTYPECODE = 'KFF' OR PRODUCT.ITEMTYPECODE = 'FKF')
    GROUP BY
        PRODUCT.ITEMTYPECODE,
        PRODUCT.SUBCODE01,
        PRODUCT.SUBCODE02,
        PRODUCT.SUBCODE03,
        PRODUCT.SUBCODE04,
        PRODUCT.SUBCODE05,
        PRODUCT.SUBCODE06,
        PRODUCT.SUBCODE07,
        PRODUCT.SUBCODE08,
        PRODUCT.SUBCODE09,
        PRODUCT.SUBCODE10,
        PRODUCT.LONGDESCRIPTION,
        A.LONGDESCRIPTION,
        B.COLOR_PRT,
        WARNA_DASAR,
        PRODUCT.SHORTDESCRIPTION);