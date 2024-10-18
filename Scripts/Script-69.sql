SELECT  
    TICKET_DETAIL.RES_STRING3 AS BARIS,
    TICKET_DETAIL.COMP_DATE,
    TICKET_DETAIL.COMP_TIME,
    TICKET_DETAIL.ID_NO,
    TICKET_DETAIL.PRODUCT_CODE,
    TICKET_DETAIL.TARGET_WT,
    TICKET_DETAIL.ACTUAL_WT
FROM 
    TICKET.dbo.TICKET_DETAIL TICKET_DETAIL
WHERE 
    TICKET_DETAIL.ID_NO LIKE '%00170293%'
UNION ALL 
    SELECT 
        Ticket_Detail_Addition.BARIS AS BARIS,
        Ticket_Detail_Addition.COMP_DATE,
        Ticket_Detail_Addition.COMP_TIME,
        Ticket_Detail_Addition.ID_NO,
        Ticket_Detail_Addition.PRODUCT_CODE,
        Ticket_Detail_Addition.TARGET_WT,
        Ticket_Detail_Addition.ACTUAL_WT
    FROM 
        LA1000_Exchange.dbo.Ticket_Detail_Addition Ticket_Detail_Addition
    WHERE 
        Ticket_Detail_Addition.ID_NO LIKE '%00170293%'
ORDER BY 
    BARIS, ID_NO ASC