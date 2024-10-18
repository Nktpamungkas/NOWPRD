DROP VIEW ITXVIEW_GRANDTOTAL_PACKINGLIST_EXIM2;
--CREATE VIEW ITXVIEW_GRANDTOTAL_PACKINGLIST_EXIM2 AS
SELECT
    PROVISIONALCODE,
    PROVISIONALCOUNTERCODE,
    ITEMTYPEAFICODE,
    CASE
        WHEN ITEMTYPEAFICODE = 'KFF' THEN sum(jml_roll)
        ELSE 0
    END AS jml_roll,
    CASE
        WHEN ITEMTYPEAFICODE = 'FKF' THEN sum(jml_roll)
        ELSE 0
    END AS jml_BALES,
    CASE
        WHEN PROVISIONALCODE LIKE '%SRE%' THEN sum(jml_kg)
        ELSE 
    	sum(jml_kg) - sum(FOC_kg)
    END AS jml_kg,
    CASE
        WHEN PROVISIONALCODE LIKE '%SRE%' THEN sum(jml_yd)
        ELSE 
    	sum(jml_yd)-sum(FOC_yd)
    END AS jml_yd,
    sum(jml_gw) AS jml_gw,
    sum(FOC_kg) AS FOC_kg,
    sum(FOC_yd) AS FOC_yd
FROM
    (
        SELECT
            PROVISIONALCODE,
            PROVISIONALCOUNTERCODE,
            count(CODE) AS jml_roll,
            USERPRIMARYQUANTITY AS jml_kg,
            ROUND(USERSECONDARYQUANTITY, 2) AS jml_yd,
            USERPRIMARYQUANTITY + 0.6 AS jml_gw,
            ITEMTYPEAFICODE,
            QTY_FOC_kg AS FOC_kg,
            QTY_FOC_yd AS FOC_yd
        FROM
            (
                SELECT DISTINCT 
                    ALLOCATION.LOTCODE,
                    ALLOCATION.CODE,
                    ALLOCATION.USERPRIMARYQUANTITY,
                    ALLOCATION.USERSECONDARYQUANTITY,
                    ALLOCATION.ITEMELEMENTCODE,
                    ITXVIEW_PACKINGLIST_EXIM.EXTERNALITEM,
                    ITXVIEW_PACKINGLIST_EXIM.PROVISIONALCODE,
                    ITXVIEW_PACKINGLIST_EXIM.PROVISIONALCOUNTERCODE,
                    ITXVIEW_PACKINGLIST_EXIM.PROVISIONALDOCUMENTDATE,
                    ITXVIEW_PACKINGLIST_EXIM.PROJECTCODE,
                    ITXVIEW_PACKINGLIST_EXIM.ITEMTYPEAFICODE,
                    CASE
                        WHEN E.QUALITYREASONCODE = 'FOC' THEN ALLOCATION.USERPRIMARYQUANTITY
                        ELSE 0
                    END AS QTY_FOC_kg,
                    CASE
                        WHEN E.QUALITYREASONCODE = 'FOC' THEN ROUND(ALLOCATION.USERSECONDARYQUANTITY, 2)
                        ELSE 0
                    END AS QTY_FOC_yd,
                    E.QUALITYREASONCODE
                FROM
                    ITXVIEW_PACKINGLIST_EXIM ITXVIEW_PACKINGLIST_EXIM
                LEFT JOIN (
                        SELECT
                            *
                        FROM
                            ALLOCATION ALLOCATION
                        WHERE
                            ALLOCATION.DETAILTYPE = '0'
                    )ALLOCATION ON
                    ITXVIEW_PACKINGLIST_EXIM.CODE = ALLOCATION.CODE
                LEFT JOIN ELEMENTS E ON
                    E.CODE = ALLOCATION.ITEMELEMENTCODE
                WHERE
                    ALLOCATION.ORIGINTRNTRANSACTIONNUMBER IS NULL
--    		        AND ITXVIEW_PACKINGLIST_EXIM.PROVISIONALCODE = 'PED2400320'
            )
        GROUP BY
            PROVISIONALCODE,
            PROVISIONALCOUNTERCODE,
            LOTCODE,
            CODE,
            USERPRIMARYQUANTITY,
            USERSECONDARYQUANTITY,
            ITEMELEMENTCODE,
            EXTERNALITEM,
            PROJECTCODE,
            ITEMTYPEAFICODE,
            QTY_FOC_kg,
            QTY_FOC_yd,
            QUALITYREASONCODE
    )
GROUP BY
    PROVISIONALCODE,
    PROVISIONALCOUNTERCODE,
    ITEMTYPEAFICODE;