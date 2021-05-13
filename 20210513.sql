-- ����) �ֱ� �Ի��� ������� ���
SELECT * FROM hr.employees
ORDER BY hire_date DESC;

-- ����) �޿��� ���� �޴� ������� ����ϴ� ���, �̸�, �޿�, ������ ����ϰ�
-- �޿��� sal ��Ī�� �־� ���
SELECT employee_id, first_name, salary AS sal, job_id FROM hr.employees
ORDER BY sal DESC;

-- ����) �μ��� ������������ ���ĵ� ���¿��� �μ� ���� �ִ� ������ ������������ �����Ͽ� ���
SELECT * FROM hr.employees
ORDER BY department_id ASC, job_id DESC;

-- ����) �μ��� ������������ �����ϰ� �� �μ����� ������ ������������ ���ĵ� ���¿��� 
-- ������ ���� �޿��� ���� ���� �޴� ������� ���
SELECT department_id, job_id, salary, employee_id, first_name FROM hr.employees
ORDER BY department_id, job_id DESC, salary DESC;

-- ����) �μ��� ������������ �����Ͽ� ����ϰ� ���� �μ����� �ٸ� ������ ���� ������� �ִٸ�
-- ������ ������������ �����ϰ� ���� ���������� �޿��� ���� �ٸ��Ƿ� �޿��� ������������ �����ϵ�
-- �޿��� �޴� ������� �Ի����� ������������ ����
SELECT department_id, job_id, salary, hire_date, employee_id, first_name FROM hr.employees
ORDER BY department_id ASC, job_id DESC, salary ASC, hire_date ASC;

-- ����) �޿��� 10000�̻��� ��� ���
-- �����ȣ, �̸�, �޿�, �Ի��� ���
-- �޿��� ������������ ����
SELECT employee_id, first_name, salary, hire_date FROM hr.employees
WHERE salary >= 10000
ORDER BY salary ASC;

-- ������ 'ac_account'�� ������� ���
SELECT * FROM hr.employees
WHERE job_id = 'AC_ACCOUNT';

SELECT * FROM hr.employees
WHERE job_id = UPPER('ac_account');

SELECT email, LOWER(email), job_id, LOWER(job_id), UPPER(first_name), first_name FROM hr.employees;
--> SELECT�� ��� ������� ������ �ش�.

SELECT * FROM hr.employees
WHERE job_id = UPPER('ac_account');

SELECT * FROM hr.employees
WHERE LOWER(job_id) = 'ac_account';

-- ����) �̸��Ͽ� 'ie'�� ���Ե� ������� ���
SELECT * FROM hr.employees
WHERE LOWER(email) LIKE '%ie%';

-- ����) �̸��� 'DAVID'�� ����� ���
SELECT * FROM hr.employees
WHERE UPPER(first_name) = 'DAVID';

-- ����) �̸��� �� ��� �빮�ڷ� ����ϰ� ������ �̸��� ��� �ҹ��ڷ� ���
-- �޿�, �Ի��� ���
SELECT UPPER(first_name), UPPER(last_name), LOWER(job_id), LOWER(email), salary, hire_date FROM hr.employees;

-- ����) �̸��� 'DAVID'�� ����� ���
SELECT first_name, email, INITCAP(email), job_id, INITCAP(job_id) FROM hr.employees
WHERE FIRST_NAME = INITCAP('DAVID');

-- ����) �����ȣ, ���̸�, �޿�, ����, �̸��� ���
SELECT employee_id, last_name || first_name, job_id, email FROM hr.employees;

-- ����) "���� �̸��� KingSteven�̰� ���� ���� ������ AD_PRES�Դϴ�."ó�� ���
SELECT '���� �̸��� ' || last_name || first_name || '�̰� ���� ���� ������ ' || job_id || '�Դϴ�.' FROM hr.employees;

-- ����) �����ȣ, ���̸�, �޿�, ����, �̸����� ��� (CONCAT ���)
SELECT employee_id, CONCAT(last_name, first_name), salary, job_id, email FROM hr.employees;

-- ����) "���� �̸��� KingSteven�̰� ���� ���� ������ AD_PRES�Դϴ�."ó�� ���
SELECT CONCAT('���� �̸��� ', CONCAT(last_name, CONCAT(first_name, CONCAT('�̰� ���� ���� ������ ', CONCAT(job_id, '�Դϴ�.'))))) FROM hr.employees;

-- ����) �÷��� �ִ� �������� ����
SELECT first_name, LENGTH(first_name), last_name, LENGTH(last_name), email, LENGTH(email), salary, LENGTH(salary) FROM hr.employees;

-- ����) ���� ���̰� 5���� ū ����� ���
SELECT * FROM hr.employees
WHERE LENGTH(last_name) > 5;

-- ����) �޿��� 4�ڸ� �̻��� ����� ���Ͻÿ�.
SELECT * FROM hr.employees
WHERE LENGTH(salary) > 4;

-- ���ڿ� �ڸ���
-- ����) �̸��Ͽ��� �� ��° ���ں��� 3���ڸ� ��� : SUBSTR()
SELECT employee_id, first_name, last_name, salary, email, SUBSTR(email, 2, 3) FROM hr.employees;

-- ���ڿ� ��ġ ã��
-- INSTR()
SELECT first_name, salary, job_id, email, INSTR(email, 's'), INSTR(email, 'S') FROM hr.employees;

-- ����) �̸��Ͽ� 's'�� 5��°�� �ִ� ��� ���
SELECT * FROM hr.employees 
WHERE INSTR(LOWER(email), 's') = 5;

-- ����) �̸��Ͽ� 'W'�� �ִٸ� 'W'���� 3���� ���
-- �׷��� ������ �տ������� 3���� ���
SELECT email, SUBSTR(email, INSTR(email, 'W'), 3) FROM hr.employees;

-- ����...
-- ���̵� ã�� highland0 : high*****
SELECT first_name, RPAD(first_name, 15, '*'), last_name, RPAD(last_name, 15, '*') FROM hr.employees;

-- ����) �̸����� �տ��� 3���ڸ� ����ϰ� ������ ���ڴ� '*' ���
SELECT email, RPAD(SUBSTR(email, 1, 3), LENGTH(email), '*') FROM hr.employees;

-- ���ڿ� �����ϱ� : REPLACE
-- ����) '_AS'���ڰ� �ִ� ������ 'abc'�� �ٲ���
SELECT job_id, REPLACE(job_id, '_AS', 'abc') FROM hr.employees;

-- TRIM : �հ� �ڿ� �ִ� ���� ����
SELECT * FROM hr.employees
WHERE email = TRIM(' ABANDA  ');

SELECT ' �̼��� ', TRIM(' �̼��� ') AS aa, '�̼���', ' �� ���� ', TRIM(' �� ���� ') bb FROM dual;

-- ����) �̸��Ͽ��� �� ���� �ִ� ���� 'A'�� ����
SELECT email, TRIM('A' FROM email) FROM hr.employees;

-- ����) �̸��� ���� �� ��ŭ '*'�� ���
SELECT email, RPAD('*', LENGTH(email), '*') FROM hr.employees;

-- ����) �̸��� �ڿ��� 1���� ��������
SELECT email, SUBSTR(email, -1, 1), SUBSTR(email, -2, 2), SUBSTR(email, -3, 3) FROM hr.employees;

-- ����) 010-1234-1234�� 010-****-****
-- 010-123-1234�� 010-***-****
-- 010-12345-1234�� 010-*****-****
SELECT RPAD(SUBSTR('010-1234-1234', 0, INSTR('010-1234-1234', '-')), LENGTH('010-1234-1234'), '*') FROM dual;

SELECT '010-1234-1234', SUBSTR('010-1234-1234', 1, 4) || 
                        RPAD('*', LENGTH(SUBSTR('010-1234-1234', 5, 4)), '*') || 
                        SUBSTR('010-1234-1234', -5) FROM dual;
                        
-- ����) ���� ���̺��� ����ó�� ����ϴµ� ����ó�� ���̰� 12�� ��ȭ��ȣ�� ���
SELECT first_name, phone_number FROM hr.employees
WHERE LENGTH(phone_number) = 12;

-- ����) ��� ���ڸ� '*'�� ���
SELECT first_name, phone_number, SUBSTR(phone_number, 1, 4) || 
        RPAD('*', LENGTH(SUBSTR(phone_number, 5, 3)), '*') || 
        SUBSTR(phone_number, -5) FROM hr.employees
        WHERE LENGTH(phone_number) = 12;
        
-- NVL : null ���� �ִ� ��� null�� ��� ���ϴ� �� �Է�
SELECT NULL, NVL(NULL, 0), NVL(NULL, 100) FROM dual;

SELECT first_name, last_name, salary, hire_date, commission_pct, NVL(commission_pct, 0) FROM hr.employees;

-- ����) Ŀ�̼��� ������ ���� ���ϱ�
SELECT employee_id, first_name, job_id, salary, commission_pct, (salary + salary * NVL(commission_pct, 0)) * 12 AS year_sal FROM hr.employees;

-- ����) ������ Ŀ�̼��� ���ΰ��� Ŀ�̼��� ���� ������ 0��
SELECT first_name, job_id, salary, commission_pct, salary * NVL(commission_pct, 0) FROM hr.employees;
