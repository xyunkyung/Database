SELECT employee_id, hire_date, last_name,
SUBSTR(last_name, 1, 3) || RPAD('*', 3, '*')
FROM hr.employees;

SELECT LENGTH('홍길동') FROM dual;

SELECT REPLACE('홍길동 \n', '\n', '<br>') FROM dual;

SELECT hire_date, TO_CHAR(hire_date, 'dd-mm-yyyy hh:mi:ss am') FROM hr.employees;

SELECT TO_CHAR(3333333, '999,999,999') FROM dual;

SELECT salary, TO_CHAR(salary, 'L999,999,999') FROM hr.employees;

SELECT employee_id, department_id, hire_date, TO_DATE('2018-10-25', 'yy-mm-dd') - hire_date FROM hr.employees;

SELECT employee_id, department_id, hire_date, TO_DATE('25-10-2018', 'dd-mm-yy') - hire_date FROM hr.employees;

SELECT employee_id, department_id, hire_date, TO_DATE('10-25-2018', 'mm-dd-yy') - hire_date FROM hr.employees;

SELECT employee_id, department_id, hire_date, TRUNC(sysdate - hire_date) FROM hr.employees
WHERE hire_date = TO_DATE('10-25-2002', 'mm-dd-yy');

SELECT employee_id, department_id, salary,  (salary + salary * commission_pct) * 12 AS year_sal FROM hr.employees;

SELECT employee_id, department_id, salary, (salary + salary * commission_pct) * 12 AS sal FROM hr.employees
WHERE department_id = 90 OR department_id = 30;

SELECT employee_id, last_name, salary, (salary + salary * NVL(commission_pct, 0)) * 12 AS sal FROM hr.employees;

SELECT last_name, salary,
CASE WHEN salary >= 10000 THEN '이사급입니다'
     WHEN salary >= 7000 THEN '부장급입니다'
     WHEN salary >= 5000 THEN '과장급입니다'
     ELSE '사원' END position
     FROM hr.employees;
     
SELECT last_name, salary,
CASE TRUNC(salary / 2000) WHEN 0 THEN salary * 0
                          WHEN 1 THEN salary * 0.09
                          WHEN 2 THEN salary * 0.2
                          WHEN 3 THEN salary * 0.3
                          WHEN 4 THEN salary * 0.4
                          WHEN 5 THEN salary * 0.42
                          WHEN 6 THEN salary * 0.44
                          ELSE salary * 0.45 END tax
FROM hr.employees
WHERE department_id = 80;

SELECT COUNT(employee_id) FROM hr.employees;

SELECT COUNT(DISTINCT(department_id)) FROM hr.employees;

SELECT department_id, ROUND(AVG(salary)) FROM hr.employees
GROUP BY department_id
ORDER BY department_id ASC;

SELECT department_id, ROUND(AVG(salary)) FROM hr.employees
GROUP BY department_id
ORDER BY ROUND(AVG(salary));

SELECT department_id, job_id, ROUND(AVG(salary)) FROM hr.employees
GROUP BY department_id, job_id;