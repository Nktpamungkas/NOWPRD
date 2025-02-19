DROP VIEW ITXVIEW_MONITORING_DYE;
--CREATE VIEW ITXVIEW_MONITORING_DYE AS
SELECT
	TRIM(i.PRODUCTIONORDERCODE) AS PRODUCTIONORDERCODE,
	TRIM(i.PRODUCTIONDEMANDCODE) AS PRODUCTIONDEMANDCODE,
	TRIM(i.PELANGGAN) AS PELANGGAN,
	TRIM(i.SUBCODE01) || ' - ' ||
	TRIM(i.SUBCODE02) || ' - ' ||
	TRIM(i.SUBCODE03) || ' - ' ||
	TRIM(i.SUBCODE04) || ' - ' ||
	TRIM(i.SUBCODE05) || ' - ' ||
	TRIM(i.SUBCODE06) || ' - ' ||
	TRIM(i.SUBCODE07) || ' - ' ||
	TRIM(i.SUBCODE08) || ' | ' ||
	TRIM(i.ITEMDESCRIPTION) AS JENIS_KAIN,
	TRIM(i.WARNA) AS WARNA,
	TRIM(im.MACHINECODE) AS NOMORMESIN,
	TRIM(im.BATHVOLUME) AS KAPASITAS,
	p.FINALUSERPRIMARYQUANTITY AS FINALUSERPRIMARYQUANTITY,
	il.PICKUPQUANTITY AS LR
--	iq.VALUEQUANTITY AS NO_PROGRAM
--	iq_cyc.VALUEQUANTITY AS CYCLE_TIME
--	iq_rpm01.VALUEQUANTITY AS RPM01,
--	iq_tekanan01.VALUEQUANTITY AS TEKANAN01,
--	iq_nozzle.VALUEQUANTITY AS NOZZLE
--	il_lb1.VALUEQUANTITY AS LB1,
--	il_lb2.VALUEQUANTITY AS LB2,
--	il_lb3.VALUEQUANTITY AS LB3,
--	il_lb4.VALUEQUANTITY AS LB4,
--	il_lb5.VALUEQUANTITY AS LB5,
--	il_lb6.VALUEQUANTITY AS LB6,
--	il_lb7.VALUEQUANTITY AS LB7,
--	il_lb8.VALUEQUANTITY AS LB8,
--	il_lb1.VALUEQUANTITY + 
--	il_lb2.VALUEQUANTITY + 
--	il_lb3.VALUEQUANTITY + 
--	il_lb4.VALUEQUANTITY + 
--	il_lb5.VALUEQUANTITY + 
--	il_lb6.VALUEQUANTITY + 
--	il_lb7.VALUEQUANTITY + 
--	il_lb8.VALUEQUANTITY AS TOTAL_LB
FROM 
	ITXVIEWKK i 
LEFT JOIN VIEWPRODUCTIONRESERVATION v ON v.PRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND v.ITEMTYPEAFICODE = 'RFD'
LEFT JOIN ITXVIEW_MACHINE im ON im.PRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE 
LEFT JOIN PRODUCTIONDEMANDSTEP p ON p.PRODUCTIONORDERCODE = im.PRODUCTIONORDERCODE AND p.PRODRESERVATIONLINKGROUPCODE = im.OPERATIONCODE 
LEFT JOIN ITXVIEW_LR il ON il.PRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE 
--LEFT JOIN ITXVIEW_QUALITYDATA iq ON iq.PRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND iq.CHARACTERISTICCODE = 'NOPROGRAM'
--LEFT JOIN ITXVIEW_QUALITYDATA iq_cyc ON iq_cyc.PRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND iq_cyc.CHARACTERISTICCODE = 'CYC'
--LEFT JOIN ITXVIEW_QUALITYDATA iq_rpm01 ON iq_rpm01.PRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND iq_rpm01.CHARACTERISTICCODE = 'RPM01'
--LEFT JOIN ITXVIEW_QUALITYDATA iq_tekanan01 ON iq_tekanan01.PRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND iq_tekanan01.CHARACTERISTICCODE = 'TEKANAN01'
--LEFT JOIN ITXVIEW_QUALITYDATA iq_nozzle ON iq_nozzle.PRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND iq_nozzle.CHARACTERISTICCODE = 'NOZZLE'
--LEFT JOIN ITXVIEW_LB il_lb1 ON il_lb1.QUALITYDOCPRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND il_lb1.CHARACTERISTICCODE = 'LB1' AND (il_lb1.HEADERNUMBERID = '839' OR il_lb1.HEADERNUMBERID = '841' OR il_lb1.HEADERNUMBERID = '844' OR il_lb1.HEADERNUMBERID = '845' OR il_lb1.HEADERNUMBERID = '847') AND NOT il_lb1.VALUEQUANTITY = 0
--LEFT JOIN ITXVIEW_LB il_lb2 ON il_lb2.QUALITYDOCPRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND il_lb2.CHARACTERISTICCODE = 'LB2'
--LEFT JOIN ITXVIEW_LB il_lb3 ON il_lb3.QUALITYDOCPRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND il_lb3.CHARACTERISTICCODE = 'LB3'
--LEFT JOIN ITXVIEW_LB il_lb4 ON il_lb4.QUALITYDOCPRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND il_lb4.CHARACTERISTICCODE = 'LB4'
--LEFT JOIN ITXVIEW_LB il_lb5 ON il_lb5.QUALITYDOCPRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND il_lb5.CHARACTERISTICCODE = 'LB5'
--LEFT JOIN ITXVIEW_LB il_lb6 ON il_lb6.QUALITYDOCPRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND il_lb6.CHARACTERISTICCODE = 'LB6'
--LEFT JOIN ITXVIEW_LB il_lb7 ON il_lb7.QUALITYDOCPRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND il_lb7.CHARACTERISTICCODE = 'LB7'
--LEFT JOIN ITXVIEW_LB il_lb8 ON il_lb8.QUALITYDOCPRODUCTIONORDERCODE = i.PRODUCTIONORDERCODE AND il_lb8.CHARACTERISTICCODE = 'LB8'
--WHERE 
--	i.PRODUCTIONORDERCODE = '00039691'
GROUP BY 
	i.PRODUCTIONORDERCODE,
	i.PRODUCTIONDEMANDCODE,
	i.PELANGGAN,
	i.SUBCODE01,
	i.SUBCODE02,
	i.SUBCODE03,
	i.SUBCODE04,
	i.SUBCODE05,
	i.SUBCODE06,
	i.SUBCODE07,
	i.SUBCODE08,
	i.ITEMDESCRIPTION,
	i.WARNA,
	im.MACHINECODE,
	im.BATHVOLUME,
	p.FINALUSERPRIMARYQUANTITY,
	il.PICKUPQUANTITY
--	iq.VALUEQUANTITY
--	iq_cyc.VALUEQUANTITY
--	iq_rpm01.VALUEQUANTITY,
--	iq_tekanan01.VALUEQUANTITY,
--	iq_nozzle.VALUEQUANTITY
--	il_lb1.VALUEQUANTITY,
--	il_lb2.VALUEQUANTITY,
--	il_lb3.VALUEQUANTITY,
--	il_lb4.VALUEQUANTITY,
--	il_lb5.VALUEQUANTITY,
--	il_lb6.VALUEQUANTITY,
--	il_lb7.VALUEQUANTITY,
--	il_lb8.VALUEQUANTITY