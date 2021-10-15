create table radiantMember(
name varchar(30) not null, -- 이름
id varchar(30) primary key, -- 아이디
pwd varchar(30) not null, -- 비밀번호
tel1 varchar(10),
tel2 varchar(10),
tel3 varchar(10),
yy number(10), -- 생년
mm number(10), -- 월
dd number(10), -- 일
email1 varchar(30),
email2 varchar(30),
emailTF varchar(5), -- 메일수신여부
recommenderId varchar(30), -- 추천인ID
memberGrade varchar(30) default 'silver', -- 회원등급
logtime date default sysdate -- 회원가입일자
);