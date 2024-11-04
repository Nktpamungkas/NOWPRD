SELECT 
    adstorage.VALUESTRING,
    SUBSTRING(
        adadditionaldata.OPTIONS, 
        POSITION(';' || adstorage.VALUESTRING || '=' IN adadditionaldata.OPTIONS) + LENGTH(adstorage.VALUESTRING) + 2,
        POSITION(';' IN SUBSTRING(adadditionaldata.OPTIONS, POSITION(';' || adstorage.VALUESTRING || '=' IN adadditionaldata.OPTIONS) + LENGTH(adstorage.VALUESTRING) + 2)) - 1
    ) AS STATUS
FROM 
    ADSTORAGE adstorage
JOIN ADADDITIONALDATA adadditionaldata ON adadditionaldata.NAME = adstorage.FIELDNAME 
--POSITION(';' || adstorage.VALUESTRING || '=' IN adadditionaldata.OPTIONS) > 0
WHERE 
	adstorage.VALUESTRING = '1'
	AND adstorage.UNIQUEID = '99304780'
	AND adstorage.FIELDNAME = 'cocokwarna'
