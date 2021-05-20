-- ����) 107�� ����� �����ȣ, �̸�, ����ó, �޿�, ������ȣ, �μ���ȣ ���
SELECT employee_id, first_name, phone_number, salary, job_id, department_id FROM hr.employees
WHERE employee_id = 107;

--����) 107�� ����� �����ִ� 60�� �μ� ���� ���
SELECT * FROM hr.departments
WHERE department_id = 60;

-- ����) 107�� ������ ������ȣ 'IT_PROG' �̸� ���
SELECT job_title FROM hr.jobs
WHERE job_id = 'IT_PROG';

-- ����) 107�� ����� �����ȣ, �̸�, ����ó, �޿�, ������ȣ, �μ���ȣ, �μ���, �ּҹ�ȣ
SELECT employee_id, first_name, phone_number, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND employee_id = 107;

-- ����) 107�� ����� �����ȣ, �̸�, ����ó, �޿�, ������ȣ, �μ���ȣ, ������ ���
SELECT employee_id, first_name, phone_number, salary, e.job_id, department_id, job_title
FROM hr.employees e, hr.jobs j
WHERE e.job_id = j.job_id
AND employee_id = 107;

SELECT job_title, e.job_id, employee_id, first_name, salary, phone_number, e.department_id, department_name, location_id
FROM hr.jobs j, hr.employees e, hr.departments d
WHERE j.job_id = e.job_id AND e.department_id = d.department_id
AND employee_id = 107;

SELECT job_title, e.job_id, employee_id, first_name, salary, phone_number, e.department_id, department_name, location_id
FROM hr.jobs j JOIN hr.employees e
ON j.job_id = e.job_id JOIN hr.departments d
ON e.department_id = d.department_id
WHERE employee_id = 107;

DESC hr.locations;

SELECT * FROM hr.locations;

-- ����) 108�� ����� �����ȣ, ��, �Ի���, ����, �޿�, �μ���ȣ, �μ���, �ּҹ�ȣ, �ּ�, ��
SELECT employee_id, last_name, hire_date, job_id, salary, e.department_id, department_name, d.location_id, street_address, city
FROM hr.employees e JOIN hr.departments d 
ON e.department_id = d.department_id JOIN hr.locations l
ON d.location_id = l.location_id
WHERE employee_id = 108;

-- �� ����
-- ����) 10�� ����� �޿��� ��� �����鿡 ���ϴ��� Ȯ��
SELECT * FROM hr.employees WHERE employee_id = 109;

SELECT employee_id, last_name, salary, job_title
FROM hr.employees e, hr.jobs j
WHERE salary BETWEEN min_salary AND max_salary
AND employee_id = 109;

-- ����) �޿��� 5000���� 10000 ���̿� �ִ� ����鸸 ���
SELECT * FROM hr.employees
WHERE salary BETWEEN 5000 AND 10000;

-- ����) �����ȣ, ��, �޿�, ����, �Ի���, �μ���ȣ, �μ���
SELECT employee_id, last_name, salary, job_id, hire_date, e.department_id, department_name
FROM hr.employees e JOIN hr.departments d
ON e.department_id = d.department_id;

-- OUTER JOIN
-- ����) �����ȣ, �̸�, �Ի���, �޿�, ����, �μ���ȣ, �μ���, �ּҹ�ȣ ���
-- �μ��� ���� ����� ���
SELECT employee_id, first_name, hire_date, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e LEFT OUTER JOIN hr.departments d
ON e.department_id = d.department_id;

SELECT employee_id, first_name, hire_date, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e RIGHT OUTER JOIN hr.departments d
ON e.department_id = d.department_id;

-- ����) �μ��� ���� ����� ����ϰ� ����� ���� �μ��� ���
SELECT employee_id, first_name, hire_date, salary, job_id, e.department_id, department_name, location_id
FROM hr.employees e FULL OUTER JOIN hr.departments d
ON e.department_id = d.department_id;

-- JOIN : �� ���̺� �ִ� ������ Ȯ���� ��
--> T-SQL JOIN, ANSI-JOIN, ������(BETWEEEN AND), OUTER JOIN, 3������
--> ���� ���� : n-1 (n = ���̺� ����)
--> �� ���̺� ���� ���ǿ� �����ϴ� �͸� ��µǹǷ� ������ ��ġ���� �ʴ� �����ʹ� ��� �ȵ�
--> ��� ���� ���̺��� �����͸� �� ����ϰ� �ʹٸ� OUTER JOIN

-- PROJECTION : ���ϴ� �÷��� ����ϴ� �� SELECT ~ FROM
-- SELECTION : ���ϴ� �� ����� �� ��� : SELECT ~ FROM ~ WHERE
-- ���� �� �Լ� : �� �ϳ����� ���ڷ� �޾Ƽ� ����� �������� ��
--> SUBSTR, INSTR, CONCAT, LPAD, RPAD, TRIM, LENGTH
--> NVL, ROUND, TRUNC, MOD, TO_CHAR, TO_DATE
-- ���� �� �Լ� : SUM, AVG, MIN, MAX, COUNT
--> ���� �� �� ���� �޾Ƽ� �ϳ��� ��� ���� ���
-- �������� : ������ �ȿ� ������
--> ���� ������ �ȿ� �� �ٸ� SELECT���� ����������� ��

-- ����) 106�� ����� �޿��� ���� �޿��� �޴� ����� ���
SELECT salary FROM hr.employees WHERE employee_id = 106;

SELECT * FROM hr.employees
WHERE salary = (SELECT salary FROM hr.employees WHERE employee_id = 106);

-- ����) ���� Austin�̶�� ����� ���� ���ϴ� ��� ���
SELECT * FROM hr.employees
WHERE department_id = (SELECT department_id FROM hr.employees WHERE last_name = 'Austin');

-- ����) 141���� ������ ���� ������ �ϴ� ��� ���
SELECT * FROM hr.employees
WHERE job_id = (SELECT job_id FROM hr.employees WHERE employee_id = 141);

-- ����) 141���� ������ ���� ������ �ϰ� 143���� ����� �޿����� ���� �޿��� �޴� ���
SELECT * FROM hr.employees
WHERE job_id = (SELECT job_id FROM hr.employees WHERE employee_id = 141)
AND salary > (SELECT salary FROM hr.employees WHERE employee_id = 143);

-- ����) ���� �޿��� �޴� ���
SELECT * FROM hr.employees
WHERE salary = (SELECT MIN(salary) FROM hr.employees);

-- ����) 90�� �μ��� ��� �޿����� ���� �޴� ���
SELECT * FROM hr.employees
WHERE salary > (SELECT AVG(salary) FROM hr.employees WHERE department_id = 90);

-- ����) �Ի����� 178������ �ʰ� �Ի��� ���
SELECT * FROM hr.employees
WHERE hire_date > (SELECT hire_date FROM hr.employees WHERE employee_id = 178);

-- ����) �� �μ��� ��� �޿�
SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id;

-- ����) 50�� �μ��� ��� �޿�
SELECT AVG(salary) FROM hr.employees
WHERE department_id = 50;

-- ����) ��� �޿��� 3475���� ū �μ�
SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) > 3475;

-- ����) 50�� �μ��� ��� �޿����� ���� �μ�
SELECT department_id, AVG(salary) FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) > (SELECT AVG(salary) FROM hr.employees WHERE department_id = 50);

-- ����) 60�� �μ��� ���� �޿����� �� ���� �޿� �޴� ���
SELECT * FROM hr.employees
WHERE salary < (SELECT MIN(salary) FROM hr.employees WHERE department_id = 60);

-- ����) 50, 60, 70�� �μ��� ���� �ݾ�
SELECT department_id, MIN(salary) FROM hr.employees
GROUP BY department_id
HAVING department_id IN(50,60,70);

-- ����) 50, 60, 70�� �μ��� ���� �ݾװ� ���� �޿� �޴� ���
SELECT * FROM hr.employees
WHERE salary IN (SELECT MIN(salary) FROM hr.employees WHERE department_id IN(50,60,70) GROUP BY department_id);

-- ����) �μ��� ���� �޿��� �ش��ϴ� ���
SELECT * FROM hr.employees
WHERE salary IN (SELECT MIN(salary) FROM hr.employees GROUP BY department_id);

-- ����) 90�� �μ��� �޿� ������������ ����
SELECT * FROM hr.employees
WHERE department_id = 90
ORDER BY salary ASC;

-- ����) �޿��� 17000 �ʰ� �޴� ���
SELECT * FROM hr.employees
WHERE salary > 17000;

-- ����) 90�� �μ� ���� �ݾ׺��� �� ���� �޴� ���
SELECT * FROM hr.employees
WHERE salary > (SELECT MIN(salary) FROM hr.employees WHERE department_id = 90);

SELECT salary FROM hr.employees
WHERE department_id = 90;

SELECT * FROM hr.employees
WHERE salary > ANY (SELECT salary FROM hr.employees WHERE department_id = 90);

-- ����) 80�� �μ��� ������� �޿� �� ���� ���� �޴� ����� �޿����� �۰� �޴� ���
SELECT * FROM hr.employees
WHERE salary < (SELECT MAX(salary) FROM hr.employees WHERE department_id = 80);
--> �׷� �Լ�

SELECT * FROM hr.employees
WHERE salary < ANY(SELECT salary FROM hr.employees WHERE department_id = 80);
--> ANY ������

-- ����) 80�� �μ��� ����� �� �Ի����� ���� ���� ������� ���� �Ի��� �����
SELECT * FROM hr.employees
WHERE hire_date < ANY(SELECT hire_date FROM hr.employees WHERE department_id = 80);

-- ����) 60�� �μ����� ���� ���� ���� ������� �ʰ� ���� ���
SELECT * FROM hr.employees
WHERE hire_date > ANY(SELECT hire_date FROM hr.employees WHERE department_id = 60);

-- ����) �޿��� 9000, 6000, 4800, 4200�� �����
SELECT * FROM hr.employees
WHERE salary IN(9000,6000,4800,4200);

-- ����) �޿��� 9000, 6000, 4800, 4200�϶� ���� ���� �޴� ������� �� ���� �޴� ���
SELECT * FROM hr.employees
WHERE salary > ALL(SELECT salary FROM hr.employees WHERE salary IN(9000,6000,4800,4200));
--> ALL ū �� ���� ū

-- ����) IT_PROG�� ������ ������ �ִ� ������� �޿� �� ���� ���� �޴� ������� �� ���� �޴� ���
SELECT * FROM hr.employees
WHERE salary > ALL(SELECT salary FROM hr.employees WHERE job_id = 'IT_PROG');

-- ����) IT_PROG�� ������ ������ �ִ� ������� �޿� �� ���� ���� ���� ������� �� ���� �޴� ���
SELECT * FROM hr.employees
WHERE salary < ALL(SELECT salary FROM hr.employees WHERE job_id = 'IT_PROG');

-- ����) IT_PROG�� ������ �ϴ� ������ ���� �޿��� �޴� ���
SELECT * FROM hr.employees
WHERE salary IN (SELECT salary FROM hr.employees WHERE job_id = 'IT_PROG');

--  SET ������ : ������, ������, ������
--> ������ : UNION

-- ����) ��� ���̺��� 108���� ��� ����ϰ� �μ� ���̺��� 80�� �μ��� �μ��� ���
SELECT manager_id FROM hr.employees WHERE employee_id = 108
UNION
SELECT manager_id FROM hr.departments WHERE department_id = 80;

-- ����) ��� ���̺��� ��縦 ��� ����ϰ�, �μ� ���̺��� �μ����� ���
SELECT manager_id FROM hr.employees
UNION
SELECT manager_id FROM hr.departments;
--> UNION : �ߺ� ����, �������� ����

SELECT manager_id FROM hr.employees
UNION ALL
SELECT manager_id FROM hr.departments;
--> UNION ALL : �ߺ� ���ŵ��� ����, ���� �ȵ�

-- ������
-- ����) ���� ���̺��� �ְ� �μ� ���̺��� �ִ� ������
SELECT manager_id FROM hr.employees
INTERSECT
SELECT manager_id FROM hr.departments;

-- ������
-- ����) �μ� ���̺��� �������� ���� ���� ���̺� ���� �����ϴ� ���
SELECT manager_id FROM hr.employees
MINUS
SELECT manager_id FROM hr.departments;

SELECT employee_id, department_id FROM hr.employees
UNION
SELECT manager_id, department_id FROM hr.departments;
--> �÷����� ���� ���� �ƴ϶� ���� Ÿ���� ������ �� 

SELECT department_id, hire_date, to_number(null)
FROM hr.employees
UNION
SELECT department_id, to_date(null), location_id
FROM hr.departments;

SELECT department_id, manager_id, salary FROM hr.employees
UNION
SELECT department_id, manager_id, 0 FROM hr.departments;
--> ���� ���� ��ġ���� �ʾƵ� ����
