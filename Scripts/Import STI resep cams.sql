INSERT INTO STOCKTRANSACTIONIMPORT (
    IMPORTSTATUS,
    COMPANYCODE,
    TRANSACTIONNUMBER,
    NOWTRNNUMBERTRANSACTIONNUMBER,
    TRANSACTIONDETAILNUMBER,
    TRANSACTIONSTATUS,
    ITEMTYPECOMPANYCODE,
    ITEMTYPECODE,
    TRANSACTIONDATE,
    TRANSACTIONTIME,
    DETAILTYPE,
    TEMPLATECOMPANYCODE,
    TEMPLATECODE,
    AUTOISSUETEMPLATECOMPANYCODE,
    AUTOISSUETEMPLATECODE,
    STOCKTRANSACTIONTYPE,
    DECOCOMPANYCODE,
    DECOSUBCODE01,
    DECOSUBCODE02,
    DECOSUBCODE03,
    DECOSUBCODE04,
    DECOSUBCODE05,
    DECOSUBCODE06,
    DECOSUBCODE07,
    DECOSUBCODE08,
    DECOSUBCODE09,
    DECOSUBCODE10,
    ITEMDESCRIPTION,
    LOGICALWAREHOUSECOMPANYCODE,
    LOGICALWAREHOUSECODE,
    TRANSFERALLOCATION,
    ISSUEQTYFROMBALANCE,
    USERPRIMARYUOMCODE,
    USERPRIMARYQUANTITY,
    USERSECONDARYUOMCODE,
    USERSECONDARYQUANTITY,
    USERPACKAGINGUOMCODE,
    USERPACKAGINGQUANTITY,
    WEIGHTUNITOFMEASURECODE,
    WEIGHTGROSS,
    WEIGHTNET,
    WEIGHTREALNET,
    DERIVATIONCODE,
    DERIVATIONLINENUMBER,
    DERIVATIONCOMPONENTLINENUMBER,
    QUALITYLVLITEMTYPECOMPANYCODE,
    QUALITYLEVELCODE,
    QUALITYREASONCOMPANYCODE,
    QUALITYREASONCODE,
    FIRSTQUALITYCONTROLDATE,
    FIRSTQUALITYCONTROLCOUNTER,
    FIRSTQUALITYCONTROLNUMBER,
    PHYSICALWAREHOUSECOMPANYCODE,
    PHYSICALWAREHOUSECODE,
    WHSLOCWHSZONEPHYWHSCMYCODE,
    WHSLOCATIONWAREHOUSEZONECODE,
    WAREHOUSELOCATIONCODE,
    CONTAINERCOMPANYCODE,
    CONTAINERITEMTYPECODE,
    CONTAINERSUBCODE01,
    CONTAINERELEMENTCOMPANYCODE,
    CONTAINERELEMENTCODE,
    LOTCOMPANYCODE,
    LOTCODE,
    ITEMELEMENTCOMPANYCODE,
    ITEMELEMENTSUBCODEKEY,
    ITEMELEMENTCODE,
    PROJECTCODE,
    COSTCENTERCOMPANYCODE,
    COSTCENTERCODE,
    STATISTICALGROUPCOMPANYCODE,
    STATISTICALGROUPCODE,
    COST,
    CURRENCYCODE,
    CUSTOMERTYPE,
    CUSTOMERCODE,
    SUPPLIERTYPE,
    SUPPLIERCODE,
    BILLDATE,
    BILLTYPE,
    BILLCOUNTER,
    BILLCODE,
    INTERNALDOCUMENTDATE,
    INTERNALDOCUMENTNUMBER,
    ORDERCOUNTERCOMPANYCODE,
    ORDERCOUNTERCODE,
    ORDERCODE,
    ORDERLINE,
    ORDERSUBLINE,
    ORDERCOMPONENTLINE,
    ORDERDELIVERYLINE,
    PRODUCTIONORDERCODE,
    RETURNCODE,
    RETURNLINE,
    TOKENCODE,
    ENVCODESKIPBLCEXP,
    ADUNIQUEID,
    ADUNIQUEIDFORAUTOISSUE,
    CREATIONDATETIME,
    CREATIONUSER,
    LASTUPDATEDATETIME,
    LASTUPDATEUSER,
    CREATIONDATETIMEUTC,
    LASTUPDATEDATETIMEUTC,
    ABSUNIQUEID,
    COLUMN26,
    COLUMN27,
    COLUMN25
) VALUES (
    1,                                  -- IMPORTSTATUS (selalu 1)
    '100',                              -- COMPANYCODE (selalu 100)
    'RSP_00000000001',                  -- TRANSACTIONNUMBER (ini nomornya generate RSP_00000000000, jadi untuk data selanjutnya dia harus cek RSP_00000000000 yg terakhir nomornya berapa terus km tambahin + 1 gitu. soalnya database DB2nya engga autoincrement)
    NULL,                               -- NOWTRNNUMBERTRANSACTIONNUMBER (selalu null)
    1,                                  -- TRANSACTIONDETAILNUMBER (selalu 1)
    0,                                  -- TRANSACTIONSTATUS (selalu 0)
    '100',                              -- ITEMTYPECOMPANYCODE (selalu 100)
    'DYC',                              -- ITEMTYPECODE (selalu DYC)
    '2026-08-11',                       -- TRANSACTIONDATE (diambil dari tanggal hari ini formatnya YYYY-MM-DD)
    '16:00:00',                         -- TRANSACTIONTIME (diambil dari jam hari ini formatnya 24 jam sesuai contoh gitu ya)
    0,                                  -- DETAILTYPE (selalu 0)
    '100',                              -- TEMPLATECOMPANYCODE (selalu 100)
    '120',                              -- TEMPLATECODE (selalu 120)
    '100',                              -- AUTOISSUETEMPLATECOMPANYCODE (selalu 100)
    NULL,                               -- AUTOISSUETEMPLATECODE (selalu null)
    5,                                  -- STOCKTRANSACTIONTYPE (selalu 5)
    '100',                              -- DECOCOMPANYCODE (selalu 100)
    'E',             					-- DECOSUBCODE01 (diambil dari query tabel CAMS harusnya sih $rowsCams->rs_subcode01, di TRIM aja ya biar kalau ada spasi berlebih bisa kehapus)
    '1',                                -- DECOSUBCODE02 (diambil dari query tabel CAMS harusnya sih $rowsCams->rs_subcode02, di TRIM aja ya biar kalau ada spasi berlebih bisa kehapus)
    '002',                              -- DECOSUBCODE03 (diambil dari query tabel CAMS harusnya sih $rowsCams->rs_subcode03, di TRIM aja ya biar kalau ada spasi berlebih bisa kehapus)
    NULL,                               -- DECOSUBCODE04 (selalu NULL)
    NULL,                               -- DECOSUBCODE05 (selalu NULL)
    NULL,                               -- DECOSUBCODE06 (selalu NULL)
    NULL,                               -- DECOSUBCODE07 (selalu NULL)
    NULL,                               -- DECOSUBCODE08 (selalu NULL)
    NULL,                               -- DECOSUBCODE09 (selalu NULL)
    NULL,                               -- DECOSUBCODE10 (selalu NULL)
    NULL,                               -- ITEMDESCRIPTION (selalu NULL)
    '100',                              -- LOGICALWAREHOUSECOMPANYCODE (selalu 100)
    'M510    ',                         -- LOGICALWAREHOUSECODE (selalu M510)
    NULL,                               -- TRANSFERALLOCATION (selalu NULL)
    0,                                  -- ISSUEQTYFROMBALANCE (selalu 0)
    'g',                                -- USERPRIMARYUOMCODE (selalu g)
    6210,                               -- USERPRIMARYQUANTITY (diambil dari field ACTUAL yg dimodal ya)
    NULL,                               -- USERSECONDARYUOMCODE (selalu NULL)
    0,                                  -- USERSECONDARYQUANTITY (selalu 0)
    NULL,                               -- USERPACKAGINGUOMCODE (selalu NULL)
    0,                                  -- USERPACKAGINGQUANTITY (selalu 0)
    NULL,                               -- WEIGHTUNITOFMEASURECODE (selalu NULL)
    NULL,                               -- WEIGHTGROSS (selalu NULL)
    NULL,                               -- WEIGHTNET (selalu NULL)
    NULL,                               -- WEIGHTREALNET (selalu NULL)
    NULL,                               -- DERIVATIONCODE (selalu NULL)
    NULL,                               -- DERIVATIONLINENUMBER (selalu NULL)
    NULL,                               -- DERIVATIONCOMPONENTLINENUMBER (selalu NULL)
    '100',                              -- QUALITYLVLITEMTYPECOMPANYCODE (selalu 100)
    '1',                                -- QUALITYLEVELCODE (selalu 1)
    '100',                              -- QUALITYREASONCOMPANYCODE (selalu 100)
    NULL,                               -- QUALITYREASONCODE (selalu NULL)
    NULL,                               -- FIRSTQUALITYCONTROLDATE (selalu NULL)
    NULL,                               -- FIRSTQUALITYCONTROLCOUNTER (selalu NULL)
    NULL,                               -- FIRSTQUALITYCONTROLNUMBER (selalu NULL)
    '100',                              -- PHYSICALWAREHOUSECOMPANYCODE (selalu 100)
    NULL,                               -- PHYSICALWAREHOUSECODE (selalu NULL)
    '100',                              -- WHSLOCWHSZONEPHYWHSCMYCODE (selalu 100)
    NULL,                               -- WHSLOCATIONWAREHOUSEZONECODE (selalu NULL)
    NULL,                               -- WAREHOUSELOCATIONCODE (selalu NULL)
    '100',                              -- CONTAINERCOMPANYCODE (selalu 100)
    NULL,                               -- CONTAINERITEMTYPECODE (selalu NULL)
    NULL,                               -- CONTAINERSUBCODE01 (selalu NULL)
    '100',                              -- CONTAINERELEMENTCOMPANYCODE (selalu 100)
    NULL,                               -- CONTAINERELEMENTCODE (selalu NULL)
    '100',                              -- LOTCOMPANYCODE (selalu 100)
    '1',                                -- LOTCODE (selalu 1)
    '100',                              -- ITEMELEMENTCOMPANYCODE (selalu 100)
    NULL,                               -- ITEMELEMENTSUBCODEKEY (selalu NULL)
    NULL,                               -- ITEMELEMENTCODE (selalu NULL)
    NULL,                               -- PROJECTCODE (selalu NULL)
    '100',                              -- COSTCENTERCOMPANYCODE (selalu 100)
    NULL,                               -- COSTCENTERCODE (selalu NULL)
    '100',                              -- STATISTICALGROUPCOMPANYCODE (selalu 100)
    NULL,                               -- STATISTICALGROUPCODE (selalu NULL)
    NULL,                               -- COST (selalu NULL)
    NULL,                               -- CURRENCYCODE (selalu NULL)
    1,                                  -- CUSTOMERTYPE (selalu 1)
    NULL,                               -- CUSTOMERCODE (selalu NULL)
    2,                                  -- SUPPLIERTYPE (selalu 2)
    NULL,                               -- SUPPLIERCODE (selalu NULL)
    NULL,                               -- BILLDATE (selalu NULL)
    0,                                  -- BILLTYPE (selalu 0)
    NULL,                               -- BILLCOUNTER (selalu NULL)
    NULL,                               -- BILLCODE (selalu NULL)
    NULL,                               -- INTERNALDOCUMENTDATE (selalu NULL)
    0,                                  -- INTERNALDOCUMENTNUMBER (selalu 0)
    '100',                              -- ORDERCOUNTERCOMPANYCODE (selalu 100)
    '640',                              -- ORDERCOUNTERCODE (selalu 640)
    '00256891',                         -- ORDERCODE (diambil dari kolom PROD ORDER, kan datanya 00256891-303 nah yg diambil itu 00256891 aja)
    305,                                -- ORDERLINE (diambil dari kolom PROD ORDER, kan datanya 00256891-303 nah yg diambil itu 303 aja, yg 00256891 adalah PROD ORDER dan pasti selalu segitu jumlah karakternya)
    NULL,                               -- ORDERSUBLINE (selalu NULL)
    NULL,                               -- ORDERCOMPONENTLINE (selalu NULL)
    NULL,                               -- ORDERDELIVERYLINE (selalu NULL)
    '00256891',                         -- PRODUCTIONORDERCODE (diambil dari kolom PROD ORDER, kan datanya 00256891-303 nah yg diambil itu 00256891 aja)
    NULL,                               -- RETURNCODE (selalu NULL)
    NULL,                               -- RETURNLINE (selalu NULL)
    NULL,                               -- TOKENCODE (selalu NULL)
    NULL,                               -- ENVCODESKIPBLCEXP (selalu NULL)
    0,                                  -- ADUNIQUEID (selalu 0)
    0,                                  -- ADUNIQUEIDFORAUTOISSUE (selalu 0)
    '2026-08-11-16.00.00.000000',       -- CREATIONDATETIME (tanggal hari ini, formatnya harus ngikutin contoh data ya)
    'Nilo.dit',                         -- CREATIONUSER (session siapa yg login)
    '2026-08-11-16.00.00.000000',       -- LASTUPDATEDATETIME (tanggal hari ini, formatnya harus ngikutin contoh data ya)
    'Nilo.dit',                         -- LASTUPDATEUSER (session siapa yg login)
    '2026-08-11-16.00.00.000000',       -- CREATIONDATETIMEUTC (tanggal hari ini, formatnya harus ngikutin contoh data ya)
    '2026-08-11-16.00.00.000000',       -- LASTUPDATEDATETIMEUTC (tanggal hari ini, formatnya harus ngikutin contoh data ya)
    0,                                  -- ABSUNIQUEID (selalu 0)
    NULL,                               -- COLUMN26 (selalu null)
    NULL,                               -- COLUMN27 (selalu null)
    NULL                                -- COLUMN25 (selalu null)
);