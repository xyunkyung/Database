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
--> 5�̻��� �ݿø�

-- ����
SELECT TRUNC(15.19345, 3), TRUNC(15.19355, 2), TRUNC(145.5554, 1),
        TRUNC(145.5554, 0), TRUNC(145.5554, -1), TRUNC(145.4354, -2),
        TRUNC(145.5554, -3)
FROM dual;

-- ����) �Ի����� ��ĥ�� �ƴ��� ���
SELECT SYSDATE FROM dual;
SELECT employee_id, first_name, salary, job_id, hire_date, 
        TRUNC(sysdate - hire_date)
FROM hr.employees;

-- ����) �Ի����� �� ��
SELECT employee_id, first_name, salary, job_id, hire_date,
        ROUND((sysdate - hire_date) / 7, 0)
        FROM hr.employees;
        
-- ����) �Ի����� ��� ��
SELECT employee_id, first_name, salary, hire_date, job_id,
        ROUND((SYSDATE - hire_date) / 365, 0)
        FROM hr.employees;
        
-- ����) 10�� 3���� ���� ������
SELECT MOD(10, 3) FROM dual;

-- ����) 10�� 3���� ���� ��
SELECT TRUNC(10 / 3, 0) FROM dual;

-- ����) �޿��� 500���� ���� �������� 400 �̻��� �����
SELECT employee_id, MOD(salary, 500), salary FROM hr.employees;

SELECT employee_id, first_name, hire_date, job_id, salary, MOD(salary, 500)
FROM hr.employees
WHERE MOD(salary, 500) >= 400;

-- ����) �޿��� 5000���� ���� ���� 3�� �ʰ��� �����
SELECT * FROM hr.employees
WHERE TRUNC(salary / 5000, 0) > 3;

-- ����) ���ú��� 3���� �Ĵ� ��ĥ
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM dual;

-- ����) ���� ������ �ݿ����� ��ĥ?
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM dual;

-- ����) �Ի��� ���� ������� ��ĥ?
SELECT employee_id, first_name, hire_date, NEXT_DAY(hire_date, '��') 
FROM hr.employees;

-- ����) �Ի��� ������ ������� '01/01/18'�� ���
SELECT employee_id, first_name, last_name, hire_date FROM hr.employees
WHERE NEXT_DAY(hire_date, '��') = '01/01/18';

-- ����) �̹� ���� ������ ��
SELECT LAST_DAY(sysdate) FROM dual;

-- ����) �Ի��� ���� ������ ����?
SELECT employee_id, first_name, last_name, hire_date, LAST_DAY(hire_date)
FROM hr.employees;

-- ����) ���⿡ �Ի��� ��� ���
SELECT * FROM hr.employees
WHERE LAST_DAY(hire_date) LIKE '%02/29';

-- ��ȯ �Լ�
-- ���� ��ȯ �Լ� TO_CHAR() : ��¥�� ���ڷ� ��ȯ
SELECT sysdate FROM dual;
--> 21/05/14 => 2021-02-14

SELECT sysdate, TO_CHAR(sysdate, 'yyyy/mm-dd'), TO_CHAR(sysdate, 'dd/mm/yy'), TO_CHAR(sysdate, 'mm/dd/yy')
FROM dual;

-- ����) �����ȣ, �̸�, �޿�, ����, �Ի����� ���
-- �Ի����� ȣ�� ������� ���
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

-- ����) 25-04-2003���� ������ �Ի��� ��� ���
SELECT * FROM hr.employees
WHERE hire_date > TO_DATE('25-04-2003', 'dd-mm-yyyy');

-- CASE
-- job_id�� 'IT_PROG' �޿��� 10% ���
--          'ST_CHERK' �޿��� 15% ���
--          'SA_REP' �޿��� 20% ���
--           �׿ܴ� �޿�
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

-- �޿��� 3000�����̸� ���
--       5000�����̸� ����
--       7000�����̸� �븮
--       9000�����̸� ����
--       11000�����̸� ����
--       13000�����̸� ����
--       �� �̻��̸� �ӿ�
SELECT employee_id, job_id, salary,
CASE WHEN salary <= 3000 THEN '���'
     WHEN salary <= 5000 THEN '����'
     WHEN salary <= 7000 THEN '�븮'
     WHEN salary <= 9000 THEN '����'
     WHEN salary <= 11000 THEN '����'
     WHEN salary <= 13000 THEN '����'
     ELSE '�ӿ�' END grade
FROM hr.employees;

-- �޿��� 2000���� ���� ���� 0�̸� �޿��� 0%
--                         1�̸� �޿��� 9%
--                         2�̸� �޿��� 20%
--                         3�̸� �޿��� 30%
--                         4�̸� �޿��� 40%
--                         5�̸� �޿��� 42%
--                         6�̸� �޿��� 44%
--                         �̿� �޿��� 45% ����
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