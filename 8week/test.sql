-- 1) Customer 테이블에서 사용할 시퀸스, 존재 유무 관계 없이 DROP
DROP TABLE Customer;

-- 2) Customer 테이블에서 사용할 시퀸스 Create
DROP SEQUENCE SEQ_Customer;

CREATE SEQUENCE SEQ_Customer
INCREMENT BY 1
START WITH 1
MAXVALUE 10
MINVALUE 0
NOCYCLE
NOCACHE;

-- 3) 3개 테이블에 대해, 존재 유무 관계 없이 테이블 DROP
DROP TABLE Customer;
DROP TABLE Shares;
DROP TABLE Stock;

-- 4) 위 3개 테이블 create
CREATE TABLE Customer(
    ssn             VARCHAR2(15) PRIMARY KEY,
    cust_name       VARCHAR2(40),
    address         VARCHAR2(100),
    cash_balance    NUMBER(1),
    credit_avail    NUMBER(4)
);

CREATE TABLE Stock(
    symbol          VARCHAR2(8) PRIMARY KEY,
    price           NUMBER(5,2)
);

CREATE TABLE Shares(
    ssn             VARCHAR2(15) REFERENCES Customer(ssn),
    symbol          VARCHAR2(8) REFERENCES Stock(symbol),
    quantity        NUMBER(4),
    purchase_price  NUMBER(5,3)
);
    
-- 5) 각 테이블에 INSERT
INSERT INTO Customer VALUES(SEQ_Customer.NEXTVAL, 'John Meyers', '1444 California Lane, Walawala, WA.', 0, 5000);
INSERT INTO Customer VALUES(SEQ_Customer.NEXTVAL, 'Tim Uhlmann', '45 West Road, Fremont CA', 0, 5000);
INSERT INTO Customer VALUES(SEQ_Customer.NEXTVAL, 'Jane O`Brien', '36 High Plan Rd, Belmont, MA', 0, 5000);
INSERT INTO Customer VALUES(SEQ_Customer.NEXTVAL, 'Patricia Duffy', '90 Main Street, Catamoint, VA', 0, 5000);
INSERT INTO Customer VALUES(SEQ_Customer.NEXTVAL, 'Pamela Sonders', NULL, 0, 5000);
INSERT INTO Customer VALUES(SEQ_Customer.NEXTVAL, 'Jennifer Sullivan Volpe', NULL, 0, 5000);
INSERT INTO Customer VALUES(SEQ_Customer.NEXTVAL, 'Priscilla Malcolm', NULL, 0, 5000);
INSERT INTO Customer VALUES(SEQ_Customer.NEXTVAL, 'Georgianna DG Meagher', NULL, 0, 5000);
INSERT INTO Customer VALUES(SEQ_Customer.NEXTVAL, 'Tom McGinn', NULL, 0, 5000);
INSERT INTO Customer VALUES(SEQ_Customer.NEXTVAL, 'Brian Waltrous', NULL, 0, 5000);

INSERT INTO Stock VALUES('SUNW', 90);
INSERT INTO Stock VALUES('CyAs', 34);
INSERT INTO Stock VALUES('DUKE', 12.38);
INSERT INTO Stock VALUES('ABStk', 20.88);
INSERT INTO Stock VALUES('JSVCo', 24);
INSERT INTO Stock VALUES('TMAs', 80.13);
INSERT INTO Stock VALUES('BWInc', 6.25);
INSERT INTO Stock VALUES('GMEnt', 52.5);
INSERT INTO Stock VALUES('PMLtd', 201.88);
INSERT INTO Stock VALUES('JDK', 13.5);

INSERT INTO Shares VALUES(1, 'SUNW', 200, 15.5);
INSERT INTO Shares VALUES(1, 'DUKE', 1200, 22.125);
INSERT INTO Shares VALUES(2, 'JSVCo', 120, 20.675);
INSERT INTO Shares VALUES(3, 'BWInc', 35, 12);
INSERT INTO Shares VALUES(4, 'GMEnt', 200, 9.25);
INSERT INTO Shares VALUES(4, 'PMLtd', 109, 45.75);
INSERT INTO Shares VALUES(5, 'TMAs', 135, 13.375);

DROP FUNCTION addCustomer;

-- 6) addCustomer
CREATE OR REPLACE FUNCTION addCustomer(
    name VARCHAR2,
    ssn VARCHAR2,
    addr VARCHAR2
)
RETURN VARCHAR2
IS    
BEGIN
    INSERT INTO Customer(cust_name, ssn, address) VALUES(name, ssn, addr);
    SELECT * FROM Customer;
END addCustomer;

-- 8) deleteCustomer
CREATE OR REPLACE FUNCTION deleteCustomer(
    ssn VARCHAR2
)
RETURN VARCHAR2
IS    
BEGIN
    DELETE FROM Customer WHERE ssn = ssn;
    SELECT * FROM Customer;

END deleteCustomer;

-- 8) updateCustomer
CREATE OR REPLACE FUNCTION updateCustomer(
    name VARCHAR2,
    ssn VARCHAR2,
    addr VARCHAR2
)
RETURN VARCHAR2
IS    
BEGIN
    UPDATE Customer SET cust_name = name,
                        ssn = ssn,
                        address = addr;
    SELECT * FROM Customer;
END updateCustomer;

-- 9) getCustomer
CREATE OR REPLACE FUNCTION getCustomer(
    ssn VARCHAR2
)
RETURN VARCHAR2
IS    
BEGIN
    SELECT * FROM Customer WHERE ssn = ssn;
END getCustomer;

-- 10) getALLCustomer
CREATE OR REPLACE FUNCTION getALLCustomer()
RETURN VARCHAR2
IS    
BEGIN
    SELECT * FROM Customer;
END getALLCustomer;

-- 16) getALLStock
CREATE OR REPLACE FUNCTION getALLStock()
RETURN VARCHAR2
IS    
BEGIN
    SELECT * FROM Stock;
END getALLStock;

-- 17) updateStockPrice
CREATE OR REPLACE FUNCTION updateStockPrice(
    sym VARCHAR2
    value NUMBER
)
RETURN VARCHAR2
IS    
BEGIN
    UPDATE Stock SET price = value WHERE symbol = sym;
    SELECT * FROM Stock;
END updateStockPrice;


-- 18) getStockPrice
CREATE OR REPLACE FUNCTION getStockPrice(
    sym VARCHAR2
)
RETURN VARCHAR2
IS    
BEGIN
    SELECT PRICE FROM Stock WHERE symbol = sym ;
END getStockPrice;
