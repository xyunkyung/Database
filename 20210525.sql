DESC HR.DEPARTMENTS;

-- 3. EMPLOYEES���̺� ���� ǥ��, �̸�, ����, �Ի��� ���
DESC HR.EMPLOYEES;
SELECT FIRST_NAME, JOB_ID, HIRE_DATE FROM HR.EMPLOYEES;

-- 4. �����ȣ, ��, ����, �Ի��� ���
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, HIRE_DATE FROM HR.EMPLOYEES;

-- 5. ��� ���̺��� ������ ����� �� �ߺ����� ���
SELECT DISTINCT JOB_ID FROM HR.EMPLOYEES;

-- 6. ��� ��ȣ�� EMP #, �̸��� EMPLOYEE, ������ JOB, �Ի����� HIRE DATE��
SELECT EMPLOYEE_ID "EMP #", FIRST_NAME EMPLOYEE, JOB_ID JOB, HIRE_DATE "HIRE DATE"
FROM HR.EMPLOYEES;

--7. ������ �̸��� �ٿ��� ����ϵ� ���̿� ',' ������
SELECT JOB_ID || ',' || FIRST_NAME FROM HR.EMPLOYEES;

-- 9. �޿��� 12,000�� �Ѵ� ����� �̸��� �޿� ���
SELECT FIRST_NAME, SALARY FROM HR.EMPLOYEES
WHERE SALARY > 12000;

-- 10. ��� ��ȣ 176�� ����� �̸��� �μ���ȣ ���
SELECT FIRST_NAME, DEPARTMENT_ID FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID = 176;

-- 11. �Ի����� 2002�� 2�� 20�� ���� 2002�� 5�� 1�� ���̿� �Ի��� ���
-- ����� �̸�, ���� �� �Ի��� ���
SELECT FIRST_NAME, JOB_ID, HIRE_DATE FROM HR.EMPLOYEES
WHERE HIRE_DATE BETWEEN '02/02/20' AND '02/05/01';

-- 12. �����ڰ� ���� ��� ���
SELECT * FROM HR.EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 13. ������ 'AP'�� ���ԵǾ� �ִ� ����� ��� ���
SELECT * FROM HR.EMPLOYEES
WHERE JOB_ID LIKE '%AP%';

-- 14. ��� ���̺��� ������ MAN�� �����ϰ� �޿��� 10000�̻��� 
-- ��� ��ȣ�� ���� ����, �޿� ���
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY FROM HR.EMPLOYEES
WHERE JOB_ID LIKE '%MAN%' AND SALARY >= 10000;

-- 15. ������ SA_REP�̰ų� AD_PRES�̸鼭 �޿��� 15000�� �ʰ�
-- �� ��, ����, �޿��� ��� (OR�� AND�� ���)
SELECT LAST_NAME, JOB_ID, SALARY FROM HR.EMPLOYEES
WHERE JOB_ID = 'SA_REP' OR (JOB_ID = 'AD_PRES' AND SALARY > 15000);

-- 16. ���� ���̺��� �μ� ��ȣ�� ������������ �����Ͽ� ���
-- �μ���ȣ, �޿�, �Ի���, ��
SELECT DEPARTMENT_ID, SALARY, HIRE_DATE, LAST_NAME
FROM HR.EMPLOYEES
ORDER BY DEPARTMENT_ID;

-- 17. �μ��� ������������ �����ϰ� �Ի��ϵ� �������� ����
-- �μ���ȣ, �޿�, �Ի���, ��
SELECT DEPARTMENT_ID, SALARY, HIRE_DATE, LAST_NAME
FROM HR.EMPLOYEES
ORDER BY DEPARTMENT_ID DESC, HIRE_DATE DESC;

-- 18. �μ��� ������������ �����ϰ� �Ի����� ������������ ����, �޿��� ��������
-- �μ���ȣ, �Ի���, �޿�, ��
SELECT DEPARTMENT_ID, HIRE_DATE, SALARY, LAST_NAME
FROM HR.EMPLOYEES
ORDER BY DEPARTMENT_ID DESC, HIRE_DATE, SALARY DESC;

-- 19. ���� ��� �ҹ����� grant�� ��� �빮���� GRANT�� ���� ã��
SELECT * FROM HR.EMPLOYEES
WHERE LAST_NAME = INITCAP('grant') OR LAST_NAME = INITCAP('GRANT');

-- 20. 'GranT'�� �Է����� �� ��� ���̺��� ���� 'Grant'�� ���
SELECT * FROM HR.EMPLOYEES
WHERE LAST_NAME = INITCAP('GranT');

-- 21. ���� ��� �빮�ڷ� ��ȯ�ϰ� �̸� ��� �ҹ��ڷ� ��ȯȭ��
-- ���� �̸��� �ٿ� ����� �� '���� GRNAT douglas �Դϴ�'�� ���
SELECT '���� ' || UPPER(LAST_NAME) || ' ' || LOWER(FIRST_NAME) || ' �Դϴ�'
FROM HR.EMPLOYEES;

-- 22. ���� �̸� �ٿ� ���
SELECT CONCAT(LAST_NAME, FIRST_NAME) FROM HR.EMPLOYEES;

-- 23. ���� Davies���� av�� ���
SELECT SUBSTR(LAST_NAME,2,2) FROM HR.EMPLOYEES;

-- 24. ���� �ι�° ���ں��� ��� ���
SELECT SUBSTR(LAST_NAME, 2) FROM HR.EMPLOYEES;

-- 25.���� ������ ���ڿ��� �α��ڸ� �������ÿ�
SELECT SUBSTR(LAST_NAME,-2,2) FROM HR.EMPLOYEES;

-- 26. ���� �ڿ� ON���� ������ ���
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME LIKE '%on';

-- 27. ���� �ڿ� ����° ���ڰ� so�� ��� ���
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME LIKE '%SO_';

-- 28. ���� ������ ����ϴµ� �̸����� ���ʿ��� 3���ڸ� ���
-- ������ȣ, ��, �޿�, ����, �̸���
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, JOB_ID, SUBSTR(EMAIL,1,3)
FROM HR.EMPLOYEES;

-- 29. ���� ������ ����ϴµ� �̸����� �����ʿ��� 3���ڸ� ���
-- ������ȣ, ��, �޿�, ����, �̸���
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, JOB_ID, SUBSTR(EMAIL, -3, 3)
FROM HR.EMPLOYEES;

-- 30. ���� ������ ����ϴµ� �̸����� �����ʿ��� 3���ڸ� ����ϰ� ������ -
-- ���� ��ȣ, ��, �޿�, ����, �̸���
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, JOB_ID, 
       LPAD(SUBSTR(EMAIL,-3,3),LENGTH(EMAIL),'-') EMAIL FROM HR.EMPLOYEES; 

-- 31. o�� �ִ� �� �� o�� ���°�� �ִ� ��ġ���� ���
-- ������ȣ, ��, �� ��ġ, ����
SELECT EMPLOYEE_ID, LAST_NAME, INSTR(LAST_NAME, 'o')
FROM HR.EMPLOYEES;

-- 32. oc�� �ִ� �� �� oc�� ���°�� �ִ� ��ġ���� ���
-- ������ȣ, ��, ���� ��ġ, ����
SELECT EMPLOYEE_ID, LAST_NAME, INSTR(LAST_NAME, 'oc')
FROM HR.EMPLOYEES;

-- 33. ������ RE�� �ִ� ��� RE���� 3���ڸ� ���
-- ������ȣ, ��, ����, ������ ����
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SUBSTR(JOB_ID, INSTR(JOB_ID, 'RE'), 3)
FROM HR.EMPLOYEES;

-- 34. ������ȣ, ��, �Ի���, �޿�
-- �޿��� 10ĭ�� ����ϰ� ������ ���� �տ� * ǥ��
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE, LPAD(SALARY, 10, '*')
FROM HR.EMPLOYEES;

-- 35. ������ȣ, ��, �Ի���, �޿�
-- �޿��� 10ĭ�� ����ϰ� ������ ���� �ڿ� * ǥ��
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE, RPAD(SALARY, 10, '*')
FROM HR.EMPLOYEES;

-- 36. ������ȣ, ��, �Ի���, ���� ���
-- ������ RE�� �ִٸ� RE�� AB�� �����Ͽ� ���
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE, REPLACE(JOB_ID, 'RE','AB')
FROM HR.EMPLOYEES;

-- 37. ������ȣ, ����ó, Ŀ�̼�, �μ���ȣ, �޿�
-- �޿��� 3000���� �������� ���� ������ ���
SELECT EMPLOYEE_ID, PHONE_NUMBER, COMMISSION_PCT, DEPARTMENT_ID,
       MOD(SALARY, 3000) FROM HR.EMPLOYEES;
       
-- 38. 2002�⵵���� �Ի��� �������� ���
SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE LIKE '02/%';

-- 39. ���� ���ñ��� ���ְ� �������� Ȯ��
SELECT TRUNC((SYSDATE - TO_DATE('2021/01/01')) / 7,0) FROM DUAL;

-- 40. �������� �� �� �ٹ��ߴ��� ���
-- ������ȣ, ��, ����ó, �μ�, �ٹ����
SELECT EMPLOYEE_ID, LAST_NAME, PHONE_NUMBER, DEPARTMENT_ID, 
       ROUND((SYSDATE - HIRE_DATE) / 365) FROM HR.EMPLOYEES;

-- 41. �ټӳ�� 8�� �̻��� ����鸸 ���
SELECT * FROM HR.EMPLOYEES
WHERE ROUND((SYSDATE - HIRE_DATE)/365) >= 8;

-- 42. ������ ���� 3���ڸ� ��� �ڿ� * ���� �� ���
-- ������ȣ, �Ի���, ��
SELECT EMPLOYEE_ID, HIRE_DATE, SUBSTR(LAST_NAME, 1, 3) || RPAD('*', 3, '*')
FROM HR.EMPLOYEES;

-- 43. ȫ�浿 �����
SELECT LENGTH('ȫ�浿') FROM DUAL;

-- 45. �Ի����� 'YYYY-MM-DD'�� ��¥�� 31-05-2019 16:24:30 ������ ���·� ���
SELECT TO_CHAR(HIRE_DATE, 'dd-mm-yyyy hh24:Mi:ss AM') FROM HR.EMPLOYEES;

-- 46. ����(3333333)�� 3�ڸ� ���� ��ǥ �� ���
SELECT TO_CHAR('3333333', '999,999,999') FROM DUAL;

-- 47. ���� ���̺��� �޿��� W33,333,333������ ���
SELECT TO_CHAR(SALARY, 'L999,999,999') FROM HR.EMPLOYEES;

-- 48. ������ 2018-10-25������ �ٹ� �ϼ� ���
-- ������ȣ, �μ���ȣ, �Ի���, �ٹ��ϼ�
SELECT EMPLOYEE_ID, DEPARTMENT_ID, HIRE_DATE,
       TO_DATE('2018-10-25', 'yyyy-mm-dd') - HIRE_DATE
FROM HR.EMPLOYEES;

-- 51. '10-25-2002'�� �Ի��� ��� ���
-- ������ȣ, �μ���ȣ, �Ի���, �ٹ��ϼ�
SELECT EMPLOYEE_ID, DEPARTMENT_ID, HIRE_DATE FROM HR.EMPLOYEES
WHERE HIRE_DATE = TO_DATE('10-25-2002', 'mm-dd-yyyy');

-- 52. �������� (���� : �޿� * 12 * Ŀ�̼�
-- ������ȣ, �μ���ȣ, �޿�, ����
SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY, (SALARY + (SALARY * COMMISSION_PCT)) * 12
FROM HR.EMPLOYEES;

-- 53. �μ��� 90�̰ų� 30�� �μ��� ���� ����
-- ������ȣ, �μ���ȣ, �޿�, ����
SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY, SALARY * 12
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(90, 30);

-- 54. �޿��� 10000�̻��̸� "�̻���Դϴ�"
--           7000�̻��̸� "������Դϴ�"
--           5000�̻��̸� "������Դϴ�"
--           �������� ������� ����Ͻÿ�
-- ���� �޿� ���
SELECT LAST_NAME, SALARY, CASE WHEN SALARY > 10000 THEN '�̻���Դϴ�'
                               WHEN SALARY > 7000 THEN '������Դϴ�'
                               WHEN SALARY > 5000 THEN '������Դϴ�'
                               ELSE '���' END EMP
FROM HR.EMPLOYEES;

-- 55. �޿��� 2000���� ���� ���� ����
-- 1�̸� 0.09
-- 2�̸� 0.20
-- 3�̸� 0.30
-- 4�̸� 0.40
-- 5�̸� 0.42
-- 6�̸� 0.44
-- �������� 0.45��ŭ ���� �ο�
-- ��, �޿�, ���� ��� ��, �μ��� 80�� ���
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

-- 56. ���� ��ü���� �Ի����� ���� ���� ����� �ֱٿ� �Ի��� ���
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE) FROM HR.EMPLOYEES;

-- 57. ����� �� ���
SELECT COUNT(*) FROM HR.EMPLOYEES;

-- 58. ���� ���̺��� �μ��� �� �� ���� ���
SELECT COUNT(DISTINCT DEPARTMENT_ID) FROM HR.EMPLOYEES;

-- 59. ��� ���̺��� �� �μ��� �޿� ���
SELECT DEPARTMENT_ID, AVG(SALARY) FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 60. �� ������ �μ� �������� ����
SELECT DEPARTMENT_ID, AVG(SALARY) FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- 61. �� �μ��� �޿��� ����� ���ϴ� ��� ���� ���� �� ���� ���
SELECT DEPARTMENT_ID, AVG(SALARY) FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY AVG(SALARY);

-- 62. �� �μ��� �ִ� ����� ������ �޿��� ���
SELECT DEPARTMENT_ID, JOB_ID, AVG(SALARY) FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;

-- 63. �޿��� 1000������ �ݿø��Ͽ� ���
SELECT ROUND(SALARY, -4) FROM HR.EMPLOYEES;

-- 64. �����ȣ�� ¦���� ���
SELECT * FROM HR.EMPLOYEES
WHERE MOD(EMPLOYEE_ID, 2) = 0;

-- 66. ����� �޿��� 3000���� 6000 ������ ���
SELECT * FROM HR.EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 6000;

-- 69. 50, 60, 90�� �μ��� �ƴ� �����
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID NOT IN(50,60,90);

-- 70. ������ 'REP'���Ե� ������ �޿��� �հ�, ���, �ִ�, �ּ�, ��� ��
SELECT JOB_ID, AVG(SALARY), SUM(SALARY), MAX(SALARY), MIN(SALARY), COUNT(EMPLOYEE_ID)
FROM HR.EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
GROUP BY JOB_ID;

-- 71. ������ �޿��� 6000�̻��� ������ �μ��� ����� ���ϰ�
-- �μ��� ����� 7000 �̻��� �μ��� ��� �μ� ��������
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM HR.EMPLOYEES
WHERE SALARY >= 6000
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >= 7000
ORDER BY DEPARTMENT_ID DESC;

-- 72. ������ 'REP'�� �����ϰ� ���� ���� �������� ������ �޿��� �հ谡
-- 13000�̻��� ������ ���. �޿��� �հ踦 ��������
SELECT JOB_ID FROM HR.EMPLOYEES
WHERE JOB_ID NOT LIKE '%REP%'
GROUP BY JOB_ID
ORDER BY SUM(SALARY);

-- 74. ��� ���̺��� �����ȣ, ��, �޿�, ����ȣ�� ����ϴµ�
-- ��簡 100, 101, 201�� ����� ���
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, MANAGER_ID
FROM HR.EMPLOYEES
WHERE MANAGER_ID IN(100,101,201);

-- 75. ��� ���̺��� Ŀ�̼��� NULL�� ����鸸 ���
SELECT * FROM HR.EMPLOYEES WHERE COMMISSION_PCT IS NULL;

-- 76. ��� ���̺��� �Ի��� �� DAY�� 6���� ����� ���
SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE LIKE '%/06';

-- 77. ��� ���̺��� 02�⵵�� �Ի��� ����� ���
SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE LIKE '02/%';

SELECT * FROM HR.EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'yy') = '02';

-- 77. ��� ���̺��� ������ 'A_'�� �����ϰ� �ִ� ���
SELECT * FROM HR.EMPLOYEES
WHERE JOB_ID LIKE '%A\_%' ESCAPE '\';

-- 78. ��� ���̺��� �޿��� 10000 �̸��̰� 15000 �ʰ�
SELECT * FROM HR.EMPLOYEES
WHERE SALARY NOT BETWEEN 10000 AND 15000;

-- 79. ��� ���̺��� ��簡 �ִ� ����鸸 ���
SELECT * FROM HR.EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;

-- 80. ������ 'SA'�� �����ϰ� ���� ���� ���
SELECT * FROM HR.EMPLOYEES WHERE JOB_ID NOT LIKE '%SA%';

-- 81. ��� ���̺��� �μ��� 50, 70, 90�̸鼭 �޿��� 10000 �̻��� ���
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(50,70,90) AND SALARY >= 10000;

-- 82. ��� ���̺��� �μ��� 50, 70�̰� �� �μ��� 90�̸鼭 �޿��� 10000�̻��� ���
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(50,70) OR (DEPARTMENT_ID = 90 AND SALARY >= 10000);

-- 83. ��� ���̺��� �μ���ȣ, �����ȣ, �̸�, �޿�, �Ի����� ����� �� �μ���
-- 50,70,90�� �μ��� ����� �Ի��� ������ ����
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(50,70,90)
ORDER BY HIRE_DATE;

-- 85. ����� �μ���ȣ, ���, �̸�, �Ի���, ������ ����� �� �μ���ȣ�� 90�� 110
-- �μ��� �������� ��� �Ի��� ���� ��������
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(90,110)
ORDER BY DEPARTMENT_ID, HIRE_DATE DESC;

-- 86. ��� ���̺��� �μ���ȣ, �Ի���, ���, �̸�, ����, �޿�, �޿��� Ŀ�̼��� ���� �� ���
-- �̸��� COMM���� ���� �μ��� 50,70,120�� ���
-- �μ��� �������� �Ի����� �������� ����
SELECT DEPARTMENT_ID, HIRE_DATE, EMPLOYEE_ID, FIRST_NAME COMM, JOB_ID, SALARY,
       SALARY * (1 + NVL(COMMISSION_PCT,0))
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN(50, 70, 120)
ORDER BY DEPARTMENT_ID, HIRE_DATE DESC;

-- 87. ��� ���̺��� �����ȣ, ��, �޿��� 12�� ���� ���� SAL�� ���
-- �޿��� 12�� ���� �� ��������
SELECT EMPLOYEE_ID, LAST_NAME, SALARY * 12 SAL
FROM HR.EMPLOYEES
ORDER BY SAL;

-- 88. ���� �μ�, �޿� ����ϴµ� �޿��� 4000���� 10000 ���̿� �ִ� �����
-- �μ��� �������� ���� �޿� ��������
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM HR.EMPLOYEES
WHERE SALARY BETWEEN 4000 AND 10000
ORDER BY DEPARTMENT_ID DESC, SALARY;

-- 89. ���� �޿��� ����� �� ������ 'MA' �����ϰ� �ִ� ��� ������ ������
-- ������� �μ��� ��������, �޿��� ��������
SELECT LAST_NAME, SALARY FROM HR.EMPLOYEES
WHERE JOB_ID NOT LIKE '%MA%'
ORDER BY DEPARTMENT_ID, SALARY DESC;

-- 90. ANSI-JOIN�� ����ؼ� �����ȣ, �̸�, �μ���ȣ. ��ġ ���
-- ��簡 149�� ����鸸
SELECT EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, LOCATION_ID
FROM HR.EMPLOYEES E JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.MANAGER_ID = 149;

-- ������ 4��°���� 6��° ���� PRO�� �ִٸ� it_program���� ���
-- ACC�� �ִٸ� finance_account �������� business ���
SELECT CASE SUBSTR(JOB_ID, 4, 3) WHEN 'PRO' THEN 'it_program'
                                 WHEN 'ACC' THEN 'finance_account'
                                 ELSE 'business' END JOB
FROM HR.EMPLOYEES;

-- 91. ������ 'SA' �����ϰ� ���� ���� ����� �� ������ �޿��� �հ谡 10000�� �ʰ��ϴ�
-- ������ �޿��� �հ� ���
-- �޿� �հ� ��������
SELECT JOB_ID, SUM(SALARY) FROM HR.EMPLOYEES
WHERE JOB_ID NOT LIKE '%SA%'
GROUP BY JOB_ID
HAVING AVG(SALARY) > 10000
ORDER BY SUM(SALARY) DESC;

-- 92. �μ��� 20�̰ų� 50�� �μ��� �����ȣȭ �μ���ȣ, �μ���, ��ġ����
SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.DEPARTMENT_ID IN(20,50);

-- 93. Matos��� ���� ������ �ִ� ���
-- �� ����� �μ������� �����ȣ, �� ���
SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND LAST_NAME = 'Matos';

-- 94. Matos��� ���� ������ �ִ� ����� King�̶�� ���� ���� ���
-- �� ����� �μ������� �����ȣ �׸��� �� ���
SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND LAST_NAME IN('Mantos', 'King');

-- 95. King��� ���� ������ �ִ� ����� �ִ�
-- �� ����� �μ������� �����ȣ �׸��� �� ���
-- ANSI-JOIN
SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM HR.EMPLOYEES E JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE LAST_NAME = 'King';

-- 96. ���� ������ ����� �� �� ������ �μ������� ���� ����
-- �μ���ȣ, �μ���, ������ȣ, ��������
SELECT EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME, E.JOB_ID, JOB_TITLE
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D, HR.JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.JOB_ID = J.JOB_ID;

-- 97. ��� ������ �μ� ������ ����� �� ����� ���� �μ��� ����ϵ�
-- 200�� �μ����� 260�μ��� �����ϰ� ���
SELECT EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM HR.EMPLOYEES E LEFT OUTER JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID NOT BETWEEN 200 AND 260; 

-- 98. �Ի����� 2005�⵵ ������ �Ի��� ����� �� 
-- �μ��� �ִ� �޿��� 8000 �̻��� �μ��� �ִ� �޿� ���
SELECT DEPARTMENT_ID, MAX(SALARY) FROM HR.EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'yyyy') < '2005'
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) >= 8000;

-- 99. 'IT_PROG'�̸� �޿��� 1.10 * SALARY
-- 'ST_CLERK'�̸� �޿��� 1.15*SALARY
-- 'SA_REP'�̸� �޿��� 1.20*SALARY
-- ������ ������ SALARY�� �޿��� �����ϰ� HEADING NAME�� 
-- "REVISED_SALARY"�� �ǰ� �Ͻÿ�.
SELECT DECODE(JOB_ID, 'IT-PROG', 1.10*SALARY,
                      'ST_CLERK', 1.15*SALARY,
                      'SA_REP', 1.20*SALARY,
                      SALARY) "REVISED_SALARY"
FROM HR.EMPLOYEES;

-- 100. Ŀ�̼��� ������ �޿��� ���
-- Ŀ�̼��� ���� ���� ������ ����
SELECT AVG(SALARY * (1+NVL(COMMISSION_PCT, 0)))
FROM HR.EMPLOYEES;

-- 101. �� �μ��� Ŀ�̼��� ������ �޿��� �հ�
SELECT DEPARTMENT_ID, SUM(SALARY * (1 + NVL(COMMISSION_PCT, 0)))
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 102. �� �μ��� ���� ���� 5�� �̻��� �μ��� ���
SELECT DEPARTMENT_ID, COUNT(*)
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(EMPLOYEE_ID) >= 5;

-- 103. �����ȣ, �̸�, �޿�, �Ի���, �μ���ȣ, �μ���, ������ȣ, ������
-- ������� �ʴ� ������ ���, ����� ���� ������ ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE, E.DEPARTMENT_ID,
       DEPARTMENT_NAME, E.JOB_ID, JOB_TITLE
FROM HR.DEPARTMENTS D JOIN HR.EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID FULL OUTER JOIN HR.JOBS J
ON E.JOB_ID = J.JOB_ID;

