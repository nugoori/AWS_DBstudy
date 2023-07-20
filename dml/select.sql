select * from student_tb;
select
	student_id,
    student_name,
    student_age,
    student_score
from
	student_tb
where
	(student_age = 20
    or student_score is not null)
    and student_name = 'ㄱㅈ일'; # is null
    
update student_tb # preference SQL editor 에서 
set 
	student_score = 20
where
	student_age = 21;
    
# 나이가 20살인 학생들의 점수를 전부 더하세요
select
	student_age,
    sum(student_score) as total_score # entity 변수명! select에서는 alias 생략 안함
from
	student_tb
-- where 
-- 	student_age = 20
group by # 
	student_age
having
	total_score = 20;
  
select # select 실행 순서 이해하기 ( from > where > group by > select > having > order by )
	count(*)
from 
	student_tb
where
	student_age = 20;

select
	*
from
	student_tb
order by
	student_score desc,
    student_id desc;

  
insert into student_tb 
values
	(0, 'ㄱㅈ일', 20, 0),
	(0, 'ㄱㅈ이', 21, 0),
    (0, 'ㄱㅈ삼', 20, null),
    (0, 'ㄱㅈ사', 22, null),
    (0, 'ㄱㅈ오', 21, 0);	