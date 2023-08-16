--CREATE VIEW ITXVIEWINSPECTPACKING AS
SELECT
    ELEMENTSINSPECTIONEVENT.ELEMENTSINSPECTIONELEMENTCODE,
    A.VALUEDECIMAL,
    ELEMENTSINSPECTION.LENGTHGROSS,
    ELEMENTSINSPECTION.WEIGHTNET,
    ELEMENTSINSPECTION.WIDTHNET,
    ELEMENTSINSPECTION.QUALITYCODE,
    LISTAGG(
        CONCAT(CONCAT(ELEMENTSINSPECTIONEVENT."SEQUENCE", ':'), ELEMENTSINSPECTIONEVENT.CODEEVENTCODE),
        ','
    ) WITHIN GROUP(
    ORDER BY
        ELEMENTSINSPECTIONEVENT."SEQUENCE" ASC
    ) AS DEFECT,
    LISTAGG(
        CONCAT(CONCAT(ELEMENTSINSPECTIONEVENT."SEQUENCE", ':'), ELEMENTSINSPECTIONEVENT.STARTPOSITION),
        ','
    ) WITHIN GROUP(
    ORDER BY
        ELEMENTSINSPECTIONEVENT."SEQUENCE" ASC
    ) AS POSITIONL,
    LISTAGG(
        CONCAT(CONCAT(ELEMENTSINSPECTIONEVENT."SEQUENCE", ':'), ELEMENTSINSPECTIONEVENT.WIDTHPOSITION),
        ','
    ) WITHIN GROUP(
    ORDER BY
        ELEMENTSINSPECTIONEVENT."SEQUENCE" ASC
    ) AS POSITIONW,
    LISTAGG(
        CONCAT(CONCAT(ELEMENTSINSPECTIONEVENT."SEQUENCE", ':'), ELEMENTSINSPECTIONEVENT.POINTS),
        ','
    ) WITHIN GROUP(
    ORDER BY
        ELEMENTSINSPECTIONEVENT."SEQUENCE" ASC
    ) AS POINT,
    SUM(ELEMENTSINSPECTIONEVENT.CREDITS) AS CREDIT
FROM
    ELEMENTSINSPECTIONEVENT
LEFT JOIN ELEMENTSINSPECTION ON
    ELEMENTSINSPECTIONEVENT.ELEMENTSINSPECTIONELEMENTCODE = ELEMENTSINSPECTION.ELEMENTCODE
LEFT JOIN ELEMENTS ON
    ELEMENTSINSPECTION.ELEMENTCODE = ELEMENTS.CODE
LEFT JOIN (
        SELECT
            ADSTORAGE.UNIQUEID,
            ADSTORAGE.VALUEDECIMAL
        FROM
            ADSTORAGE ADSTORAGE
        WHERE
            ADSTORAGE.NAMENAME = 'CalculatedLength'
    ) A ON
    ELEMENTSINSPECTION.ABSUNIQUEID = A.UNIQUEID
WHERE
	ELEMENTSINSPECTIONEVENT.ELEMENTSINSPECTIONELEMENTCODE = ''
GROUP BY
    ELEMENTSINSPECTIONEVENT.ELEMENTSINSPECTIONELEMENTCODE,
    A.VALUEDECIMAL,
    ELEMENTSINSPECTION.LENGTHGROSS,
    ELEMENTSINSPECTION.WEIGHTNET,
    ELEMENTSINSPECTION.WIDTHNET,
    ELEMENTSINSPECTION.QUALITYCODE;