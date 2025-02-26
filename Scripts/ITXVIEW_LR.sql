DROP VIEW ITXVIEW_LR;
--CREATE VIEW ITXVIEW_LR AS
SELECT * FROM (
	SELECT
		VIEWPRODUCTIONRESERVATION.GROUPLINE,
	    VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE,
	    VIEWPRODUCTIONRESERVATION.PICKUPQUANTITY
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