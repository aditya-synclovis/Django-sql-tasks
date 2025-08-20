select * from fee_types;

-- classId → ID of the class
-- className → Name of the class
-- feeType → Name of the fee type
-- highAttendanceUnpaid → Number of students with > 75% attendance but unpaid
-- lowAttendancePaid → Number of students with < 50% attendance but paid

with stu_att as(
	select  stu.id AS student_id,
			stu.class_id,
			(count(case when att.status='P' then 1 End) * 100)/count(*) as att_per
    from students as stu
    join attendance as att on stu.id=att.student_id and att.is_active=1 
    where stu.is_active=1
    group by stu.id , stu.class_id
), 
PaymentStatus as (
	select
        stu.id as student_id,
        ft.id as fee_type_id,
        case when sum(fc.amount_paid) > 0 then true else false end as paid
    from students stu
    join fee_types ft
    left join fee_collections fc on stu.id = fc.student_id and ft.id = fc.fee_type_id and fc.is_active = TRUE
    where stu.is_active = true
    group by stu.id, ft.id

)
select
    cls.id as classId,
    cls.name as className,
    ft.name as feeType,
    COUNT(DISTINCT CASE WHEN sa.att_per > 75 AND fs.paid = FALSE THEN sa.student_id END) as highAttendanceUnpaid,
    COUNT(DISTINCT CASE WHEN sa.att_per < 50 AND fs.paid = TRUE THEN sa.student_id END) as lowAttendancePaid
FROM classes as cls
JOIN students as stu ON cls.id = stu.class_id AND stu.is_active = TRUE
JOIN fee_types as ft ON ft.is_active = TRUE
LEFT JOIN stu_att sa ON sa.student_id = stu.id
LEFT JOIN PaymentStatus fs ON fs.student_id = stu.id AND fs.fee_type_id = ft.id
WHERE cls.is_active = TRUE
GROUP BY cls.id, cls.name, ft.name
ORDER BY cls.id, ft.name;

