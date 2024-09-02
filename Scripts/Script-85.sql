SELECT
	*
FROM
	ITXVIEWSTATUSKAIN_GKJ
WHERE 
	ITEMELEMENTCODE = '0029037300601'
	
	
	
SELECT
	ITEMELEMENTCODE,
    QUALITYREASONCODE,
    CREATIONDATETIME,
    PROJECTCODE,
    ROW_NUMBER() OVER (
        PARTITION BY ITEMELEMENTCODE
    ORDER BY
        CREATIONDATETIME DESC,
        TRANSACTIONDETAILNUMBER DESC
    ) AS RN
FROM
	STOCKTRANSACTION s
WHERE
	ITEMELEMENTCODE = '0029037300601'