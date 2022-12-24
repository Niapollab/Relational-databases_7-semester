CREATE TABLE DEPARTMENT (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	NAME VARCHAR2(255) NOT NULL
);

CREATE TABLE WORK_ORDER (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	CODE INT NOT NULL
);

CREATE TABLE EMPLOYEE (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	FIRST_NAME VARCHAR2(255) NOT NULL,
	SECOND_NAME VARCHAR2(255) NOT NULL,
	MIDDLE_NAME VARCHAR2(255)
);

CREATE TABLE DRAWING (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	CODE INT NOT NULL
);

CREATE TABLE TOOL (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	CODE INT NOT NULL,
	DESCRIPTION VARCHAR2(2048) NOT NULL,
	ALLOCATED INT NOT NULL,
	REMAINING INT NOT NULL
);

CREATE TABLE PRODUCT (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	LAST_CREATED DATE NOT NULL,
	LAST_PRICE DECIMAL NOT NULL,
	LAST_OPERATIONS_COUNT INT NOT NULL
);

CREATE TABLE OPERATION (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	DEPARTMENT_ID INTEGER NOT NULL REFERENCES DEPARTMENT(ID),
	DRAWING_ID INTEGER NOT NULL REFERENCES DRAWING(ID),
	DESCRIPTION VARCHAR2(2048) NOT NULL,
	DURATION INTERVAL DAY TO SECOND NOT NULL,
	NUMBER_OF_RESOURCES INT NOT NULL
);

CREATE TABLE EXTRADITION (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	PRODUCT_ID INTEGER NOT NULL REFERENCES PRODUCT(ID),
	EMPLOYEE_ID INTEGER NOT NULL REFERENCES EMPLOYEE(ID),
	OPERATION_ID INTEGER NOT NULL REFERENCES OPERATION(ID),
	WORK_ORDER_ID INTEGER NOT NULL REFERENCES WORK_ORDER(ID),
	ISSUED_QUANTITY INTEGER NOT NULL,
	EXTRADITION_DATA DATE NOT NULL
);

CREATE TABLE CLIENT_ORDER (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	PRODUCT_ID INTEGER NOT NULL REFERENCES PRODUCT(ID),
	CREATE_DATE DATE NOT NULL,
	RECEIPT_DATE DATE NOT NULL,
	PRODUCT_COUNT INTEGER NOT NULL
);

CREATE TABLE TOOL_OPERATION_EXPECTED (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	OPERATION_ID INTEGER NOT NULL REFERENCES OPERATION(ID),
	TOOL_ID INTEGER NOT NULL REFERENCES TOOL(ID),
	TOOL_COUNT INTEGER NOT NULL
);


CREATE TABLE TOOL_INSTANCE (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	TOOL_ID INTEGER NOT NULL REFERENCES TOOL(ID),
	RECEIPT_DATE DATE NOT NULL
);


CREATE TABLE TOOL_DEPARTMENT (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	DEPARTMENT_ID INTEGER NOT NULL REFERENCES DEPARTMENT(ID),
	TOOL_INSTANCE_ID INTEGER NOT NULL REFERENCES TOOL_INSTANCE(ID)
);


CREATE TABLE TOOL_OPERATION_REAL (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
	TOOL_INSTANCE_ID INTEGER NOT NULL REFERENCES TOOL_INSTANCE(ID),
	DEPARTMENT_ID INTEGER NOT NULL REFERENCES DEPARTMENT(ID),
	WORK_ORDER_ID INTEGER NOT NULL REFERENCES WORK_ORDER(ID)
);