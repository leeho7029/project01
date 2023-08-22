CREATE DATABASE gnj;

USE gnj;

-- member
CREATE TABLE MEMBER(
	id VARCHAR(16) NOT NULL,   -- (아이디)
	pw VARCHAR(330) NOT NULL,   -- (비밀번호)
	NAME VARCHAR(100) NOT NULL,   -- (이름)
	email VARCHAR(100) NOT NULL,   -- (이메일)
	tel VARCHAR(13),   -- (전화번호)
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (가입일)
	POINT INT DEFAULT 0,   -- (포인트)
	PRIMARY KEY (id)
);

-- board
CREATE TABLE board(
	bno INT(11) PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
	boardType INT NOT NULL,   -- (게시글 타입) 
	title VARCHAR(200) NOT NULL,   -- (게시글 제목)
	content VARCHAR(1000),   -- (게시글 내용)
	author VARCHAR(16) NOT NULL,   -- (작성자)
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
	cnt INT DEFAULT 0   -- (조회수)
);

-- dat
CREATE TABLE dat(
	dno INT PRIMARY KEY AUTO_INCREMENT,   -- (댓글번호) 자동발생
	id VARCHAR(16) NOT NULL,   -- (댓글 작성자)
	content VARCHAR(1000) NOT NULL,   -- (댓글 내용)
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (댓글 등록일)
	par INT(11) NOT NULL   -- (해당 게시글 번호)
);

-- event
CREATE TABLE EVENT (
	eno INT PRIMARY KEY AUTO_INCREMENT,   -- (이벤트 번호) 자동발생
	STATUS BOOLEAN NOT NULL DEFAULT TRUE,   -- (이벤트 상태)
	regdate TIMESTAMP NOT  NULL DEFAULT CURRENT_TIMESTAMP(),   -- (이벤트 등록일)
	startdate DATE,   -- (이벤트시작일)
	enddate DATE,   -- (이벤트종료일)
	title VARCHAR(200) NOT NULL,   -- (이벤트명)
	content VARCHAR(1000),   -- (이벤트내용)
	img_name VARCHAR(330),   -- (이미지이름)
	img_path VARCHAR(330),   -- (이미지저장위치)
	cnt int DEFAULT 0   -- (조회수)
);

-- qna
CREATE TABLE qna(
	qno INT PRIMARY KEY AUTO_INCREMENT,   -- (문의번호) 자동발생
	title VARCHAR(100) NOT NULL,   -- (문의 제목)
	content VARCHAR(1000) NOT NULL,   -- (문의 내용)
	author VARCHAR(16),   -- (문의 작성자)
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),   -- (문의 등록)
	cnt INT DEFAULT 0,   -- (조회수)
	lev INT DEFAULT 0, -- 질문(0), 답변(1)
	par INT,	-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
	secret BOOLEAN DEFAULT 0,	-- 비밀글 유무
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

-- book
CREATE TABLE book(
	bno INT PRIMARY KEY AUTO_INCREMENT,   -- (책번호) 자동발생
	title VARCHAR(200) NOT NULL,   -- (책제목)
	author VARCHAR(16),   -- (작성자)
	date VARCHAR(30),   -- (등록일)
	company varchar (30),   -- (회사명)
	price INT   -- (가격)
);