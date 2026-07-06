select 
    s.TRANSACTIONDATE as transactiondate,
    s.TRANSACTIONTIME as transactiontime,
    s.ITEMTYPECODE as itemtypecode,
    s.TEMPLATECODE as templatecode,
    CASE
        WHEN s.ITEMTYPECODE = 'PST' THEN TRIM(s.DECOSUBCODE01)
        WHEN s.ITEMTYPECODE = 'DYC' THEN TRIM(s.DECOSUBCODE01) || '-' || TRIM(s.DECOSUBCODE02) || '-' || TRIM(s.DECOSUBCODE03)
    END as obat_fin,
    s.BASEPRIMARYQUANTITY as baseprimaryquantity,
    s.BASEPRIMARYUOMCODE as baseprimaryuomcode,
    s.PRODUCTIONORDERCODE as productionordercode
 from 
 	STOCKTRANSACTION as s 
 where s.LOGICALWAREHOUSECODE = 'M512' 
 	and s.TEMPLATECODE in (120, 098) 
 	and ((s.ITEMTYPECODE = 'PST' and TRIM(s.DECOSUBCODE01) = 'E-2-008') )