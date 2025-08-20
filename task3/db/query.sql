-- departmentId → ID of the department
-- departmentName → Name of the department
-- totalDoctors → Number of doctors in the department
-- totalPatients → Patients admitted in the given date range
-- avgStayDays → Average number of days between admission & discharge
-- appointmentsCount → Total number of appointments in the given date range
-- doctorPatientRatio → totalPatients ÷ totalDoctors

-- with admDays as (
-- select DATEDIFF(COALESCE(pat.discharged_date),pat.admitted_date ) as days, pat.id from patients as pat 
-- )
-- select * from appointments as app
-- join doctors as doc on doc.id=app.doctor_id
-- join departments as dep on dep.id=doc.dept_id
-- join patients as pat on app.patient_id=pat.id
-- join admDays as days on days.id =pat.id
-- ;


with admDays as (
select DATEDIFF(COALESCE(pat.discharged_date),pat.admitted_date ) as days, pat.id from patients as pat 
)
select 
		dep.name as departmentName,
        count(distinct pat.id) as totalPatients,
		count(dep.name) as appointmentsCount,
        dep.id as departmentId,
        count(distinct doc.id) as totalDoctors,
        round(avg(days.days),1) as avgStayDays,
        round(count(distinct pat.id)/count(distinct doc.id),1) as doctorPatientRatio
from appointments as app
join doctors as doc on doc.id=app.doctor_id and doc.is_active=1
join departments as dep on dep.id=doc.dept_id and dep.is_active=1
join patients as pat on app.patient_id=pat.id 
join admDays as days on days.id =pat.id
 where pat.admitted_date between date('2024-07-31') and date('2026-08-02')
group by dep.name
;


