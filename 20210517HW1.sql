SELECT * FROM hr.employees
WHERE job_id != 'IT_PROG'
AND job_id != 'ST_CLERK'
AND job_id !='SA_REP';

SELECT * FROM hr.employees
WHERE salary < 3000 OR salary > 5000;

SELECT department_id, employee_id, first_name, hire_date FROM hr.employees
WHERE department_id = 70;

SELECT employee_id, department_id, first_name, salary FROM hr.employees
WHERE hire_date = '02/06/07';

SELECT department_id, employee_id, first_name, job_id FROM hr.employees
WHERE first_name = 'William';

SELECT department_id, employee_id, first_name, job_id, salary FROM hr.employees
WHERE job_id = 'FI_ACCOUNT';

SELECT first_name AS name, department_id did, employee_id eid, job_id FROM hr.employees
WHERE department_id >= 50;

SELECT * FROM hr.employees
WHERE salary > 4000 AND salary < 10000;

SELECT * FROM hr.employees
WHERE job_id != 'FI_ACCOUNT';

SELECT * FROM hr.employees
WHERE department_id = 50 OR department_id = 70;

SELECT * FROM hr.employees
WHERE first_name > 'Daniel';

SELECT * FROM hr.employees
WHERE first_name > 'Daniel' AND first_name < 'Julia';

SELECT * FROM hr.employees
WHERE hire_date >= '01/01/13' AND hire_date <= '06/01/03';

SELECT * FROM hr.employees
WHERE salary > 10000 AND salary < 15000;

SELECT * FROM hr.employees
WHERE department_id = 50 OR department_id = 90;

SELECT * FROM hr.employees
WHERE job_id = 'FI_MGR'
OR job_id = 'SA_MAN'
OR job_id = 'MK_MAN';

SELECT employee_id, last_name, salary, manager_id FROM hr.employees
WHERE manager_id IN(100,101,201);

SELECT employee_id, manager_id, department_id FROM hr.employees
WHERE last_name > 'Hartstein' AND last_name < 'Vargas';

SELECT employee_id, manager_id, department_id FROM hr.employees
WHERE last_name = 'Hartstein' OR last_name = 'Vargas';

SELECT * FROM hr.employees
WHERE commission_pct IS NULL;

SELECT last_name, job_id, manager_id FROM hr.employees
WHERE manager_id IS NULL;

SELECT * FROM hr.employees
WHERE department_id IS NULL;

SELECT * FROM hr.employees
WHERE first_name LIKE 'S%';

SELECT * FROM hr.employees
WHERE hire_date LIKE '%/06';

SELECT * FROM hr.employees
WHERE hire_date LIKE '02/%';

SELECT * FROM hr.employees
WHERE job_id LIKE '%MA%';

SELECT * FROM hr.employees
WHERE first_name LIKE '_s%';

SELECT * FROM hr.employees
WHERE first_name LIKE '__s%';

SELECT * FROM hr.employees
WHERE first_name LIKE '%s_';

SELECT * FROM hr.employees
WHERE job_id LIKE 'A_%';

SELECT * FROM hr.employees
WHERE salary < 10000 OR salary > 15000;

SELECT * FROM hr.employees
WHERE last_name < 'Doran' OR last_name > 'Fox';

SELECT * FROM hr.employees
WHERE department_id NOT IN(50,70,90);

SELECT last_name, job_id FROM hr.employees
WHERE job_id NOT IN('IT_PROG', 'ST_CLERK', 'SA_REP');

SELECT * FROM hr.employees
WHERE commission_pct IS NOT NULL;

SELECT * FROM hr.employees
WHERE manager_id IS NOT NULL;

SELECT * FROM hr.employees
WHERE department_id IS NOT NULL;

SELECT * FROM hr.employees
WHERE job_id LIKE '%SA%';

SELECT * FROM hr.employees
WHERE job_id NOT LIKE '%SA%';

SELECT * FROM hr.employees
WHERE department_id IN(50, 70, 90) AND salary >= 10000;

SELECT * FROM hr.employees
WHERE department_id IN(50,70) OR (department_id = 90 AND salary >= 10000);

SELECT * FROM hr.employees
WHERE department_id IN(50,70,90) AND salary >= 10000;

SELECT * FROM hr.employees
ORDER BY first_name ASC;

SELECT department_id, first_name, salary, hire_date FROM hr.employees
ORDER BY department_id ASC;

SELECT * FROM hr.employees
WHERE department_id = 90
ORDER BY first_name ASC;

SELECT department_id, employee_id, first_name, salary, hire_date FROM hr.employees
WHERE department_id IN(50,70)
ORDER BY hire_date ASC;

SELECT * FROM hr.employees
ORDER BY hire_date DESC;

SELECT department_id, employee_id, first_name FROM hr.employees
WHERE hire_date >= '02/08/16' AND hire_date < '08/01/29'
ORDER BY hire_date DESC;

SELECT department_id, employee_id, first_name, hire_date FROM hr.employees
WHERE job_id NOT LIKE 'SA%'
ORDER BY department_id DESC;

SELECT department_id, employee_id, first_name, hire_date, job_id FROM hr.employees
WHERE department_id IN(90,110)
ORDER BY department_id ASC, hire_date ASC;

SELECT department_id, hire_date, first_name, job_id, salary, salary + commission_pct AS comm
FROM hr.employees
WHERE department_id IN(50,70,120)
ORDER BY department_id ASC, hire_date DESC;

SELECT employee_id, last_name, salary * 12 AS sal FROM hr.employees
ORDER BY sal ASC;

SELECT last_name, department_id, salary FROM hr.employees
WHERE salary > 4000 AND salary < 10000
ORDER BY department_id DESC, salary ASC;

SELECT last_name, salary FROM hr.employees
WHERE job_id NOT LIKE '%MA%'
ORDER BY department_id ASC, salary DESC;