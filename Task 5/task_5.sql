ACCEPT PROMT_UNIVERSITY_NAME CHAR PROMPT '������� �������� ������������: ';
ACCEPT PROMT_UNIVERSITY_RATING NUMBER PROMPT '������� ������� ������������: ';
ACCEPT PROMT_UNIVERSITY_CITY CHAR PROMPT '������� ����� ������������: ';

CREATE TABLE UNIVERSITY (
    UNIV_ID INTEGER PRIMARY KEY,
    UNIV_NAME CHAR(140) NOT NULL UNIQUE,
    RATING INTEGER,
    CITY CHAR(30) NOT NULL
);

CREATE SEQUENCE UNIV_ID_SEQUENCE START WITH 1;

BEGIN
    INSERT INTO UNIVERSITY VALUES (
        UNIV_ID_SEQUENCE.NEXTVAL,
        '&PROMT_UNIVERSITY_NAME',
        &PROMT_UNIVERSITY_RATING,
        '&PROMT_UNIVERSITY_CITY'
    );
END;
/