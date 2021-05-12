select * from hr.employees;

-- ����) ��� ���̺��� �����ȣ�� �̸�, �޿�, ����, �μ���ȣ
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID, DEPARTMENT_ID FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY + 300, SALARY FROM HR.employees;

-- ����) ��� ���̺��� �����ȣ, �μ���ȣ, ����, �޿� ����ϴµ� ��������
SELECT employee_id, department_id, job_id, salary * 12 FROM hr.employees;

-- ����) ��� ���̺��� �����ȣ, �μ���ȣ, ����, ������ ����ϴµ� �ſ� 300�� ���ʽ� ����
SELECT employee_id, department_id, job_id, (salary + 300) * 12 FROM hr.employees;

-- ����) ��� ���̺��� �����ȣ, �μ���ȣ, ����, ������ ����ϴµ� �������޿� 300�� Ư�� ���ʽ��� ����
SELECT employee_id, department_id, job_id, (salary * 12) + 300 FROM hr.employees;

-- ����) ��� ���̺��� �����ȣ, �̸�, �Ի���, �޿�, �޿��� 30% Ŀ�̼�
SELECT employee_id, first_name, hire_date, salary, salary * 0.3 FROM hr.employees;

-- ����) �����ȣ, �̸�, �޿�, �޿��� ���� Ŀ�̼� ���
SELECT employee_id, first_name, salary, commission_pct, salary * commission_pct FROM hr.employees;

-- ��Ī (alias)
SELECT employee_id AS e_id, first_name f_name, last_name "l name", department_id "D_id" FROM hr.employees;

-- ����) �����ȣ�� �޿��� ����ϴ� ���̿� �Ʒ� ������ ���
-- "kingSteven�� ������ AD_PRES�Դϴ�"
SELECT employee_id, first_name || '�� ������ ' || job_id || '�Դϴ�.', salary FROM hr.employees; 

SELECT DISTINCT department_id FROM hr.employees;

SELECT DISTINCT department_id, first_name, salary FROM hr.employees;

-- ������ �Ի����� ���� �ٸ� �����?
SELECT DISTINCT job_id, hire_date FROM hr.employees;

-- ��� ����� �߿��� 90�� �μ��� ����� ���
SELECT * FROM hr.employees
WHERE department_id = 90;

-- �����ȣ, ��, ����, �μ��� ���
SELECT employee_id, last_name, job_id, department_id FROM hr.employees;

-- �����ȣ, ��, ����, �μ��� ����� �� 90�� �μ��� ���
SELECT employee_id, last_name, job_id, deparment_id FROM hr.employees
WHERE department_id = 90;

SELECT * FROM hr.employees
WHERE first_name = 'Nancy';

SELECT * FROM hr.employees WHERE employee_id = 110;

-- ����) �޿��� 3000 �̻��� ������� ���� �޿��� ����Ͻÿ�.
SELECT last_name, salary FROM hr.employees
WHERE salary >= 3000;

-- ����) �Ի����� 06/01/03���� �ʰ� �Ի��� ���
SELECT employee_id, first_name, salary FROM hr.employees
WHERE hire_date > '06/01/03';

-- ����) �޿��� 3000�� �ƴ� ����� ��� ���
SELECT employee_id, first_name, salary FROM hr.employees
WHERE salary != 3000;

-- ����) ���� King���� Smith ���̿� �ִ� ����� ���
SELECT * FROM hr.employees 
WHERE last_name BETWEEN 'King' AND 'Smith';

-- ����) �Ի����� 02/06/07 ���� 06/01/03���̿� �Ի��� ��� ���
SELECT * FROM hr.employees
WHERE hire_date BETWEEN '02/06/07' AND '06/01/03';

-- ����) �μ��� 50, 70, 90�� ������� �����ȣ, �̸�, ���, �޿� ���
SELECT employee_id, first_name, manager_id, salary, department_id FROM hr.employees
WHERE department_id IN (50, 70, 90);

-- ����) ��簡 100, 101, 102�� �����
SELECT * FROM hr.employees
WHERE manager_id IN (100, 101, 102);

SELECT last_name FROM hr.employees
WHERE last_name LIKE 'S%';

SELECT hire_date FROM hr.employees
WHERE hire_date Like '02%';

-- ����) 04�⵵�� �Ի��� ����� ���
SELECT * FROM hr.employees
WHERE hire_date LIKE '04%';

-- ����) ������ 'ST'�� �����ϴ� ���
SELECT * FROM hr.employees
WHERE job_id LIKE 'ST%';

-- ����) �̸����� 'MW'�� �����ϴ� ���
SELECT * FROM hr.employees
WHERE email LIKE 'MW%';

-- ����) ������ 'ST'�� ������ ���
SELECT * FROM hr.employees
WHERE job_id LIKE '%ST';

-- ����) ������ 'CL'�� ���Ե� �����
SELECT * FROM hr.employees
WHERE job_id LIKE '%CL%';

-- ����) ������ 'ST'�� ���Ե� �����
SELECT * FROM hr.employees
WHERE job_id LIKE '%ST%';

-- ����) 07�⵵�� �Ի��ϰų� 07���� �Ի��ϰų� 07�Ͽ� �Ի��� �����
SELECT * FROM hr.employees
WHERE hire_date LIKE '%07%';

-- ����) �̸��Ͽ� ù��° ���ڰ� 'K'�� �����ϴ� �����
SELECT * FROM hr.employees
WHERE email LIKE 'K%';

-- ����) �̸��Ͽ� �ι�° ���ڰ� 'K'�� �����
SELECT * FROM hr.employees
WHERE email LIKE '_K%';

-- ����) ���� �ι�° ���ڰ� 'o'�� �����
SELECT * FROM hr.employees
WHERE last_name LIKE '_o%';

-- ����) �̸��Ͽ� ����° ���ڰ� 'O'�� �����
SELECT * FROM hr.employees
WHERE email LIKE '__O%';

-- ����) �̸��� �������� ���ڰ� 'O'�� �����
SELECT * FROM hr.employees
WHERE email LIKE '%O';

-- ����) �̸��� ���������� �ι�° ���ڰ� 'O'�� �����
SELECT * FROM hr.employees
WHERE email LIKE '%O_';

-- ����) �̸����� �տ��� �ι�°�� K�̰� �ڿ��� �ι�°�� O�� �����
SELECT * FROM hr.employees
WHERE email LIKE '_k%O_';

SELECT * FROM hr.employees
WHERE email LIKE '_A%I_';

-- IT_�� �����ϴ� ����
SELECT * FROM hr.employees
WHERE job_id LIKE 'IT\_%';

-- ����) Ŀ�̼��� ���� ���ϴ� �������� ���
SELECT * FROM hr.employees
WHERE commission_pct IS NULL;

-- ����) ��簡 ���� ������ ���
SELECT * FROM hr.employees
WHERE manager_id IS NULL;

-- ����) �μ��� ���� ������ ���
SELECT * FROM hr.employees
WHERE department_id IS NULL;

-- ����) �޿��� 5000���� 10000������ ����
SELECT * FROM hr.employees
WHERE salary BETWEEN 5000 AND 10000;

SELECT * FROM hr.employees
WHERE salary >= 5000 AND salary <= 10000;

-- ����) �Ի����� 03/06/17���� 05/09/21 ���̿� �Ի��� �����
SELECT * FROM hr.employees
WHERE hire_date BETWEEN '03/06/17' AND '05/09/21';

SELECT * FROM hr.employees
WHERE hire_date >= '03/06/17' AND hire_date <= '05/09/21';

-- ����) �޿��� 10000�̻��̸鼭 ������ 'MAN'�� ���ԵǾ��ִ� �����
SELECT * FROM hr.employees
WHERE SALARY >= 10000 AND job_id LIKE '%MAN%';

SELECT * FROM hr.employees
WHERE SALARY >= 10000 OR job_id LIKE '%MAN%';

-- 'AD_PRED', 'AD_VP', 'IT_PROG'�� ���
SELECT * FROM hr.employees
WHERE job_id IN ('AD_PRED', 'AD_VP', 'IT_PROG');

-- 'AD_PRED', 'AD_VP', 'IT_PROG'�ƴ� ���
SELECT * FROM hr.employees
WHERE job_id NOT IN ('AD_PRED', 'AD_VP', 'IT_PROG');

-- �޿��� 5000�̻��̰� 10000���ϰ� �ƴ� ���
SELECT * FROM hr.employees
WHERE salary NOT BETWEEN 5000 AND 10000;

SELECT * FROM hr.employees
WHERE salary < 5000 OR salary > 10000;

-- ������ IT_PROG�̰ų� ST_MAN�̸鼭 �޿��� 6000�̻�
SELECT * FROM hr.employees
WHERE job_id = 'IT_PROG' AND salary >= 6000
OR job_id = 'ST_MAN' AND salary >= 6000;

SELECT * FROM hr.employees
WHERE job_id in ('IT_PROG', 'ST_MAN') AND salary >= 6000;

-- 'IT_PROG'�̰ų� 'ST_MAN'�̰ų� �޿��� 6000 �̻��� �����
SELECT * FROM hr.employees
WHERE job_id = 'IT_PROG' OR job_id = 'ST_MAN' OR salary >= 6000;

-- �Ի����� ���� ������� ���� ��� ������ ����
SELECT * FROM hr.employees
ORDER BY hire_date;

SELECT * FROM hr.employees
ORDER BY hire_date ASC;

-- �Ի��� ���� �������
SELECT * FROM hr.employees
ORDER BY hire_date DESC;

-- �����ȣ �̸� �Ի��� �޿� �μ���ȣ ����� �� �޿� ���� ���� �޴� ��
-- �޿��� sal�� ��Ī
SELECT employee_id, first_name, hire_date, salary AS sal, department_id
FROM hr.employees
ORDER BY sal DESC;

-- �μ��� ������������ ���ĵ� ���¿��� �μ����� �ִ� ���� ��������
SELECT * FROM hr.employees
ORDER BY department_id ASC, job_id ASC;

-- �μ��� ������������ ���ĵ� ���¿��� �μ����� �ִ� ���� ��������
SELECT * FROM hr.employees
ORDER BY department_id ASC, job_id DESC;

-- 80�� �μ��� �ִ� ����� �Ի����� ���� ������� ���
SELECT * FROM hr.employees
WHERE department_id = 80
ORDER BY hire_date DESC;
