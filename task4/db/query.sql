select * from marks
join students as stu on stu.id = marks.student_id
join courses as c on c.id=stu.course_id
;

select 
	distinct c.name as courseName ,
    c.id as courseId,
    count(distinct stu.id) as totalStudents,
    count(distinct marks.subject_id) as subjectCount,
    avg(marks.score) as avgScore,
    count(Case when (marks.score > 40) then 1 End) as passCount
from marks
join students as stu on stu.id = marks.student_id
join courses as c on c.id=stu.course_id
group by c.id,marks.subject_id;

-- courseId → ID of the course
-- courseName → Name of the course
-- totalStudents → Number of students in the course
-- subjectCount → Total subjects in the course
-- avgScore → Average score across all students & subjects
-- passCount → Students with avg score ≥ 40
-- failCount → totalStudents - passCount
-- topperName → Name of the student with the highest avg score

with std_avg as (
    select 
        c.id as course_id,
        c.name as course_name,
        s.id as student_id,
        s.name as student_name,
        avg(m.score) as avg_score
    from courses as c
    join students as s on c.id = s.course_id
    join marks as m on s.id = m.student_id
    where c.is_active = 1 
      and s.is_active = 1 
      and m.is_active = 1
    group by c.id, c.name, s.id, s.name
),
stat as (
    select 
        sa.course_id,
        sa.course_name,
        count(distinct sa.student_id) as total_students,
        avg(sa.avg_score) as overall_avg_score,
        sum(case when sa.avg_score >= 40 then 1 else 0 end) as pass_count,
        sum(case when sa.avg_score < 40 then 1 else 0 end) as fail_count
    from std_avg as sa
    group by sa.course_id, sa.course_name
),
toppers AS (
    select 
        sa.course_id,
        sa.student_name as topper_name,
        row_number() over (partition by sa.course_id order by sa.avg_score desc) as rn
    from std_avg as sa
),
no_subjects as (
    select 
        course_id,
        count(*) as subject_count
    from subjects
    where is_active = 1
    group by course_id
)
select 
    cs.course_id as courseId,
    cs.course_name as courseName,
    cs.total_students as totalStudents,
    sc.subject_count as subjectCount,
    ROUND(cs.overall_avg_score, 1) as avgScore,
    cs.pass_count as passCount,
    cs.fail_count as failCount,
    ct.topper_name as topperName
from stat as cs
join no_subjects sc on cs.course_id = sc.course_id
join toppers ct on cs.course_id = ct.course_id and ct.rn = 1
order by cs.course_id;

