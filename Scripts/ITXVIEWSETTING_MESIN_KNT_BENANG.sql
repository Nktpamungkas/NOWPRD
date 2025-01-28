-- DB2ADMIN.ITXVIEWSETTING_MESIN_KNT_BENANG source
DROP VIEW ITXVIEWSETTING_MESIN_KNT_BENANG;
--CREATE VIEW ITXVIEWSETTING_MESIN_KNT_BENANG AS
SELECT
    *
FROM
    (
        SELECT
            ROW_NUMBER() OVER (
                PARTITION BY p.ORDERCODE
            ORDER BY
                p.GROUPLINE
            ) AS NOMORURUT,
            p.ORDERCODE,
            p.GROUPLINE,
            REPLACE(REPLACE(REPLACE(FULLITEMKEYDECODER.ORDERITEMCODE, '    ', ' '), '   ', ' '), '  ', '') AS ORDERITEMCODE,
            TRIM(FULLITEMKEYDECODER.SUMMARIZEDDESCRIPTION) AS SUMMARIZEDDESCRIPTION
        FROM
            PRODUCTIONRESERVATION p
        LEFT JOIN FULLITEMKEYDECODER FULLITEMKEYDECODER ON
            FULLITEMKEYDECODER.ITEMTYPECODE = p.ITEMTYPEAFICODE
            AND FULLITEMKEYDECODER.SUBCODE01 = p.SUBCODE01
            AND FULLITEMKEYDECODER.SUBCODE02 = p.SUBCODE02
            AND FULLITEMKEYDECODER.SUBCODE03 = p.SUBCODE03
            AND FULLITEMKEYDECODER.SUBCODE04 = p.SUBCODE04
            AND FULLITEMKEYDECODER.SUBCODE05 = p.SUBCODE05
            AND FULLITEMKEYDECODER.SUBCODE06 = p.SUBCODE06
            AND FULLITEMKEYDECODER.SUBCODE07 = p.SUBCODE07
            AND FULLITEMKEYDECODER.SUBCODE08 = p.SUBCODE08
            AND FULLITEMKEYDECODER.SUBCODE09 = p.SUBCODE09
            WHERE
            	ORDERCODE = '00321968'
        ORDER BY
            p.GROUPLINE ASC
    );