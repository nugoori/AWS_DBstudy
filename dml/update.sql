select * from test_tb;

# update
update test_tb set name = 'ㄱㅈㅊ' where test_id = 7; 
update test_tb set birthday = '1994-09-12' where test_id = 5;
update test_tb set name = 'ㄱㅈ이', birthday = '1994-09-09' where test_id = 2;