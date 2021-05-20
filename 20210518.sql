-- 문제) 107번 사원의 사원번호, 이름, 연락처, 급여, 직무번호, 부서번호 출력
SELECT employee_id, first_name, phone_number, salary, job_id, department_id FROM hr.employees
WHERE employee_id = 107;

--문제) 107번 사원이 속해있는 60번 부서 정보 출력
SELECT * FROM hr.departments
WHERE department_id = 60;

-- 문제) 107번 직무인 직무번호 'IT_PROG' 이름 출력
SELECT job_title FROM hr.jobs
WHERE job_id = 'IT_PROG';

-- 문제) 107번 사원의 사원번호, 이름, 연락처, 급여, 직무번호, 부서번호, 부서명, 주소번호
SELECT employee_id, first_name, phone_number, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND employee_id = 107;

-- 문제) 107번 사원의 사원번호, 이름, 연락처, 급여, 직무번호, 부서번호, 직무명 출력
SELECT employee_id, first_name, phone_number, salary, e.job_id, department_id, job_title
FROM hr.employees e, hr.jobs j
WHERE e.job_id = j.job_id
AND employee_id = 107;

SELECT job_title, e.job_id, employee_id, first_name, salary, phone_number, e.department_id, department_name, location_id
FROM hr.jobs j, hr.employees e, hr.departments d
WHERE j.job_id = e.job_id AND e.department_id = d.department_id
AND employee_id = 107;

SELECT job_title, e.job_id, employee_id, first_name, salary, phone_number, e.department_id, department_name, location_id
FROM hr.jobs j JOIN hr.employees e
ON j.job_id = e.job_id JOIN hr.departments d
ON e.department_id = d.department_id
WHERE employee_id = 107;

DESC hr.locations;

SELECT * FROM hr.locations;

-- 문제) 108번 사원의 사원번호, 성, 입사일, 직무, 급여, 부서번호, 부서명, 주소번호, 주소, 시
SELECT employee_id, last_name, hire_date, job_id, salary, e.department_id, department_name, d.location_id, street_address, city
FROM hr.employees e JOIN hr.departments d 
ON e.department_id = d.department_id JOIN hr.locations l
ON d.location_id = l.location_id
WHERE employee_id = 108;

-- 비등가 조인
-- 문제) 10번 사원의 급여가 어느 직무들에 속하는지 확인
SELECT * FROM hr.employees WHERE employee_id = 109;

SELECT employee_id, last_name, salary, job_title
FROM hr.employees e, hr.jobs j
WHERE salary BETWEEN min_salary AND max_salary
AND employee_id = 109;

-- 문제) 급여가 5000부터 10000 사이에 있는 사원들만 출력
SELECT * FROM hr.employees
WHERE salary BETWEEN 5000 AND 10000;

-- 문제) 사원번호, 성, 급여, 직무, 입사일, 부서번호, 부서명
SELECT employee_id, last_name, salary, job_id, hire_date, e.department_id, department_name
FROM hr.employees e JOIN hr.departments d
ON e.department_id = d.department_id;

-- OUTER JOIN
-- 문제) 사원번호, 이름, 입사일, 급여, 직무, 부서번호, 부서명, 주소번호 출력
-- 부서가 없는 사원도 출력
SELECT employee_id, first_name, hire_date, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e LEFT OUTER JOIN hr.departments d
ON e.department_id = d.department_id;

SELECT employee_id, first_name, hire_date, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e RIGHT OUTER JOIN hr.departments d
ON e.department_id = d.department_id;

-- 문제) 부서가 없는 사원도 출력하고 사원이 없는 부서도 출력
SELECT employee_id, first_name, hire_date, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e FULL OUTER JOIN hr.departments d
ON e.department_id = d.department_id;

-- JOIN : 두 테이블에 있는 정보를 확인할 때
--> T-SQL JOIN, ANSI-JOIN, 비등가조인(BETWEEEN AND), OUTER JOIN, 3중조인
--> 조인 조건 : n-1 (n = 테이블 개수)
--> 두 테이블 조인 조건에 만족하는 것만 출력되므로 조건이 일치하지 않는 데이터는 출력 안됨
--> 어느 한쪽 테이블의 데이터를 더 출력하고 싶다면 OUTER JOIN

-- PROJECTION : 원하는 컬럼만 출력하는 것 SELECT ~ FROM
-- SELECTION : 원하는 행 출력할 때 사용 : SELECT ~ FROM ~ WHERE
-- 단일 행 함수 : 행 하나만을 인자로 받아서 결과를 가져오는 것
--> SUBSTR, INSTR, CONCAT, LPAD, RPAD, TRIM, LENGTH
--> NVL, ROUND, TRUNC, MOD, TO_CHAR, TO_DATE
-- 다중 행 함수 : SUM, AVG, MIN, MAX, COUNT
--> 여러 개 행 값을 받아서 하나의 결과 값을 출력
-- 서브쿼리 : 쿼리문 안에 쿼리문
--> 메인 쿼리문 안에 또 다른 SELECT문을 서브쿼리라고 함

-- 문제) 106번 사원의 급여와 같은 급여를 받는 사원을 출력
SELECT salary FROM hr.employees WHERE employee_id = 106;

SELECT * FROM hr.employees
WHERE salary = (SELECT salary FROM hr.employees WHERE employee_id = 106);

-- 문제) 성이 Austin이라는 사원과 같이 일하는 사원 출력
SELECT * FROM hr.employees
WHERE department_id = (SELECT department_id FROM hr.employees WHERE last_name = 'Austin');

-- 문제) 141번의 직무와 같은 직무를 하는 사원 출력
SELECT * FROM hr.employees
WHERE job_id = (SELECT job_id FROM hr.employees WHERE employee_id = 141);

-- 문제) 141번의 직무와 같은 직무를 하고 143번의 사원의 급여보다 많은 급여를 받는 사원
SELECT * FROM hr.employees
WHERE job_id = (SELECT job_id FROM hr.employees WHERE employee_id = 141)
AND salary > (SELECT salary FROM hr.employees WHERE employee_id = 143);

-- 문제) 최저 급여를 받는 사원
SELECT * FROM hr.employees
WHERE salary = (SELECT MIN(salary) FROM hr.employees);

-- 문제) 90인 부서의 평균 급여보다 많이 받는 사원
SELECT * FROM hr.employees
WHERE salary > (SELECT AVG(salary) FROM hr.employees WHERE department_id = 90);

-- 문제) 입사일이 178번보다 늦게 입사한 사원
SELECT * FROM hr.employees
WHERE hire_date > (SELECT hire_date FROM hr.employees WHERE employee_id = 178);

-- 문제) 각 부서의 평균 급여
SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id;

-- 문제) 50인 부서의 평균 급여
SELECT AVG(salary) FROM hr.employees
WHERE department_id = 50;

-- 문제) 평균 급여가 3475보다 큰 부서
SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) > 3475;

-- 문제) 50인 부서의 평균 급여보다 많은 부서
SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) > (SELECT AVG(salary) FROM hr.employees WHERE department_id = 50);

-- 문제) 60인 부서의 최저 급여보다 더 적은 급여 받는 사원
SELECT * FROM hr.employees
WHERE salary < (SELECT MIN(salary) FROM hr.employees WHERE department_id = 60);

-- 문제) 50, 60, 70인 부서의 최저 금액
SELECT department_id, MIN(salary) FROM hr.employees
GROUP BY department_id
HAVING department_id IN(50,60,70);

-- 문제) 50, 60, 70인 부서의 최저 금액과 같은 급여 받는 사원
SELECT * FROM hr.employees
WHERE salary IN (SELECT MIN(salary) FROM hr.employees WHERE department_id IN(50,60,70) GROUP BY department_id);

-- 문제) 부서의 최저 급여에 해당하는 사원
SELECT * FROM hr.employees
WHERE salary IN (SELECT MIN(salary) FROM hr.employees GROUP BY department_id);

-- 문제) 90인 부서의 급여 오름차순으로 정렬
SELECT * FROM hr.employees
WHERE department_id = 90
ORDER BY salary ASC;

-- 문제) 급여를 17000 초과 받는 사원
SELECT * FROM hr.employees
WHERE salary > 17000;

-- 문제) 90인 부서 최저 금액보다 더 많이 받는 사원
SELECT * FROM hr.employees
WHERE salary > (SELECT MIN(salary) FROM hr.employees WHERE department_id = 90);

SELECT salary FROM hr.employees
WHERE department_id = 90;

SELECT * FROM hr.employees
WHERE salary > ANY (SELECT salary FROM hr.employees WHERE department_id = 90);

-- 문제) 80인 부서의 사원들의 급여 중 제일 많이 받는 사원의 급여보다 작게 받는 사원
SELECT * FROM hr.employees
WHERE salary < (SELECT MAX(salary) FROM hr.employees WHERE department_id = 80);
--> 그룹 함수

SELECT * FROM hr.employees
WHERE salary < ANY(SELECT salary FROM hr.employees WHERE department_id = 80);
--> ANY 연산자

-- 문제) 80인 부서의 사원들 중 입사일이 제일 늦은 사원보다 먼저 입사한 사원들
SELECT * FROM hr.employees
WHERE hire_date < ANY(SELECT hire_date FROM hr.employees WHERE department_id = 80);

-- 문제) 60인 부서에서 제일 먼저 들어온 사람보다 늦게 들어온 사원
SELECT * FROM hr.employees
WHERE hire_date > ANY(SELECT hire_date FROM hr.employees WHERE department_id = 60);

-- 문제) 급여가 9000, 6000, 4800, 4200인 사원들
SELECT * FROM hr.employees
WHERE salary IN(9000,6000,4800,4200);

-- 문제) 급여가 9000, 6000, 4800, 4200일때 제일 많이 받는 사원보다 더 많이 받는 사원
SELECT * FROM hr.employees
WHERE salary > ALL(SELECT salary FROM hr.employees WHERE salary IN(9000,6000,4800,4200));
--> ALL 큰 것 보다 큰

-- 문제) IT_PROG인 직무를 가지고 있는 사원들의 급여 중 제일 많이 받는 사원보다 더 많이 받는 사원
SELECT * FROM hr.employees
WHERE salary > ALL(SELECT salary FROM hr.employees WHERE job_id = 'IT_PROG');

-- 문제) IT_PROG인 직무를 가지고 있는 사원들의 급여 중 제일 적게 받은 사원보다 더 적게 받는 사원
SELECT * FROM hr.employees
WHERE salary < ALL(SELECT salary FROM hr.employees WHERE job_id = 'IT_PROG');

-- 문제) IT_PROG인 직무를 하는 사원들과 같은 급여를 받는 사원
SELECT * FROM hr.employees
WHERE salary IN (SELECT salary FROM hr.employees WHERE job_id = 'IT_PROG');

--  SET 연산자 : 교집합, 합집합, 차집합
--> 합집합 : UNION

-- 문제) 사원 테이블에서 108번인 상사 출력하고 부서 테이블에서 80인 부서의 부서장 출력
SELECT manager_id FROM hr.employees WHERE employee_id = 108
UNION
SELECT manager_id FROM hr.departments WHERE department_id = 80;

-- 문제) 사원 테이블에서 상사를 모두 출력하고, 부서 테이블에서 부서장을 출력
SELECT manager_id FROM hr.employees
UNION
SELECT manager_id FROM hr.departments;
--> UNION : 중복 제거, 오름차순 정렬

SELECT manager_id FROM hr.employees
UNION ALL
SELECT manager_id FROM hr.departments;
--> UNION ALL : 중복 제거되지 않음, 정렬 안됨

-- 교집합
-- 문제) 직원 테이블에도 있고 부서 테이블에도 있는 관리자
SELECT manager_id FROM hr.employees
INTERSECT
SELECT manager_id FROM hr.departments;

-- 차집합
-- 문제) 부서 테이블에는 존재하지 않은 직원 테이블에 상사로 존재하는 상사
SELECT manager_id FROM hr.employees
MINUS
SELECT manager_id FROM hr.departments;

SELECT employee_id, department_id FROM hr.employees
UNION
SELECT manager_id, department_id FROM hr.departments;
--> 컬럼명이 같은 것이 아니라 열의 타입이 같으면 됨 

SELECT department_id, hire_date, to_number(null)
FROM hr.employees
UNION
SELECT department_id, to_date(null), location_id
FROM hr.departments;

SELECT department_id, manager_id, salary FROM hr.employees
UNION
SELECT department_id, manager_id, 0 FROM hr.departments;
--> 열의 개수 일치하지 않아도 오류
