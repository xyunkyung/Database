CREATE TABLE dept(
    deptno NUMBER(2),
    dename VARCHAR2(14),
    loc VARCHAR2(13),
    create_date DATE DEFAULT '05/02/01');
    
DESC dept;

INSERT INTO dept VALUES(1, '이숭무', '서울', '2021/05/02');

SELECT * FROM dept;

DESC hr.departments;

CREATE TABLE departments(
    department_id NUMBER(4),
    department_name VARCHAR2(30),
    manager_id NUMBER,
    location_id NUMBER(4)
);

DESC departments;

INSERT INTO departments (department_id, department_name, manager_id, location_id)
    VALUES (70, 'Public Relations', 100, 1700);
    
SELECT * FROM departments;

INSERT INTO departments(department_name, location_id, department_id, manager_id)
    VALUES('Purchasing', 1800, 80, 110);
    
SELECT * FROM departments;

INSERT INTO departments(department_id, department_name)
    VALUES(30, 'Purchasing1');
    
SELECT * FROM departments;

INSERT INTO departments VALUES(100, 'Finance', NULL, NULL);

SELECT * FROM departments;

CREATE TABLE employees(
    employee_id NUMBER(6),
    first_name VARCHAR2(20),
    last_name VARCHAR2(25),
    email VARCHAR2(25),
    phone_number VARCHAR2(20),
    hire_date DATE,
    job_id VARCHAR2(10),
    salary NUMBER(8,2),
    commission_pct NUMBER(2,2),
    manager_id NUMBER(6),
    department_id NUMBER(4)
);

DESC employees;

INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
                        hire_date, job_id, salary, commission_pct, manager_id, department_id)
    VALUES(113, 'Louis', 'Popp', 'LPOPP', '515.124.4567', SYSDATE, 'AC_ACCOUNT',
            6900, NULL, 205, 100);
            
SELECT * FROM employees;

-- 문제) 113번의 사원번호, 성, 직무, 입사일, 커미션을 출력
SELECT employee_id, last_name, job_id, hire_date, commission_pct FROM employees
WHERE employee_id = 113;

INSERT INTO employees VALUES(114, 'Den', 'Raphealy', 'DRAPHEAL', '515.127.4561', '2021/05/20',
    'AC_ACCOUNT', 11000, null, 100, 30);
    
SELECT * FROM employees;

INSERT INTO employees VALUES(115, 'Soong', 'Rhee', 'SRHEE', '010.1234.1234', TO_DATE('05/2021/19', 'mm/yyyy/dd'),
    'AC_ACCOUNT', 11000, null, 100, 30);

SELECT * FROM employees;

INSERT iNTO employees(employee_id, first_name, last_name, hire_date, job_id)
SELECT employee_id, first_name, last_name, hire_date, job_id FROM hr.employees;

ROLLBACK;

SELECT * FROM employees;

INSERT INTO employees(employee_id, last_name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct FROM hr.employees
WHERE job_id like '%REP';

SELECT * FROM employees;

ROLLBACK;

SELECT * FROM employees;

INSERT INTO employees
SELECT * FROM hr.employees;

SELECT * FROM employees;

DROP TABLE employees;
SELECT * FROM employees;

CREATE TABLE employees(
    employee_id NUMBER(6),
    first_name VARCHAR2(20),
    last_name VARCHAR2(25),
    email VARCHAR2(25),
    phone_number VARCHAR2(20),
    hire_date DATE DEFAULT sysdate,
    job_id VARCHAR2(10),
    salary NUMBER(8,2),
    commission_pct NUMBER(2,2),
    manager_id NUMBER(6),
    department_id NUMBER(4)
);

DESC employees;
INSERT INTO employees(employee_id, last_name, first_name, hire_date, job_id)
VALUES(110, 'Rhee', 'Soong', sysdate, 'AC_ACCOUNT');

SELECT * FROM employees;

INSERT INTO employees(employee_id, last_name, first_name, hire_date, job_id)
VALUES(120, 'Park', 'Jun', '2021/05/16', 'AC_ACCOUNT');

SELECT * FROM employees;

INSERT INTO employees(employee_id, last_name, first_name, job_id)
VALUES(130, 'Rhee', 'Sang', 'AC_ACCOUNT');

SELECT * FROM employees;

INSERT INTO employees(employee_id, last_name, first_name, hire_date, job_id)
VALUES(140, 'Rhee', 'Jang', default, 'AC_ACCOUNT');

SELECT * FROM employees;

DESC departments;

DROP TABLE departments;

CREATE TABLE departments(
    department_id NUMBER(4),
    department_name VARCHAR2(30),
    manager_id NUMBER default 100,
    location_id NUMBER(4)
);

SELECT * FROM departments;

INSERT INTO departments(department_id, department_name)
VALUES(300, 'Engineering');

SELECT * FROM departments;

INSERT INTO departments(department_id, department_name, manager_id)
VALUES(300, 'Engineering', default);

SELECT * FROM departments;

DELETE FROM employees;

INSERT INTO employees
SELECT * FROM hr.employees;

select * from employees
WHERE employee_id = 113;

UPDATE employees SET department_id = 70
WHERE employee_id = 113;

select * from employees
WHERE employee_id = 113;

UPDATE employees SET department_id = 100;

SELECT * FROM employees;

-- 문제) 114번의 직무와 급여를 205번 사원과 같게 변경
SELECT job_id, salary FROM employees
WHERE employee_id = 205;

SELECT job_id, salary FROM employees
WHERE employee_id = 114;

UPDATE employees
SET job_id = 'AC_MGR', salary = 12008
WHERE employee_id = 114;

UPDATE employees
SET job_id = (SELECT job_id FROM employees WHERE employee_id = 205), 
    salary = (SELECT salary FROM employees WHERE employee_id = 205)
WHERE employee_id = 114;

SELECT * FROM employees
WHERE employee_id = 114;

-- CRUD C : insert, R : select, U : update, D : delete

DELETE FROM departments;
INSERT INTO departments
SELECT * FROM hr.departments;
SELECT * FROM hr.departments;

-- 문제) 200이 가진 직무와 같은 사원들의 부서장이 114인 부서로 변경
SELECT job_id FROM employees WHERE employee_id = 200;
SELECT * FROM employees WHERE job_id = 'AD_ASST';

SELECT department_id FROM departments
WHERE manager_id = 114;

UPDATE employees
SET department_id = 30
WHERE job_id = 'AD_ASST';

UPDATE employees
SET department_id = (SELECT department_id FROM departments WHERE manager_id = 114)
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 200);

-- 문제) 부서명이 'Finance'인 부서를 삭제
SELECT * FROM departments WHERE department_name = 'Finance';

DELETE FROM departments
WHERE department_name = 'Finance';

SELECT * FROM departments;

DELETE FROM departments;
SELECT * FROM departments;
ROLLBACK;
SELECT * FROM departments;
-- 문제) 사원번호가 114인 사원을 삭제
DELETE FROM employees WHERE employee_id = 114;

-- 문제) 부서번호가 30, 40인 부서 삭제
DELETE FROM departments WHERE department_id IN(30, 40);


INSERT INTO departments
SELECT * FROM hr.departments;

INSERT INTO employees
SELECT * FROM hr.employees;

-- 문제) 부서명이 'Public'를 포함하고 있는 부서에 속해 있는 사원들 정보 삭제
SELECT department_id, department_name FROM departments WHERE department_name LiKE '%Public%';

SELECT * FROM employees WHERE department_id = 70;

DELETE FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name LIKE '%Public%');

SELECT * FROM employees;

TRUNCATE TABLE employees;
TRUNCATE TABLE departments;
--> 테이블 전체 내용 삭제

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id,
                        salary, department_id)
VALUES(9998, 'Taylor', 'DTAYLOR', sysdate, 'ST_CLERK', 5000, 50);

SELECT * FROM employees;

INSERT INTO (SELECT employee_id, last_name, email, hire_date, job_id,
                        salary, department_id 
              FROM employees
              WHERE department_id = 50)
VALUES(9999, 'Taylor', 'DTAYLOR', sysdate, 'ST_CLERK', 5000, 100);

SELECT * FROM employees;

INSERT INTO (SELECT employee_id, last_name, email, hire_date, job_id,
                        salary, department_id 
              FROM employees
              WHERE department_id = 50)
VALUES(9997, 'Taylor', 'DTAYLOR', sysdate, 'ST_CLERK', 5000, 100);

SELECT * FROM employees;

INSERT INTO (SELECT employee_id, last_name, email, hire_date, job_id,
                        salary, department_id 
              FROM employees
              WHERE department_id = 50 WITH CHECK OPTION)
VALUES(9997, 'Taylor', 'DTAYLOR', sysdate, 'ST_CLERK', 5000, 100);
--> 실행 안됨

INSERT INTO (SELECT employee_id, last_name, email, hire_date, job_id,
                        salary, department_id 
              FROM employees
              WHERE department_id = 50 WITH CHECK OPTION)
VALUES(9997, 'Taylor', 'DTAYLOR', sysdate, 'ST_CLERK', 5000, 50);

SELECT * FROM employees;

-- TCL : commit, rollback, savepoint
-- DDL : create, alter, drop
-- DML : insert, select, update, delete
-- DCL : grant, revoke

ROLLBACK;
SELECT * FROM employees;
SELECT * FROM departments;

INSERT INTO employees
SELECT * FROM hr.employees;

SELECT * FROM employees;

INSERT INTO departments
SELECT * FROM hr.departments;

SELECT * FROM departments;

COMMIT;
ROLLBACK;
SELECT * FROM employees;
SELECT * FROM departments;

DELETE FROM employees
WHERE job_id LIKE '%REP%';

SELECT * FROM employees
WHERE job_id LIKE '%REP%';

SAVEPOINT a;

DELETE FROM employees
WHERE department_id = 90;

SELECT * FROM employees
WHERE department_id = 90;

SAVEPOINT b;

DELETE FROM employees;
SELECT * FROM employees;
ROLLBACK TO b;
SELECT * FROM employees;
SELECT * FROM employees WHERE department_id = 90;

ROLLBACK a;
SELECT * FROM employees WHERE department_id = 90;
SELECT * FROM employees WHERE job_id LIKE '%REP%';

-- CONSTRAINT
DROP TABLE employees;

CREATE TABLE employees(
    employee_id NUMBER(6) NOT NULL CONSTRAINT emp_eployee_id_pk primary key,
    first_name VARCHAR2(20) NOT NULL,
    last_name VARCHAR2(25) NOT NULL,
    email VARCHAR2(25) CONSTRAINT emp_email_uk UNIQUE,
    phone_number VARCHAR2(20),
    hire_date DATE DEFAULT sysdate CONSTRAINT emp_hire_date_nn NOT NULL,
    job_id VARCHAR2(10) CONSTRAINT emp_job_id_nn NOT NULL,
    salary NUMBER(8,2),
    commission_pct NUMBER(2,2),
    manager_id NUMBER(6),
    department_id NUMBER(4),
    -- CONSTRAINT emp_department_id_fk REFERENCES departments(department_id)
    CONSTRAINT emp_department_id_fk FOREIGN KEY(department_id) 
    REFERENCES departments(department_id)
);

INSERT INTO employees(employee_id, first_name, last_name, hire_date, job_id)
VALUES(110, 'Rhee', 'Soong', null, 'AD_REP');
--> 실제 값이 존재해야 함

SELECT * FROM employees;

INSERT INTO employees (employee_id, first_name, last_name, hire_date, job_id)
VALUES();

DROP TABLE departments;
CREATE TABLE departments(
    department_id NUMBER(4) NOT NULL,
    department_NAME VARCHAR2(30) NOT NULL,
    manager_id NUMBER,
    location_id NUMBER(4),
    CONSTRAINT dept_manager_id_uk UNIQUE(manager_id),
    CONSTRAINT dept_departmnet_id_pk PRIMARY KEY(department_id)
);

SELECT * FROM departments;

INSERT INTO departments
SELECT * FROM hr.departments;

SELECT * FROM departments;

INSERT INTO departments(department_id, department_name)
VALUES(280, 'smrit');

INSERT INTO departments(department_id, department_name, manager_id)
VALUES(280, 'smrit', 204);
--> unique constraint (SMART.DEPT_MANAGER_ID_UK) violated

SELECT * FROM departments;

SELECT * FROM user_constraints WHERE table_name = 'EMPLOYEES';
SELECT * FROM user_constraints WHERE table_name = 'DEPARTMENTS';

INSERT INTO departments
SELECT * FROM hr.departments;

SELECT * FROM departments;

INSERT INTO employees
VALUES(102, 'Lex', 'De Hann', 'LDEHAAN', '515.123.4569', '01/01/13', 'AD_VP', 17000,
        null, 100, 90);
        
SELECT * FROM employees;

-- 문제) 부서에 있는 90부서 삭제
DELETE FROM departments
WHERE department_id = 90;
--> 참조되고 있는 것이기 때문에 삭제 불가
--> 먼저 자식이 삭제가 되고 부모가 삭제되어야 함
DELETE FROM employees
WHERE department_id = 90;

DELETE FROM departments
WHERE department_id = 90;