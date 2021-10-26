배송지 추가
create table radiantship(
	id varchar(30),
	shipName varchar(30),	--배송지명
	shipZipcode varchar(10),	--배송지 우편번호
	shipAddr1 varchar(150),		--배송지 주소1
	shipAddr2 varchar(150),		--배송지 상세주소
	receiver varchar(30),		--수령인
	shipTel1 varchar(10),		
	shipTel2 varchar(10),
	shipTel3 varchar(10),
	baseShipCheck varchar(8)	--기본배송지 체크
);