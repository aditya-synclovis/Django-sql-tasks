'''
Veiws for handling XML file uploads in a Django REST Framework application.
'''
from rest_framework.views import APIView
from django.http import JsonResponse
import logging
from utils.fetch_query_sql import fetch_query
from utils.list_to_dict import columns_to_dict
logger = logging.getLogger(__name__)


class task4(APIView):
    '''
    University Exam Results Analysis
    '''    
    def get(self, request):
        try:
            query = """
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
                group by c.id, c.name, s.id, s.name),
                stat as (
                select 
                    sa.course_id,
                    sa.course_name,
                    count(distinct sa.student_id) as total_students,
                    avg(sa.avg_score) as overall_avg_score,
                    sum(case when sa.avg_score >= 40 then 1 else 0 end) as pass_count,
                    sum(case when sa.avg_score < 40 then 1 else 0 end) as fail_count
                from std_avg as sa
                group by sa.course_id, sa.course_name),
                toppers AS (
                    select 
                        sa.course_id,
                        sa.student_name as topper_name,
                        row_number() over (partition by sa.course_id order by sa.avg_score desc) as rn
                    from std_avg as sa),
                no_subjects as (
                    select 
                        course_id,
                        count(*) as subject_count
                    from subjects
                    where is_active = 1
                    group by course_id)
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

            """
            # Hit the query
            rows,columns=fetch_query(query,logger)
            # Convert to list of dictionaries
            results=columns_to_dict(rows,columns,logger)
            # return the Response 
            return JsonResponse({
                'success': True,
                'data': results,
                'count': len(results)
            })
            
        except Exception as e:
            logger.error(f"Error Occured: {str(e)}")
            return JsonResponse({
                'success': False,
                'error': f"{str(e)}"
            }, status=500)
