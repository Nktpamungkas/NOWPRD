SELECT
    SUM(BASEPRIMARYQUANTITYUNIT) AS QTY_READY,
    SUM(BASESECONDARYQUANTITYUNIT) AS QTY_READY_2
FROM
    BALANCE b
WHERE
    PROJECTCODE = 'EXP2400214'
    AND LOTCODE = '13808'
    AND TRIM(DECOSUBCODE02) || '-' || TRIM(DECOSUBCODE03) = '$dt_sum_detail[KET_PRODUCT]'
    AND LOGICALWAREHOUSECODE = 'M031'