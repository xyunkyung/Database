SELECT REPLACE('ȫ�浿\n', '\n', '<br \>') FROM dual;

SELECT commission_pct, NVL(commission_pct, 0) FROM hr.employees;

SELECT SUM(salary), ROUND(AVG(salary)), MAX(salary), MIN(salary) FROM hr.employees;
--> �������� ���� �Է� �޾Ƽ� �ϳ��� ����� ������

SELECT salary, SUM(salary) FROM hr.employees;
--> ���߷ο� �Լ��� �÷��� ���� ����� �� ����

-- ����) �μ��� 90�� �μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, �޿��� �հ�
SELECT ROUND(AVG(salary)), MAX(salary), MIN(salary), SUM(salary) FROM hr.employees
WHERE department_id = 90;

-- ����) 'REP'�� ���ԵǾ� �ִ� ������ �ִ�޿�, �ּұ޿�, ��ձ޿�, �޿��� �հ�
SELECT MAX(salary), MIN(salary), AVG(salary), SUM(salary) FROM hr.employees
WHERE job_id LIKE '%REP%';

-- ����) �Ի����� ���� ���� ����� �Ի����� ���� ���� ���
SELECT MIN(hire_date), MAX(hire_date) FROM hr.employees;

-- ����) ��ü ����� ��
SELECT COUNT(employee_id), COUNT(commission_pct) FROM hr.employees;

SELECT COUNT(*) FROM hr.employees;
--> ��� �ϳ��� �÷��� ���� �����Ѵٸ� count ��

-- ����) 50�� �μ��� ����� ��
SELECT COUNT(employee_id) FROM hr.employees
WHERE department_id = 50;

-- ����) 80�� �μ��� ����� ���� Ŀ�̼��� �޴� ����� ��
SELECT COUNT(employee_id), COUNT(commission_pct) FROM hr.employees
WHERE department_id = 80;

-- ����) 50�� �μ��� ����� ���� Ŀ�̼��� �޴� ����� ��
SELECT COUNT(employee_id), COUNT(commission_pct) FROM hr.employees
WHERE department_id = 50;

-- ����) Ŀ�̼��� �޴� ����� Ŀ�̼��� ��հ� ��ü ����� Ŀ�̼��� ���
SELECT ROUND(AVG(commission_pct), 4), ROUND(SUM(commission_pct) / count(employee_id), 4),
       ROUND(AVG(NVL(commission_pct, 0)), 4)
       FROM hr.employees;
       
-- ����) �� ���� �� �޿��� �հ�
SELECT job_id, sum(salary), AVG(salary), MIN(salary), MAX(salary) 
FROM hr.employees
GROUP BY job_id;

-- ����) �� �μ����� ���� ���� �Ի��� ����� ���� ���߿� �Ի��� ���
SELECT department_id, MIN(hire_date), MAX(hire_date) FROM hr.employees
GROUP BY department_id
ORDER BY department_id;

-- ����) �� ������ ���� ���� �Ի��� ����� ���� ���߿� �Ի��� ���
SELECT job_id, MIN(hire_date), MAX(hire_date) FROM hr.employees
GROUP BY job_id
ORDER BY job_id;

-- ����) �����ȣ, �̸�, �Ի���, ����, �μ��� ����� ��
-- �μ��� ��������, �� �μ��� ������ ��������
SELECT employee_id, first_name, hire_date, job_id, department_id FROM hr.employees
ORDER BY department_id, job_id;

-- ����) �� �μ��� ������ �޿� �հ�
SELECT department_id, job_id, SUM(salary) FROM hr.employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- ����) �μ��� ������ �޿��� ���� ����� ��
SELECT department_id, job_id, salary, COUNT(*) FROM hr.employees
GROUP BY department_id, job_id, salary;

-- ����) �޿��� 7000�̻��� �޴� ����� �޿��� �հ�, �޿��� ���, ����� ��
SELECT SUM(salary), AVG(salary), COUNT(*) FROM hr.employees
WHERE salary >= 7000;

-- ����) ��� �޿��� 7000�̻��� �μ��� ���
SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) >= 7000;

-- ����) REP�� ���� ������ �μ��� ��� �޿�
SELECT department_id, job_id, AVG(salary) FROM hr.employees
WHERE job_id LIKE '%REP%'
GROUP BY department_id, job_id;

-- ����) ��� �޿��� 7000�̻��� �μ��� ���
-- ��� �޿� ���� �� ���� ���
SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) >= 7000
ORDER BY AVG(salary) DESC;

-- ����) �μ��� ���� ���� 10�� �̸��� �μ�
SELECT department_id, COUNT(*) FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) < 10;

-- ����) ������ 'REP'�� ���ԵǾ� ���� ���� ������ �޿��� ���, �հ�, �ּ�, �ִ� �� ���
-- �޿��� �հ谡 13000�̻��� ������ ���
SELECT job_id, AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
GROUP BY job_id
HAVING job_id NOT LIKE '%REP%' 
AND SUM(salary) >= 13000;

-- ����) �� �μ��� ��� �� ���� ���� �޴� �޿��� ���
SELECT MAX(AVG(salary)) FROM hr.employees
GROUP BY department_id;

-- ����) 90�� �μ��� �ִ� ����� ���
-- �����ȣ, �̸�, �޿�, ����, �μ���ȣ
SELECT employee_id, first_name, salary, job_id, department_id FROM hr.employees
WHERE department_id = 90;

-- ����) 90�� �μ��� �ִ� ����� ��� (departments)
SELECT * FROM hr.departments
WHERE department_id = 90;

-- ����) 80�� �μ��� �޿��� ��հ� �հ�, �ּ�, �ִ� ���
SELECT AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
WHERE department_id = 80;

-- ����) 50�� �μ��� �޿��� ��հ� �հ�, �ּ�, �ִ� ���
SELECT AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
WHERE department_id = 50;

-- ����) 50�� �μ��� ������ �޿��� ��հ� �հ�, �ּ�, �ִ� ���
SELECT job_id, AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
WHERE department_id = 50
GROUP BY job_id;

-- ����) 80�� �μ��� ������ �޿��� ��հ� �հ�, �ּ�, �ִ� ���
SELECT job_id, AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
WHERE department_id = 80
GROUP BY job_id;

-- ����) 30�� �μ��� ����� �� ���� ���� �Ի��� ����� �޿��� ��հ� �հ�, �ּ�, �ִ� ��
SELECT AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM hr.employees
WHERE department_id = 30
GROUP BY hire_date;

-- JOIN : �� ���̺� �ִ� ������ ����� �� ���
SELECT department_id, department_name, manager_id, location_id FROM hr.departments;

-- ����) 90�� �μ��� ���� ����� �����ȣ, �̸�, �޿�, �μ���ȣ, �μ���, �ּҹ�ȣ ���
SELECT employee_id, first_name, salary, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND e.department_id = 90;
--> JOIN������ ���̺��� ��Ī�� ����� �� ����

-- ����) 50�� �μ��� ������� �����ȣ, �̸�, �޿�, ����, �μ���ȣ ���
SELECT employee_id, first_name, salary, job_id, department_id
FROM hr.employees
WHERE department_id = 50;

-- ����) 50�� �μ��� �μ���ȣ, �μ���, �ּ� ��ȣ ���
SELECT department_id, department_name, location_id
FROM hr.departments
WHERE department_id = 50;

-- ����) 50�� �μ��� ������� �����ȣ, �̸�, �޿�, ����, �μ���ȣ, �μ���, �ּҹ�ȣ ���
SELECT employee_id, first_name, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND e.department_id = 50;

-- ����) �� ����� �����ȣ, �̸�, �޿�, ����, �μ���ȣ, �μ���, �ּҹ�ȣ ���
SELECT employee_id, first_name, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id;

-- ����) �� ����� �̸�, �Ի���, ����, �����ȣ, �μ���ȣ, �μ���, �ּ� ���
SELECT first_name, hire_date, job_id, employee_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id;
--> ���� ������ �ּ� n-1�� �̴�. (n = ���̺� ����)

-- ���� ���� : jobs
SELECT * FROM hr.jobs;
SELECT job_id, job_title, min_salary, max_salary FROM hr.jobs;

-- ����) AD_PRES�� ������ ���� ������� �����ȣ, �̸�, �޿�, �μ���ȣ, ������ȣ ���
SELECT employee_id, first_name, salary, department_id, job_id FROM hr.employees
WHERE job_id LIKE '%AD_PRES%';

-- ����) AD_PRES�� �������� ���
SELECT * FROM hr.jobs
WHERE job_id LIKE '%AD_PRES%';

-- ����) AD_PRES�� ������ ���� ������� �����ȣ, �̸�, �޿�, �μ���ȣ, ������ȣ, ������ ���
SELECT employee_id, first_name, salary, department_id, e.job_id, job_title
FROM hr.employees e, hr.jobs j
WHERE e.job_id = j.job_id
AND e.job_id LIKE 'AD_PRES';

-- ����) FI_MGR�� ������ ���� ������� �����ȣ, �̸�, �޿�, �μ���ȣ, ������ȣ, ������ ���
SELECT employee_id, first_name, salary, department_id, e.job_id, job_title 
FROM hr.employees e, hr.jobs j
WHERE e.job_id = j.job_id
AND e.job_id LIKE 'FI_MGR';

-- ����) ST_MAN�� ������ ���� ������� �����ȣ, �̸�, �޿�, �μ���ȣ, ������ȣ, ������ ���
SELECT employee_id, first_name, salary, department_id, e.job_id, job_title 
FROM hr.employees e, hr.jobs j
WHERE e.job_id = j.job_id
AND e.job_id LIKE 'ST_MAN';

-- ����) 90�� �μ��� ����� �̸�, �Ի���, ����, �����ȣ, �μ���ȣ, �μ���, �ּ�
-- T-SQL JOIN
SELECT first_name, hire_date, job_id, employee_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND e.department_id = 90;

-- ANSI JOIN
SELECT first_name, hire_date, job_id, employee_id, e.department_id, department_name, location_id
FROM hr.employees e JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.department_id = 90;

-- ����) ST_MAN�� ������ ���� ������� �����ȣ, �̸�, �޿�, �μ���ȣ, ������ȣ, ������ ��� (ANSI JOIN)
SELECT employee_id, first_name, salary, department_id, e.job_id, job_title
FROM hr.employees e JOIN hr.jobs j
ON e.job_id = j.job_id
WHERE j.job_id LIKE 'ST_MAN';

-- ����) 114���� ����� ����� �����ȣ, �̸�, �޿�, �μ���ȣ, ������ȣ, ��� ���
SELECT employee_id, first_name, salary, department_id, job_id, manager_id FROM hr.employees
WHERE manager_id = 114;

-- ����) �μ����� 114���� �μ��� ���
SELECT * FROM hr.departments
WHERE manager_id = 114;

-- ����) �μ����� ����� ����� �̸�, �Ի���, ����, �μ���ȣ, �μ���, �ּ�
SELECT first_name, hire_date, job_id, e.department_id, department_name, location_id, e.manager_id
FROM hr.employees e JOIN hr.departments d
ON e.manager_id = d.manager_id;

-- ����) 114���� �μ����� �������� �����ȣ, �̸�, ����, Ŀ�̼�, �Ի���, �޿�, �μ���ȣ, �μ��� ���
SELECT employee_id, first_name, job_id, commission_pct, hire_date, salary, e.department_id, department_name
FROM hr.employees e JOIN hr.departments d
ON e.manager_id = d.manager_id
WHERE d.manager_id = 114;

-- ����) 120���� �����ȣ, �̸�, �Ի���, �޿�, ������ȣ, �μ���ȣ
SELECT employee_id, first_name, hire_date, salary, job_id, department_id
FROM hr.employees
WHERE employee_id = 120;

-- ����) 30�� �μ�����(�μ���ȣ, �μ���, �ּҹ�ȣ) ���
SELECT department_id, department_name, location_id
FROM hr.departments;

-- ����) ST_MAN�� ������ȣ, ������ ���
SELECT job_id, job_title
FROM hr.jobs WHERE job_id LIKE 'ST_MAN';

-- ����) 120���� �����ȣ, �̸�, �Ի���, �޿�, ������ȣ, �μ���ȣ, �μ���, �ּҹ�ȣ
SELECT employee_id, first_name, hire_date, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e JOIN hr.departments d
ON e.department_id = d.department_id
WHERE employee_id = 120;

-- ����) 120���� �����ȣ, �̸�, �Ի���, �޿�, ������ȣ, �μ���ȣ
SELECT employee_id, first_name, hire_date, salary, job_id, department_id
FROM hr.employees
WHERE employee_id = 120;

-- ����) 120���� �����ȣ, �̸�, �Ի���, �޿�, ������ȣ, ������, �μ���ȣ
SELECT employee_id, first_name, hire_date, salary, e.job_id, job_title, department_id
FROM hr.employees e JOIN hr.jobs j
ON e.job_id = j.job_id
WHERE employee_id = 120;

-- 3�� ����
-- ����) 120�� ����� ������, ������ȣ, �����ȣ, �̸�, �Ի���, �޿�, �μ���ȣ, �μ���
SELECT job_title, j.job_id, employee_id, first_name, hire_date, salary, e.department_id, department_name
FROM hr.jobs j, hr.employees e, hr.departments d
WHERE j.job_id = e.job_id AND e.department_id = d.department_id
AND employee_id = 120;

-- ����) 115�� ����� �����ȣ, �̸�, �޿�, ����, �μ���ȣ
SELECT employee_id, first_name, salary, job_id, department_id FROM hr.employees
WHERE employee_id = 115;

-- ����) 30�� �μ��� �μ���ȣ, �μ���, �ּҹ�ȣ ���
SELECT department_id, department_name, location_id FROM hr.departments
WHERE department_id = 30;

SELECT employee_id, first_name, salary, job_id, e.department_id, department_name
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND employee_id = 115;

-- ����) 115�� ����� �����ȣ, �̸�, �޿�, ����, �μ���ȣ
SELECT employee_id, first_name, salary, job_id, department_id FROM hr.employees
WHERE employee_id = 115;

-- ����) PU_CLERK�� ������ȣ, ������ ���
SELECT job_id, job_title FROM hr.jobs
WHERE job_id = 'PU_CLERK';

SELECT employee_id, first_name, salary, department_id, e.job_id, job_title
FROM hr.employees e, hr.jobs j
WHERE e.job_id = j.job_id
AND j.job_id = 'PU_CLERK';

-- ����) ��� 115���� ������, ������ȣ, �����ȣ, �̸�, �޿�, �Ի���, ���, �μ���ȣ, �μ��� ���
SELECT job_title, e.job_id, employee_id, first_name, salary, hire_date, e.manager_id, e.department_id, department_name
FROM hr.jobs j, hr.employees e, hr.departments d
WHERE j.job_id = e.job_id AND e.department_id = d.department_id
AND employee_id = 115;