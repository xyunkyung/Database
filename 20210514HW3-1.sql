SELECT salary, ROUND(salary, -4) FROM hr.employees;

SELECT * FROM hr.employees
WHERE MOD(employee_id, 2) = 0;

SELECT * FROM hr.employees
WHERE MOD(employee_id, 2) != 0;

SELECT * FROM hr.employees
WHERE salary < 3000 OR salary > 6000;

SELECT employee_id, first_name, hire_date, ROUND((sysdate - hire_date) / 7) FROM hr.employees;

SELECT * FROM hr.employees
WHERE ROUND((sysdate - hire_date) / 7) > 1000;

SELECT employee_id, first_name, hire_date, ROUND((sysdate - hire_date) / 365) FROM hr.employees;

SELECT email, SUBSTR(email, 1, 2), SUBSTR(email, 2, 2), SUBSTR(email, 3, 2) FROM hr.employees;

SELECT * FROM hr.employees
WHERE hire_date > TO_DATE('10-25-2003', 'mm-dd-yy');

SELECT salary, commission_pct, (salary + (salary * commission_pct)) * 12 FROM hr.employees;

SELECT * FROM hr.employees
WHERE department_id != 50 AND department_id != 60 AND department_id != 90;

SELECT * FROM hr.employees
WHERE hire_date < TO_DATE('10-20-2003', 'mm-dd-yy');

SELECT first_name, salary, (salary + (salary * NVL(commission_pct, 0))) * 12 AS sal FROM hr.employees
ORDER BY sal DESC;

SELECT first_name, salary, (salary + (salary * NVL(commission_pct, 0))) * 12 AS sal FROM hr.employees
WHERE department_id = 60 OR department_id = 90
ORDER BY sal DESC;

SELECT SUM(salary), AVG(salary), MAX(salary), MIN(salary), COUNT(employee_id) FROM hr.employees
WHERE job_id LIKE '%REP%';

SELECT COUNT(commission_pct) FROM hr.employees
WHERE department_id = 80;

SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id
ORDER BY AVG(salary) DESC;

SELECT department_id, AVG(salary) FROM hr.employees
WHERE salary >= 6000
GROUP BY department_id
HAVING AVG(salary) >= 7000
ORDER BY department_id DESC;

SELECT job_id, SUM(salary) FROM hr.employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) >= 13000
ORDER BY SUM(salary);