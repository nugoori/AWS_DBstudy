# transaction

# mySQL에선 commit이 자동으로 실행되도록 설정
select @@autocommit;
set autocommit = 0; #commit off

# 
start transaction;

savepoint insert_user;
insert into user_tb
values(0, 'ddd', '1234');

select * from user_tb;

savepoint update_user_password;
update user_tb set password = '1111' where username = 'ddd';

rollback to savepoint update_user_password;
rollback to savepoint insert_user; 
rollback; # start 한 시점으로

commit; # = ctr + s
# commit을 하지 않으면 DB에 저장이 되지 않음
