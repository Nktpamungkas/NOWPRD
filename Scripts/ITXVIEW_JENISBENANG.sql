DROP VIEW ITXVIEW_JENISBENANG;
--CREATE VIEW ITXVIEW_JENISBENANG AS
SELECT
    b.NUMBERID,
    b.SUBCODE01,
    b.SUBCODE02,
    b.SUBCODE03,
    b.SUBCODE04,
--    LISTAGG ('(' || TRIM(f.SUMMARIZEDDESCRIPTION) || ')' ) AS DESCRIP
    TRIM(b.LONGDESCRIPTION) AS DESCRIP
FROM
    BILLOFMATERIAL b
--LEFT JOIN BOMCOMPONENT b2 ON b2.BILLOFMATERIALNUMBERID = b.NUMBERID
--LEFT JOIN FULLITEMKEYDECODER f ON f.SUBCODE01 = b2.SUBCODE01
--    AND f.SUBCODE02 = b2.SUBCODE02
--    AND f.SUBCODE03 = b2.SUBCODE03
--    AND f.SUBCODE04 = b2.SUBCODE04
--    AND f.SUBCODE05 = b2.SUBCODE05
--    AND f.SUBCODE06 = b2.SUBCODE06
--    AND f.SUBCODE07 = b2.SUBCODE07
--    AND f.SUBCODE08 = b2.SUBCODE08
--GROUP BY
--    b.NUMBERID,
--    b.SUBCODE01,
--    b.SUBCODE02,
--    b.SUBCODE03,
--    b.SUBCODE04;