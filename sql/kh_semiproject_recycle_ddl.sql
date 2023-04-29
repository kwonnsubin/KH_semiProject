-- 회원테이블
DROP TABLE MEMBER;
CREATE TABLE MEMBER (
NICKNAME VARCHAR2(20),
PWD VARCHAR2(20) NOT NULL,
PWDCHECK VARCHAR(20) NOT NULL,
EMAIL VARCHAR2(20) PRIMARY KEY
);


-- 게시판테이블
DROP TABLE BOARD_T
create table BOARD_T (
BOARD_NO NUMBER PRIMARY KEY, 
WRITER VARCHAR2(20),
PWD VARCHAR2(20),
TITLE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(4000) NOT NULL,
REGDATE TIMESTAMP DEFAULT(CURRENT_TIMESTAMP)
);
-- 시퀀스 생성
CREATE SEQUENCE BOARD_S NOCACHE;


-- 카테고리 테이블 중간테이블
drop table cateNum;
create table cateNum (
BOARD_NO NUMBER REFERENCES BOARD_T(BOARD_NO) ON DELETE CASCADE,
CATE_NO NUMBER REFERENCES cateName(CATE_NO) ON DELETE CASCADE
);

-- 카테고리 이름
drop table cateName;
create table cateName (
CATE_NO NUMBER primary key ,
CATENAME VARCHAR2(20) NOT NULL
);

-- 댓글 테이블
DROP TABLE REPLY;
create table REPLY (
BOARD_NO NUMBER REFERENCES BOARD_T(BOARD_NO) ON DELETE CASCADE,
REPLY_NO NUMBER PRIMARY KEY,
REPLY_WRITER VARCHAR2(20) NOT NULL,
REPLY_REGDATE TIMESTAMP DEFAULT(CURRENT_TIMESTAMP),
REPLY_CONTENT VARCHAR2(4000) NOT NULL,
REPLY_PWD VARCHAR2(20) NOT NULL
);


-- 재활용 테이블
drop table recycle;
create table recycle (
recycle_code number primary key,
recycle_name VARCHAR2(20) NOT NULL,
recycle_tag varchar(300),
recycle_check varchar(10) CHECK (recycle_check IN ('가능', '불가능')),
content varchar(4000),
title varchar2(4000)
);

-- 재활용분류번호 테이블(1,2,3) 중간 테이블
DROP TABLE cf_code;
create table cf_code (
recycle_code REFERENCES recycle(recycle_code) ON DELETE CASCADE,
cf_code number primary key REFERENCES cf(cf_code) ON DELETE CASCADE
);

-- 재활용분류종류 테이블(대형생활폐기물, 의류수거함, 일반쓰레기)
DROP TABLE cf;
create table cf (
cf_code number primary key,
cf_name varchar(30)
);