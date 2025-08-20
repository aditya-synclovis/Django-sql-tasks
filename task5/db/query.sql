-- projectId → ID of the project
-- projectName → Name of the project
-- departmentName → Department linked to the project
-- totalEmployees → Distinct employees who worked on the project
-- totalHours → Total hours logged
-- billedAmount → totalHours × billing_rate
-- avgUtilization → Average hours per employee
-- topEmployee → Employee with the maximum hours in that project

SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';
SELECT @@sql_mode;

with top_emp as(
select 
	ts.emp_id,
    ts.project_id,
	row_number() over (partition by ts.project_id order by ts.hours desc) as rn
from timesheets as ts),
emp_det as (
select 
		ts.project_id , 
		sum(ts.hours) as tot_hrs, 
		count(distinct ts.emp_id)  as tot_emp
from timesheets as ts
group by ts.project_id)
select 
		pro.id as projectId,
        pro.name as projectName,
        dep.name as departmentName,
        emp_det.tot_emp as totalEmployees,
        emp_det.tot_hrs as totalHours,
        emp_det.tot_hrs*pro.billing_rate as billedAmount,
        round(emp_det.tot_hrs/emp_det.tot_emp,1) as avgUtilization,
        emp.name as topEmployee
from projects as pro
join departments as dep on dep.id=pro.dept_id and dep.is_active=1
join top_emp on top_emp.project_id=pro.id and top_emp.rn=1
join emp_det on emp_det.project_id=pro.id
join employees as emp on top_emp.emp_id=emp.id
group by pro.id,dep.name,emp_det.tot_emp,emp_det.tot_hrs ;