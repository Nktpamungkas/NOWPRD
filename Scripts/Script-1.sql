SELECT
 DISTINCT VIEWPRODUCTIONRESERVATION.GROUPLINE AS GROUPLINE,
 VIEWPRODUCTIONRESERVATION.GROUPSTEPNUMBER,
	VIEWPRODUCTIONRESERVATION.GROUPLINE
FROM
    VIEWPRODUCTIONRESERVATION VIEWPRODUCTIONRESERVATION
LEFT JOIN ITXVIEWKK i ON i.PRODUCTIONORDERCODE = VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE
LEFT JOIN ITXVIEW_RESERVATION ir ON ir.PRODRESERVATIONLINKGROUPCODE = VIEWPRODUCTIONRESERVATION.PRODRESERVATIONLINKGROUPCODE 
                                AND ir.PRODUCTIONORDERCODE = VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE 
WHERE
    VIEWPRODUCTIONRESERVATION.PRODUCTIONORDERCODE = '00176041'
    AND VIEWPRODUCTIONRESERVATION.ITEMTYPEAFICODE IN ('RFD', 'RFF')
    AND SUBSTR(VIEWPRODUCTIONRESERVATION.SUBCODE01, 1, 2) = 'SC' 
ORDER BY 
	VIEWPRODUCTIONRESERVATION.GROUPSTEPNUMBER ASC,
	VIEWPRODUCTIONRESERVATION.GROUPLINE ASC