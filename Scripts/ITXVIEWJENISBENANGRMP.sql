DROP VIEW ITXVIEWJENISBENANGRMP;
--CREATE VIEW ITXVIEWJENISBENANGRMP AS
SELECT
    PRODUCTIONDEMAND.PROJECTCODE,
    PRODUCTIONDEMAND.CODE,
    A.CODE AS DEMAND_KFF,
    A.ABSUNIQUEID,
    B.PROJECT_ADDS,
    PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE,
    PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE,
    PRODUCTIONDEMAND.SUBCODE01,
    PRODUCTIONDEMAND.SUBCODE02,
    PRODUCTIONDEMAND.SUBCODE03,
    PRODUCTIONDEMAND.SUBCODE04,
    PRODUCTIONRESERVATION.PRODUCTIONORDERCODE,
    LISTAGG(PRODUCTIONRESERVATION.FULLITEMIDENTIFIER, ',') WITHIN GROUP (ORDER BY PRODUCTIONRESERVATION.FULLITEMIDENTIFIER ASC) AS FULLITEMIDENTIFIER,
    LISTAGG(PRODUCTIONRESERVATION.RESERVATIONLINE, ',') WITHIN GROUP ( ORDER BY PRODUCTIONRESERVATION.RESERVATIONLINE ASC) AS RESERVATIONLINE,
    LISTAGG(CONCAT(CONCAT(PRODUCTIONRESERVATION.RESERVATIONLINE, ':'), TRIM(CAST(FULLITEMKEYDECODER.SUMMARIZEDDESCRIPTION AS VARCHAR(10000)))), ',') WITHIN GROUP (ORDER BY PRODUCTIONRESERVATION.RESERVATIONLINE ASC) AS SUMMARIZEDDESCRIPTION,
    LISTAGG(CONCAT(CONCAT(PRODUCTIONRESERVATION.RESERVATIONLINE, ':'), TRIM(CAST(PRODUCTIONRESERVATIONCOMMENT.COMMENTTEXT AS VARCHAR(10000)))), ',') WITHIN GROUP (ORDER BY PRODUCTIONRESERVATION.RESERVATIONLINE ASC) AS COMMENTTEXT
FROM
    PRODUCTIONDEMAND PRODUCTIONDEMAND
LEFT JOIN PRODUCTIONRESERVATION PRODUCTIONRESERVATION ON PRODUCTIONDEMAND.COMPANYCODE = PRODUCTIONRESERVATION.COMPANYCODE AND PRODUCTIONDEMAND.CODE = PRODUCTIONRESERVATION.ORDERCODE
LEFT JOIN FULLITEMKEYDECODER FULLITEMKEYDECODER ON PRODUCTIONRESERVATION.FULLITEMIDENTIFIER = FULLITEMKEYDECODER.IDENTIFIER
LEFT JOIN PRODUCTIONRESERVATIONCOMMENT PRODUCTIONRESERVATIONCOMMENT ON PRODUCTIONRESERVATION.ORDERCODE = PRODUCTIONRESERVATIONCOMMENT.PRODUCTIONRESERVATIONORDERCODE AND PRODUCTIONRESERVATION.RESERVATIONLINE = PRODUCTIONRESERVATIONCOMMENT.PRORESERVATIONRESERVATIONLINE
LEFT JOIN (
    SELECT
        PRODUCTIONDEMAND.CODE,
        PRODUCTIONDEMAND.ITEMTYPEAFICODE,
        PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE,
        PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE,
        PRODUCTIONDEMAND.ABSUNIQUEID
    FROM
        PRODUCTIONDEMAND PRODUCTIONDEMAND
    WHERE
        PRODUCTIONDEMAND.ITEMTYPEAFICODE = 'KFF'
) A ON
    PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE = A.ORIGDLVSALORDLINESALORDERCODE AND PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE = A.ORIGDLVSALORDERLINEORDERLINE
LEFT JOIN (
    SELECT
        ADSTORAGE.UNIQUEID,
        ADSTORAGE.VALUESTRING AS PROJECT_ADDS
    FROM
        ADSTORAGE ADSTORAGE
    WHERE
        ADSTORAGE.NAMENAME = 'ProAllow'
) B ON
    A.ABSUNIQUEID = B.UNIQUEID
WHERE
    PRODUCTIONRESERVATION.ITEMTYPEAFICODE = 'GYR' OR PRODUCTIONRESERVATION.ITEMTYPEAFICODE = 'DYR'
GROUP BY
    PRODUCTIONDEMAND.PROJECTCODE,
    PRODUCTIONDEMAND.CODE,
    A.CODE,
    A.ABSUNIQUEID,
    B.PROJECT_ADDS,
    PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE,
    PRODUCTIONDEMAND.ORIGDLVSALORDERLINEORDERLINE,
    PRODUCTIONDEMAND.SUBCODE01,
    PRODUCTIONDEMAND.SUBCODE02,
    PRODUCTIONDEMAND.SUBCODE03,
    PRODUCTIONDEMAND.SUBCODE04,
    PRODUCTIONRESERVATION.PRODUCTIONORDERCODE;