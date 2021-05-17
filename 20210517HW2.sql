SELECT employee_id, first_name, e.department_id, location_id 
FROM hr.employees e JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;

SELECT job_id,
CASE WHEN job_id LIKE '___PRO%' THEN 'it_program'
     WHEN job_id LIKE '___ACC%' THEN 'finance_account'
     ELSE 'business' END pos
FROM hr.employees;

SELECT AVG(salary), MIN(salary), MAX(salary), SUM(salary) FROM hr.employees
WHERE job_id LIKE '%REP%'
GROUP BY job_id;

SELECT department_id, MAX(salary)FROM hr.employees
GROUP BY department_id
HAVING MAX(salary) >= 10000;

SELECT job_id, SUM(salary) FROM hr.employees
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY SUM(salary) DESC;

SELECT employee_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND d.department_id IN(20, 50);

SELECT * FROM hr.departments;

SELECT d.department_id, department_name, d.manager_id, location_id, employee_id, last_name
FROM hr.departments d, hr.employees e
WHERE d.department_id = e.department_id
AND last_name = 'Matos';

SELECT d.department_id, department_name, d.manager_id, location_id, employee_id, last_name
FROM hr.departments d, hr.employees e
WHERE d.department_id = e.department_id
AND last_name IN('Matos', 'King');

SELECT d.department_id, department_name, d.manager_id, location_id, employee_id, last_name
FROM hr.departments d JOIN hr.employees e
ON d.department_id = e.department_id
WHERE last_name IN('King');

SELECT department_id, department_name, location_id
FROM hr.departments
WHERE location_id = 1400;

SELECT department_id, location_id FROM hr.departments;

SELECT department_id, department_name, job_id, job_title
FROM hr.departments, hr.jobs;

SELECT employee_id, e.department_id 
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND d.department_id < 200 OR d.department_id > 260;

SELECT employee_id, e.department_id 
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND MOD(employee_id, 2) != 0;

SELECT * FROM hr.job_history;

SELECT salary, 
CASE WHEN salary >= 15000 THEN '임원'
     WHEN salary >= 10000 THEN '부장'
     WHEN salary >= 7000 THEN '과장'
     WHEN salary >= 5000 THEN '대리'
     ELSE '사원' END pos
FROM hr.employees;

SELECT department_id FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) >= 5000;

SELECT department_id, AVG(salary) FROM hr.employees
WHERE salary >= 10000
GROUP BY department_id
HAVING AVG(salary) >= 16000;

SELECT department_id, MAX(salary) FROM hr.employees
WHERE hire_date > TO_DATE(05, 'yy')
GROUP BY department_id
HAVING MAX(salary) >= 8000;

SELECT department_id, MAX(salary) FROM hr.employees
GROUP BY department_id
HAVING MAX(salary) >= 10000;

SELECT job_id, SUM(salary) FROM hr.employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 3000
ORDER BY SUM(salary) DESC;

SELECT employee_id, department_id, hire_date, SYSDATE - hire_date AS d
FROM hr.employees
WHERE hire_date = TO_DATE('25-10-2020', 'dd-mm-yyyy');

SELECT employee_id, department_id, hire_date, SYSDATE - hire_date AS d
FROM hr.employees
WHERE hire_date = TO_DATE('01-01-2005', 'dd-mm-yyyy');

SELECT employee_id, department_id, salary, (salary + (salary * commission_pct)) * 12
FROM hr.employees;

SELECT job_id, salary,
CASE job_id WHEN 'IT_PROG' THEN salary * 1.1
            WHEN 'ST_CLERK' THEN salary * 1.15
            WHEN 'SA_REP' THEN salary * 1.2
            ELSE salary END "REVISED_SALARY"
            FROM hr.employees;
            
SELECT job_id, salary,
DECODE (job_id, 'IT_PROG', salary * 1.1
        , 'ST_CLERK', salary * 1.15
        , 'SA_REP', salary * 1.2
        , salary) "REVISED_SALARY"
FROM hr.employees;

SELECT AVG((salary +(salary * NVL(commission_pct, 0)))) FROM hr.employees;

SELECT department_id, SUM((salary +(salary * NVL(commission_pct, 0)))) FROM hr.employees
GROUP BY department_id;

SELECT department_id, COUNT(employee_id) FROM hr.employees
GROUP BY department_id
HAVING COUNT(employee_id) >= 5;

SELECT job_id, AVG(salary) FROM hr.employees
GROUP BY job_id;

SELECT employee_id, first_name, salary, hire_date, e.department_id, department_name, e.job_id, job_title
FROM hr.employees e, hr.departments d, hr.jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

SELECT employee_id, last_name, job_id, salary FROM hr.employees
WHERE job_id LIKE '%MAN%'
AND salary >= 10000;

SELECT last_name, job_id, salary FROM hr.employees
WHERE (job_id = 'SA_REP' OR job_id = 'AD_PRES') AND salary >= 15000;

SELECT department_id, salary, hire_date, last_name FROM hr.employees
ORDER BY department_id DESC, hire_date DESC;

SELECT department_id, salary, hire_date, last_name FROM hr.employees
ORDER BY department_id DESC, hire_date ASC;

SELECT department_id, salary, hire_date, last_name FROM hr.employees
ORDER BY department_id DESC, hire_date ASC, salary DESC;