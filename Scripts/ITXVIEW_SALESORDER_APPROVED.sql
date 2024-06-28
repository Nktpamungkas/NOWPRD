DROP VIEW ITXVIEW_SALESORDER_APPROVED;
--CREATE VIEW ITXVIEW_SALESORDER_APPROVED AS
SELECT
    CODE,
    status,
    LASTUPDATEUSER,
    tgl_buat_mkt,
    LASTUPDATEDATETIMEUTC,
    CAST(
        LEFT(jam_approve, 8)AS TIME
    )AS jam_approve_mkt,
    ApproveRMP,
    approvedRMP,
    tgl_approvedRMP,
    ApprovePPC,
    ApprovedPPC
FROM
    (
        SELECT
            SALESORDER.CODE,
            CASE
                WHEN LOGSALESORDER.CURRENTSTATUS = 1 THEN 'Active'
            END AS status,
            CASE
                WHEN LOGSALESORDER.LASTUPDATEUSER = absuser.USERID THEN absuser.FULLNAME
            END LASTUPDATEUSER,
            LEFT(SALESORDER.CREATIONDATETIME, 10) AS tgl_buat_mkt,
            LOGSALESORDER.LASTUPDATEDATETIME AS waktu,
            LEFT(LOGSALESORDER.LASTUPDATEDATETIME, 10) AS LASTUPDATEDATETIMEUTC,
            RIGHT(LOGSALESORDER.LASTUPDATEDATETIME, 15) AS jam_approve,
            a3.FIELDNAME AS ApproveRMP,
            a3.VALUESTRING AS approvedRMP,
            a5.VALUEDATE AS tgl_approvedRMP,
            a4.FIELDNAME AS ApprovePPC,
            a4.VALUESTRING AS ApprovedPPC
        FROM
            SALESORDER
        LEFT JOIN LOGSALESORDER ON
            SALESORDER.CODE = LOGSALESORDER.CODE
            AND LOGSALESORDER.LOGOPERATION = '2'
        LEFT JOIN ADSTORAGE a3 ON
            SALESORDER.ABSUNIQUEID = a3.UNIQUEID
            AND a3.FIELDNAME = 'ApprovalRMP'
        LEFT JOIN ADSTORAGE a4 ON
            SALESORDER.ABSUNIQUEID = a4.UNIQUEID
            AND a4.FIELDNAME = 'ApprovalPPC'
        LEFT JOIN ADSTORAGE a5 ON
            SALESORDER.ABSUNIQUEID = a5.UNIQUEID
            AND a5.FIELDNAME = 'ApprovalDate'
        LEFT JOIN ABSUSERDEF absuser ON
            LOGSALESORDER.LASTUPDATEUSER = absuser.USERID
        WHERE
            LOGSALESORDER.CURRENTSTATUS = 1
            AND absuser.USERID IN (
                'ridwan.setiawan', 'budiman.mkt', 'heri.bahtiar', 'deden.wijaya', 'bambang.susiyanto', 'mas.roni', 'bunbun.kui', 'nia.wuri', 'yohanes.pribadi', 'frans.subrata'
            )
            AND absuser.GROUPUSERID IN(
                'sales', 'sales.manager'
            )
        ORDER BY
            LOGSALESORDER.LASTUPDATEDATETIME DESC
    );