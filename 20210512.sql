select * from hr.employees;

-- 문제) 사원 테이블에서 사원번호와 이름, 급여, 직무, 부서번호
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID, DEPARTMENT_ID FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY + 300, SALARY FROM HR.employees;

-- 문제) 사원 테이블에서 사원번호, 부서번호, 직무, 급여 출력하는데 연봉으로
SELECT employee_id, department_id, job_id, salary * 12 FROM hr.employees;

-- 문제) 사원 테이블에서 사원번호, 부서번호, 직무, 연봉을 출력하는데 매월 300씩 보너스 지급
SELECT employee_id, department_id, job_id, (salary + 300) * 12 FROM hr.employees;

-- 문제) 사원 테이블에서 사원번호, 부서번호, 직무, 연봉을 출력하는데 마지막달에 300이 특별 보너스로 지급
SELECT employee_id, department_id, job_id, (salary * 12) + 300 FROM hr.employees;

-- 문제) 사원 테이블에서 사원번호, 이름, 입사일, 급여, 급여의 30% 커미션
SELECT employee_id, first_name, hire_date, salary, salary * 0.3 FROM hr.employees;

-- 문제) 사원번호, 이름, 급여, 급여에 대한 커미션 출력
SELECT employee_id, first_name, salary, commission_pct, salary * commission_pct FROM hr.employees;

-- 별칭 (alias)
SELECT employee_id AS e_id, first_name f_name, last_name "l name", department_id "D_id" FROM hr.employees;

-- 문제) 사원번호와 급여를 출력하는 사이에 아래 내용이 출력
-- "kingSteven의 직무는 AD_PRES입니다"
SELECT employee_id, first_name || '의 직무는 ' || job_id || '입니다.', salary FROM hr.employees; 

SELECT DISTINCT department_id FROM hr.employees;

SELECT DISTINCT department_id, first_name, salary FROM hr.employees;

-- 직무와 입사일이 서로 다른 사원은?
SELECT DISTINCT job_id, hire_date FROM hr.employees;

-- 모든 사원들 중에서 90인 부서의 사원만 출력
SELECT * FROM hr.employees
WHERE department_id = 90;

-- 사원번호, 성, 직무, 부서를 출력
SELECT employee_id, last_name, job_id, department_id FROM hr.employees;

-- 사원번호, 성, 직무, 부서를 출력할 떄 90인 부서만 출력
SELECT employee_id, last_name, job_id, deparment_id FROM hr.employees
WHERE department_id = 90;

SELECT * FROM hr.employees
WHERE first_name = 'Nancy';

SELECT * FROM hr.employees WHERE employee_id = 110;

-- 문제) 급여가 3000 이상인 사원들의 성과 급여를 출력하시오.
SELECT last_name, salary FROM hr.employees
WHERE salary >= 3000;

-- 문제) 입사일이 06/01/03보다 늦게 입사한 사원
SELECT employee_id, first_name, salary FROM hr.employees
WHERE hire_date > '06/01/03';

-- 문제) 급여가 3000이 아닌 사원을 모두 출력
SELECT employee_id, first_name, salary FROM hr.employees
WHERE salary != 3000;

-- 문제) 성이 King부터 Smith 사이에 있는 사원들 출력
SELECT * FROM hr.employees 
WHERE last_name BETWEEN 'King' AND 'Smith';

-- 문제) 입사일이 02/06/07 부터 06/01/03사이에 입사한 사원 출력
SELECT * FROM hr.employees
WHERE hire_date BETWEEN '02/06/07' AND '06/01/03';

-- 문제) 부서가 50, 70, 90인 사원들의 사원번호, 이름, 상사, 급여 출력
SELECT employee_id, first_name, manager_id, salary, department_id FROM hr.employees
WHERE department_id IN (50, 70, 90);

-- 문제) 상사가 100, 101, 102인 사원들
SELECT * FROM hr.employees
WHERE manager_id IN (100, 101, 102);

SELECT last_name FROM hr.employees
WHERE last_name LIKE 'S%';

SELECT hire_date FROM hr.employees
WHERE hire_date Like '02%';

-- 문제) 04년도에 입사한 사원들 출력
SELECT * FROM hr.employees
WHERE hire_date LIKE '04%';

-- 문제) 직무에 'ST'로 시작하는 사원
SELECT * FROM hr.employees
WHERE job_id LIKE 'ST%';

-- 문제) 이메일이 'MW'로 시작하는 사원
SELECT * FROM hr.employees
WHERE email LIKE 'MW%';

-- 문제) 직무가 'ST'로 끝나는 사원
SELECT * FROM hr.employees
WHERE job_id LIKE '%ST';

-- 문제) 직무에 'CL'이 포함된 사원들
SELECT * FROM hr.employees
WHERE job_id LIKE '%CL%';

-- 문제) 직무에 'ST'이 포함된 사원들
SELECT * FROM hr.employees
WHERE job_id LIKE '%ST%';

-- 문제) 07년도에 입사하거나 07월에 입사하거나 07일에 입사한 사원들
SELECT * FROM hr.employees
WHERE hire_date LIKE '%07%';

-- 문제) 이메일에 첫번째 글자가 'K'로 시작하는 사원들
SELECT * FROM hr.employees
WHERE email LIKE 'K%';

-- 문제) 이메일에 두번째 글자가 'K'인 사원들
SELECT * FROM hr.employees
WHERE email LIKE '_K%';

-- 문제) 성에 두번째 글자가 'o'인 사원들
SELECT * FROM hr.employees
WHERE last_name LIKE '_o%';

-- 문제) 이메일에 세번째 글자가 'O'인 사원들
SELECT * FROM hr.employees
WHERE email LIKE '__O%';

-- 문제) 이메일 마지막의 글자가 'O'인 사원들
SELECT * FROM hr.employees
WHERE email LIKE '%O';

-- 문제) 이메일 마지막에서 두번째 글자가 'O'인 사원들
SELECT * FROM hr.employees
WHERE email LIKE '%O_';

-- 문제) 이메일의 앞에서 두번째가 K이고 뒤에서 두번째가 O인 사원들
SELECT * FROM hr.employees
WHERE email LIKE '_k%O_';

SELECT * FROM hr.employees
WHERE email LIKE '_A%I_';

-- IT_로 시작하는 직무
SELECT * FROM hr.employees
WHERE job_id LIKE 'IT\_%';

-- 문제) 커미션을 받지 못하는 직원들을 출력
SELECT * FROM hr.employees
WHERE commission_pct IS NULL;

-- 문제) 상사가 없는 직원들 출력
SELECT * FROM hr.employees
WHERE manager_id IS NULL;

-- 문제) 부서가 없는 직원들 출력
SELECT * FROM hr.employees
WHERE department_id IS NULL;

-- 문제) 급여가 5000부터 10000사이인 직원
SELECT * FROM hr.employees
WHERE salary BETWEEN 5000 AND 10000;

SELECT * FROM hr.employees
WHERE salary >= 5000 AND salary <= 10000;

-- 문제) 입사일이 03/06/17에서 05/09/21 사이에 입사한 사원들
SELECT * FROM hr.employees
WHERE hire_date BETWEEN '03/06/17' AND '05/09/21';

SELECT * FROM hr.employees
WHERE hire_date >= '03/06/17' AND hire_date <= '05/09/21';

-- 문제) 급여가 10000이상이면서 직무에 'MAN'이 포함되어있는 사원들
SELECT * FROM hr.employees
WHERE SALARY >= 10000 AND job_id LIKE '%MAN%';

SELECT * FROM hr.employees
WHERE SALARY >= 10000 OR job_id LIKE '%MAN%';

-- 'AD_PRED', 'AD_VP', 'IT_PROG'인 사원
SELECT * FROM hr.employees
WHERE job_id IN ('AD_PRED', 'AD_VP', 'IT_PROG');

-- 'AD_PRED', 'AD_VP', 'IT_PROG'아닌 사원
SELECT * FROM hr.employees
WHERE job_id NOT IN ('AD_PRED', 'AD_VP', 'IT_PROG');

-- 급여가 5000이상이고 10000이하가 아닌 사원
SELECT * FROM hr.employees
WHERE salary NOT BETWEEN 5000 AND 10000;

SELECT * FROM hr.employees
WHERE salary < 5000 OR salary > 10000;

-- 직무가 IT_PROG이거나 ST_MAN이면서 급여가 6000이상
SELECT * FROM hr.employees
WHERE job_id = 'IT_PROG' AND salary >= 6000
OR job_id = 'ST_MAN' AND salary >= 6000;

SELECT * FROM hr.employees
WHERE job_id in ('IT_PROG', 'ST_MAN') AND salary >= 6000;

-- 'IT_PROG'이거나 'ST_MAN'이거나 급여가 6000 이상인 사원들
SELECT * FROM hr.employees
WHERE job_id = 'IT_PROG' OR job_id = 'ST_MAN' OR salary >= 6000;

-- 입사일이 빠른 사람부터 늦은 사람 순으로 정렬
SELECT * FROM hr.employees
ORDER BY hire_date;

SELECT * FROM hr.employees
ORDER BY hire_date ASC;

-- 입사일 늦은 사원부터
SELECT * FROM hr.employees
ORDER BY hire_date DESC;

-- 사원번호 이름 입사일 급여 부서번호 출력할 때 급여 제일 많이 받는 순
-- 급여에 sal로 별칭
SELECT employee_id, first_name, hire_date, salary AS sal, department_id
FROM hr.employees
ORDER BY sal DESC;

-- 부서가 오름차순으로 정렬된 상태에서 부서내에 있는 직무 오름차순
SELECT * FROM hr.employees
ORDER BY department_id ASC, job_id ASC;

-- 부서가 오름차순으로 정렬된 상태에서 부서내에 있는 직무 내림차순
SELECT * FROM hr.employees
ORDER BY department_id ASC, job_id DESC;

-- 80인 부서에 있는 사원을 입사일이 늦은 사원부터 출력
SELECT * FROM hr.employees
WHERE department_id = 80
ORDER BY hire_date DESC;
