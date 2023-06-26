DROP VIEW ITXVIEW_DETAIL_QA_DATA;
CREATE VIEW ITXVIEW_DETAIL_QA_DATA AS
SELECT DISTINCT
	PRODUCTIONDEMANDSTEP.PRODUCTIONDEMANDCODE,
	PRODUCTIONDEMANDSTEP.PRODUCTIONORDERCODE,
	PRODUCTIONDEMANDSTEP.WORKCENTERCODE,
	PRODUCTIONDEMANDSTEP.OPERATIONCODE,
	QUALITYDOClINE.LINE,
	QUALITYDOClINE.QUALITYDOCUMENTHEADERNUMBERID,
	QUALITYDOClINE.CHARACTERISTICCODE,
	QUALITYCHARACTERISTICTYPE.LONGDESCRIPTION,
	CASE
		WHEN QUALITYDOClINE.VALUEQUANTITY IS NULL OR QUALITYDOClINE.VALUEQUANTITY = 0 THEN 0 ELSE 
		floor( QUALITYDOClINE.VALUEQUANTITY ) 
	END AS VALUEQUANTITY 
FROM
	QUALITYDOCUMENT QUALITYDOCUMENT
LEFT JOIN QUALITYDOCLINE QUALITYDOCLINE ON QUALITYDOCUMENT.HEADERNUMBERID = QUALITYDOCLINE.QUALITYDOCUMENTHEADERNUMBERID 
		AND QUALITYDOCUMENT.HEADERLINE = QUALITYDOCLINE.QUALITYDOCUMENTHEADERLINE
LEFT JOIN QUALITYCHARACTERISTICTYPE QUALITYCHARACTERISTICTYPE ON QUALITYDOClINE.CHARACTERISTICCODE = QUALITYCHARACTERISTICTYPE.CODE 
LEFT JOIN PRODUCTIONDEMANDSTEP PRODUCTIONDEMANDSTEP ON QUALITYDOCUMENT.PRODUCTIONORDERCODE = PRODUCTIONDEMANDSTEP.PRODUCTIONORDERCODE 
		AND QUALITYDOCUMENT.WORKCENTERCODE = PRODUCTIONDEMANDSTEP.WORKCENTERCODE 
		AND QUALITYDOCUMENT.OPERATIONCODE = PRODUCTIONDEMANDSTEP.OPERATIONCODE 
WHERE
	QUALITYDOCLINE.VALUEQUANTITY IS NOT NULL 
	AND QUALITYDOCLINE.VALUEQUANTITY <> 0 