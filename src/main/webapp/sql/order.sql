-- 결제 테이블
create table radiantorder (
	oredernum number, -- 주문번호
	id varchar(15),
	clNum number,
	color varchar(30),
	outcount number,
	logtime date default sysdate
);

-- 배송 테이블
create table radiantdelivery (
	ordernum number, -- 주문번호
	delivery varchar(20) -- 배송상황
);

create sequence seq_ordernum start with 10000 NOCACHE NOCYCLE;