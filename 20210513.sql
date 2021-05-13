-- 문제) 최근 입사한 사람부터 출력
SELECT * FROM hr.employees
ORDER BY hire_date DESC;

-- 문제) 급여를 많이 받는 사람부터 출력하는 사번, 이름, 급여, 직무를 출력하고
-- 급여를 sal 별칭을 주어 출력
SELECT employee_id, first_name, salary AS sal, job_id FROM hr.employees
ORDER BY sal DESC;

-- 문제) 부서가 오름차순으로 정렬된 상태에서 부서 내에 있는 직무를 내림차순으로 정렬하여 출력
SELECT * FROM hr.employees
ORDER BY department_id ASC, job_id DESC;

-- 문제) 부서를 오름차순으로 정렬하고 각 부서에서 직무가 내림차순으로 정렬된 상태에서 
-- 직무에 따른 급여를 제일 많이 받는 사람부터 출력
SELECT department_id, job_id, salary, employee_id, first_name FROM hr.employees
ORDER BY department_id, job_id DESC, salary DESC;

-- 문제) 부서를 오름차순으로 정렬하여 출력하고 같은 부서에서 다른 직무를 가진 사원들이 있다면
-- 직무를 내림차순으로 정렬하고 같은 직무에서도 급여가 서로 다르므로 급여를 오름차순으로 정렬하되
-- 급여를 받는 사람들의 입사일을 오름차순으로 정렬
SELECT department_id, job_id, salary, hire_date, employee_id, first_name FROM hr.employees
ORDER BY department_id ASC, job_id DESC, salary ASC, hire_date ASC;

-- 문제) 급여가 10000이상인 사원 출력
-- 사원번호, 이름, 급여, 입사일 출력
-- 급여를 오름차순으로 정렬
SELECT employee_id, first_name, salary, hire_date FROM hr.employees
WHERE salary >= 10000
ORDER BY salary ASC;

-- 직무가 'ac_account'인 사원들을 출력
SELECT * FROM hr.employees
WHERE job_id = 'AC_ACCOUNT';

SELECT * FROM hr.employees
WHERE job_id = UPPER('ac_account');

SELECT email, LOWER(email), job_id, LOWER(job_id), UPPER(first_name), first_name FROM hr.employees;
--> SELECT는 출력 결과에만 영향을 준다.

SELECT * FROM hr.employees
WHERE job_id = UPPER('ac_account');

SELECT * FROM hr.employees
WHERE LOWER(job_id) = 'ac_account';

-- 문제) 이메일에 'ie'가 포함된 사원들을 출력
SELECT * FROM hr.employees
WHERE LOWER(email) LIKE '%ie%';

-- 문제) 이름이 'DAVID'인 사원을 출력
SELECT * FROM hr.employees
WHERE UPPER(first_name) = 'DAVID';

-- 문제) 이름과 성 모두 대문자로 출력하고 직무와 이메일 모두 소문자로 출력
-- 급여, 입사일 출력
SELECT UPPER(first_name), UPPER(last_name), LOWER(job_id), LOWER(email), salary, hire_date FROM hr.employees;

-- 문제) 이름이 'DAVID'인 사원을 출력
SELECT first_name, email, INITCAP(email), job_id, INITCAP(job_id) FROM hr.employees
WHERE FIRST_NAME = INITCAP('DAVID');

-- 문제) 사원번호, 성이름, 급여, 직무, 이메일 출력
SELECT employee_id, last_name || first_name, job_id, email FROM hr.employees;

-- 문제) "나의 이름은 KingSteven이고 내가 맡은 업무는 AD_PRES입니다."처럼 출력
SELECT '나의 이름은 ' || last_name || first_name || '이고 내가 맡은 업무는 ' || job_id || '입니다.' FROM hr.employees;

-- 문제) 사원번호, 성이름, 급여, 직무, 이메일을 출력 (CONCAT 사용)
SELECT employee_id, CONCAT(last_name, first_name), salary, job_id, email FROM hr.employees;

-- 문제) "나의 이름은 KingSteven이고 내가 맡은 업무는 AD_PRES입니다."처럼 출력
SELECT CONCAT('나의 이름은 ', CONCAT(last_name, CONCAT(first_name, CONCAT('이고 내가 맡은 업무는 ', CONCAT(job_id, '입니다.'))))) FROM hr.employees;

-- 문제) 컬럼에 있는 데이터의 길이
SELECT first_name, LENGTH(first_name), last_name, LENGTH(last_name), email, LENGTH(email), salary, LENGTH(salary) FROM hr.employees;

-- 문제) 성의 길이가 5보다 큰 사원들 출력
SELECT * FROM hr.employees
WHERE LENGTH(last_name) > 5;

-- 문제) 급여가 4자리 이상인 사원을 구하시오.
SELECT * FROM hr.employees
WHERE LENGTH(salary) > 4;

-- 문자열 자르기
-- 문제) 이메일에서 두 번째 글자부터 3글자만 출력 : SUBSTR()
SELECT employee_id, first_name, last_name, salary, email, SUBSTR(email, 2, 3) FROM hr.employees;

-- 문자열 위치 찾기
-- INSTR()
SELECT first_name, salary, job_id, email, INSTR(email, 's'), INSTR(email, 'S') FROM hr.employees;

-- 문제) 이메일에 's'가 5번째에 있는 사원 출력
SELECT * FROM hr.employees 
WHERE INSTR(LOWER(email), 's') = 5;

-- 문제) 이메일에 'W'가 있다면 'W'부터 3개만 출력
-- 그렇지 않으면 앞에서부터 3개만 출력
SELECT email, SUBSTR(email, INSTR(email, 'W'), 3) FROM hr.employees;

-- 제목...
-- 아이디 찾기 highland0 : high*****
SELECT first_name, RPAD(first_name, 15, '*'), last_name, RPAD(last_name, 15, '*') FROM hr.employees;

-- 문제) 이메일의 앞에서 3글자만 출력하고 나머지 글자는 '*' 출력
SELECT email, RPAD(SUBSTR(email, 1, 3), LENGTH(email), '*') FROM hr.employees;

-- 문자열 변경하기 : REPLACE
-- 문제) '_AS'문자가 있는 직무를 'abc'로 바꾸자
SELECT job_id, REPLACE(job_id, '_AS', 'abc') FROM hr.employees;

-- TRIM : 앞과 뒤에 있는 글자 삭제
SELECT * FROM hr.employees
WHERE email = TRIM(' ABANDA  ');

SELECT ' 이숭무 ', TRIM(' 이숭무 ') AS aa, '이숭무', ' 이 숭무 ', TRIM(' 이 숭무 ') bb FROM dual;

-- 문제) 이메일에서 양 끝에 있는 문자 'A'를 제거
SELECT email, TRIM('A' FROM email) FROM hr.employees;

-- 문제) 이메일 글자 수 만큼 '*'가 출력
SELECT email, RPAD('*', LENGTH(email), '*') FROM hr.employees;

-- 문제) 이메일 뒤에서 1글자 가져오기
SELECT email, SUBSTR(email, -1, 1), SUBSTR(email, -2, 2), SUBSTR(email, -3, 3) FROM hr.employees;

-- 문제) 010-1234-1234를 010-****-****
-- 010-123-1234를 010-***-****
-- 010-12345-1234를 010-*****-****
SELECT RPAD(SUBSTR('010-1234-1234', 0, INSTR('010-1234-1234', '-')), LENGTH('010-1234-1234'), '*') FROM dual;

SELECT '010-1234-1234', SUBSTR('010-1234-1234', 1, 4) || 
                        RPAD('*', LENGTH(SUBSTR('010-1234-1234', 5, 4)), '*') || 
                        SUBSTR('010-1234-1234', -5) FROM dual;
                        
-- 문제) 직원 테이블에서 연락처를 출력하는데 연락처의 길이가 12인 전화번호만 출력
SELECT first_name, phone_number FROM hr.employees
WHERE LENGTH(phone_number) = 12;

-- 문제) 가운데 숫자를 '*'로 출력
SELECT first_name, phone_number, SUBSTR(phone_number, 1, 4) || 
        RPAD('*', LENGTH(SUBSTR(phone_number, 5, 3)), '*') || 
        SUBSTR(phone_number, -5) FROM hr.employees
        WHERE LENGTH(phone_number) = 12;
        
-- NVL : null 값이 있는 경우 null값 대신 원하는 값 입력
SELECT NULL, NVL(NULL, 0), NVL(NULL, 100) FROM dual;

SELECT first_name, last_name, salary, hire_date, commission_pct, NVL(commission_pct, 0) FROM hr.employees;

-- 문제) 커미션을 포함한 연봉 구하기
SELECT employee_id, first_name, job_id, salary, commission_pct, (salary + salary * NVL(commission_pct, 0)) * 12 AS year_sal FROM hr.employees;

-- 문제) 직원의 커미션이 얼마인가요 커미션이 없는 직원은 0원
SELECT first_name, job_id, salary, commission_pct, salary * NVL(commission_pct, 0) FROM hr.employees;
