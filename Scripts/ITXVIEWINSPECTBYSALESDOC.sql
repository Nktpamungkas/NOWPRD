DROP VIEW ITXVIEWINSPECTBYSALESDOC;
--CREATE VIEW ITXVIEWINSPECTBYSALESDOC AS
SELECT
    A.PROVISIONALCODE,
    B.CODE,
    C.ITEMELEMENTCODE,
    C.LOTCODE
FROM
    SALESDOCUMENT A
LEFT JOIN ALLOCATION B ON A.PROVISIONALCODE = B.ORDERCODE
LEFT JOIN ALLOCATION C ON B.CODE = C.CODE
WHERE
    C.DETAILTYPE = '0'
--    AND C.ITEMELEMENTCODE LIKE '%00176832%'