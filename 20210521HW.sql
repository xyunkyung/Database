CREATE TABLE MEMBER(
    USER_ID VARCHAR2(20) NOT NULL,
    USER_PW VARCHAR2(200) NOT NULL,
    USER_NAME VARCHAR2(40) NOT NULL,
    USER_BIRTH TIMESTAMP NOT NULL,
    USER_GENDER VARCHAR2(1) NOT NULL,
    USER_ADDR VARCHAR2(200) NOT NULL,
    USER_PH1 VARCHAR2(13) NOT NULL,
    USER_PH2 VARCHAR2(13),
    USER_REGIST TIMESTAMP DEFAULT SYSDATE,
    USER_EMAIL VARCHAR2(200),
    JOIN_OK VARCHAR2(500),
    CONSTRAINT MEMBER_USER_ID_PK PRIMARY KEY (USER_ID),
    CONSTRAINT MAMBER_USER_EMANIL_UU UNIQUE (USER_EMAIL)
);

DESC MEMBER;

DROP TABLE BOARD;
CREATE TABLE BOARD(
    BOARD_NUM NUMBER NOT NULL,
    USER_ID VARCHAR2(20) NOT NULL,
    BOARD_NAME VARCHAR2(20) NOT NULL,
    BOARD_PASS VARCHAR2(200) NOT NULL,
    BOARD_SUBJECT VARCHAR2(100) NOT NULL,
    BOARD_CONTENT VARCHAR2(2000),
    BOARD_DATE TIMESTAMP,
    IP_ADDR VARCHAR2(15),
    READ_COUNT NUMBER DEFAULT 0,
    CONSTRAINT BOARD_BOARD_NUM_PK PRIMARY KEY (BOARD_NUM),
    CONSTRAINT BOARD_USER_ID_FK FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID)
);

DESC BOARD;

INSERT INTO MEMBER(USER_ID, USER_PW, USER_NAME, USER_BIRTH, USER_GENDER,
                    USER_ADDR, USER_PH1, USER_PH2, USER_REGIST, USER_EMAIL)
VALUES('highland0', '111111', '이숭무', '1999-12-12', '1', '서울', '010-1234-1234',
        NULL, DEFAULT, NULL);
INSERT INTO MEMBER(USER_ID, USER_PW, USER_NAME, USER_BIRTH, USER_GENDER,
                    USER_ADDR, USER_PH1, USER_PH2, USER_REGIST, USER_EMAIL)
VALUES('lhk1', '123456', '이현경', '1997-05-25', '2', '경기', '010-1234-0000',
        NULL, DEFAULT, NULL);
INSERT INTO MEMBER(USER_ID, USER_PW, USER_NAME, USER_BIRTH, USER_GENDER,
                    USER_ADDR, USER_PH1, USER_PH2, USER_REGIST, USER_EMAIL)
VALUES('space', '222222', '이우주', '2003-01-23', '1', '서울', '010-0000-1234',
        NULL, DEFAULT, NULL);
INSERT INTO MEMBER(USER_ID, USER_PW, USER_NAME, USER_BIRTH, USER_GENDER,
                    USER_ADDR, USER_PH1, USER_PH2, USER_REGIST, USER_EMAIL)
VALUES('star', '888888', '이혜성', '2007-04-07', '1', '서울', '010-1234-1234',
        NULL, DEFAULT, NULL);
INSERT INTO MEMBER(USER_ID, USER_PW, USER_NAME, USER_BIRTH, USER_GENDER,
                    USER_ADDR, USER_PH1, USER_PH2, USER_REGIST, USER_EMAIL)
VALUES('sky', '343434', '이하늘', '2020-12-04', '1', '서울', '010-1000-1234',
        NULL, DEFAULT, NULL);
        
SELECT * FROM MEMBER;

INSERT INTO BOARD(BOARD_NUM, USER_ID, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT,
                    BOARD_CONTENT, IP_ADDR)
VALUES(1, 'highland0', '상장범 아빠', '1111', '제목', '내용', '192.168.3.117');
INSERT INTO BOARD(BOARD_NUM, USER_ID, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT,
                    BOARD_CONTENT, IP_ADDR)
VALUES(2, 'highland0', '상장범 아빠2', '1111', '제목', '내용', '192.168.3.117');
INSERT INTO BOARD(BOARD_NUM, USER_ID, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT,
                    BOARD_CONTENT, IP_ADDR)
VALUES(3, 'lhk1', '이현경', '1111', '제목', '내용', '192.168.3.117');
INSERT INTO BOARD(BOARD_NUM, USER_ID, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT,
                    BOARD_CONTENT, IP_ADDR)
VALUES(4, 'space', '이우주', '1111', '제목', '내용', '192.168.3.117');
INSERT INTO BOARD(BOARD_NUM, USER_ID, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT,
                    BOARD_CONTENT, IP_ADDR)
VALUES(5, 'star', '이혜성', '1111', '제목', '내용', '192.168.3.117');
INSERT INTO BOARD(BOARD_NUM, USER_ID, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT,
                    BOARD_CONTENT, IP_ADDR)
VALUES(6, 'sky', '이하늘', '1111', '제목', '내용', '192.168.3.117');

SELECT * FROM BOARD;

SELECT M.USER_ID, USER_NAME, USER_EMAIL, BOARD_CONTENT, BOARD_SUBJECT, READ_COUNT
FROM MEMBER M, BOARD B
WHERE M.USER_ID = B.USER_ID
AND B.USER_ID = 'highland0';

DROP SEQUENCE BOARD_READ_COUNT_SEQ;
CREATE SEQUENCE BOARD_READ_COUNT_SEQ
INCREMENT BY 1;

UPDATE BOARD SET READ_COUNT = BOARD_READ_COUNT_SEQ.NEXTVAL
WHERE BOARD_NUM = 1;

SELECT * FROM BOARD;

ROLLBACK;

SELECT * FROM MEMBER M,(
    SELECT USER_ID FROM BOARD
    WHERE BOARD_NUM = 2) B
    WHERE M.USER_ID = B.USER_ID;
    
SELECT COUNT(BOARD_NUM) FROM BOARD;

SELECT USER_ID, COUNT(BOARD_NUM) FROM BOARD
GROUP BY USER_ID;

SELECT COUNT(USER_ID) FROM MEMBER;

UPDATE MEMBER
SET USER_PH1 = '02-9876-1234',
    USER_EMAIL = 'highland0@nate.com',
    USER_PW = '22222'
WHERE USER_ID = 'highland0';

SELECT * FROM MEMBER;

UPDATE BOARD
SET BOARD_SUBJECT = '나는 열심히 공부할래',
    BOARD_CONTENT = '열심히 공부해서\n빨리 취업이 될 수 있게 노력해야지'
WHERE BOARD_NUM = 1;

SELECT * FROM BOARD;

UPDATE BOARD
SET BOARD_SUBJECT = '나는 열심히 공부할래',
    BOARD_CONTENT = REPLACE('열심히 공부해서\n빨리 취업이 될 수 있게 노력해야지', '\n', '<br/>')
WHERE BOARD_NUM = 1;

UPDATE BOARD
SET BOARD_SUBJECT = SUBSTR(BOARD_SUBJECT, 1, 5) || RPAD('*', 5, '*');

SELECT SUBSTR(USER_ID, 1, 3) || RPAD('*', LENGTH(USER_ID)-3, '*')
FROM MEMBER
WHERE USER_EMAIL = 'highland0@nate.com'
AND USER_PH1 = '02-9876-1234';

SELECT USER_ID, COUNT(BOARD_NUM) FROM BOARD
GROUP BY USER_ID
HAVING COUNT(BOARD_NUM) = MAX(BOARD_NUM);

COMMIT;

DELETE FROM BOARD
WHERE USER_ID = (SELECT USER_ID FROM MEMBER WHERE USER_NAME = '이숭무');

DELETE FROM MEMBER
WHERE USER_NAME = '이숭무';

SELECT * FROM MEMBER;

ROLLBACK;

SELECT * FROM BOARD;

DELETE FROM BOARD
WHERE USER_ID = (
    SELECT USER_ID FROM MEMBER WHERE USER_ID = 'highland0'
        AND USER_PW = '22222')
AND BOARD_NUM = 1;

SELECT * FROM BOARD;