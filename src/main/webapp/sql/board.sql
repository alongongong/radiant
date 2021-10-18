CREATE TABLE radiantboard(
     boardSeq NUMBER primary key,       -- 글번호 (시퀀스 객체 이용)
     id VARCHAR2(20) NOT NULL,          -- 아이디
     name VARCHAR2(40) NOT NULL,        -- 이름
     subject VARCHAR2(255) NOT NULL,    -- 제목
     content VARCHAR2(4000) NOT NULL,   -- 내용 
     reply NUMBER DEFAULT 0 NOT NULL,   -- 댓글수
     hit NUMBER DEFAULT 0,              -- 조회수
     logtime DATE DEFAULT SYSDATE		-- 게시글 작성 시간
 );

 create table radiantcomment(
 	commentSeq number(10) primary key, -- 댓글 번호
 	boardSeq number(10) not null, -- 게시글 번호
 	commentId varchar(20) not null, -- 댓글 작성자 
 	commentText varchar(1000) not null, -- 댓글 내용
 	commentDate date default sysdate, -- 댓글 작성 시간
 	foreign key(boardseq) references radiantboard on delete cascade -- 게시글 번호 외래키. 
 ); -- on delete cascade 부모키 삭제되면 내용도 삭제되게!
 
 CREATE SEQUENCE seq_radiantboard  NOCACHE NOCYCLE;
