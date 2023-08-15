--DROP VIEW ITXVIEW_INVOICE_NOINVOICE;
--CREATE VIEW ITXVIEW_INVOICE_NOINVOICE AS
SELECT
    Invoice,
    NO_SJ,
    tgl_inv,
    issue_date,
    tanggal_inv,
    tgl_create,
    due,
    DUEKB,
    DATEKB,
    jenis_order,
    kode_bep,
    id_bep,
    nama_bep,
    kode_cus,
    nama_cus,
    CASE
        WHEN jenis_order = 'EXPORT'
        AND id_bep <> 989 THEN '0'
        WHEN jenis_order = 'SAMPLE'
        AND id_bep <> 888
        AND id_bep <> 813
        OR kode_cus = 'BIHQSS' THEN '0'
        WHEN jenis_order = 'REPLCEXP'
        AND id_bep <> 888 THEN '0'
        ELSE NPWP
    END AS NPWP,
    --    NPWP,
    FAKTUR_PAJAK,
    NO_ORDER,
    CASE
        WHEN NO_PO IS NULL THEN 'Nomor PO Header dan Line Kosong'
        ELSE NO_PO
    END AS NO_PO,
    NO_CI,
    desc_kain,
    code_payment,
    curr,
    CASE
        WHEN ppn = 'S03' THEN 0.11
        WHEN ppn = 'S01' THEN 0.11
        WHEN ppn = 'S13' THEN 0.11
        WHEN ppn = 'N01' THEN 0
        ELSE 0
    END AS ppn,
    payment_terms,
    unit,
    rate,
    biaya_tambahan,
    harga_foc,
    SUM(BERAT) - (foc_kg) AS Berat,
    SUM(BERAT_LAIN) - (foc_yard) AS BERAT_LAIN,
    CASE
        WHEN curr = 'IDR' THEN 0
        ELSE SUM(JUMLAH_HARGA) + (biaya_tambahan) - (harga_foc)
    END AS DPP,
     floor((SUM(JUMLAH_HARGA) + biaya_tambahan - harga_foc) * rate) AS DPP_BC,
    CASE
        WHEN curr = 'IDR' THEN 0
        ELSE round(CASE WHEN PPN = 'S01' THEN SUM((JUMLAH_HARGA) + biaya_tambahan - harga_foc) * 0.11 
		WHEN PPN = 'S03' THEN SUM((JUMLAH_HARGA) + biaya_tambahan - harga_foc) * 0.11 
		WHEN PPN = 'S13' THEN SUM((JUMLAH_HARGA) + biaya_tambahan - harga_foc) * 0.11
		ELSE 0 END, 2)
    END AS VAT,
    CASE
        WHEN PPN = 'S01' THEN floor(floor((SUM(JUMLAH_HARGA) + biaya_tambahan - harga_foc) * rate) * 0.11)
        WHEN PPN = 'S03' THEN floor(floor((SUM(JUMLAH_HARGA) + biaya_tambahan - harga_foc) * rate) * 0.11)
        WHEN PPN = 'S13' THEN floor(floor((SUM(JUMLAH_HARGA) + biaya_tambahan - harga_foc) * rate) * 0.11)
        ELSE 0
    END AS VAT_BC,
    CASE
        WHEN curr = 'IDR' THEN 0
        ELSE round(SUM(JUMLAH_HARGA) + biaya_tambahan - (harga_foc) + CASE
            WHEN PPN = 'S01' THEN SUM((JUMLAH_HARGA) + biaya_tambahan - harga_foc) * 0.11
            WHEN PPN = 'S03' THEN SUM((JUMLAH_HARGA) + biaya_tambahan - harga_foc) * 0.11
            WHEN PPN = 'S13' THEN SUM((JUMLAH_HARGA) + biaya_tambahan - harga_foc) * 0.11
            ELSE 0
        END, 2)
    END AS TOTAL,
        floor((SUM(JUMLAH_HARGA) + biaya_tambahan - harga_foc) * rate) + CASE
        WHEN PPN = 'S01' THEN floor(FLOOR((SUM(JUMLAH_HARGA) + biaya_tambahan - harga_foc) * rate) * 0.11)
        WHEN PPN = 'S03' THEN floor(FLOOR((SUM(JUMLAH_HARGA) + biaya_tambahan - harga_foc) * rate) * 0.11)
        WHEN PPN = 'S13' THEN floor(FLOOR((SUM(JUMLAH_HARGA) + biaya_tambahan - harga_foc) * rate) * 0.11)
        ELSE 0
    END AS TOTAL_BC,
    SUM(JML_KURANGIN_BERAT) AS JML_KURANGIN_BERAT,
    sum(total_kurangin_biaya) AS total_kurangin_biaya_usd,
    floor(round(sum(total_kurangin_biaya)* rate, 2)) AS total_kurangin_biaya_IDR,
    PAYMENTCUSTOMERUNIQUEID,
    TAXTEMPLATECODE,
    PAYMENTCUSTOMERCODE
FROM
    (
        SELECT
            LOTCODE,
            Invoice,
            NO_SJ,
            tgl_inv,
            issue_date,
            tanggal_inv,
            tgl_create,
            DUE,
            DATEKB,
            DUEKB,
            curr,
            JENIS_ORDER,
            kode_bep,
            id_bep,
            nama_bep,
            kode_cus,
            nama_cus,
            NPWP,
            FAKTUR_PAJAK,
            NO_ORDER,
            NO_PO,
            NO_CI,
            DESC_KAIN,
            PPN,
            code_payment,
            payment_terms,
            unit,
            rate,
            biaya_tambahan,
            foc_kg,
            foc_yard,
            HARGA_FOC,
            SUM(QTY_KG)AS BERAT,
            CASE
                WHEN trim(unit) = 'kg' THEN SUM(round(QTY_YD, 2))
                WHEN trim(unit) = 'yd' THEN SUM(round(QTY_YD, 2))
                WHEN trim(unit) = 'm' THEN SUM(round( QTY_METER, 2))
                WHEN trim(unit) = 'un' THEN SUM(round(QTY_PCS, 2))
            END AS BERAT_LAIN,
            harga_satuan,
            JML_KURANGIN_BERAT,
            total_kurangin_biaya,
            CASE
                WHEN trim(ORDERCURRENCYCODE) = 'USD'
                --AND trim(PLANTINVOICE.CODE) NOT IN ('EX2200440', 'EX2200467', 'EX2200468') 
            THEN
            CASE
                    WHEN trim(unit) = 'kg' THEN round(SUM(round(QTY_KG, 2)) * round(harga_satuan, 3), 2)
                    WHEN trim(unit) = 'yd' THEN round(SUM(round(QTY_YD, 2)) * round(harga_satuan, 3), 2)
                    WHEN trim(unit) = 'm' THEN round(SUM(round(QTY_METER, 2)) * round(harga_satuan, 3), 2)
                    WHEN trim(unit) = 'un' THEN round(SUM(round(QTY_PCS, 2)) * round(harga_satuan, 3), 2)
                END
                WHEN trim(ORDERCURRENCYCODE) = 'IDR'
                --AND trim(PLANTINVOICE.CODE) NOT IN ('EX2200440', 'EX2200467', 'EX2200468') 
            THEN
            CASE
                    WHEN trim(unit) = 'kg' THEN floor(SUM(round(QTY_KG, 2)) * round(harga_satuan, 2))
                    WHEN trim(unit) = 'yd' THEN floor(SUM(round(QTY_YD, 2)) * round(harga_satuan, 2))
                    WHEN trim(unit) = 'm' THEN floor(SUM(round(QTY_METER, 2)) * round(harga_satuan, 2))
                    WHEN trim(unit) = 'un' THEN floor(SUM(round(QTY_PCS, 2)) * round(harga_satuan, 2))
                    WHEN trim(unit) = 'Lot' THEN floor(SUM(round(QTY_PCS, 2)) * round(harga_satuan, 2))
                END
            END AS JUMLAH_HARGA,
            PAYMENTCUSTOMERUNIQUEID,
            TAXTEMPLATECODE,
            PAYMENTCUSTOMERCODE
        FROM
            (
                SELECT
                    DISTINCT 
        ITXVIEW_ALLOCATION_SURATJALAN_PPC.CODE,
                    ITXVIEW_ALLOCATION_SURATJALAN_PPC.LOTCODE,
                    trim(PLANTINVOICE.CODE) AS Invoice,
                    SALESDOCUMENTLINE.PREVIOUSCODE AS NO_SJ,
                    SALESDOCUMENT2.PROVISIONALDOCUMENTDATE AS tgl_inv,
                    SALESDOCUMENT2.GOODSISSUEDATE AS issue_date,
                    CASE
                        WHEN trim(SALESDOCUMENT2.PROVISIONALDOCUMENTDATE) <= DATE('2022-08-15') THEN
				CASE
                            WHEN trim(SALESDOCUMENT2.GOODSISSUEDATE) IS NOT NULL THEN trim(SALESDOCUMENT2.GOODSISSUEDATE)
                            ELSE
	        	trim(SALESDOCUMENT2.PROVISIONALDOCUMENTDATE)
                        END
                        ELSE
        	trim(SALESDOCUMENT2.GOODSISSUEDATE)
                    END AS tanggal_inv,
                    PLANTINVOICE.CREATIONDATE AS tgl_create,
                    -- SALESDOCUMENT2.PROVISIONALDOCUMENTDATE + PAYMENTMETHODIE.NOOFDAYS DAYS AS DUE,
        CASE
                        WHEN trim(SALESDOCUMENT2.PROVISIONALDOCUMENTDATE) <= DATE('2022-08-15') THEN
				CASE
                            WHEN trim(SALESDOCUMENT2.GOODSISSUEDATE) IS NOT NULL THEN SALESDOCUMENT2.GOODSISSUEDATE + PAYMENTMETHODIE.NOOFDAYS
                            ELSE
	        	SALESDOCUMENT2.PROVISIONALDOCUMENTDATE + PAYMENTMETHODIE.NOOFDAYS
                        END
                        ELSE
        	SALESDOCUMENT2.GOODSISSUEDATE + PAYMENTMETHODIE.NOOFDAYS
                    END AS DUE,
                    PLANTINVOICE.CHALLANDATE AS DATEKB,
                    PLANTINVOICE.LRDATE AS DUEKB,
                    trim(PLANTINVOICE.ORDERCURRENCYCODE) AS curr,
                    trim(SALESORDER.COUNTERCODE) AS JENIS_ORDER,
                    trim(SALESORDER.FNCORDPRNCUSTOMERSUPPLIERCODE) AS kode_bep,
                    SALESORDER.PAYMENTCUSTOMERUNIQUEID,
                    SALESORDER.PAYMENTCUSTOMERCODE,
                    BUSINESSPARTNER.NUMBERID AS id_bep,
                    BUSINESSPARTNER.LEGALNAME1 AS nama_bep,
                    CASE
                        WHEN ADDRESS.CODE IS NULL THEN 'Warning! Kolom Address Code Sales Order Kosong. USER: ' || TRIM(SALESORDER.CREATIONUSER)
                        ELSE ADDRESS.CODE
                    END AS kode_cus,
                    CASE
                        WHEN trim(ADDRESS.ADDRESSEE) IS NULL THEN 'Warning! Kolom Address Code Sales Order Kosong. USER: ' || TRIM(SALESORDER.CREATIONUSER)
                        ELSE trim(ADDRESS.ADDRESSEE)
                    END AS nama_cus,
                    CASE
                        WHEN PLANTINVOICE.BLNUMBER IS NOT NULL THEN
            CASE
                            WHEN trim(ADDRESS.ADDRESSLINE4) IS NULL THEN 'Warning! Kolom Address Code Sales Order Kosong. USER: ' || TRIM(SALESORDER.CREATIONUSER)
                            ELSE trim(ADDRESS.ADDRESSLINE4)
                        END
                        ELSE
            CASE
                            WHEN trim(ADDRESS.ADDRESSLINE4) IS NULL THEN 'Warning! Kolom Address Code Sales Order Kosong. USER: ' || TRIM(SALESORDER.CREATIONUSER)
                            ELSE trim(ADDRESS.ADDRESSLINE4)
                        END
                    END AS NPWP,
                    CASE
                        WHEN PLANTINVOICE.BLNUMBER IS NULL THEN 'Warning! Kolom faktur pajak Invoice Kosong. USER : ' || TRIM(PLANTINVOICE.CREATIONUSER)
                        ELSE PLANTINVOICE.BLNUMBER
                    END AS FAKTUR_PAJAK,
                    trim(PLANTINVOICE.CONTRACTNOCODE) AS NO_ORDER,
                    REPLACE(ITXVIEW_PO_INVOICE.NO_PO, '''', ' ') AS NO_PO,
                    PLANTINVOICE.STATUS AS NO_CI,
                    CASE
                        WHEN trim(SALESORDER.TEMPLATECODE) LIKE '%CWD%' THEN trim(SALESORDER.DESCRIPTION)
                        ELSE '-'
                    END AS DESC_KAIN,
                    PLANTINVOICELINE.TAXTEMPLATECODE AS PPN,
                    PLANTINVOICELINE.TAXTEMPLATECODE,
                    trim(PAYMENTMETHOD.LONGDESCRIPTION) AS code_payment,
                    trim(PAYMENTMETHODIE.NOOFDAYS) AS payment_terms,
                    trim(SALESDOCUMENTLINE.PRICEUNITOFMEASURECODE) AS unit,
                    PLANTINVOICE.EXCHANGERATEOFCONTRACT AS rate,
                    CASE
                        WHEN (ITXVIEW_INVOICE_BIAYATAMBAHAN.biaya_tambahan) IS NULL THEN 0
                        ELSE (ITXVIEW_INVOICE_BIAYATAMBAHAN.biaya_tambahan)
                    END AS biaya_tambahan,
                    CASE
                        WHEN (ITXVIEW_FOC_INVOICE2.foc_kg) IS NULL THEN 0
                        ELSE (ITXVIEW_FOC_INVOICE2.foc_kg)
                    END AS foc_kg,
                    CASE
                        WHEN (ITXVIEW_FOC_INVOICE2.foc_yard) IS NULL THEN 0
                        ELSE (ITXVIEW_FOC_INVOICE2.foc_yard)
                    END AS foc_yard,
                    CASE
                        WHEN (ITXVIEW_FOC_INVOICE2.QUANTITY_FOC) IS NULL THEN 0
                        ELSE (ITXVIEW_FOC_INVOICE2.QUANTITY_FOC)
                    END AS HARGA_FOC,
                    SUM(round(ITXVIEW_ALLOCATION_SURATJALAN_PPC.BASEPRIMARYQUANTITY, 2))AS QTY_KG,
                    SUM(round(ITXVIEW_ALLOCATION_SURATJALAN_PPC.BASESECONDARYQUANTITY, 2)) AS QTY_YD,
                    SUM(round(ITXVIEW_ALLOCATION_SURATJALAN_PPC.BASESECONDARYQUANTITY * 0.9144, 2)) AS QTY_METER,
                    CASE
                        WHEN trim(SALESDOCUMENTLINE.ITEMTYPEAFICODE) = 'CAP' THEN SUM(round(ITXVIEW_ALLOCATION_SURATJALAN_PPC.BASEPRIMARYQUANTITY, 2))
                        ELSE SUM(round(ITXVIEW_ALLOCATION_SURATJALAN_PPC.BASESECONDARYQUANTITY, 2))
                    END AS QTY_PCS,
                    round(SALESDOCUMENTLINE.price, 2) AS harga_satuan,
                    SALESDOCUMENTLINE.ITEMTYPEAFICODE,
                    PLANTINVOICE.ORDERCURRENCYCODE,
                    CASE
                        WHEN ITXVIEW_ALLOCATION_SURATJALAN_PPC.CODE IN (
                            '000000396037', '000000396038', '000000396042', '000000396043', '000000396047', '000000396048'
                        )
        	THEN SUM(round(ITXVIEW_ALLOCATION_SURATJALAN_PPC.BASEPRIMARYQUANTITY, 2))
                        ELSE
        	0
                    END AS JML_KURANGIN_BERAT,
                    CASE
                        WHEN ITXVIEW_ALLOCATION_SURATJALAN_PPC.CODE IN (
                            '000000396037', '000000396038', '000000396042', '000000396043', '000000396047', '000000396048'
                        )
        	THEN round(SUM(round(ITXVIEW_ALLOCATION_SURATJALAN_PPC.BASEPRIMARYQUANTITY, 2))* round(SALESDOCUMENTLINE.price, 3), 2)
                        ELSE
        	0
                    END AS total_kurangin_biaya
                FROM
                    PLANTINVOICE PLANTINVOICE
                LEFT JOIN ITXVIEW_PO_INVOICE ITXVIEW_PO_INVOICE ON
                    PLANTINVOICE.CODE = ITXVIEW_PO_INVOICE.NO_INVOICE
                LEFT JOIN SALESORDER SALESORDER ON
                    PLANTINVOICE.CONTRACTNOCODE = SALESORDER.CODE
                LEFT JOIN SALESDOCUMENT SALESDOCUMENT ON
                    PLANTINVOICE.CODE = SALESDOCUMENT.PROVISIONALCODE
                    --        AND PLANTINVOICE.CODE = SALESDOCUMENT.DEFINITIVECODE
                LEFT JOIN PAYMENTMETHOD PAYMENTMETHOD ON
                    PLANTINVOICE.TERMSOFPAYMENTCODE = PAYMENTMETHOD.CODE
                LEFT JOIN PAYMENTMETHODIE PAYMENTMETHODIE ON
                    PLANTINVOICE.TERMSOFPAYMENTCODE = PAYMENTMETHODIE.CODE
                LEFT JOIN ADDRESS ADDRESS ON
                    ADDRESS.UNIQUEID = SALESORDER.PAYMENTCUSTOMERUNIQUEID
                    AND ADDRESS.CODE = SALESORDER.PAYMENTCUSTOMERCODE
                LEFT JOIN ORDERPARTNER ORDERPARTNER ON
                    ORDERPARTNER.CUSTOMERSUPPLIERCODE = PLANTINVOICE.BUYERIFOTCCUSTOMERSUPPLIERCODE
                LEFT JOIN BUSINESSPARTNER BUSINESSPARTNER ON
                    BUSINESSPARTNER.NUMBERID = ORDERPARTNER.ORDERBUSINESSPARTNERNUMBERID
                LEFT JOIN SALESDOCUMENTLINE SALESDOCUMENTLINE ON
                    SALESDOCUMENTLINE.SALESDOCUMENTPROVISIONALCODE = SALESDOCUMENT.PROVISIONALCODE
                LEFT JOIN PLANTINVOICELINE PLANTINVOICELINE ON
                    PLANTINVOICELINE.PLANTINVOICECODE = SALESDOCUMENTLINE.SALESDOCUMENTPROVISIONALCODE
                    AND PLANTINVOICELINE.INVOICELINENO = CASE
                        WHEN LENGTH(RTRIM(PREVIOUSORDERLINE)) = 2 THEN SUBSTR(SALESDOCUMENTLINE.PREVIOUSORDERLINE, 1, 1)
                        WHEN LENGTH(RTRIM(PREVIOUSORDERLINE)) = 3 THEN SUBSTR(SALESDOCUMENTLINE.PREVIOUSORDERLINE, 1, 2)
                        WHEN LENGTH(RTRIM(PREVIOUSORDERLINE)) = 4 THEN SUBSTR(SALESDOCUMENTLINE.PREVIOUSORDERLINE, 1, 3)
                    END
                LEFT JOIN SALESDOCUMENT SALESDOCUMENT2 ON
                    SALESDOCUMENT2.PROVISIONALCODE = SALESDOCUMENTLINE.PREVIOUSCODE
                LEFT JOIN SALESORDERLINE SALESORDERLINE ON
                    SALESORDERLINE.SALESORDERCODE = SALESORDER.CODE
                    AND SALESORDERLINE.ORDERLINE = SALESDOCUMENTLINE.DLVSALESORDERLINEORDERLINE
                LEFT JOIN (
                        SELECT
                            *
                        FROM
                            ALLOCATION ALLOCATION
                        WHERE
                            ALLOCATION.DETAILTYPE = '1'
                            AND ALLOCATION.ORIGINTRNTRANSACTIONNUMBER IS NULL
                    )ALLOCATION ON
                    SALESDOCUMENTLINE.SUBCODE01 = ALLOCATION.DECOSUBCODE01
                    AND SALESDOCUMENTLINE.SUBCODE02 = ALLOCATION.DECOSUBCODE02
                    AND SALESDOCUMENTLINE.SUBCODE03 = ALLOCATION.DECOSUBCODE03
                    AND SALESDOCUMENTLINE.SUBCODE04 = ALLOCATION.DECOSUBCODE04
                    AND SALESDOCUMENTLINE.SUBCODE05 = ALLOCATION.DECOSUBCODE05
                    AND SALESDOCUMENTLINE.SUBCODE06 = ALLOCATION.DECOSUBCODE06
                    AND SALESDOCUMENTLINE.SUBCODE07 = ALLOCATION.DECOSUBCODE07
                    AND SALESDOCUMENTLINE.PREVIOUSCODE = ALLOCATION.ORDERCODE
                    AND SALESDOCUMENTLINE.PREVIOUSORDERLINE = ALLOCATION.ORDERLINE
                LEFT JOIN ITXVIEW_ALLOCATION_SURATJALAN_PPC ITXVIEW_ALLOCATION_SURATJALAN_PPC ON
                    ITXVIEW_ALLOCATION_SURATJALAN_PPC.CODE = ALLOCATION.CODE
                LEFT JOIN ITXVIEW_INVOICE_BIAYATAMBAHAN ITXVIEW_INVOICE_BIAYATAMBAHAN ON
                    PLANTINVOICE.CODE = ITXVIEW_INVOICE_BIAYATAMBAHAN.no_invoice
                    -- UNTUK JENIS FOC
                LEFT JOIN ITXVIEW_FOC_INVOICE2 ITXVIEW_FOC_INVOICE2 ON
                    PLANTINVOICE.CODE = ITXVIEW_FOC_INVOICE2.NO_INVOICE
                    --SALESDOCUMENTLINE.PREVIOUSCODE = ITXVIEW_FOC_INVOICE2.NO_SJ
                    --                                        WHERE PLANTINVOICE.CODE= 'DMU23070600'
--                                WHERE
--                                    PLANTINVOICE.CODE IN ('CA23080001')
                    --                AND ITXVIEW_ALLOCATION_SURATJALAN_PPC.CODE IN ('000000396037','000000396038','000000396042','000000396043','000000396047','000000396048')
                GROUP BY
                    ITXVIEW_ALLOCATION_SURATJALAN_PPC.CODE,
                    ITXVIEW_ALLOCATION_SURATJALAN_PPC.LOTCODE,
                    PLANTINVOICE.CODE,
                    PLANTINVOICE.CHALLANDATE,
                    PLANTINVOICE.LRDATE,
                    PLANTINVOICE.STATUS,
                    SALESORDER.CREATIONUSER,
                    SALESORDER.PAYMENTCUSTOMERUNIQUEID,
                    SALESORDER.PAYMENTCUSTOMERCODE,
                    PLANTINVOICE.CREATIONUSER,
                    SALESDOCUMENTLINE.PREVIOUSCODE,
                    SALESDOCUMENTLINE.ITEMTYPEAFICODE,
                    ITXVIEW_PO_INVOICE.NO_PO,
                    SALESDOCUMENT.ORDERPARTNERBRANDCODE,
                    SALESORDER.ORDERPARTNERBRANDCODE,
                    ALLOCATION.ALLOCATIONDATE,
                    SALESDOCUMENT2.GOODSISSUEDATE,
                    SALESDOCUMENT2.PROVISIONALDOCUMENTDATE,
                    PLANTINVOICE.CREATIONDATE,
                    PAYMENTMETHOD.LONGDESCRIPTION,
                    PAYMENTMETHODIE.NOOFDAYS,
                    PLANTINVOICE.CONTRACTNOCODE,
                    SALESORDER.FNCORDPRNCUSTOMERSUPPLIERCODE,
                    ADDRESS.ADDRESSEE,
                    ADDRESS.TAXREGISTRATIONNUMBER,
                    ADDRESS.ADDRESSLINE4,
                    PLANTINVOICE.ORDERCURRENCYCODE,
                    PLANTINVOICE.EXCHANGERATEOFCONTRACT,
                    ITXVIEW_INVOICE_BIAYATAMBAHAN.biaya_tambahan,
                    ITXVIEW_FOC_INVOICE2.foc_kg,
                    ITXVIEW_FOC_INVOICE2.foc_yard,
                    ITXVIEW_FOC_INVOICE2.QUANTITY_FOC,
                    SALESDOCUMENTLINE.PRICEUNITOFMEASURECODE,
                    PLANTINVOICELINE.TAXTEMPLATECODE,
                    PLANTINVOICE.BLNUMBER,
                    PLANTINVOICE.ORDERCURRENCYCODE,
                    SALESDOCUMENTLINE.price,
                    ALLOCATION.ORIGINTRNTRANSACTIONNUMBER,
                    SALESORDER.DESCRIPTION,
                    SALESORDER.TEMPLATECODE,
                    SALESORDER.COUNTERCODE,
                    BUSINESSPARTNER.NUMBERID,
                    BUSINESSPARTNER.LEGALNAME1,
                    ADDRESS.CODE
            )
        GROUP BY
            LOTCODE,
            Invoice,
            NO_SJ,
            tgl_inv,
            issue_date,
            tanggal_inv,
            tgl_create,
            DUE,
            DATEKB,
            DUEKB,
            curr,
            JENIS_ORDER,
            kode_bep,
            id_bep,
            nama_bep,
            kode_cus,
            nama_cus,
            NPWP,
            FAKTUR_PAJAK,
            NO_ORDER,
            NO_PO,
            NO_CI,
            DESC_KAIN,
            PPN,
            code_payment,
            payment_terms,
            unit,
            rate,
            biaya_tambahan,
            foc_kg,
            foc_yard,
            HARGA_FOC,
            harga_satuan,
            JML_KURANGIN_BERAT,
            total_kurangin_biaya,
            ORDERCURRENCYCODE,
            PAYMENTCUSTOMERUNIQUEID,
            TAXTEMPLATECODE,
            PAYMENTCUSTOMERCODE
    )
GROUP BY
    Invoice,
    NO_SJ,
    tgl_inv,
    tanggal_inv,
    issue_date,
    tgl_create,
    jenis_order,
    kode_bep,
    due,
    DUEKB,
    DATEKB,
    nama_cus,
    NPWP,
    FAKTUR_PAJAK,
    NO_ORDER,
    NO_PO,
    NO_CI,
    code_payment,
    payment_terms,
    unit,
    biaya_tambahan,
    harga_foc,
    foc_kg,
    foc_yard,
    rate,
    curr,
    desc_kain,
    ppn,
    --    dpp_bc,
    id_bep,
    nama_bep,
    kode_cus,
    PAYMENTCUSTOMERUNIQUEID,
    TAXTEMPLATECODE,
    PAYMENTCUSTOMERCODE;