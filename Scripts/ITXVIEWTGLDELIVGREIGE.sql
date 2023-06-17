DROP VIEW ITXVIEWTGLDELIVGREIGE;
--CREATE VIEW ITXVIEWTGLDELIVGREIGE AS
SELECT
	PRODUCTIONDEMAND.CODE,
    LISTAGG(TRIM(PRODUCTIONDEMAND.FINALPLANNEDDATE), ',') AS FINALPLANNEDDATE,
    PRODUCTIONDEMAND.ITEMTYPEAFICODE,
    PRODUCTIONDEMAND.SUBCODE01,
    PRODUCTIONDEMAND.SUBCODE02,
    PRODUCTIONDEMAND.SUBCODE03,
    PRODUCTIONDEMAND.SUBCODE04,
    PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE AS PROJECTCODE 
FROM
    PRODUCTIONDEMAND PRODUCTIONDEMAND
WHERE
    ITEMTYPEAFICODE = 'KGF'
GROUP BY
	PRODUCTIONDEMAND.CODE,
    PRODUCTIONDEMAND.ITEMTYPEAFICODE,
    PRODUCTIONDEMAND.SUBCODE01,
    PRODUCTIONDEMAND.SUBCODE02,
    PRODUCTIONDEMAND.SUBCODE03,
    PRODUCTIONDEMAND.SUBCODE04,
    PRODUCTIONDEMAND.ORIGDLVSALORDLINESALORDERCODE;