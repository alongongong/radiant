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
buycount number(10),
sellcount number(10),
stockcount number(10),
foreign key(clnum) references radiantInfo on delete set null);

테이블3
옷번호, 옷 상세정보, 리뷰수, 좋아요
create table radiantDetail(
clnum number(5),
cldetail varchar(300),
like number(10),
foreign key(clnum) references radiantInfo on delete set null);


- 배송정보 테이블
테이블1 (radiantmember)
아이디, 이름, 비번, 핸드폰, 이메일

테이블2 (배송정보) - 마이페이지에서 설정
아이디, 우편번호, 주소1, 주소2


- 게시판 테이블 (-> 검색기능)
테이블1
글번호, 아이디, 제목, 내용, 글비번, 첨부파일, 날짜, 

테이블2

- 리뷰 테이블