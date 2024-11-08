DROP VIEW ITXVIEW_TGLBAGIKAIN;
--CREATE VIEW ITXVIEW_TGLBAGIKAIN AS
SELECT 
    PRODUCTIONORDERCODE,
    LISTAGG(TRANSACTIONDATE, ', ') AS TRANSACTIONDATE
FROM (
    SELECT DISTINCT
        s4.PRODUCTIONORDERCODE,
        s4.TRANSACTIONDATE
    FROM 
        STOCKTRANSACTION s4 
    LEFT JOIN ITXVIEWKK i5 ON i5.PRODUCTIONORDERCODE = s4.PRODUCTIONORDERCODE AND i5.COMPANYCODE = s4.COMPANYCODE 
    WHERE 
        s4.ITEMTYPECODE ='KGF')
--WHERE PRODUCTIONORDERCODE = '00051007'
GROUP BY 
        PRODUCTIONORDERCODE