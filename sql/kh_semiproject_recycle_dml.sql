-- 회원테이블
-- 맨 처음 계정 생성
INSERT INTO MEMBER VALUES('admin', 'admin', 'admin','admin@test.com');
-- 로그인 
select nickname, pwd, email from member where email='admin@test.com' and pwd='admin';
-- 회원가입 추가
INSERT INTO MEMBER VALUES('admin', 'admin', 'admin','admin@test.com');



-- 게시판 목록 
select BOARD_NO, WRITER, PWD, TITLE, CONTENT, REGDATE, CATEGORY from BOARD_T ORDER BY BOARD_NO DESC;
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'subin','subin', '게시글 테스트', '게시판 글 작성 테스트입니다.',DEFAULT, 1);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'user11','user11', '게시글 테스트', '게시판 글 작성 테스트입니다.',DEFAULT, 2);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'user22','user22', '게시글 테스트', '게시판 글 작성 테스트입니다.',DEFAULT, 3);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, '쓰레기','1234', '물엿 어떻게 버릴까요?', '이거 그냥 땅에 버릴 수도 없고.. 어떻게 버려야할까요?',DEFAULT, 4);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, '배고파','1234', '물엿 어떻게 버릴까요?', '이거 그냥 땅에 버릴 수도 없고.. 어떻게 버려야할까요?',DEFAULT, 5);



-- 게시판 수정
update BOARD_T set TITLE ='수정', CONTENT='수정테스트', CATEGORY='2' where PWD ='subin';

-- 게시판 삭제
delete from board_t;


-- 게시판 번호 최대값 + 1
SELECT NVL(max(BOARD_NO), 0) + 1 FROM BOARD_T ;

-- 게시판 조회
select * from board_t;
select BOARD_NO, WRITER, PWD, TITLE, CONTENT, REGDATE, CATEGORY from BOARD_T ORDER BY BOARD_NO DESC;
select BOARD_NO, WRITER, PWD, TITLE, CONTENT, REGDATE from BOARD_T where board_no=12;
select  BOARD_NO, WRITER, PWD, TITLE, CONTENT, REGDATE, CATE_NO, cateName from BOARD_T join cateNum using (BOARD_NO) join cateName using (CATE_NO) where board_no=12;
select Cf_code, Recycle_code, recycle_name from recycle join cf_code using (recycle_code) join cf using (cf_code) where recycle_name LIKE '그릇';

-- 카테고리 테이블(중간테이블)
INSERT INTO cateNum VALUES(22, 1);
INSERT INTO cateNum VALUES(24, 2);
INSERT INTO cateNum VALUES(25, 3);
INSERT INTO cateNum VALUES(26, 4);
INSERT INTO cateNum VALUES(17, 5);

delete from cateNum where CATE_NO=5;


-- 카테고리이름 테이블
INSERT INTO cateName VALUES(1, '질문');
INSERT INTO cateName VALUES(2, '팁/정보');
INSERT INTO cateName VALUES(3, '의견/제안');
INSERT INTO cateName VALUES(4, '뉴스');
INSERT INTO cateName VALUES(5, '기타');



-- 댓글 테이블 
INSERT INTO REPLY VALUES(0, (select NVL(MAX(REPLY_NO),0)+1 from REPLY), 'admin', DEFAULT, '댓글추가아아', '1234');
INSERT INTO REPLY VALUES(7, (select NVL(MAX(REPLY_NO),0)+1 from REPLY), 'admin', DEFAULT, '안나와', '1234');
INSERT INTO REPLY VALUES(7, (select NVL(MAX(REPLY_NO),0)+1 from REPLY), 'admin', DEFAULT, 'ㅇㅇ', '1234');
INSERT INTO REPLY VALUES(10, (select NVL(MAX(REPLY_NO),0)+1 from REPLY), 'admin', DEFAULT, 'ㅇㅇ', '1234');
INSERT INTO REPLY VALUES(9, (select NVL(MAX(REPLY_NO),0)+1 from REPLY), 'admin', DEFAULT, 'ㅇㅇ', '1234');
select BOARD_NO, REPLY_NO, REPLY_WRITER, REPLY_REGDATE, REPLY_CONTENT, REPLY_PWD  from reply;
-- 댓글 삭제
delete from REPLY where REPLY_NO=1 and REPLY_PWD='1234';
-- 댓글 수정
update REPLY set REPLY_CONTENT='댓수정' where REPLY_NO =9 and REPLY_PWD='1234';

-- 재활용 테이블
INSERT INTO recycle VALUES((select NVL(MAX(recycle_code),0)+1 from recycle),'이불', '#솜이불 #담요 #매트리스커버 #침대패드', '가능', '내용');
INSERT INTO recycle VALUES((select NVL(MAX(recycle_code),0)+1 from recycle),'그릇', '#사기그릇 #유리그릇 #유기그릇 #플라스틱그릇 #접시', '불가능', '내용');
INSERT INTO recycle VALUES((select NVL(MAX(recycle_code),0)+1 from recycle),'김치', '#배추김치 #깍두기', '가능', '버리는 방법', '상해서 먹지 못하는 김치는 김장 양념을 물에 한번 헹군 후 음식물쓰레기로 버려요.');

select Cf_code, Recycle_code, recycle_name from recycle join cf_code using (recycle_code) join cf using (cf_code) where recycle_name LIKE '그릇';
select Cf_code, Recycle_code, recycle_name from recycle join cf_code using (recycle_code) join cf using (cf_code) where recycle_name LIKE '그릇';


select * from recycle;
DROP TABLE recycle;
delete from recycle where recycle_code=1;


-- 재활용분류번호 테이블(1,2,3) 중간 테이블
INSERT INTO cf_code VALUES(2,1);
INSERT INTO cf_code VALUES(3,2);
INSERT INTO cf_code VALUES(1,3);
INSERT INTO cf_code VALUES(4,6);
select * from cf_code;


-- 재활용분류종류 테이블(대형생활폐기물, 의류수거함, 일반쓰레기)
INSERT INTO cf VALUES(1, '대형생활폐기물');
INSERT INTO cf VALUES(2, '의류수거함');
INSERT INTO cf VALUES(3, '일반쓰레기');
INSERT INTO cf VALUES(4, '불연성쓰레기');
INSERT INTO cf VALUES(5, '캔류');
INSERT INTO cf VALUES(6, '플라스틱');
select * from cf;

select * 
from recycle 
join cf_code
using (recycle_code)
join cf
using (cf_code)
where recycle_name LIKE '이불';


select * from recycle join cf_code using (recycle_code) join cf using (cf_code) where recycle_name LIKE '이불';
select cf_code, recycle_code, recycle_name, recycle_tag, recycle_check, content, cf_name from recycle join cf_code using (recycle_code) join cf using (cf_code) where recycle_name LIKE '이불';
select recycle_name from recycle join cf_code using (recycle_code) join cf using (cf_code) where recycle_name LIKE '%이%';

-- 20230429 보완
-- 게시판 목록(페이징)
select BOARD_NO, WRITER, PWD, TITLE, CONTENT, REGDATE, CATEGORY 
from (
SELECT ROWNUM AS N
, BOARD_NO
, WRITER
, PWD
, TITLE
, CONTENT
, REGDATE
, CATEGORY 
FROM (SELECT * FROM BOARD_T ORDER BY REGDATE DESC)
)
WHERE N BETWEEN 1 AND 5
;
-- 게시판 글 수
SELECT COUNT(*) FROM BOARD_T;
