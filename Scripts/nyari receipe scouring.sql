SELECT
	GROUPTYPECODE,
	"SEQUENCE",
	SUBSEQUENCE,
	ITEMTYPEAFICODE,
	SUBCODE01,
	SUBCODE02,
	SUBCODE03,
	CONSUMPTION,
	CONSUMPTIONTYPE,
	COMMENTLINE
FROM
	RECIPECOMPONENT r
WHERE
	RECIPESUBCODE01 = 'SC3301'
	AND RECIPESUFFIXCODE = '01'
ORDER BY
	GROUPTYPECODE ASC,
	"SEQUENCE" ASC

	
SELECT
	r3.GROUPTYPECODE,
	r3."SEQUENCE",
	r3.SUBSEQUENCE,
	r3.ITEMTYPEAFICODE,
	r3.SUBCODE01,
	r3.SUBCODE02,
	r3.SUBCODE03,
	r3.CONSUMPTION,
	r3.CONSUMPTIONTYPE,
	r3.COMMENTLINE
FROM
	RECIPE r
LEFT JOIN RECIPECOMPONENT r2 ON r2.RECIPENUMBERID = r.NUMBERID 
LEFT JOIN RECIPECOMPONENT r3 ON r3.RECIPESUBCODE01 = r2.SUBCODE01 AND r3.RECIPESUFFIXCODE = r2.SUFFIXCODE
WHERE
--	r.SUBCODE01 = '21120/240478L'
	r.SUBCODE01 = '21120/240478L'
	AND r.SUFFIXCODE = '001'
ORDER BY
	r3.GROUPTYPECODE ASC,
	r3."SEQUENCE" ASC