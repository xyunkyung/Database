select * from HR.employees;
select employee_id, first_name, email, hire_date from HR.employees;

select employee_id, first_name, 3 * 10 from hr.employees;

select * from HR.departments;

select department_name, department_id from hr.departments;

select manager_id, department_id, location_id from hr.departments;

select * from hr.employees;

--      ���          �̸�          ��       �̸���     �޴���       ��볯¥
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE,
--      ������ȣ   �޿�     Ŀ�̼� �ۼ�Ʈ   ���� ���       �μ� ��ȣ   
        JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID FROM HR.EMPLOYEES;
        
-- ����) ��� ���̺��� �����ȣ�� �̸�, �޿�, ����, �μ���ȣ�� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID, DEPARTMENT_ID FROM HR.EMPLOYEES;

-- ����) ��� ���̺��� �����ȣ, �μ���ȣ, ����, �޿� ����ϴµ� �޿��� �������� ���
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, SALARY * 12 FROM HR.EMPLOYEES;

-- ����) ��� ���̺��� �����ȣ, �μ���ȣ, ����, ������ ����ϴµ� �ſ� 300�� ���ʽ��� ����
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, (SALARY + 300) * 12 FROM HR.EMPLOYEES;

-- ����) ��� ���̺��� �����ȣ, �μ���ȣ, ����, ���� ����ϴµ� ������ �޿� 300�� Ư�� ���ʽ�
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, (SALARY * 12) + 300 FROM HR.EMPLOYEES;

-- ����) ��� ���̺��� �����ȣ, �μ���ȣ, ����, �޿��� ���� Ŀ�̼� ����ϴµ� ��� ��� Ŀ�̼��� �޿��� 30%
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, SALARY * 0.3 FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT, DEPARTMENT_ID FROM HR.EMPLOYEES;

-- ����) ��� ���̺��� �����ȣ, �̸�, �޿�, Ŀ�̼��ۼ�Ʈ, Ŀ�̼� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT, SALARY * COMMISSION_PCT FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY * NULL FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT * 300 FROM HR.EMPLOYEES;

-- ����) �����ȣ, �̸�, ����, �μ���ȣ, �޿�, ���� ����ϴµ� ������ �޿��� 2500�� Ư�� �󿩱����� ����
--                                                                                  ��Ī(ALIAS)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, SALARY, (SALARY * 12) + 2500 AS YEAR_SEL FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, SALARY, (SALARY * 12) + 2500 "YEAR SEL" FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, SALARY, (SALARY * 12) + 2500 aaaa FROM HR.EMPLOYEES; -- �빮�� ���

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, SALARY, (SALARY * 12) + 2500 "Aaaaa" FROM HR.EMPLOYEES; -- ��ҹ��� ����

-- ���ڿ� ���̱� ������
select 'rhee' + 'soongmoo' from dual; -- (x)

SELECT 'Rhee' || 'SoongMoo' FULLNAME FROM DUAL;

select 10 + 5, 10 - 5, 10 * 5, 10 / 5 from dual;

-- ����) ��� ���̺��� �����ȣ, ��� ��ü�̸�, �޿�, �μ� ���
SELECT EMPLOYEE_ID, LAST_NAME || FIRST_NAME AS FULLNAME, SALARY, DEPARTMENT_ID FROM HR.EMPLOYEES;

-- ����) �����ȣ, �޿��� ����ϴ� ���̿� "KingSteven�� ������ AD_PRES�Դϴ�." ���
SELECT EMPLOYEE_ID, LAST_NAME || FIRST_NAME || '�� ������ ' || JOB_ID || '�Դϴ�.' AS SENTANCE, SALARY FROM HR.EMPLOYEES;
