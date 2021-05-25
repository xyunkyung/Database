DESC HR.DEPARTMENTS;

-- 3. EMPLOYEES테이블 구조 표시, 이름, 직무, 입사일 출력
DESC HR.EMPLOYEES;
SELECT FIRST_NAME, JOB_ID, HIRE_DATE FROM HR.EMPLOYEES;

-- 4. 사원번호, 성, 직무, 입사일 출력
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, HIRE_DATE FROM HR.EMPLOYEES;

-- 5. 사원 테이블에서 직무를 출력할 때 중복없이 출력
SELECT DISTINCT JOB_ID FROM HR.EMPLOYEES;

-- 6. 사원 번호는 EMP #, 이름은 EMPLOYEE, 직무는 JOB, 입사일은 HIRE DATE로
SELECT EMPLOYEE_ID "EMP #", FIRST_NAME EMPLOYEE, JOB_ID JOB, HIRE_DATE "HIRE DATE"
FROM HR.EMPLOYEES;

--7. 직무와 이름을 붙여서 출력하되 사이에 ',' 들어가도록
SELECT JOB_ID || ',' || FIRST_NAME FROM HR.EMPLOYEES;

-- 9. 급여가 12,000이 넘는 사원의 이름과 급여 출력
SELECT FIRST_NAME, SALARY FROM HR.EMPLOYEES
WHERE SALARY > 12000;

-- 10. 사원 번호 176인 사원의 이름과 부서번호 출력
SELECT FIRST_NAME, DEPARTMENT_ID FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID = 176;

-- 11. 입사일이 2002년 2월 20일 부터 2002년 5월 1일 사이에 입사한 사원
-- 사원의 이름, 직무 및 입사일 출력
SELECT FIRST_NAME, JOB_ID, HIRE_DATE FROM HR.EMPLOYEES
WHERE HIRE_DATE BETWEEN '02/02/20' AND '02/05/01';

-- 12. 관리자가 없는 사원 출력
SELECT * FROM HR.EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 13. 직무에 'AP'가 포함되어 있는 사원들 모두 출력
SELECT * FROM HR.EMPLOYEES
WHERE JOB_ID LIKE '%AP%';

-- 14. 사원 테이블에서 직무에 MAN을 포함하고 급여가 10000이상인 
-- 사원 번호와 성과 직무, 급여 출력
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY FROM HR.EMPLOYEES
WHERE JOB_ID LIKE '%MAN%' AND SALARY >= 10000;

-- 15. 직무가 SA_REP이거나 AD_PRES이면서 급여가 15000을 초과
-- 단 성, 직무, 급여만 출력 (OR와 AND만 사용)
SELECT LAST_NAME, JOB_ID, SALARY FROM HR.EMPLOYEES
WHERE JOB_ID = 'SA_REP' OR (JOB_ID = 'AD_PRES' AND SALARY > 15000);

-- 16. 직원 테이블에서 부서 번호를 오름차순으로 정렬하여 출력
-- 부서번호, 급여, 입사일, 성
SELECT DEPARTMENT_ID, SALARY, HIRE_DATE, LAST_NAME
FROM HR.EMPLOYEES
ORDER BY DEPARTMENT_ID;

-- 17. 부서는 내림차순으로 정렬하고 입사일도 내림차순 정렬
-- 부서번호, 급여, 입사일, 성
SELECT DEPARTMENT_ID, SALARY, HIRE_DATE, LAST_NAME
FROM HR.EMPLOYEES
ORDER BY DEPARTMENT_ID DESC, HIRE_DATE DESC;

-- 18. 부서는 내림차순으로 정렬하고 입사일은 오름차순으로 정렬, 급여는 내림차순
-- 부서번호, 입사일, 급여, 성
SELECT DEPARTMENT_ID, HIRE_DATE, SALARY, LAST_NAME
FROM HR.EMPLOYEES
ORDER BY DEPARTMENT_ID DESC, HIRE_DATE, SALARY DESC;

-- 19. 성이 모두 소문자인 grant와 모두 대문자인 GRANT로 직원 찾기
SELECT * FROM HR.EMPLOYEES
WHERE LAST_NAME = INITCAP('grant') OR LAST_NAME = INITCAP('GRANT');

-- 20. 'GranT'로 입력했을 때 사원 테이블에서 성이 'Grant'인 사원
SELECT * FROM HR.EMPLOYEES
WHERE LAST_NAME = INITCAP('GranT');

-- 21. 성은 모두 대문자로 변환하고 이름 모두 소문자로 변환화여
-- 성과 이름을 붙여 출력할 때 '나는 GRNAT douglas 입니다'로 출력
SELECT '나는 ' || UPPER(LAST_NAME) || ' ' || LOWER(FIRST_NAME) || ' 입니다'
FROM HR.EMPLOYEES;

-- 22. 성과 이름 붙여 출력
SELECT CONCAT(LAST_NAME, FIRST_NAME) FROM HR.EMPLOYEES;

-- 23. 성이 Davies에서 av만 출력
SELECT SUBSTR(LAST_NAME,2,2) FROM HR.EMPLOYEES;

-- 24. 성이 두번째 글자부터 모두 출력
SELECT SUBSTR(LAST_NAME, 2) FROM HR.EMPLOYEES;

-- 25.성의 마지막 글자에서 두글자만 가져오시오
SELECT SUBSTR(LAST_NAME,-2,2) FROM HR.EMPLOYEES;

-- 26. 성의 뒤에 ON으로 끝나는 사람
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME LIKE '%on';

-- 27. 성의 뒤에 세번째 글자가 so인 사람 출력
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME LIKE '%SO_';

-- 28. 직원 정보를 출력하는데 이메일은 왼쪽에서 3글자만 출력
-- 직원번호, 성, 급여, 직무, 이메일
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, JOB_ID, SUBSTR(EMAIL,1,3)
FROM HR.EMPLOYEES;

-- 29. 직원 정보를 출력하는데 이메일은 오른쪽에서 3글자만 출력
-- 직원번호, 성, 급여, 직무, 이메일
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, JOB_ID, SUBSTR(EMAIL, -3, 3)
FROM HR.EMPLOYEES;

-- 30. 직원 정보를 출력하는데 이메일은 오른쪽에서 3글자만 출력하고 나머지 -
-- 직원 번호, 성, 급여, 직무, 이메일
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, JOB_ID, 
       LPAD(SUBSTR(EMAIL,-3,3),LENGTH(EMAIL),'-') EMAIL FROM HR.EMPLOYEES; 

-- 31. o가 있는 성 중 o가 몇번째에 있는 위치인지 출력
-- 직원번호, 성, 성 위치, 직무
SELECT EMPLOYEE_ID, LAST_NAME, INSTR(LAST_NAME, 'o')
FROM HR.EMPLOYEES;

-- 32. oc가 있는 성 중 oc가 몇번째에 있는 위치인지 출력
-- 직원번호, 성, 성의 위치, 직무
SELECT EMPLOYEE_ID, LAST_NAME, INSTR(LAST_NAME, 'oc')
FROM HR.EMPLOYEES;

-- 33. 직무에 RE가 있는 경우 RE부터 3글자만 출력
-- 직원번호, 성, 직무, 가공된 직무
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SUBSTR(JOB_ID, INSTR(JOB_ID, 'RE'), 3)
FROM HR.EMPLOYEES;

-- 34. 직원번호, 성, 입사일, 급여
-- 급여를 10칸에 출력하고 나머지 공간 앞에 * 표시
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE, LPAD(SALARY, 10, '*')
FROM HR.EMPLOYEES;

-- 35. 직원번호, 성, 입사일, 급여
-- 급여를 10칸에 출력하고 나머지 공간 뒤에 * 표시
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE, RPAD(SALARY, 10, '*')
FROM HR.EMPLOYEES;

-- 36. 직원번호, 성, 입사일, 직무 출력
-- 직무에 RE가 있다면 RE를 AB로 변경하여 출력
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE, REPLACE(JOB_ID, 'RE','AB')
FROM HR.EMPLOYEES;

-- 37. 직원번호, 연락처, 커미션, 부서번호, 급여
-- 급여를 3000으로 나누었을 때의 나머지 출력
SELECT EMPLOYEE_ID, PHONE_NUMBER, COMMISSION_PCT, DEPARTMENT_ID,
       MOD(SALARY, 3000) FROM HR.EMPLOYEES;
       
-- 38. 2002년도부터 입사한 직원들을 출력
SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE LIKE '02/%';

-- 39. 올해 오늘까지 몇주가 지났는지 확인
SELECT TRUNC((SYSDATE - TO_DATE('2021/01/01')) / 7,0) FROM DUAL;

-- 40. 직원마다 몇 년 근무했는지 출력
-- 직원번호, 성, 연락처, 부서, 근무년수
SELECT EMPLOYEE_ID, LAST_NAME, PHONE_NUMBER, DEPARTMENT_ID, 
       ROUND((SYSDATE - HIRE_DATE) / 365) FROM HR.EMPLOYEES;

-- 41. 근속년수 8년 이상인 사원들만 출력
SELECT * FROM HR.EMPLOYEES
WHERE ROUND((SYSDATE - HIRE_DATE)/365) >= 8;

-- 42. 직원의 성을 3글자만 출력 뒤에 * 세번 찍어서 출력
-- 직원번호, 입사일, 성
SELECT EMPLOYEE_ID, HIRE_DATE, SUBSTR(LAST_NAME, 1, 3) || RPAD('*', 3, '*')
FROM HR.EMPLOYEES;

-- 43. 홍길동 몇글자
SELECT LENGTH('홍길동') FROM DUAL;

-- 45. 입사일이 'YYYY-MM-DD'인 날짜를 31-05-2019 16:24:30 오전인 형태로 출력
SELECT TO_CHAR(HIRE_DATE, 'dd-mm-yyyy hh24:Mi:ss AM') FROM HR.EMPLOYEES;

-- 46. 숫자(3333333)를 3자리 마다 쉼표 찍어서 출력
SELECT TO_CHAR('3333333', '999,999,999') FROM DUAL;

-- 47. 직원 테이블에서 급여를 W33,333,333식으로 출력
SELECT TO_CHAR(SALARY, 'L999,999,999') FROM HR.EMPLOYEES;

-- 48. 직원의 2018-10-25까지의 근무 일수 계산
-- 직원번호, 부서번호, 입사일, 근무일수
SELECT EMPLOYEE_ID, DEPARTMENT_ID, HIRE_DATE,
       TO_DATE('2018-10-25', 'yyyy-mm-dd') - HIRE_DATE
FROM HR.EMPLOYEES;

-- 51. '10-25-2002'에 입사한 사원 출력
-- 직원번호, 부서번호, 입사일, 근무일수
SELECT EMPLOYEE_ID, DEPARTMENT_ID, HIRE_DATE FROM HR.EMPLOYEES
WHERE HIRE_DATE = TO_DATE('10-25-2002', 'mm-dd-yyyy');

-- 52. 연말정산 (연봉 : 급여 * 12 * 커미션
-- 직원번호, 부서번호, 급여, 연봉
SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY, (SALARY + (SALARY * COMMISSION_PCT)) * 12
FROM HR.EMPLOYEES;

-- 53. 부서가 90이거나 30인 부서의 직원 연봉
-- 직원번호, 부서번호, 급여, 연봉
SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY, SALARY * 12
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(90, 30);

-- 54. 급여가 10000이상이면 "이사급입니다"
--           7000이상이면 "부장급입니다"
--           5000이상이면 "과장급입니다"
--           나머지는 사원으로 출력하시오
-- 성과 급여 출력
SELECT LAST_NAME, SALARY, CASE WHEN SALARY > 10000 THEN '이사급입니다'
                               WHEN SALARY > 7000 THEN '부장급입니다'
                               WHEN SALARY > 5000 THEN '과장급입니다'
                               ELSE '사원' END EMP
FROM HR.EMPLOYEES;

-- 55. 급여를 2000으로 나눈 값의 목이
-- 1이면 0.09
-- 2이면 0.20
-- 3이면 0.30
-- 4이면 0.40
-- 5이면 0.42
-- 6이면 0.44
-- 나머지는 0.45만큼 세금 부여
-- 성, 급여, 세금 출력 단, 부서가 80인 사원
SELECT LAST_NAME, SALARY,
       CASE TRUNC(SALARY / 2000) WHEN 0 THEN 0.00
                                 WHEN 1 THEN 0.09
                                 WHEN 2 THEN 0.20
                                 WHEN 3 THEN 0.30
                                 WHEN 4 THEN 0.40
                                 WHEN 5 THEN 0.42
                                 WHEN 6 THEN 0.44
                                 ELSE 0.45 END TAX
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- 56. 직원 전체에서 입사일이 제일 빠른 사람과 최근에 입사한 사원
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE) FROM HR.EMPLOYEES;

-- 57. 사원의 수 출력
SELECT COUNT(*) FROM HR.EMPLOYEES;

-- 58. 직원 테이블에서 부서가 몇 개 인지 출력
SELECT COUNT(DISTINCT DEPARTMENT_ID) FROM HR.EMPLOYEES;

-- 59. 사원 테이블에서 각 부서별 급여 평균
SELECT DEPARTMENT_ID, AVG(SALARY) FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 60. 위 문제를 부서 오름차순 정렬
SELECT DEPARTMENT_ID, AVG(SALARY) FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- 61. 각 부서별 급여의 평균을 구하는 평균 값이 낮은 것 부터 출력
SELECT DEPARTMENT_ID, AVG(SALARY) FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY AVG(SALARY);

-- 62. 각 부서에 있는 사원의 직무별 급여의 평균
SELECT DEPARTMENT_ID, JOB_ID, AVG(SALARY) FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;

-- 63. 급여의 1000단위를 반올림하여 출력
SELECT ROUND(SALARY, -4) FROM HR.EMPLOYEES;

-- 64. 사원번호가 짝수인 사원
SELECT * FROM HR.EMPLOYEES
WHERE MOD(EMPLOYEE_ID, 2) = 0;

-- 66. 사원의 급여가 3000에서 6000 사이의 사원
SELECT * FROM HR.EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 6000;

-- 69. 50, 60, 90인 부서가 아닌 사원들
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID NOT IN(50,60,90);

-- 70. 직무에 'REP'포함된 직원의 급여의 합계, 평균, 최대, 최소, 사원 수
SELECT JOB_ID, AVG(SALARY), SUM(SALARY), MAX(SALARY), MIN(SALARY), COUNT(EMPLOYEE_ID)
FROM HR.EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
GROUP BY JOB_ID;

-- 71. 직원의 급여가 6000이상인 사언들의 부서별 평균을 구하고
-- 부서별 평균이 7000 이상인 부서만 출력 부서 내림차순
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM HR.EMPLOYEES
WHERE SALARY >= 6000
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >= 7000
ORDER BY DEPARTMENT_ID DESC;

-- 72. 직무가 'REP'를 포함하고 있지 않은 직원들의 직무별 급여의 합계가
-- 13000이상인 직무만 출력. 급여의 합계를 오름차순
SELECT JOB_ID FROM HR.EMPLOYEES
WHERE JOB_ID NOT LIKE '%REP%'
GROUP BY JOB_ID
ORDER BY SUM(SALARY);

-- 74. 사원 테이블에서 사원번호, 성, 급여, 상사번호를 출력하는데
-- 상사가 100, 101, 201인 사원들 출력
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, MANAGER_ID
FROM HR.EMPLOYEES
WHERE MANAGER_ID IN(100,101,201);

-- 75. 사원 테이블에서 커미션이 NULL인 사원들만 출력
SELECT * FROM HR.EMPLOYEES WHERE COMMISSION_PCT IS NULL;

-- 76. 사원 테이블에서 입사일 중 DAY가 6일인 사람들 출력
SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE LIKE '%/06';

-- 77. 사원 테이블에서 02년도에 입사한 사원들 출력
SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE LIKE '02/%';

SELECT * FROM HR.EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'yy') = '02';

-- 77. 사원 테이블에서 직무에 'A_'를 포함하고 있는 사원
SELECT * FROM HR.EMPLOYEES
WHERE JOB_ID LIKE '%A\_%' ESCAPE '\';

-- 78. 사원 테이블에서 급여가 10000 미만이고 15000 초과
SELECT * FROM HR.EMPLOYEES
WHERE SALARY NOT BETWEEN 10000 AND 15000;

-- 79. 사원 테이블에서 상사가 있는 사원들만 출력
SELECT * FROM HR.EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;

-- 80. 직무에 'SA'를 포함하고 있지 않은 사원
SELECT * FROM HR.EMPLOYEES WHERE JOB_ID NOT LIKE '%SA%';

-- 81. 사원 테이블에서 부서가 50, 70, 90이면서 급여가 10000 이상인 사원
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(50,70,90) AND SALARY >= 10000;

-- 82. 사원 테이블에서 부서가 50, 70이고 또 부서가 90이면서 급여가 10000이상인 사원
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(50,70) OR (DEPARTMENT_ID = 90 AND SALARY >= 10000);

-- 83. 사원 테이블에서 부서번호, 사원번호, 이름, 급여, 입사일을 출력할 때 부서가
-- 50,70,90인 부서의 사원을 입사일 순으로 정렬
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(50,70,90)
ORDER BY HIRE_DATE;

-- 85. 사원을 부서번호, 사번, 이름, 입사일, 직무를 출력할 때 부서번호가 90과 110
-- 부서를 오름차순 사원 입사일 기준 오름차순
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(90,110)
ORDER BY DEPARTMENT_ID, HIRE_DATE DESC;

-- 86. 사원 테이블에서 부서번호, 입사일, 사번, 이름, 직무, 급여, 급여에 커미션을 더한 값 출력
-- 이름은 COMM으로 변경 부서는 50,70,120만 출력
-- 부서는 오름차순 입사일은 내림차순 정렬
SELECT DEPARTMENT_ID, HIRE_DATE, EMPLOYEE_ID, FIRST_NAME COMM, JOB_ID, SALARY,
       SALARY * (1 + NVL(COMMISSION_PCT,0))
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(50, 70, 120)
ORDER BY DEPARTMENT_ID, HIRE_DATE DESC;

-- 87. 사원 테이블에서 사원번호, 성, 급여에 12를 곱한 값을 SAL로 출력
-- 급여에 12를 곱한 값 오름차순
SELECT EMPLOYEE_ID, LAST_NAME, SALARY * 12 SAL
FROM HR.EMPLOYEES
ORDER BY SAL;

-- 88. 성과 부서, 급여 출력하는데 급여가 4000부터 10000 사이에 있는 사원만
-- 부서를 내림차순 정렬 급여 오름차순
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM HR.EMPLOYEES
WHERE SALARY BETWEEN 4000 AND 10000
ORDER BY DEPARTMENT_ID DESC, SALARY;

-- 89. 성과 급여를 출력할 때 직무가 'MA' 포함하고 있는 사원 제외한 나머지
-- 사원들을 부서는 오름차순, 급여는 내림차순
SELECT LAST_NAME, SALARY FROM HR.EMPLOYEES
WHERE JOB_ID NOT LIKE '%MA%'
ORDER BY DEPARTMENT_ID, SALARY DESC;

-- 90. ANSI-JOIN을 사용해서 사원번호, 이름, 부서번호. 위치 출력
-- 상사가 149인 사원들만
SELECT EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, LOCATION_ID
FROM HR.EMPLOYEES E JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.MANAGER_ID = 149;

-- 직무에 4번째에서 6번째 까지 PRO가 있다면 it_program으로 출력
-- ACC가 있다면 finance_account 나머지는 business 출력
SELECT CASE SUBSTR(JOB_ID, 4, 3) WHEN 'PRO' THEN 'it_program'
                                 WHEN 'ACC' THEN 'finance_account'
                                 ELSE 'business' END JOB
FROM HR.EMPLOYEES;

-- 91. 직무에 'SA' 포함하고 있지 않은 사원들 중 직무별 급여의 합계가 10000을 초과하는
-- 직무와 급여의 합계 출력
-- 급여 합계 내림차순
SELECT JOB_ID, SUM(SALARY) FROM HR.EMPLOYEES
WHERE JOB_ID NOT LIKE '%SA%'
GROUP BY JOB_ID
HAVING AVG(SALARY) > 10000
ORDER BY SUM(SALARY) DESC;

-- 92. 부서가 20이거나 50인 부서의 사원번호화 부서번호, 부서명, 위치정보
SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.DEPARTMENT_ID IN(20,50);

-- 93. Matos라는 성을 가지고 있는 사원
-- 이 사원의 부서정보와 사원번호, 성 출력
SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND LAST_NAME = 'Matos';

-- 94. Matos라는 성을 가지고 있는 사원과 King이라는 성을 가진 사원
-- 이 사원의 부서정보와 사원번호 그리고 성 출력
SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND LAST_NAME IN('Mantos', 'King');

-- 95. King라는 성을 가지고 있는 사원이 있다
-- 이 사원의 부서정보와 사원번호 그리고 성 출력
-- ANSI-JOIN
SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM HR.EMPLOYEES E JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE LAST_NAME = 'King';

-- 96. 직원 정보를 출력할 때 그 직원의 부서정보와 직무 내용
-- 부서번호, 부서명, 직무번호, 직무내용
SELECT EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME, E.JOB_ID, JOB_TITLE
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D, HR.JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.JOB_ID = J.JOB_ID;

-- 97. 사원 정보와 부서 정보를 출력할 때 사원이 없는 부서도 출력하되
-- 200번 부서부터 260부서를 제외하고 출력
SELECT EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM HR.EMPLOYEES E LEFT OUTER JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID NOT BETWEEN 200 AND 260; 

-- 98. 입사일이 2005년도 이전에 입사한 사람들 중 
-- 부서별 최대 급여가 8000 이상인 부서와 최대 급여 출력
SELECT DEPARTMENT_ID, MAX(SALARY) FROM HR.EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'yyyy') < '2005'
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) >= 8000;

-- 99. 'IT_PROG'이면 급여를 1.10 * SALARY
-- 'ST_CLERK'이면 급여를 1.15*SALARY
-- 'SA_REP'이면 급여를 1.20*SALARY
-- 나머지 직무는 SALARY로 급여를 지불하고 HEADING NAME을 
-- "REVISED_SALARY"가 되게 하시오.
SELECT DECODE(JOB_ID, 'IT-PROG', 1.10*SALARY,
                      'ST_CLERK', 1.15*SALARY,
                      'SA_REP', 1.20*SALARY,
                      SALARY) "REVISED_SALARY"
FROM HR.EMPLOYEES;

-- 100. 커미션을 포함한 급여의 평균
-- 커미션을 받지 않은 직원도 포함
SELECT AVG(SALARY * (1+NVL(COMMISSION_PCT, 0)))
FROM HR.EMPLOYEES;

-- 101. 각 부서별 커미션을 포함한 급여의 합계
SELECT DEPARTMENT_ID, SUM(SALARY * (1 + NVL(COMMISSION_PCT, 0)))
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 102. 각 부서의 직원 수가 5명 이상인 부서만 출력
SELECT DEPARTMENT_ID, COUNT(*)
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(EMPLOYEE_ID) >= 5;

-- 103. 사원번호, 이름, 급여, 입사일, 부서번호, 부서명, 직무번호, 직무명
-- 담당하지 않는 직무도 출력, 사원이 없는 직무도 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE, E.DEPARTMENT_ID,
       DEPARTMENT_NAME, E.JOB_ID, JOB_TITLE
FROM HR.DEPARTMENTS D JOIN HR.EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID FULL OUTER JOIN HR.JOBS J
ON E.JOB_ID = J.JOB_ID;

