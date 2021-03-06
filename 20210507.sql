select * from HR.employees;
select employee_id, first_name, email, hire_date from HR.employees;

select employee_id, first_name, 3 * 10 from hr.employees;

select * from HR.departments;

select department_name, department_id from hr.departments;

select manager_id, department_id, location_id from hr.departments;

select * from hr.employees;

--      사번          이름          성       이메일     휴대폰       고용날짜
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE,
--      직무번호   급여     커미션 퍼센트   직속 상사       부서 번호   
        JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID FROM HR.EMPLOYEES;
        
-- 문제) 사원 테이블에서 사원번호와 이름, 급여, 직무, 부서번호를 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID, DEPARTMENT_ID FROM HR.EMPLOYEES;

-- 문제) 사원 테이블에서 사원번호, 부서번호, 직무, 급여 출력하는데 급여를 연봉으로 출력
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, SALARY * 12 FROM HR.EMPLOYEES;

-- 문제) 사원 테이블에서 사원번호, 부서번호, 직무, 연봉을 출력하는데 매월 300씩 보너스가 지급
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, (SALARY + 300) * 12 FROM HR.EMPLOYEES;

-- 문제) 사원 테이블에서 사원번호, 부서번호, 직무, 연봉 출력하는데 마지막 달에 300이 특별 보너스
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, (SALARY * 12) + 300 FROM HR.EMPLOYEES;

-- 문제) 사원 테이블에서 사원번호, 부서번호, 직무, 급여에 대한 커미션 출력하는데 모든 사원 커미션은 급여의 30%
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, SALARY * 0.3 FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT, DEPARTMENT_ID FROM HR.EMPLOYEES;

-- 문제) 사원 테이블에서 사원번호, 이름, 급여, 커미션퍼센트, 커미션 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT, SALARY * COMMISSION_PCT FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY * NULL FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT * 300 FROM HR.EMPLOYEES;

-- 문제) 사원번호, 이름, 직무, 부서번호, 급여, 연봉 출력하는데 마지막 달에는 2500이 특별 상여금으로 지급
--                                                                                  별칭(ALIAS)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, SALARY, (SALARY * 12) + 2500 AS YEAR_SEL FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, SALARY, (SALARY * 12) + 2500 "YEAR SEL" FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, SALARY, (SALARY * 12) + 2500 aaaa FROM HR.EMPLOYEES; -- 대문자 출력

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, SALARY, (SALARY * 12) + 2500 "Aaaaa" FROM HR.EMPLOYEES; -- 대소문자 구분

-- 문자열 붙이기 연산자
select 'rhee' + 'soongmoo' from dual; -- (x)

SELECT 'Rhee' || 'SoongMoo' FULLNAME FROM DUAL;

select 10 + 5, 10 - 5, 10 * 5, 10 / 5 from dual;

-- 문제) 사원 테이블에서 사원번호, 사원 전체이름, 급여, 부서 출력
SELECT EMPLOYEE_ID, LAST_NAME || FIRST_NAME AS FULLNAME, SALARY, DEPARTMENT_ID FROM HR.EMPLOYEES;

-- 문제) 사원번호, 급여를 출력하는 사이에 "KingSteven의 직무는 AD_PRES입니다." 출력
SELECT EMPLOYEE_ID, LAST_NAME || FIRST_NAME || '의 직무는 ' || JOB_ID || '입니다.' AS SENTANCE, SALARY FROM HR.EMPLOYEES;
