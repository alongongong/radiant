--장바구니 테이블
create table cart(
cart_id number not null primary key, --장바구니 코드(일련번호)
userid varchar2(50) not null, -- 아이디
product_id number not null,   -- 상품코드
color varchar2(30) not null, --옷색깔
amount number default 0,       -- 수량
product_name varchar2(50) not null,
price number not null
); 
--foreign key 설정
alter table cart add constraint cart_userid_fk
foreign key(userid) references radiantmember(id);

alter table cart add
foreign key(product_id) references radiantinfo(clnum);

--시퀀스 
create sequence seq_cart
start with 1 
increment by 1;