DROP VIEW ITXVIEW_INVOICE_GRANDTOTAL2L;
--CREATE VIEW ITXVIEW_INVOICE_GRANDTOTAL2L AS
SELECT
    SALESDOCUMENTPROVISIONALCODE,
    SALESDOCUMENTCOMPANYCODE,
    SALDOCPROVISIONALCOUNTERCODE,
    --    ITEMTYPECODE,
    sum(total_kg) AS total_kg,
    sum(total_yard) AS total_yard,
    sum(total_meter) AS total_meter,
    sum(total_unit) AS total_unit,
    CASE
        WHEN CURR = 'USD'
        AND ITEMTYPECODE = 'KFF' THEN ROUND(SUM(jml_harga_YD), 2)
        WHEN CURR = 'IDR'
        AND ITEMTYPECODE = 'KFF' THEN FLOOR(SUM(jml_harga_YD))
        WHEN CURR = 'USD'
        AND ITEMTYPECODE IN (
            'FKF', 'CAP'
        ) THEN ROUND(SUM(jml_harga_YD_FKF), 2)
        WHEN CURR = 'IDR'
        AND ITEMTYPECODE IN (
            'FKF', 'CAP'
        ) THEN FLOOR(SUM(jml_harga_YD_FKF))
    END AS TOTAL_jml_harga_YD,
       CASE
        WHEN CURR = 'USD'
        AND ITEMTYPECODE = 'KFF' THEN round(SUM(jml_harga_kg), 2)
        WHEN CURR = 'IDR'
        AND ITEMTYPECODE = 'KFF' THEN FLOOR(SUM(jml_harga_kg))
        WHEN CURR = 'USD'
        AND ITEMTYPECODE IN (
            'FKF', 'CAP', 'DYC'
        ) THEN round(SUM(jml_harga_kg_FKF), 2)
        WHEN CURR = 'IDR'
        AND ITEMTYPECODE IN (
            'FKF', 'CAP', 'DYC'
        ) THEN FLOOR(SUM(jml_harga_kg_FKF))
    END AS TOTAL_jml_harga_kg,
       CASE
        WHEN CURR = 'USD'
        AND ITEMTYPECODE = 'KFF' THEN round(SUM(jml_harga_m), 2)
        WHEN CURR = 'IDR'
        AND ITEMTYPECODE = 'KFF' THEN FLOOR(SUM(jml_harga_m))
        WHEN CURR = 'USD'
        AND ITEMTYPECODE IN (
            'FKF', 'CAP'
        ) THEN round(SUM(jml_harga_m_fKF), 2)
        WHEN CURR = 'IDR'
        AND ITEMTYPECODE IN (
            'FKF', 'CAP'
        ) THEN FLOOR(SUM(jml_harga_m_fKF))
    END AS TOTAL_jml_harga_m,
       CASE
        WHEN CURR = 'USD'
        AND ITEMTYPECODE = 'KFF' THEN round(SUM(jml_harga_un), 2)
        WHEN CURR = 'IDR'
        AND ITEMTYPECODE = 'KFF' THEN FLOOR(SUM(jml_harga_un))
        WHEN CURR = 'USD'
        AND ITEMTYPECODE IN (
            'FKF', 'CAP'
        ) THEN round(SUM(jml_harga_un_FKF), 2)
        WHEN CURR = 'IDR'
        AND ITEMTYPECODE IN (
            'FKF', 'CAP'
        ) THEN FLOOR(SUM(jml_harga_un_FKF))
    END AS TOTAL_jml_harga_un
FROM
    (
        SELECT
            --        INVOICE,
            SALESDOCUMENTPROVISIONALCODE,
            SALESDOCUMENTCOMPANYCODE,
            SALDOCPROVISIONALCOUNTERCODE,
                    LOTCODE,
            ITEMTYPECODE,
            --                        DECOSUBCODE04,
            sum(USERPRIMARYQUANTITY) AS total_kg,
            sum(USERSECONDARYQUANTITY) AS total_yard,
            sum(BASESECONDARYQUANTITY) AS total_meter,
            sum(qty_pcs) AS total_unit,
            SUM(jml_harga_YD_FKF) AS jml_harga_YD_FKF,
            SUM(jml_harga_kg_FKF) AS jml_harga_kg_FKF,
            SUM(jml_harga_m_fKF) AS jml_harga_m_fKF,
            SUM(jml_harga_un_FKF) AS jml_harga_un_FKF,
            PRICE,
            CURR,
             CASE
                WHEN PRICEUNITOFMEASURECODE = 'yd'
                AND CURR = 'USD' THEN round((SUM(USERSECONDARYQUANTITY)* price), 2)
                WHEN PRICEUNITOFMEASURECODE = 'yd'
                AND CURR = 'IDR' THEN FLOOR((SUM(USERSECONDARYQUANTITY)* price))
                ELSE 0
            END jml_harga_YD,
            CASE
                WHEN PRICEUNITOFMEASURECODE = 'kg'
                AND CURR = 'USD' THEN round((SUM(USERPRIMARYQUANTITY)* price), 2)
                WHEN PRICEUNITOFMEASURECODE = 'kg'
                AND CURR = 'IDR' THEN FLOOR(SUM(USERPRIMARYQUANTITY)* price)
                ELSE 0
            END jml_harga_kg,
            CASE
                WHEN PRICEUNITOFMEASURECODE = 'm'
                AND CURR = 'USD' THEN round((SUM(BASESECONDARYQUANTITY)* price), 2)
                WHEN PRICEUNITOFMEASURECODE = 'm'
                AND CURR = 'IDR' THEN FLOOR((SUM(BASESECONDARYQUANTITY)* price))
                ELSE 0
            END jml_harga_m,
            CASE
                WHEN PRICEUNITOFMEASURECODE = 'un'
                AND CURR = 'USD' THEN round((SUM(qty_pcs)* price), 2)
                WHEN PRICEUNITOFMEASURECODE = 'Lot'
                AND CURR = 'USD' THEN round((SUM(qty_pcs)* price), 2)
                WHEN PRICEUNITOFMEASURECODE = 'un'
                AND CURR = 'IDR' THEN FLOOR((SUM(qty_pcs)* price))
                WHEN PRICEUNITOFMEASURECODE = 'Lot'
                AND CURR = 'IDR' THEN FLOOR((SUM(qty_pcs)* price))
                ELSE 0
            END jml_harga_un
        FROM
            (
                SELECT
                    DISTINCT
            SALESDOCUMENTPROVISIONALCODE,
                    SALESDOCUMENTCOMPANYCODE,
                    --    CODE,
                    CURR,
                    LOTCODE,
                    SUM(USERPRIMARYQUANTITY) AS USERPRIMARYQUANTITY,
                    SUM(USERSECONDARYQUANTITY) AS USERSECONDARYQUANTITY,
                    SUM(BASESECONDARYQUANTITY)AS BASESECONDARYQUANTITY,
                    SUM(qty_pcs) AS qty_pcs,
                    PRICE,
                    CASE
                        WHEN PRICEUNITOFMEASURECODE = 'yd'
                        AND CURR = 'USD'
                        AND ITEMTYPECODE IN (
                            'FKF', 'CAP'
                        )THEN round((SUM(USERSECONDARYQUANTITY)* price), 2)
                        WHEN PRICEUNITOFMEASURECODE = 'yd'
                        AND CURR = 'IDR'
                        AND ITEMTYPECODE IN (
                            'FKF', 'CAP'
                        )THEN FLOOR((SUM(USERSECONDARYQUANTITY)* price))
                        ELSE 0
                    END jml_harga_YD_FKF,
                    CASE
                        WHEN PRICEUNITOFMEASURECODE = 'kg'
                        AND CURR = 'USD'
                        AND ITEMTYPECODE IN (
                            'FKF', 'CAP', 'DYC'
                        ) THEN round((SUM(USERPRIMARYQUANTITY)* price), 2)
                        WHEN PRICEUNITOFMEASURECODE = 'kg'
                        AND CURR = 'IDR'
                        AND ITEMTYPECODE IN (
                            'FKF', 'CAP', 'DYC'
                        ) THEN FLOOR(SUM(USERPRIMARYQUANTITY)* price)
                        ELSE 0
                    END jml_harga_kg_FKF,
                    CASE
                        WHEN PRICEUNITOFMEASURECODE = 'm'
                        AND CURR = 'USD'
                        AND ITEMTYPECODE IN (
                            'FKF', 'CAP'
                        ) THEN round((SUM(BASESECONDARYQUANTITY)* price), 2)
                        WHEN PRICEUNITOFMEASURECODE = 'm'
                        AND CURR = 'IDR'
                        AND ITEMTYPECODE IN (
                            'FKF', 'CAP'
                        ) THEN FLOOR((SUM(BASESECONDARYQUANTITY)* price))
                        ELSE 0
                    END jml_harga_m_fKF,
                    CASE
                        WHEN PRICEUNITOFMEASURECODE = 'un'
                        AND CURR = 'USD'
                        AND ITEMTYPECODE IN (
                            'FKF', 'CAP'
                        ) THEN round((SUM(qty_pcs)* price), 2)
                        WHEN PRICEUNITOFMEASURECODE = 'Lot'
                        AND CURR = 'USD'
                        AND ITEMTYPECODE IN (
                            'FKF', 'CAP'
                        )THEN round((SUM(qty_pcs)* price), 2)
                        WHEN PRICEUNITOFMEASURECODE = 'un'
                        AND CURR = 'IDR'
                        AND ITEMTYPECODE IN (
                            'FKF', 'CAP'
                        ) THEN FLOOR((SUM(qty_pcs)* price))
                        WHEN PRICEUNITOFMEASURECODE = 'Lot'
                        AND CURR = 'IDR'
                        AND ITEMTYPECODE IN (
                            'FKF', 'CAP'
                        ) THEN FLOOR((SUM(qty_pcs)* price))
                        ELSE 0
                    END jml_harga_un_FKF,
                    --        QUALITYREASONCODE,
                    ORDERCODE,
                    --            ORDERLINE,
                    PRICEUNITOFMEASURECODE,
                    PREVIOUSCODE,
                    SALDOCPROVISIONALCOUNTERCODE,
                    --            PROJECTCODE,
                    ITEMTYPECODE,
                    ALLOCATIONDATE,
                    DECOSUBCODE01,
                    DECOSUBCODE02,
                    DECOSUBCODE03,
                    DECOSUBCODE04,
                    DECOSUBCODE05,
                    DECOSUBCODE06,
                    DECOSUBCODE07,
                    DECOSUBCODE08,
                    CUSTOMERCODE
                FROM
                    (
                        SELECT
                            DISTINCT
                s.SALESDOCUMENTPROVISIONALCODE,
                            s.SALESDOCUMENTCOMPANYCODE,
                            ALLOCATION.CODE AS CODE,
                            iasp.itemelementcode,
                            iasp.LOTCODE,
                            CURR.CURRENCYCODE AS curr,
                            --                s.ORDERLINE AS orderline,
                CASE
                                WHEN e.QUALITYREASONCODE = 'FOC'
                                AND s.SALDOCPROVISIONALCOUNTERCODE IN(
                                    'DREDEF', 'DREPROV', 'DRDDEF', 'DRPPROV'
                                ) THEN iasp.USERSECONDARYQUANTITY
                                WHEN e.QUALITYREASONCODE = 'FOC'
                                AND s.SALDOCPROVISIONALCOUNTERCODE IN(
                                    'EXDPROV', 'EXPPROV', 'PFEPROV', 'GSEPROV'
                                ) THEN 0
                                ELSE iasp.USERSECONDARYQUANTITY
                            END USERSECONDARYQUANTITY,
                            CASE
                                WHEN e.QUALITYREASONCODE = 'FOC'
                                AND s.SALDOCPROVISIONALCOUNTERCODE IN(
                                    'DREDEF', 'DREPROV', 'DRDDEF', 'DRPPROV'
                                ) THEN iasp.USERPRIMARYQUANTITY
                                WHEN e.QUALITYREASONCODE = 'FOC'
                                AND s.SALDOCPROVISIONALCOUNTERCODE IN(
                                    'EXDPROV', 'EXPPROV', 'PFEPROV', 'GSEPROV'
                                ) THEN 0
                                ELSE iasp.USERPRIMARYQUANTITY
                            END USERPRIMARYQUANTITY,
                            CASE
                                WHEN e.QUALITYREASONCODE = 'FOC'
                                AND s.SALDOCPROVISIONALCOUNTERCODE IN(
                                    'DREDEF', 'DREPROV', 'DRDDEF', 'DRPPROV'
                                ) THEN iasp.USERSECONDARYUSEDQUANTITY
                                WHEN e.QUALITYREASONCODE = 'FOC'
                                AND s.SALDOCPROVISIONALCOUNTERCODE IN(
                                    'EXDPROV', 'EXPPROV', 'PFEPROV', 'GSEPROV'
                                ) THEN 0
                                WHEN ALLOCATION.ITEMTYPECODE <> 'CAP' THEN round(iasp.USERSECONDARYUSEDQUANTITY , 2)
                                WHEN iasp.ITEMTYPECODE = 'CAP'
                                AND iasp.BASEPRIMARYUOMCODE IN(
                                    'Lot', 'un'
                                ) THEN iasp.BASEPRIMARYQUANTITY
                                ELSE iasp.BASESECONDARYQUANTITY
                            END qty_pcs,
                            CASE
                                WHEN e.QUALITYREASONCODE = 'FOC'
                                AND s.SALDOCPROVISIONALCOUNTERCODE IN(
                                    'DREDEF', 'DREPROV', 'DRDDEF', 'DRPPROV'
                                ) THEN ROUND(iasp.BASESECONDARYQUANTITY * 0.9144, 2)
                                WHEN e.QUALITYREASONCODE = 'FOC'
                                AND s.SALDOCPROVISIONALCOUNTERCODE IN(
                                    'EXDPROV', 'EXPPROV', 'PFEPROV', 'GSEPROV'
                                ) THEN 0
                                ELSE ROUND(iasp.BASESECONDARYQUANTITY * 0.9144, 2)
                            END BASESECONDARYQUANTITY,
                            CASE
                                WHEN e.QUALITYREASONCODE = 'FOC' THEN iasp.USERPRIMARYQUANTITY
                                ELSE 0
                            END AS FOC_KG,
                            CASE
                                WHEN e.QUALITYREASONCODE = 'FOC' THEN iasp.USERSECONDARYQUANTITY
                                ELSE 0
                            END AS FOC_YARD,
                            s.PRICE,
                            TRIM(s.PRICEUNITOFMEASURECODE) AS PRICEUNITOFMEASURECODE,
                            e.QUALITYREASONCODE,
                            s.PREVIOUSCODE,
                            s.SALDOCPROVISIONALCOUNTERCODE,
                            ALLOCATION.ORDERCODE AS ORDERCODE,
                            --                ALLOCATION.ORDERLINE AS ORDERLINE,
                            ALLOCATION.PROJECTCODE AS PROJECTCODE,
                            ALLOCATION.ITEMTYPECODE,
                            ALLOCATION.ALLOCATIONDATE AS ALLOCATIONDATE,
                            ALLOCATION.DECOSUBCODE01 AS DECOSUBCODE01,
                            ALLOCATION.DECOSUBCODE02 AS DECOSUBCODE02,
                            ALLOCATION.DECOSUBCODE03 AS DECOSUBCODE03,
                            ALLOCATION.DECOSUBCODE04 AS DECOSUBCODE04,
                            ALLOCATION.DECOSUBCODE05 AS DECOSUBCODE05,
                            ALLOCATION.DECOSUBCODE06 AS DECOSUBCODE06,
                            ALLOCATION.DECOSUBCODE07 AS DECOSUBCODE07,
                            ALLOCATION.DECOSUBCODE08 AS DECOSUBCODE08,
                            ALLOCATION.CUSTOMERCODE AS CUSTOMERCODE
                        FROM
                            ALLOCATION ALLOCATION
                        LEFT JOIN ITXVIEW_ALLOCATION_SURATJALAN_PPC iasp ON
                            iasp.CODE = ALLOCATION.CODE
                            AND iasp.DECOSUBCODE01 = ALLOCATION.DECOSUBCODE01
                            AND iasp.DECOSUBCODE02 = ALLOCATION.DECOSUBCODE02
                            AND iasp.DECOSUBCODE03 = ALLOCATION.DECOSUBCODE03
                            AND iasp.DECOSUBCODE04 = ALLOCATION.DECOSUBCODE04
                            AND iasp.DECOSUBCODE05 = ALLOCATION.DECOSUBCODE05
                            AND iasp.DECOSUBCODE06 = ALLOCATION.DECOSUBCODE06
                            AND iasp.DECOSUBCODE07 = ALLOCATION.DECOSUBCODE07
                        LEFT JOIN ELEMENTS e ON
                            iasp.itemelementcode = e.CODE
                        LEFT JOIN SALESDOCUMENTLINE s ON
                            ALLOCATION.DECOSUBCODE01 = s.SUBCODE01
                            AND ALLOCATION.DECOSUBCODE02 = s.SUBCODE02
                            AND ALLOCATION.DECOSUBCODE03 = s.SUBCODE03
                            AND ALLOCATION.DECOSUBCODE04 = s.SUBCODE04
                            AND ALLOCATION.DECOSUBCODE05 = s.SUBCODE05
                            AND ALLOCATION.DECOSUBCODE06 = s.SUBCODE06
                            AND ALLOCATION.DECOSUBCODE07 = s.SUBCODE07
                            AND ALLOCATION.ORDERCODE = s.SALESDOCUMENTPROVISIONALCODE
                            AND ALLOCATION.ORDERLINE = s.ORDERLINE
                        LEFT JOIN SALESDOCUMENT CURR ON
                            CURR.PROVISIONALCODE = s.SALESDOCUMENTPROVISIONALCODE
                            AND CURR.COMPANYCODE = s.SALESDOCUMENTCOMPANYCODE
                            AND CURR.PROVISIONALCOUNTERCODE = s.SALDOCPROVISIONALCOUNTERCODE
                        WHERE
                            ALLOCATION.DETAILTYPE = '1'
                            AND
	    		ALLOCATION.ORIGINTRNTRANSACTIONNUMBER IS NULL
                            AND
	    		ALLOCATION.DESTINATIONTYPE = '7'
                            --                and ALLOCATION.ORDERCODE IN ('PCA2400006')
                    )
                WHERE
                    USERPRIMARYQUANTITY <> 0
                GROUP BY
                    SALESDOCUMENTPROVISIONALCODE,
                    --    CODE,
                    SALESDOCUMENTCOMPANYCODE,
                    CURR,
                    LOTCODE,
                    ORDERCODE,
                    --            ORDERLINE,
                    --            PROJECTCODE,
                    PRICE,
                    PRICEUNITOFMEASURECODE,
                    PREVIOUSCODE,
                    ALLOCATIONDATE,
                    ITEMTYPECODE,
                    SALDOCPROVISIONALCOUNTERCODE,
                    DECOSUBCODE01,
                    DECOSUBCODE02,
                    DECOSUBCODE03,
                    DECOSUBCODE04,
                    DECOSUBCODE05,
                    DECOSUBCODE06,
                    DECOSUBCODE07,
                    DECOSUBCODE08,
                    CUSTOMERCODE
            )
        GROUP BY
            SALESDOCUMENTPROVISIONALCODE,
            SALESDOCUMENTCOMPANYCODE,
            LOTCODE,
            --                DECOSUBCODE04,
            CURR,
            ITEMTYPECODE,
            PRICEUNITOFMEASURECODE,
            SALDOCPROVISIONALCOUNTERCODE,
            PRICE
    )
    --                                            WHERE SALESDOCUMENTPROVISIONALCODE ='PCA2400004'
GROUP BY
    SALESDOCUMENTCOMPANYCODE,
    ITEMTYPECODE,
    SALDOCPROVISIONALCOUNTERCODE,
    CURR,
    SALESDOCUMENTPROVISIONALCODE;