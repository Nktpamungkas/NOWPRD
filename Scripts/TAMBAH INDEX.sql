SELECT * FROM SYSCAT.INDEXES WHERE tabname = 'STOCKTRANSACTION'

CREATE INDEX INTERNALREFERENCE2 ON DB2ADMIN.SALESORDERLINE(INTERNALREFERENCE);
