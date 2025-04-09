-- DB2ADMIN.ITXVIEW_CET_CUTEL2 source
DROP VIEW ITXVIEW_CET_CUTEL2;
--CREATE VIEW ITXVIEW_CET_CUTEL2 AS
SELECT
    CASE
        WHEN LEFT(e.CODE, 1) = '8'
		        AND (CASE
		                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
		                ELSE 'NORMAL'
		            END) = 'NORMAL'
		        AND (CASE
		                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
		                ELSE 'NORMAL'
		            END) = 'NORMAL' THEN p2.PRODUCTIONORDERCODE
        WHEN LEFT(e.CODE, 1) <> '8'
        		AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL' THEN p2.PRODUCTIONORDERCODE
        WHEN LEFT(e.CODE, 1) = '8'
        		AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.PRODUCTIONORDERCODE
        WHEN LEFT(e.CODE, 1) <> '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.PRODUCTIONORDERCODE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL'
	        	AND (CASE
	                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.PRODUCTIONORDERCODE
    END AS PRODUCTIONORDERCODE,
    CASE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL'
	        	AND (CASE
	                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL' THEN p2.PRODUCTIONDEMANDCODE
        WHEN LEFT(e.CODE, 1) <> '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL' THEN p2.PRODUCTIONDEMANDCODE
        WHEN LEFT(e.CODE, 1) <> '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.PRODUCTIONDEMANDCODE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.PRODUCTIONDEMANDCODE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL'
	        	AND (CASE
	                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END)= 'CHANGE LOT' THEN p.PRODUCTIONDEMANDCODE
    END AS PRODUCTIONDEMANDCODE,
    CASE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL'
	        	AND (CASE
	                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL' THEN p2.EXTERNALREFERENCE
        WHEN LEFT(e.CODE, 1) <> '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL' THEN p2.EXTERNALREFERENCE
        WHEN LEFT(e.CODE, 1) <> '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.EXTERNALREFERENCE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.EXTERNALREFERENCE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL'
	        	AND (CASE
	                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END)= 'CHANGE LOT' THEN p.EXTERNALREFERENCE
    END AS EXTERNALREFERENCE,
    CASE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL'
	        	AND (CASE
	                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END)= 'NORMAL' THEN p2.INTERNALREFERENCE
        WHEN LEFT(e.CODE, 1) <> '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL' THEN p2.INTERNALREFERENCE
        WHEN LEFT(e.CODE, 1) <> '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.INTERNALREFERENCE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.INTERNALREFERENCE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL'
	        	AND (CASE
	                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END)= 'CHANGE LOT' THEN p.INTERNALREFERENCE
    END AS INTERNALREFERENCE,
    CASE
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL'
	        	AND (CASE
	                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END)= 'NORMAL' THEN p2.EXTERNALITEM
        WHEN LEFT(e.CODE, 1) <> '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL' THEN p2.EXTERNALITEM
        WHEN LEFT(e.CODE, 1) <> '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.EXTERNALITEM
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'CHANGE LOT' THEN p.EXTERNALITEM
        WHEN LEFT(e.CODE, 1) = '8'
	        	AND (CASE
	                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END) = 'NORMAL'
	        	AND (CASE
	                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
	                ELSE 'NORMAL'
	            END)= 'CHANGE LOT' THEN p.EXTERNALITEM
    END AS EXTERNALITEM,
    CASE
        WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
        ELSE 'NORMAL'
    END AS KET_ELEMENT,
    CASE
        WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
        ELSE 'NORMAL'
    END AS KET_ELEMENT_CUT,
    s.LOTCODE AS LOT_NEW,
    s3.LOTCODE AS LOT_NEW_CUT,
    s2.LOTCODE AS LOT_PRODUCTION,
    s4.LOTCODE AS LOT_PRODUCTION_CUT,
    LEFT(e.CODE, 8) AS DEMAND,
    LEFT(e.CUTITEMELEMENTCODE, 8) AS DEMAND_CUT_EL,  
    CASE
        WHEN LEFT(e.CODE, 1) = '8'
        	AND (CASE
                WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
                ELSE 'NORMAL'
            END) = 'NORMAL'
        	AND (CASE
                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
                ELSE 'NORMAL'
            END)= 'CHANGE LOT' THEN s3.TRANSACTIONDATE
        ELSE s.TRANSACTIONDATE
    END AS TRANSACTIONDATE,
    --    s3.TRANSACTIONDATE AS TRANSACTIONDATE_CUT,
    --    s.TRANSACTIONDATE,
    e.CODE AS CODE,
    e.CUTITEMELEMENTCODE AS CUT_ELEMENT
FROM
    ELEMENTS e
LEFT JOIN (
        SELECT
            *
        FROM
            STOCKTRANSACTION s
        WHERE
            s.TEMPLATECODE = '314'
        ORDER BY
            CREATIONDATETIME DESC
    ) s ON s.ITEMELEMENTCODE = e.CODE
LEFT JOIN (
        SELECT
            *
        FROM
            STOCKTRANSACTION s
        WHERE
            s.TEMPLATECODE = '110'
        ORDER BY
            CREATIONDATETIME DESC
    ) s2 ON s2.ITEMELEMENTCODE = e.CODE
LEFT JOIN (
        SELECT
            *
        FROM
            STOCKTRANSACTION s
        WHERE
            s.TEMPLATECODE = '314'
        ORDER BY
            CREATIONDATETIME DESC) s3 ON s3.ITEMELEMENTCODE = e.CUTITEMELEMENTCODE
LEFT JOIN (
        SELECT
            *
        FROM
            STOCKTRANSACTION s
        WHERE
            s.TEMPLATECODE = '110'
        ORDER BY
            CREATIONDATETIME DESC) s4 ON s4.ITEMELEMENTCODE = e.CUTITEMELEMENTCODE
LEFT JOIN (
        SELECT
            p2.PRODUCTIONDEMANDCODE,
            p2.PRODUCTIONORDERCODE,
            COALESCE(s.EXTERNALREFERENCE , COALESCE(s2.EXTERNALREFERENCE , '')) AS EXTERNALREFERENCE,
            COALESCE(s.INTERNALREFERENCE, COALESCE(s2.INTERNALREFERENCE, '')) AS INTERNALREFERENCE,
            CASE
                WHEN TRIM(s2.EXTERNALITEM) IS NULL THEN TRIM(p.SUBCODE02) || '-' || TRIM(p.SUBCODE03)
                ELSE TRIM(s2.EXTERNALITEM)
            END AS EXTERNALITEM
        FROM
            PRODUCTIONDEMAND p
        LEFT JOIN (
                SELECT
                    DISTINCT p2.PRODUCTIONDEMANDCODE,
                    p2.PRODUCTIONORDERCODE
                FROM
                    PRODUCTIONDEMANDSTEP p2
            ) p2 ON p.CODE = p2.PRODUCTIONDEMANDCODE
        LEFT JOIN SALESORDER s ON p.ORIGDLVSALORDLINESALORDERCODE = s.CODE
        LEFT JOIN SALESORDERLINE s2 ON s2.SALESORDERCODE = s.CODE AND s2.ORDERLINE = p.ORIGDLVSALORDERLINEORDERLINE) p ON p.PRODUCTIONORDERCODE = (
        CASE
            WHEN (CASE
                    WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
                    ELSE 'NORMAL'
                END) = 'CHANGE LOT' THEN s.LOTCODE
            WHEN LEFT(e.CODE, 1) = '8'
                AND (CASE
                        WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
                        ELSE 'NORMAL'
                    END) = 'NORMAL'
                    AND (CASE
                            WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
                            ELSE 'NORMAL'
                        END) = 'CHANGE LOT' THEN s3.LOTCODE
                END
    )
LEFT JOIN (
        SELECT
            p2.PRODUCTIONDEMANDCODE,
            p2.PRODUCTIONORDERCODE,
            COALESCE(s.EXTERNALREFERENCE , COALESCE(s2.EXTERNALREFERENCE , '')) AS EXTERNALREFERENCE,
            COALESCE(s.INTERNALREFERENCE, COALESCE(s2.INTERNALREFERENCE, '')) AS INTERNALREFERENCE,
            CASE
                WHEN TRIM(s2.EXTERNALITEM) IS NULL THEN TRIM(p.SUBCODE02) || '-' || TRIM(p.SUBCODE03)
                ELSE TRIM(s2.EXTERNALITEM)
            END AS EXTERNALITEM
        FROM
            PRODUCTIONDEMAND p
        LEFT JOIN (
                SELECT
                    DISTINCT p2.PRODUCTIONDEMANDCODE,
                    p2.PRODUCTIONORDERCODE
                FROM
                    PRODUCTIONDEMANDSTEP p2
            ) p2 ON p.CODE = p2.PRODUCTIONDEMANDCODE
        LEFT JOIN SALESORDER s ON p.ORIGDLVSALORDLINESALORDERCODE = s.CODE
        LEFT JOIN SALESORDERLINE s2 ON s2.SALESORDERCODE = s.CODE AND s2.ORDERLINE = p.ORIGDLVSALORDERLINEORDERLINE
    ) p2 ON p2.PRODUCTIONDEMANDCODE = (
        CASE
            WHEN LEFT(e.CODE, 1) <> '8'
                AND (CASE
                        WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
                        ELSE 'NORMAL'
                    END) = 'NORMAL' THEN LEFT(e.CODE, 8)
                WHEN LEFT(e.CODE, 1) = '8'
                    AND (CASE
                            WHEN s.LOTCODE <> '' THEN 'CHANGE LOT'
                            ELSE 'NORMAL'
                        END) = 'NORMAL'
                        AND (CASE
                                WHEN s3.LOTCODE <> '' THEN 'CHANGE LOT'
                                ELSE 'NORMAL'
                            END) = 'NORMAL' THEN LEFT(e.CUTITEMELEMENTCODE, 8)
                    END)
        WHERE
            	e.CODE IN ('0032557500201',
							'0032557500301',
							'0032557500401',
							'0032557500501',
							'0032557500601',
							'0032557500701',
							'0032557500801',
							'0032557500901',
							'0032557501001',
							'0032557501101')
    --        	e.CODE = '0032633600101';