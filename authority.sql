# 사용자 추가
create user test1@localhost identified by '1234'; # @% ? > 어디에서나 접근 가능

use mysql;
select host, user from user;

# 사용자 권한
revoke all on study3.* from test1@localhost;

grant all privileges on study3.user_tb to test1@localhost;
grant select, delete, update on study2.* to test1@localhost;

create user 'test2'@'%' identified by '1234';
use mysql; # object클래스 같은 DB
select host, user from user;

alter user 'test2'@'%' identified by '1111';
flush privileges;

alter user 'test1'@'localhost' identified by '1111';
flush privileges;

grant select, insert on `study3`.`user_tb` to 'test2'@'%';
flush privileges;

revoke insert on `study3`.`user_tb` from 'test2'@'%';
flush privileges;

show grants for 'test2'@'%';

# '영문이름'@'localhost', 에서만 접속 가능 비번 1234
use mysql;
select host, user from user;
create user 'hojin'@'localhost' identified by '1234';

#  해당 계정의 비번을 1q2w3e4r로 변경
alter user 'hojin'@'localhost' identified by '1q2w3e4r';

# 권한 study2db : user_tb(select, insert, update, delete)
grant select, insert, update, delete on `study2`.`user_tb` to 'hojin'@'localhost';
flush privileges;

# update 권한 회수
revoke update on `study2`.`user_tb` from 'hojin'@'localhost';
flush privileges;

# study3 db : product_tb(select)
grant select on `study3`.`product_tb` to 'hojin'@'localhost';
flush privileges;
show grants for 'hojin'@'localhost';

# delete 권한 추가
grant delete on `study3`.`product_tb` to 'hojin'@'localhost';
flush privileges;
