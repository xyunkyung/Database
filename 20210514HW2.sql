SELECT employee_id, last_name, job_id, salary FROM hr.employees
WHERE job_id LIKE '%MAN%' AND salary >= 10000;

SELECT last_name, job_id, salary FROM hr.employees
WHERE (job_id = 'SA_REP' OR job_id = 'AD_PRES')
AND salary > 15000;

SELECT department_id, salary, hire_date, last_name FROM hr.employees
ORDER BY department_id ASC;

SELECT department_id, salary, hire_date, last_name FROM hr.employees
ORDER BY department_id DESC, hire_date DESC;

SELECT department_id, salary, hire_date, last_name FROM hr.employees
ORDER BY department_id DESC, hire_date ASC;

SELECT department_id, hire_date, salary, last_name FROM hr.employees
ORDER BY department_id DESC, hire_date ASC, salary DESC;

SELECT * FROM hr.employees
WHERE LOWER(last_name) = 'grant' AND UPPER(last_name) = 'GRANT';

SELECT * FROM hr.employees
WHERE last_name = INITCAP('GranT');

SELECT '나는 ' || UPPER(last_name) || ' ' || LOWER(first_name) || ' 입니다' FROM hr.employees;

SELECT CONCAT(last_name, first_name) FROM hr.employees;

SELECT CONCAT('나는 ', CONCAT(UPPER(last_name), CONCAT(' ', CONCAT(LOWER(first_name), ' 입니다')))) FROM hr.employees;

SELECT last_name, SUBSTR(last_name, 2, 2) FROM hr.employees;

SELECT last_name, SUBSTR(last_name, 2, LENGTH(last_name)) FROM hr.employees;

SELECT last_name, SUBSTR(last_name, -2, 2) FROM hr.employees;

SELECT * FROM hr.employees
WHERE SUBSTR(last_name, -2, 2) = 'on';

SELECT * FROM hr.employees
WHERE SUBSTR(last_name, -3, 2) = 'so';

SELECT employee_id, last_name, salary, job_id, email, SUBSTR(email, 1, 3) FROM hr.employees;

SELECT employee_id, last_name, salary, job_id, email, SUBSTR(email, -3, 3) FROM hr.employees;

SELECT employee_id, last_name, salary, job_id, email, RPAD('-', LENGTH(SUBSTR(email, 1, LENGTH(email)-3)), '-') ||
        SUBSTR(email, -3, 3) FROM hr.employees;
        
SELECT employee_id, last_name, INSTR(last_name, 'o'), job_id FROM hr.employees;

SELECT employee_id, last_name, INSTR(last_name, 'oc'), job_id FROM hr.employees;

SELECT employee_id, last_name, job_id, SUBSTR(job_id, INSTR(job_id, 'RE'), 3) FROM hr.employees;

SELECT employee_id, last_name, hire_date, salary, LPAD(salary, 10, '*') FROM hr.employees;

SELECT employee_id, last_name, hire_date, salary, RPAD(salary, 10, '*') FROM hr.employees;

SELECT employee_id, last_name, hire_date, salary, job_id, REPLACE(job_id, 'RE', 'AB') FROM hr.employees;

SELECT employee_id, phone_number, commission_pct, department_id, salary, MOD(salary, 3000) FROM hr.employees;

SELECT * FROM hr.employees
WHERE hire_date LIKE '02%';

SELECT TRUNC((sysdate - TO_DATE('2021-01-01')) / 7 ) FROM dual;

SELECT employee_id, last_name, phone_number, department_id, TRUNC((sysdate - hire_date) / 365) FROM hr.employees;

SELECT * FROM hr.employees
WHERE TRUNC((sysdate - hire_date) / 365) >= 8;