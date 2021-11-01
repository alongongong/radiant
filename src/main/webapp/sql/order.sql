-- 결제 테이블
create table radiantorder (
	ordernum varchar(20), -- 주문번호
	id varchar(15),
	shipMoney number, -- 배송비
	shipName varchar(20),
	shipTel1 varchar(5),
	shipTel2 varchar(5),
	shipTel3 varchar(5),
	shipZipcode varchar(10),
	shipAddr1 varchar(100),
	shipAddr2 varchar(100),
	shipMemo varchar(150), -- 배송메모
	payment varchar(30), -- 구매수단
	logtime date default sysdate
);

create table radiantorderproduct (
	ordernum varchar(20), -- 주문번호
	clNum number,
	color varchar(30),
	outCount number
);

-- 배송 테이블
create table radiantdelivery (
	ordernum varchar(20), -- 주문번호
	delivery varchar(20) default '결제완료'-- 배송상황
);

create sequence seq_ordernum start with 10000 NOCACHE NOCYCLE;