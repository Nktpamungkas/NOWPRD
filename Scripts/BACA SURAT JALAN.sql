SELECT
	isp.DECOSUBCODE05,
	isp.SUBCODE02 || isp.SUBCODE03,
	i.WARNA,
	COUNT(isp.SUBCODE05) AS ROLL,
	SUM(iasp.BASEPRIMARYQUANTITY) AS SUMKG
--	iasp.LOTCODE 
FROM
	ITXVIEW_SURATJALAN_PPC isp
LEFT JOIN ITXVIEW_ALLOCATION_SURATJALAN_PPC iasp ON iasp.CODE = isp.CODE 
LEFT JOIN ITXVIEWCOLOR i ON i.ITEMTYPECODE = isp.ITEMTYPEAFICODE 
						AND i.SUBCODE01 = isp.DECOSUBCODE01
						AND i.SUBCODE02 = isp.DECOSUBCODE02
						AND i.SUBCODE03 = isp.DECOSUBCODE03
						AND i.SUBCODE04 = isp.DECOSUBCODE04
						AND i.SUBCODE05 = isp.DECOSUBCODE05
						AND i.SUBCODE06 = isp.DECOSUBCODE06
						AND i.SUBCODE07 = isp.DECOSUBCODE07
						AND i.SUBCODE08 = isp.DECOSUBCODE08
						AND i.SUBCODE09 = isp.DECOSUBCODE09
						AND i.SUBCODE10 = isp.DECOSUBCODE10
WHERE 
	isp.PROVISIONALCODE = 'PCA2400002'
--	AND iasp.LOTCODE = '1-1'
GROUP BY
	isp.DECOSUBCODE05,
	i.WARNA,
--	iasp.LOTCODE,
	isp.SUBCODE03,
	isp.SUBCODE02
ORDER BY 
	isp.DECOSUBCODE05 
ASC