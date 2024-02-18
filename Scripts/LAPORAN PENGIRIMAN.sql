SELECT 
	DISTINCT
    i.PROVISIONALCODE,
    TRIM(i.PRICEUNITOFMEASURECODE) AS PRICEUNITOFMEASURECODE,
    i.DEFINITIVECOUNTERCODE,
    i.DEFINITIVEDOCUMENTDATE,
    i.ORDERPARTNERBRANDCODE,
    CASE
        WHEN TRIM(i.DEFINITIVECOUNTERCODE) = 'CESDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'CESPROV' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DREDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'DREPROV' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DSEDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEDEF' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'PSEPROV' THEN '' ELSE i.PO_NUMBER
    END AS PO_NUMBER,
    i.PROJECTCODE,
    DAY(i.GOODSISSUEDATE) ||'-'|| MONTHNAME(i.GOODSISSUEDATE) ||'-'|| YEAR(i.GOODSISSUEDATE) AS GOODSISSUEDATE,
    i.ORDPRNCUSTOMERSUPPLIERCODE,
    i.PAYMENTMETHODCODE,   
    i.ITEMTYPEAFICODE,
    CASE
        WHEN TRIM(i.DEFINITIVECOUNTERCODE) = 'CESDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'CESPROV' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DREDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'DREPROV' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DSEDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEDEF' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'PSEPROV' THEN '' ELSE i.DLVSALORDERLINESALESORDERCODE
    END AS DLVSALORDERLINESALESORDERCODE,
    CASE
        WHEN TRIM(i.DEFINITIVECOUNTERCODE) = 'CESDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'CESPROV' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DREDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'DREPROV' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DSEDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEDEF' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'PSEPROV' THEN 0 ELSE i.DLVSALESORDERLINEORDERLINE
    END AS DLVSALESORDERLINEORDERLINE,
    CASE
        WHEN TRIM(i.DEFINITIVECOUNTERCODE) = 'CESDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'CESPROV' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DREDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'DREPROV' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DSEDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEDEF' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'PSEPROV' THEN '' 
        ELSE 
            TRIM(i.SUBCODE01) || '-' || TRIM(i.SUBCODE02) || '-' || TRIM(i.SUBCODE03) || '-' || TRIM(i.SUBCODE04) || '-' ||
            TRIM(i.SUBCODE05) || '-' || TRIM(i.SUBCODE06) || '-' || TRIM(i.SUBCODE07) || '-' || TRIM(i.SUBCODE08)
    END AS ITEMDESCRIPTION,
    CASE
        WHEN TRIM(i.DEFINITIVECOUNTERCODE) = 'CESDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'CESPROV' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DREDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'DREPROV' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DSEDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEDEF' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'PSEPROV' THEN '' ELSE iasp.LOTCODE
    END AS LOTCODE,
    CASE
        WHEN TRIM(i.DEFINITIVECOUNTERCODE) = 'CESDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'CESPROV' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DREDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'DREPROV' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DSEDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEDEF' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'PSEPROV' THEN '' ELSE i2.WARNA
    END AS WARNA,
    i.LEGALNAME1,
    CASE
        WHEN TRIM(i.DEFINITIVECOUNTERCODE) = 'CESDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'CESPROV' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DREDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'DREPROV' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'DSEDEF' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXDPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPDEF' OR
            TRIM(i.DEFINITIVECOUNTERCODE) = 'EXPPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEDEF' OR 
            TRIM(i.DEFINITIVECOUNTERCODE) = 'GSEPROV' OR TRIM(i.DEFINITIVECOUNTERCODE) = 'PSEPROV' THEN 'EXPORT' ELSE i.CODE
    END AS CODE
FROM 
    ITXVIEW_SURATJALAN_PPC_FOR_POSELESAI i
LEFT JOIN ITXVIEW_ALLOCATION_SURATJALAN_PPC iasp ON iasp.CODE = i.CODE
LEFT JOIN ITXVIEWCOLOR i2 ON i2.ITEMTYPECODE =  i.ITEMTYPEAFICODE
                        AND i2.SUBCODE01 = i.SUBCODE01 AND i2.SUBCODE02 = i.SUBCODE02
                        AND i2.SUBCODE03 = i.SUBCODE03 AND i2.SUBCODE04 = i.SUBCODE04
                        AND i2.SUBCODE05 = i.SUBCODE05 AND i2.SUBCODE06 = i.SUBCODE06
                        AND i2.SUBCODE07 = i.SUBCODE07 AND i2.SUBCODE08 = i.SUBCODE08
                        AND i2.SUBCODE09 = i.SUBCODE09 AND i2.SUBCODE10 = i.SUBCODE10
WHERE 
--    i.DLVSALORDERLINESALESORDERCODE = '$no_order'
    i.GOODSISSUEDATE = '2024-01-25'
--    AND PROVISIONALCODE = 'PCA2400002'
    AND NOT (SUBSTR(i.DLVSALORDERLINESALESORDERCODE, 1,3) = 'CAP' AND (i.ITEMTYPEAFICODE = 'KFF' OR i.ITEMTYPEAFICODE = 'KGF'))
    AND i.DOCUMENTTYPETYPE = 05 
    AND NOT i.CODE IS NULL 
    AND i.PROGRESSSTATUS_SALDOC = 2
GROUP BY
    i.PROVISIONALCODE,
    i.PRICEUNITOFMEASURECODE,
    i.DEFINITIVEDOCUMENTDATE,
    i.ORDERPARTNERBRANDCODE,
    i.PO_NUMBER,
    i.PROJECTCODE,
    i.GOODSISSUEDATE,
    i.ORDPRNCUSTOMERSUPPLIERCODE,
    i.PAYMENTMETHODCODE,
    i.PO_NUMBER,    
    i.ITEMTYPEAFICODE,
    i.DLVSALORDERLINESALESORDERCODE,
    i.DLVSALESORDERLINEORDERLINE,
    i.ITEMDESCRIPTION,
    iasp.LOTCODE,
    i.DEFINITIVECOUNTERCODE,
    i2.WARNA,
    i.LEGALNAME1,
    i.CODE,
    i.SUBCODE01,
    i.SUBCODE02,
    i.SUBCODE03,
    i.SUBCODE04,
    i.SUBCODE05,
    i.SUBCODE06,
    i.SUBCODE07,
    i.SUBCODE08,
    i.SUBCODE09,
    i.SUBCODE10
ORDER BY 
    i.PROVISIONALCODE ASC

-- CAPITAL KFF KGF
SELECT 
	DISTINCT
	i.GOODSISSUEDATE,
	i.PROVISIONALCODE,
	i2.WARNA,
	COUNT(i2.SUBCODE05) AS ROLL,
	SUM(iasp.BASEPRIMARYQUANTITY) AS QTY_KG,
	SUM(iasp.BASESECONDARYQUANTITY) AS QTY_YD,
	i.LONGDESCRIPTION AS BUYER,
	i.LEGALNAME1 AS CUSTOMER,
	i.PO_NUMBER,
	i.DLVSALORDERLINESALESORDERCODE,
	CASE
		WHEN LOCATE('//', LISTAGG(DISTINCT TRIM(p.LONGDESCRIPTION), '//')) = 0 THEN LISTAGG(DISTINCT TRIM(p.LONGDESCRIPTION), '//')
		ELSE
			SUBSTR(LISTAGG(DISTINCT TRIM(p.LONGDESCRIPTION), '//'), 1, LOCATE('//', LISTAGG(DISTINCT TRIM(p.LONGDESCRIPTION), '//'))-1)
	END AS JENIS_KAIN	
FROM 
    ITXVIEW_SURATJALAN_PPC i
LEFT JOIN ITXVIEW_ALLOCATION_SURATJALAN_PPC iasp ON iasp.CODE = i.CODE
LEFT JOIN ITXVIEWCOLOR i2 ON i2.ITEMTYPECODE =  i.ITEMTYPEAFICODE
                        AND i2.SUBCODE01 = i.SUBCODE01 AND i2.SUBCODE02 = i.SUBCODE02
                        AND i2.SUBCODE03 = i.SUBCODE03 AND i2.SUBCODE04 = i.SUBCODE04
                        AND i2.SUBCODE05 = i.SUBCODE05 AND i2.SUBCODE06 = i.SUBCODE06
                        AND i2.SUBCODE07 = i.SUBCODE07 AND i2.SUBCODE08 = i.SUBCODE08
                        AND i2.SUBCODE09 = i.SUBCODE09 AND i2.SUBCODE10 = i.SUBCODE10
LEFT JOIN PRODUCT p ON p.ITEMTYPECODE =  i.ITEMTYPEAFICODE
                    AND p.SUBCODE01 = i.SUBCODE01 AND p.SUBCODE02 = i.SUBCODE02
                    AND p.SUBCODE03 = i.SUBCODE03 AND p.SUBCODE04 = i.SUBCODE04
                    AND p.SUBCODE05 = i.SUBCODE05 AND p.SUBCODE06 = i.SUBCODE06
                    AND p.SUBCODE07 = i.SUBCODE07 AND p.SUBCODE08 = i.SUBCODE08
                    AND p.SUBCODE09 = i.SUBCODE09 AND p.SUBCODE10 = i.SUBCODE10
WHERE 
    i.GOODSISSUEDATE = '2024-01-25'
    AND PROVISIONALCODE = 'PCA2400002'
    AND (SUBSTR(i.DLVSALORDERLINESALESORDERCODE, 1,3) = 'CAP' AND (i.ITEMTYPEAFICODE = 'KFF' OR i.ITEMTYPEAFICODE = 'KGF'))
GROUP BY 
	i.GOODSISSUEDATE,
	i.PROVISIONALCODE,
	i2.WARNA,
	i.LONGDESCRIPTION,
	i.LEGALNAME1,
	i.PO_NUMBER,
	i.DLVSALORDERLINESALESORDERCODE