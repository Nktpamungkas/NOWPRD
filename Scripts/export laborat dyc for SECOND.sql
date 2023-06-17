-- FOR SECOND
SELECT 
	a.id AS id_matching_detail,
	a.id_matching as id_matching,
	a.id_status as is_status,
	b.recipe_code as recipe_code,
	case
		when SUBSTRING(b.no_resep, 1,2) = 'DR' or SUBSTRING(b.no_resep, 1,2) = 'CD' or SUBSTRING(b.no_resep, 1,2) = 'OB' then CONCAT(SUBSTRING(b.no_resep, 3), 'L')
		when SUBSTRING(b.no_resep, 1,2) = 'D2' or SUBSTRING(b.no_resep, 1,2) = 'R2' or SUBSTRING(b.no_resep, 1,2) = 'A2' then CONCAT(SUBSTRING(b.no_resep, 2), 'L')
	end as no_resep_convert,
	kode as kode,
	nama as nama,
	case
		when conc10 != 0 then conc10
		when conc9 != 0 then conc9
		when conc8 != 0 then conc8
		when conc7 != 0 then conc7
		when conc6 != 0 then conc6
		when conc5 != 0 then conc5
		when conc4 != 0 then conc4
		when conc3 != 0 then conc3
		when conc2 != 0 then conc2
		when conc1 != 0 then conc1
	end as conc,
	remark as remark 
FROM tbl_matching_detail a 
LEFT JOIN tbl_matching b ON b.id = a.id_matching
left join tbl_status_matching tsm on tsm.idm = b.no_resep 
WHERE a.id_matching = '31570' AND a.id_status = '30877' and remark = 'from merge Co-power' order by a.flag asc


-- FOR SECONDARY TEMPERATURE, BLEACHING, SOAPING, AND RC
select 
	b.recipe_code as recipe_code,
	case
		when SUBSTRING(b.no_resep, 1,2) = 'DR' or SUBSTRING(b.no_resep, 1,2) = 'CD' or SUBSTRING(b.no_resep, 1,2) = 'OB' then CONCAT(SUBSTRING(b.no_resep, 3), 'L')
		when SUBSTRING(b.no_resep, 1,2) = 'D2' or SUBSTRING(b.no_resep, 1,2) = 'R2' or SUBSTRING(b.no_resep, 1,2) = 'A2' then CONCAT(SUBSTRING(b.no_resep, 2), 'L')
	end as no_resep_convert,
	concat(trim(tsm.cside_c),'''C X ', trim(tsm.cside_min), ' MNT') as nama
from 
	tbl_status_matching tsm 
left join tbl_matching b on b.no_resep = tsm.idm
left join tbl_matching_detail a on a.id_matching = b.id
where tsm.idm = 'DR22100698'
group by tsm.idm
union 
select 
	b.recipe_code as recipe_code,
	case
		when SUBSTRING(b.no_resep, 1,2) = 'DR' or SUBSTRING(b.no_resep, 1,2) = 'CD' or SUBSTRING(b.no_resep, 1,2) = 'OB' then CONCAT(SUBSTRING(b.no_resep, 3), 'L')
		when SUBSTRING(b.no_resep, 1,2) = 'D2' or SUBSTRING(b.no_resep, 1,2) = 'R2' or SUBSTRING(b.no_resep, 1,2) = 'A2' then CONCAT(SUBSTRING(b.no_resep, 2), 'L')
	end as no_resep_convert,
	concat("SOAPING ",trim(tsm.soaping_sh),'''C X ', trim(tsm.soaping_tm), " MNT") as nama
from 
	tbl_status_matching tsm 
left join tbl_matching b on b.no_resep = tsm.idm
left join tbl_matching_detail a on a.id_matching = b.id
where tsm.idm = 'DR22100698' and not tsm.soaping_sh = 0 and not tsm.soaping_tm = 0
group by b.no_resep
union 
select 
	b.recipe_code as recipe_code,
	case
		when SUBSTRING(b.no_resep, 1,2) = 'DR' or SUBSTRING(b.no_resep, 1,2) = 'CD' or SUBSTRING(b.no_resep, 1,2) = 'OB' then CONCAT(SUBSTRING(b.no_resep, 3), 'L')
		when SUBSTRING(b.no_resep, 1,2) = 'D2' or SUBSTRING(b.no_resep, 1,2) = 'R2' or SUBSTRING(b.no_resep, 1,2) = 'A2' then CONCAT(SUBSTRING(b.no_resep, 2), 'L')
	end as no_resep_convert,
	concat("RC ",trim(tsm.rc_sh),'''C X ', trim(tsm.rc_tm), ' MNT') as nama
from 
	tbl_status_matching tsm 
left join tbl_matching b on b.no_resep = tsm.idm
left join tbl_matching_detail a on a.id_matching = b.id
where tsm.idm = 'DR22100698' and not tsm.rc_sh = 0 and not tsm.rc_tm = 0
group by b.no_resep
union 
select 
	b.recipe_code as recipe_code,
	case
		when SUBSTRING(b.no_resep, 1,2) = 'DR' or SUBSTRING(b.no_resep, 1,2) = 'CD' or SUBSTRING(b.no_resep, 1,2) = 'OB' then CONCAT(SUBSTRING(b.no_resep, 3), 'L')
		when SUBSTRING(b.no_resep, 1,2) = 'D2' or SUBSTRING(b.no_resep, 1,2) = 'R2' or SUBSTRING(b.no_resep, 1,2) = 'A2' then CONCAT(SUBSTRING(b.no_resep, 2), 'L')
	end as no_resep_convert,
	concat("BLEACHING ",trim(tsm.bleaching_sh),'''C X ', trim(tsm.bleaching_tm), ' MNT') as nama
from 
	tbl_status_matching tsm 
left join tbl_matching b on b.no_resep = tsm.idm
left join tbl_matching_detail a on a.id_matching = b.id
where tsm.idm = 'DR22100698' and not tsm.bleaching_sh = 0 and not tsm.bleaching_tm = 0
group by b.no_resep