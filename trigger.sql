insert into user_tb
values(0, 'ㄱㅈ일');

insert into table1 # select의 결과를 테이블에 넣을 수 있음!!
select
	0,
	(select ifnull(max(user_id), 0) from user_tb),
    concat((select
				name 
			from 
				user_tb 
			where 
				user_id = (select 
								ifnull(max(user_id), 0)
							from 
								user_tb)), '의 자기소개');


insert into table1
values(0, 1, 'ㄱㅈ일의 자기소개');


insert into table2
values(0, 1, '자기소개 내용을 입력하세요');

delete
from
	user_tb
where
	name = 'ㄱㅈ일';
