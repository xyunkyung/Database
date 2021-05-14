select employee_id, last_name, salary * 12 AS "ANNUAL SALARY"
FROM hr.employees;

DESC hr.departments;
SELECT * FROM hr.departments;

DESC hr.employees;
SELECT first_name, job_id, hire_date FROM hr.employees;

SELECT last_name, job_id, hire_date FROM hr.employees;

SELECT DISTINCT(job_id) FROM hr.employees;

SELECT employee_id AS "Emp #", first_name employee, job_id job, hire_date "Hire Date" FROM hr.employees;

SELECT job_id || ', ' || first_name FROM hr.employees;

SELECT * FROM hr.employees;
SELECT employee_id || ',' || first_name || ',' || last_name || ',' || email || ',' || phone_number ||
',' || hire_date || ',' || job_id || ',' || salary || ',' || commission_pct || ',' || manager_id || 
',' || department_id FROM hr.employees;

SELECT first_name, salary FROM hr.employees
WHERE salary > 12000;

SELECT first_name, department_id FROM hr.employees
WHERE employee_id = 176;

SELECT first_name, job_id, hire_date FROM hr.employees
WHERE hire_date > '2002-02-20' AND hire_date < '2002-05-01';

SELECT * FROM hr.employees
WHERE manager_id IS NULL;

SELECT * FROM hr.employees
WHERE job_id LIKE '%AP%';