SELECT
	*
FROM
	ITXVIEW_QTYPACKING_WITH_DATE iqwd 
LEFT JOIN ITXVIEW_MEMOPENTINGPPC im ON im.DEMAND = iqwd.DEMANDCODE 
WHERE 
	iqwd.TGL_PACKING BETWEEN '2024-09-17' AND '2024-09-20' 