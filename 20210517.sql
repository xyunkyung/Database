SELECT REPLACE('홍길동\n', '\n', '<br \>') FROM dual;

SELECT commission_pct, NVL(commission_pct, 0) FROM hr.employees;

SELECT SUM(salary), ROUND(AVG(salary)), MAX(salary), MIN(salary) FROM hr.employees;
--> 여러개의 행을 입력 받아서 하나의 결과를 가져옴

SELECT salary, SUM(salary) FROM hr.employees;
--> 다중로우 함수와 컬럼을 같이 사용할 수 없음

-- 문제) 부서가 90인 부서의 평균 급여, 최대 급여, 최소 급여, 급여의 합계
SELECT ROUND(AVG(salary)), MAX(salary), MIN(salary), SUM(salary) FROM hr.employees
WHERE department_id = 90;

-- 문제) 'REP'가 포함되어 있는 직무의 최대급여, 최소급여, 평균급여, 급여의 합계
SELECT MAX(salary), MIN(salary), AVG(salary), SUM(salary) FROM hr.employees
WHERE job_id LIKE '%REP%';

-- 문제) 입사일이 제일 빠른 사람과 입사일이 제일 늦은 사람
SELECT MIN(hire_date), MAX(hire_date) FROM hr.employees;

-- 문제) 전체 사원의 수
SELECT COUNT(employee_id), COUNT(commission_pct) FROM hr.employees;

SELECT COUNT(*) FROM hr.employees;
--> 적어도 하나의 컬럼에 값이 존재한다면 count 함

-- 문제) 50인 부서의 사원의 수
SELECT COUNT(employee_id) FROM hr.employees
WHERE department_id = 50;

-- 문제) 80인 부서의 사원의 수와 커미션을 받는 사원의 수
SELECT COUNT(employee_id), COUNT(commission_pct) FROM hr.employees
WHERE department_id = 80;

-- 문제) 50인 부서의 사원의 수와 커미션을 받는 사원의 수
SELECT COUNT(employee_id), COUNT(commission_pct) FROM hr.employees
WHERE department_id = 50;

-- 문제) 커미션을 받는 사원의 커미션의 평균과 전체 사원의 커미션의 평균
SELECT ROUND(AVG(commission_pct), 4), ROUND(SUM(commission_pct) / count(employee_id), 4),
       ROUND(AVG(NVL(commission_pct, 0)), 4)
       FROM hr.employees;
       
-- 문제) 각 직무 별 급여의 합계
SELECT job_id, sum(salary), AVG(salary), MIN(salary), MAX(salary) 
FROM hr.employees
GROUP BY job_id;

-- 문제) 각 부서에서 제일 먼저 입사한 사원과 제일 나중에 입사한 사원
SELECT department_id, MIN(hire_date), MAX(hire_date) FROM hr.employees
GROUP BY department_id
ORDER BY department_id;

-- 문제) 각 직무별 제일 먼저 입사한 사원과 제일 나중에 입사한 사원
SELECT job_id, MIN(hire_date), MAX(hire_date) FROM hr.employees
GROUP BY job_id
ORDER BY job_id;

-- 문제) 사원번호, 이름, 입사일, 직무, 부서를 출력할 때
-- 부서는 오름차순, 각 부서의 직무를 오름차순
SELECT employee_id, first_name, hire_date, job_id, department_id FROM hr.employees
ORDER BY department_id, job_id;

-- 문제) 각 부서별 직무의 급여 합계
SELECT department_id, job_id, SUM(salary) FROM hr.employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- 문제) 부서와 직무와 급여가 같은 사원의 수
SELECT department_id, job_id, salary, COUNT(*) FROM hr.employees
GROUP BY department_id, job_id, salary;

-- 문제) 급여를 7000이상을 받는 사원의 급여의 합계, 급여의 평균, 사원의 수
SELECT SUM(salary), AVG(salary), COUNT(*) FROM hr.employees
WHERE salary >= 7000;

-- 문제) 평균 급여가 7000이상인 부서만 출력
SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) >= 7000;

-- 문제) REP를 가진 직무의 부서별 평균 급여
SELECT department_id, job_id, AVG(salary) FROM hr.employees
WHERE job_id LIKE '%REP%'
GROUP BY department_id, job_id;

-- 문제) 평균 급여가 7000이상인 부서만 출력
-- 평균 급여 높은 것 부터 출력
SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) >= 7000
ORDER BY AVG(salary) DESC;

-- 문제) 부서의 직원 수가 10명 미만인 부서
SELECT department_id, COUNT(*) FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) < 10;

-- 문제) 직무에 'REP'가 포함되어 있지 않은 직무별 급여의 평균, 합계, 최소, 최대 값 출력
-- 급여의 합계가 13000이상인 직무만 출력
SELECT job_id, AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
GROUP BY job_id
HAVING job_id NOT LIKE '%REP%' 
AND SUM(salary) >= 13000;

-- 문제) 각 부서별 평균 중 가장 많이 받는 급여의 평균
SELECT MAX(AVG(salary)) FROM hr.employees
GROUP BY department_id;

-- 문제) 90인 부서에 있는 사원들 출력
-- 사원번호, 이름, 급여, 직무, 부서번호
SELECT employee_id, first_name, salary, job_id, department_id FROM hr.employees
WHERE department_id = 90;

-- 문제) 90인 부서에 있는 사원들 출력 (departments)
SELECT * FROM hr.departments
WHERE department_id = 90;

-- 문제) 80인 부서의 급여의 평균과 합계, 최소, 최대 출력
SELECT AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
WHERE department_id = 80;

-- 문제) 50인 부서의 급여의 평균과 합계, 최소, 최대 출력
SELECT AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
WHERE department_id = 50;

-- 문제) 50인 부서의 직무별 급여의 평균과 합계, 최소, 최대 출력
SELECT job_id, AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
WHERE department_id = 50
GROUP BY job_id;

-- 문제) 80인 부서의 직무별 급여의 평균과 합계, 최소, 최대 출력
SELECT job_id, AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
WHERE department_id = 80
GROUP BY job_id;

-- 문제) 30인 부서의 사원들 중 같은 날에 입사한 사원의 급여의 평균과 합계, 최소, 최대 값
SELECT AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
WHERE department_id = 30
GROUP BY hire_date;

-- JOIN : 두 테이블에 있는 내용을 출력할 때 사용
SELECT department_id, department_name, manager_id, location_id FROM hr.departments;

-- 문제) 90인 부서에 대한 사원의 사원번호, 이름, 급여, 부서번호, 부서명, 주소번호 출력
SELECT employee_id, first_name, salary, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND e.department_id = 90;
--> JOIN에서는 테이블의 별칭을 사용할 수 있음

-- 문제) 50인 부서의 사원들의 사원번호, 이름, 급여, 직무, 부서번호 출력
SELECT employee_id, first_name, salary, job_id, department_id
FROM hr.employees
WHERE department_id = 50;

-- 문제) 50인 부서의 부서번호, 부서명, 주소 번호 출력
SELECT department_id, department_name, location_id
FROM hr.departments
WHERE department_id = 50;

-- 문제) 50인 부서의 사원들의 사원번호, 이름, 급여, 직무, 부서번호, 부서명, 주소번호 출력
SELECT employee_id, first_name, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND e.department_id = 50;

-- 문제) 전 사원의 사원번호, 이름, 급여, 직무, 부서번호, 부서명, 주소번호 출력
SELECT employee_id, first_name, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id;

-- 문제) 전 사원의 이름, 입사일, 직무, 사원번호, 부서번호, 부서명, 주소 출력
SELECT first_name, hire_date, job_id, employee_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id;
--> 조인 조건은 최소 n-1개 이다. (n = 테이블 갯수)

-- 직무 정보 : jobs
SELECT * FROM hr.jobs;
SELECT job_id, job_title, min_salary, max_salary FROM hr.jobs;

-- 문제) AD_PRES인 직무를 가진 사원들의 사원번호, 이름, 급여, 부서번호, 직무번호 출력
SELECT employee_id, first_name, salary, department_id, job_id FROM hr.employees
WHERE job_id LIKE '%AD_PRES%';

-- 문제) AD_PRES의 직무정보 출력
SELECT * FROM hr.jobs
WHERE job_id LIKE '%AD_PRES%';

-- 문제) AD_PRES인 직무를 가진 사원들의 사원번호, 이름, 급여, 부서번호, 직무번호, 직무명 출력
SELECT employee_id, first_name, salary, department_id, e.job_id, job_title
FROM hr.employees e, hr.jobs j
WHERE e.job_id = j.job_id
AND e.job_id LIKE 'AD_PRES';

-- 문제) FI_MGR인 직무를 가진 사원들의 사원번호, 이름, 급여, 부서번호, 직무번호, 직무명 출력
SELECT employee_id, first_name, salary, department_id, e.job_id, job_title 
FROM hr.employees e, hr.jobs j
WHERE e.job_id = j.job_id
AND e.job_id LIKE 'FI_MGR';

-- 문제) ST_MAN인 직무를 가진 사원들의 사원번호, 이름, 급여, 부서번호, 직무번호, 직무명 출력
SELECT employee_id, first_name, salary, department_id, e.job_id, job_title 
FROM hr.employees e, hr.jobs j
WHERE e.job_id = j.job_id
AND e.job_id LIKE 'ST_MAN';

-- 문제) 90인 부서의 사원의 이름, 입사일, 직무, 사원번호, 부서번호, 부서명, 주소
-- T-SQL JOIN
SELECT first_name, hire_date, job_id, employee_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND e.department_id = 90;

-- ANSI JOIN
SELECT first_name, hire_date, job_id, employee_id, e.department_id, department_name, location_id
FROM hr.employees e JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.department_id = 90;

-- 문제) ST_MAN인 직무를 가진 사원들의 사원번호, 이름, 급여, 부서번호, 직무번호, 직무명 출력 (ANSI JOIN)
SELECT employee_id, first_name, salary, department_id, e.job_id, job_title
FROM hr.employees e JOIN hr.jobs j
ON e.job_id = j.job_id
WHERE j.job_id LIKE 'ST_MAN';

-- 문제) 114번이 상사인 사원의 사원번호, 이름, 급여, 부서번호, 직무번호, 상사 출력
SELECT employee_id, first_name, salary, department_id, job_id, manager_id FROM hr.employees
WHERE manager_id = 114;

-- 문제) 부서장이 114번인 부서를 출력
SELECT * FROM hr.departments
WHERE manager_id = 114;

-- 문제) 부서장이 상사인 사원의 이름, 입사일, 직무, 부서번호, 부서명, 주소
SELECT first_name, hire_date, job_id, e.department_id, department_name, location_id, e.manager_id
FROM hr.employees e JOIN hr.departments d
ON e.manager_id = d.manager_id;

-- 문제) 114번이 부서장인 직원들의 사원번호, 이름, 직무, 커미션, 입사일, 급여, 부서번호, 부서명 출력
SELECT employee_id, first_name, job_id, commission_pct, hire_date, salary, e.department_id, department_name
FROM hr.employees e JOIN hr.departments d
ON e.manager_id = d.manager_id
WHERE d.manager_id = 114;

-- 문제) 120번의 사원번호, 이름, 입사일, 급여, 직무번호, 부서번호
SELECT employee_id, first_name, hire_date, salary, job_id, department_id
FROM hr.employees
WHERE employee_id = 120;

-- 문제) 30번 부서정보(부서번호, 부서명, 주소번호) 출력
SELECT department_id, department_name, location_id
FROM hr.departments;

-- 문제) ST_MAN의 직무번호, 직무명 출력
SELECT job_id, job_title
FROM hr.jobs WHERE job_id LIKE 'ST_MAN';

-- 문제) 120번의 사원번호, 이름, 입사일, 급여, 직무번호, 부서번호, 부서명, 주소번호
SELECT employee_id, first_name, hire_date, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e JOIN hr.departments d
ON e.department_id = d.department_id
WHERE employee_id = 120;

-- 문제) 120번의 사원번호, 이름, 입사일, 급여, 직무번호, 부서번호
SELECT employee_id, first_name, hire_date, salary, job_id, department_id
FROM hr.employees
WHERE employee_id = 120;

-- 문제) 120번의 사원번호, 이름, 입사일, 급여, 직무번호, 직무명, 부서번호
SELECT employee_id, first_name, hire_date, salary, e.job_id, job_title, department_id
FROM hr.employees e JOIN hr.jobs j
ON e.job_id = j.job_id
WHERE employee_id = 120;

-- 3중 조인
-- 문제) 120번 사원의 직무명, 직무번호, 사원번호, 이름, 입사일, 급여, 부서번호, 부서명
SELECT job_title, j.job_id, employee_id, first_name, hire_date, salary, e.department_id, department_name
FROM hr.jobs j, hr.employees e, hr.departments d
WHERE j.job_id = e.job_id AND e.department_id = d.department_id
AND employee_id = 120;

-- 문제) 115번 사원의 사원번호, 이름, 급여, 직무, 부서번호
SELECT employee_id, first_name, salary, job_id, department_id FROM hr.employees
WHERE employee_id = 115;

-- 문제) 30번 부서의 부서번호, 부서명, 주소번호 출력
SELECT department_id, department_name, location_id FROM hr.departments
WHERE department_id = 30;

SELECT employee_id, first_name, salary, job_id, e.department_id, department_name
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND employee_id = 115;

-- 문제) 115번 사원의 사원번호, 이름, 급여, 직무, 부서번호
SELECT employee_id, first_name, salary, job_id, department_id FROM hr.employees
WHERE employee_id = 115;

-- 문제) PU_CLERK의 직무번호, 직무명 출력
SELECT job_id, job_title FROM hr.jobs
WHERE job_id = 'PU_CLERK';

SELECT employee_id, first_name, salary, department_id, e.job_id, job_title
FROM hr.employees e, hr.jobs j
WHERE e.job_id = j.job_id
AND j.job_id = 'PU_CLERK';

-- 문제) 사원 115번의 직무명, 직무번호, 사원번호, 이름, 급여, 입사일, 상사, 부서번호, 부서명 출력
SELECT job_title, e.job_id, employee_id, first_name, salary, hire_date, e.manager_id, e.department_id, department_name
FROM hr.jobs j, hr.employees e, hr.departments d
WHERE j.job_id = e.job_id AND e.department_id = d.department_id
AND employee_id = 115;