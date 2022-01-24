SELECT empno,ename,dname,job,hiredate
FROM emp
INNER JOIN dept ON dept.deptno=emp.deptno;

CREATE VIEW vw_emp_dept_details AS
SELECT empno,ename,dname,job,hiredate
FROM emp
INNER JOIN dept ON dept.deptno=emp.deptno


SELECT empno,ename,dname,job,hiredate
FROM vw_emp_dept_details;


SELECT e.ename,e.job,e.sal,
m.ename,dname,branchname
FROM emp e join emp m ON e.mgr=m.empno
JOIN dept ON dept.deptno=e.deptno
JOIN branch ON branch.branchno=e.branchno
WHERE e.empno=(SELECT empno FROM emp 
WHERE sal=(SELECT MIN(sal) FROM emp));


CREATE VIEW vw_min_salary AS
SELECT e.ename,e.job,e.sal,
m.ename AS managername,dname,branchname
FROM emp e join emp m ON e.mgr=m.empno
JOIN dept ON dept.deptno=e.deptno
JOIN branch ON branch.branchno=e.branchno
WHERE e.empno=(SELECT empno FROM emp 
WHERE sal=(SELECT MIN(sal) FROM emp));


SELECT * FROM vw_min_salary;

SELECT ename,sal,comm from emp;
SELECT ename,comm from emp where comm >0;
select ename,sal,comm,sal+comm As Totalsal
from emp order by comm;

select ename,sal,comm,sal+coalesce(comm,0) As Totalsal,
case
	when comm>0 then 'Commission Added'
	else 'No Commission considered'
end as remark
from emp order by comm;

select ename,sal,comm,sal+coalesce(comm,0) As Totalsal,
case
	when comm>0 then sal+comm
	when comm=0 OR comm is null then sal+200
	else sal
	end as TotalSal
from emp order by comm;

ALTER VIEW vw_min_salary 
RENAME TO vw_emp_min_sal;

do $$
<<emp_block>>
declare
	emp_count integer:=0;
begin
	select count(*) into emp_count
	from emp;
	raise notice 'The number of emps is %', emp_count;
end emp_block $$;


do
'
<<emp_block>>
declare
emp_count integer := 0;
begin
select count(*)
into emp_count
from emp;
raise notice ''The number of emps is %'', emp_count;
end emp_block;';