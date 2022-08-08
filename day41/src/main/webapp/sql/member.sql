SELECT * FROM USER_TABLES;

select * from member;

drop table member;

create table member(
	mpk int primary key,
	name varchar(20) not null,
	score int default 0
);
