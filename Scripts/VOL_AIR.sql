--DROP VIEW ITXVIEW_VOLAIR;
--CREATE VIEW ITXVIEW_VOLAIR AS
SELECT * FROM (
	SELECT
		VIEWPRODUCTIONRESERVATION.GROUPLINE,
	    VIEWPRODUCTIONRESERVATION.ITEMTYPEAFICODE,
	    VIEWPRODUCTIONRESERVATION.PICKUPQUANTITY,
	    VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE,
	    VIEWPRODUCTIONDEMANDSTEP.FINALUSERPRIMARYQUANTITY
	FROM
	    DB2ADMIN.VIEWPRODUCTIONRESERVATION VIEWPRODUCTIONRESERVATION
	LEFT OUTER JOIN DB2ADMIN.VIEWPRODUCTIONDEMANDSTEP VIEWPRODUCTIONDEMANDSTEP ON
	    VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE = VIEWPRODUCTIONDEMANDSTEP.PRODUCTIONORDERCODE
	    AND VIEWPRODUCTIONRESERVATION.PRODRESERVATIONLINKGROUPCODE = VIEWPRODUCTIONDEMANDSTEP.OPERATIONCODE
	WHERE
	    VIEWPRODUCTIONRESERVATION.ITEMTYPEAFICODE = 'RFD'
	ORDER BY 
		VIEWPRODUCTIONRESERVATION.GROUPLINE DESC
)