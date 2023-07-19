select * from test_tb;

# insert(데이터 추가)
insert into `study1`.`test_tb`(`test_id`, `name`, `birthday`) values(3, 'ㄱㅈㅅ', '1994-09-09'); # ctr + d 복사
insert into `study1`.`test_tb`(`test_id`, `birthday` , `name`) values(4, '1994-09-09', 'ㄱㅈ사');
insert into study1.test_tb(test_id, birthday, name) values(5, '1994-09-09', 'ㄱㅈㅇ');
insert into test_tb values(6, '1994-09-13', 'ㄱㅈㅇ');
insert into test_tb(test_id, birthday) values(7, '1994-09-14');
insert into test_tb values(8, 'ㄱㅈㅍ', null);