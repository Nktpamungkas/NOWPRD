SELECT
	BALANCE.ITEMTYPECODE,
	BALANCE.DECOSUBCODE01,
	BALANCE.DECOSUBCODE02,
	BALANCE.DECOSUBCODE03,
	BALANCE.DECOSUBCODE04,
	BALANCE.DECOSUBCODE05,
	BALANCE.DECOSUBCODE06,
	BALANCE.DECOSUBCODE07,
	BALANCE.DECOSUBCODE08,
	BALANCE.DECOSUBCODE09,
	BALANCE.DECOSUBCODE10,
	BALANCE.LOTCODE,
	BALANCE.ELEMENTSCODE,
	BALANCE.PROJECTCODE,
	BALANCE.BASEPRIMARYUNITCODE,
	BALANCE.BASEPRIMARYQUANTITYUNIT,
	BALANCE.BASESECONDARYUNITCODE,
	BALANCE.BASESECONDARYQUANTITYUNIT,
	SALESORDER.COUNTERCODE,
	SALESORDER.CODE,
	SALESORDER.ORDPRNCUSTOMERSUPPLIERCODE,
	SALESORDER.DELIVERYPOINTUNIQUEID,
	SALESORDER.DELIVERYPOINTCODE,
	SALESORDER.STATISTICALGROUPCODE
FROM
	DB2ADMIN.BALANCE BALANCE
LEFT OUTER JOIN DB2ADMIN.SALESORDER 
       SALESORDER ON
	BALANCE.PROJECTCODE = SALESORDER.CODE
WHERE 
	BALANCE.ELEMENTSCODE = '0026849090001'