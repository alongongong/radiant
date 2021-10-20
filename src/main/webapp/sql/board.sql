CREATE TABLE radiantboard(
     boardSeq NUMBER primary key,       -- 글번호 (시퀀스 객체 이용)
     id VARCHAR2(20) NOT NULL,          -- 아이디
     subject VARCHAR2(255) NOT NULL,    -- 제목
     content VARCHAR2(4000) NOT NULL,   -- 내용 
     boardPwd varchar(20) not null,		-- 게시글 비밀번호
     reply NUMBER DEFAULT 0 NOT NULL,   -- 댓글수
     hit NUMBER DEFAULT 0,              -- 조회수
     logtime DATE DEFAULT SYSDATE		-- 게시글 작성 시간
 );

 create table radiantcomment(
 	commentSeq number primary key, 		-- 댓글 번호
 	boardSeq number not null, 			-- 게시글 번호
 	commentId varchar(20) not null, 	-- 댓글 작성자 
 	commentText varchar(1000) not null, -- 댓글 내용
 	commentDate date default sysdate, 	-- 댓글 작성 시간
 	commentParent number, 				-- 대댓글의 부모댓글번호
 	foreign key(boardseq) references radiantboard on delete cascade -- 게시글 번호 외래키. 
 ); -- on delete cascade 부모키 삭제되면 내용도 삭제되게!
 
 CREATE SEQUENCE seq_radiantboard  NOCACHE NOCYCLE;
 
 create sequence seq_radiantcomment nocache nocycle;
 
 - 게시판 테이블 (-> 검색기능)
테이블1 --> 
글번호, 아이디, 제목, 내용, 글비번, 첨부파일, 날짜, 

테이블2

- 리뷰 테이블