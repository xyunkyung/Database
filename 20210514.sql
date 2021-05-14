SELECT first_name, 'is ', job_id, 10 FROM hr.employees;

SELECT * FROM hr.employees
WHERE department_id = 90;

SELECT employee_id, first_name, last_name, hire_date, salary, commission_pct,
        (salary + salary * NVL(commission_pct, 0)) * 12
FROM hr.employees;

SELECT ROUND(15.19345, 3), ROUND(15.19355, 3), ROUND(145.5554, 2),
        ROUND(145.5554, 1), ROUND(145.5554, 0), ROUND(145.4354, 0),
        ROUND(145.5554, -1)
FROM dual;
--> 5이상은 반올림

-- 절삭
SELECT TRUNC(15.19345, 3), TRUNC(15.19355, 2), TRUNC(145.5554, 1),
        TRUNC(145.5554, 0), TRUNC(145.5554, -1), TRUNC(145.4354, -2),
        TRUNC(145.5554, -3)
FROM dual;

-- 문제) 입사한지 며칠이 됐는지 계산
SELECT SYSDATE FROM dual;
SELECT employee_id, first_name, salary, job_id, hire_date, 
        TRUNC(sysdate - hire_date)
FROM hr.employees;

-- 문제) 입사한지 몇 주
SELECT employee_id, first_name, salary, job_id, hire_date,
        ROUND((sysdate - hire_date) / 7, 0)
        FROM hr.employees;
        
-- 문제) 입사한지 몇년 차
SELECT employee_id, first_name, salary, hire_date, job_id,
        ROUND((SYSDATE - hire_date) / 365, 0)
        FROM hr.employees;
        
-- 문제) 10을 3으로 나눈 나머지
SELECT MOD(10, 3) FROM dual;

-- 문제) 10을 3으로 나눈 몫
SELECT TRUNC(10 / 3, 0) FROM dual;

-- 문제) 급여를 500으로 나눈 나머지가 400 이상인 사원들
SELECT employee_id, MOD(salary, 500), salary FROM hr.employees;

SELECT employee_id, first_name, hire_date, job_id, salary, MOD(salary, 500)
FROM hr.employees
WHERE MOD(salary, 500) >= 400;

-- 문제) 급여를 5000으로 나눈 몫이 3을 초과한 사원들
SELECT * FROM hr.employees
WHERE TRUNC(salary / 5000, 0) > 3;

-- 문제) 오늘부터 3개월 후는 며칠
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM dual;

-- 문제) 오늘 이후의 금요일은 며칠?
SELECT SYSDATE, NEXT_DAY(SYSDATE, '금') FROM dual;

-- 문제) 입사한 다음 목요일은 며칠?
SELECT employee_id, first_name, hire_date, NEXT_DAY(hire_date, '목') 
FROM hr.employees;

-- 문제) 입사한 이후의 목요일이 '01/01/18'인 사원
SELECT employee_id, first_name, last_name, hire_date FROM hr.employees
WHERE NEXT_DAY(hire_date, '목') = '01/01/18';

-- 문제) 이번 달의 마지막 날
SELECT LAST_DAY(sysdate) FROM dual;

-- 문제) 입사한 날의 마지막 날은?
SELECT employee_id, first_name, last_name, hire_date, LAST_DAY(hire_date)
FROM hr.employees;

-- 문제) 윤년에 입사한 사원 출력
SELECT * FROM hr.employees
WHERE LAST_DAY(hire_date) LIKE '%02/29';

-- 변환 함수
-- 문자 변환 함수 TO_CHAR() : 날짜를 문자로 변환
SELECT sysdate FROM dual;
--> 21/05/14 => 2021-02-14

SELECT sysdate, TO_CHAR(sysdate, 'yyyy/mm-dd'), TO_CHAR(sysdate, 'dd/mm/yy'), TO_CHAR(sysdate, 'mm/dd/yy')
FROM dual;

-- 문제) 사원번호, 이름, 급여, 직무, 입사일을 출력
-- 입사일을 호주 방식으로 출력
SELECT employee_id, first_name, salary, job_id, TO_CHAR(hire_date, 'DD/MM/YY') FROM hr.employees;

SELECT employee_id, first_name, hire_date, 
        TO_CHAR(hire_date, 'yyyy-mm-dd hh:mi:ss am'),
        TO_CHAR(sysdate, 'yyyy-mm-dd hh:mi:ss am'),
        TO_CHAR(sysdate, 'yyyy-mm-dd hh24:mi:ss am'),
        TO_CHAR(sysdate, 'yyyy-mon-dd hh24:mi:ss am')
FROM hr.employees;

SELECT 1234567, TO_CHAR(1234567, '999,999,999.0'),
        TO_CHAR(1234567, '$999,999,999.0'),
        TO_CHAR(1234567, 'L999,999,999.0'),
        TO_CHAR(-1234567, '999,999,999mi2')
FROM dual;

SELECT employee_id, first_name, last_name, TO_CHAR(salary, '$999,999,999')
FROM hr.employees;

-- TO_DATE()
SELECT '12-25-1999', TO_DATE('12-25-1999', 'mm-dd-yyyy')
FROM dual;

-- 문제) 25-04-2003월이 지나서 입사한 사람 출력
SELECT * FROM hr.employees
WHERE hire_date > TO_DATE('25-04-2003', 'dd-mm-yyyy');

-- CASE
-- job_id이 'IT_PROG' 급여를 10% 상승
--          'ST_CHERK' 급여를 15% 상승
--          'SA_REP' 급여를 20% 상승
--           그외는 급여
SELECT employee_id, job_id, salary,
CASE job_id WHEN 'IT_PROG' THEN salary + salary * 0.1
            WHEN 'ST_CLERK' THEN salary + salary * 0.15
            WHEN 'SA_REP' THEN salary + salary * 0.2
            ELSE salary END sal
FROM hr.employees;

SELECT employee_id, job_id, salary,
CASE WHEN job_id = 'IT_PROG' THEN salary + salary * 0.1
     WHEN job_id = 'ST_CLERK' THEN salary + salary * 0.15
     WHEN job_id = 'SA_REP' THEN salary + salary * 0.2
     ELSE salary END sal
FROM hr.employees;

-- 급여가 3000이하이면 사원
--       5000이하이면 주임
--       7000이하이면 대리
--       9000이하이면 과장
--       11000이하이면 차장
--       13000이하이면 부장
--       그 이상이면 임원
SELECT employee_id, job_id, salary,
CASE WHEN salary <= 3000 THEN '사원'
     WHEN salary <= 5000 THEN '주임'
     WHEN salary <= 7000 THEN '대리'
     WHEN salary <= 9000 THEN '과장'
     WHEN salary <= 11000 THEN '차장'
     WHEN salary <= 13000 THEN '부장'
     ELSE '임원' END grade
FROM hr.employees;

-- 급여를 2000으로 나눈 몫이 0이면 급여의 0%
--                         1이면 급여의 9%
--                         2이면 급여의 20%
--                         3이면 급여의 30%
--                         4이면 급여의 40%
--                         5이면 급여의 42%
--                         6이면 급여의 44%
--                         이외 급여의 45% 세금
SELECT employee_id, job_id, salary, TRUNC(salary / 2000, 0) AS rate,
CASE WHEN TRUNC(salary / 2000, 0) = 0 THEN salary * 0
     WHEN TRUNC(salary / 2000, 0) = 1 THEN salary * 0.09
     WHEN TRUNC(salary / 2000, 0) = 2 THEN salary * 0.2
     WHEN TRUNC(salary / 2000, 0) = 3 THEN salary * 0.3
     WHEN TRUNC(salary / 2000, 0) = 4 THEN salary * 0.4
     WHEN TRUNC(salary / 2000, 0) = 5 THEN salary * 0.42
     WHEN TRUNC(salary / 2000, 0) = 5 THEN salary * 0.44
     ELSE salary * 0.45 END tax
     FROM hr.employees;
     
SELECT employee_id, job_id, salary,
DECODE (job_id, 'IT_PROG', salary + salary * 0.1
        , 'ST_CLERK', salary + salary * 0.15
        , 'SA_REP', salary + salary * 0.2
        , salary ) sal
FROM hr.employees;