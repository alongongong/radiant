- 재고관리 테이블 (+상품정보)
테이블1
옷번호, 옷이름, 카테고리, 정가, 할인율
create table radiantInfo(
clnum number(5) primary key,
clname varchar(120) not null,
category varchar(50) not null,
price number(10) not null,
salerate number(5) default 0);

테이블2
옷번호, 옷옵션, 입고, 구매수, 재고
create table radiantStock(
clnum number(5),
color varchar(30),
entercount number(10),
outcount number(10),
foreign key(clnum) references radiantInfo on delete set null);

테이블3
옷번호, 옷 상세정보, 리뷰수, 좋아요
create table radiantDetail(
clnum number(5),
cldetail varchar(300),
likecount number(10),
foreign key(clnum) references radiantInfo on delete set null);

CREATE SEQUENCE seq_radianttop start with 1  maxvalue 99 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_radiantpants start with 101  maxvalue 199 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_radiantouter start with 201  maxvalue 299 NOCACHE NOCYCLE;

- 배송정보 테이블
테이블1 (radiantmember)
아이디, 이름, 비번, 핸드폰, 이메일

테이블2 (배송정보) - 마이페이지에서 설정
아이디, 우편번호, 주소1, 주소2
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
