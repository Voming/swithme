ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

DROP SEQUENCE SEQ_BOARD_ID;

CREATE SEQUENCE  "SWITHME"."SEQ_BOARD_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;


SELECT * FROM BOARD;
desc board;

insert into board values(1, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(2, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(3, 'kim', '코딩 공부중', '반가워요', default, default, default);
insert into board values(4, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(5, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(6, 'kim', '코딩 공부중', '반가워요', default, default, default);
insert into board values(7, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(8, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(9, 'kim', '코딩 공부중', '반가워요', default, default, default);
insert into board values(10, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(11, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(12, 'kim', '코딩 공부중', '반가워요', default, default, default);
insert into board values(13, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(14, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(15, 'kim', '코딩 공부중', '반가워요', default, default, default);
insert into board values(16, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(17, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(18, 'kim', '코딩 공부중', '반가워요', default, default, default);


insert into board values(19, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(20, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(21, 'kim', '코딩 공부중', '반가워요', default, default, default);
insert into board values(22, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(23, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(24, 'kim', '코딩 공부중', '반가워요', default, default, default);
insert into board values(25, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(26, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(27, 'kim', '코딩 공부중', '반가워요', default, default, default);
insert into board values(28, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(29, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(30, 'kim', '코딩 공부중', '반가워요', default, default, default);
insert into board values(31, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(32, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(33, 'kim', '코딩 공부중', '반가워요', default, default, default);
insert into board values(34, 'song', '안녕하세요', '반가워요', default, default, default);
insert into board values(35, 'oh', '안녕', '반가워요', default, default, default);
insert into board values(36, 'kim', '코딩 공부중', '반가워요', default, default, default);

INSERT INTO BOARD(BOARD_ID, BOARD_WRITER, TITLE, CONTENT, WRITE_TIME, READ_COUNT, BOARD_LIKE)
VALUES(SEQ_BOARD_ID.nextval, 'oh', '코딩어려워요 ㅠㅠ', '이렇게 어려운데 어떻게 취업하죠 ㅎ', default, default, default);



commit;

delete from board;
commit;

select * from member;

SELECT
    "A1"."BOARD_ID"                                       "BOARD_ID",
    "A1"."TITLE"                                          "TITLE",
    to_char("A1"."WRITE_TIME", 'yyyy-mm-dd hh:mi')         "WRITE_TIME",
    "A1"."BOARD_WRITER"                                   "BOARD_WRITER",
    "A1"."READ_COUNT"                                     "READ_COUNT"
FROM
    "SWITHME"."BOARD" "A1"
ORDER BY
    "A1"."BOARD_ID" DESC
;



SELECT TITLE, BOARD_WRITER, to_char(WRITE_TIME, 'yyyy-mm-dd hh:mi') WRITE_TIME, BOARD_LIKE, CONTENT FROM BOARD WHERE BOARD_ID = 10;


select * from member;

select * from board_reply;

--mybatis 들어갈 sql문 확인
INSERT INTO BOARD_REPLY 
		VALUES((SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY) , 1, 'song', '안녕',
				default, default, (SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY), DEFAULT);
                
INSERT INTO BOARD_REPLY 
		VALUES((SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY) , 1, 'oh', '반갑습니다',
				default, default, (SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY), DEFAULT);

delete from  BOARD_REPLY;

desc board_reply;


--댓글 순서 업데이트
UPDATE BOARD_REPLY SET REPLY_STEP = REPLY_STEP+1  WHERE
    REPLY_REF = ( SELECT REPLY_REF FROM BOARD_REPLY WHERE REPLY_ID = ?)
    AND
    REPLY_STEP > ( SELECT REPLY_STEP FROM BOARD_REPLY WHERE REPLY_ID = ? );
    
--대댓글 작성
INSERT INTO BOARD_REPLY VALUES ( (SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY), ?,
?, ? , default , 
(SELECT REPLY_LEVEL+1 FROM BOARD_REPLY WHERE REPLY_ID = ? )  , 
(SELECT REPLY_REF     FROM BOARD_REPLY WHERE REPLY_ID = ? )  , 
(SELECT REPLY_STEP+1  FROM BOARD_REPLY WHERE REPLY_ID = ? )  );

--boardId, replyWriterid, replyContent, dafault, 

SELECT TITLE, BOARD_WRITER, to_char(WRITE_TIME, 'yyyy-mm-dd hh:mi') WRITE_TIME, BOARD_LIKE, CONTENT FROM BOARD WHERE BOARD_ID = 10;
desc board;


desc board_reply;

--대댓글 확인
SELECT REPLY_ID, REPLY_WRITER_ID ,REPLY_CONTENT, REPLY_WRITE_TIME, REPLY_LEVEL, REPLY_REF, REPLY_STEP
FROM BOARD_REPLY
WHERE BOARD_ID = 1 ORDER BY REPLY_REF ASC, REPLY_STEP;

desc record;

select * from record;
 
--일간 랭킹
SELECT record_mem_id, SUBSTR(((sysdate - record_end) - (sysdate - record_start)), 11, 9) AS 총공부시간
from RECORD;


    
    
SELECT
    round(SUM(to_number(to_char(record_end, 'HH24MISS')) - to_number(to_char(record_start, 'HH24MISS'))) / 100) AS "SUM_MIN", record_mem_id AS "MEMID"
FROM
    record
WHERE record_start >= ( sysdate - 7 ) AND  record_mem_id IN (SELECT SGROUP_MEM_ID FROM SGROUP_MEMBER WHERE SGROUP_ID = '53')
GROUP BY record_mem_id;


SELECT RECORD_MEM_ID, to_number(to_char(record_end, 'HH24MISS'))
FROM RECORD;

SELECT RECORD_MEM_ID, RECORD_END
FROM RECORD;

SELECT record_mem_id, sum(to_number(record_end/60))
from record
    group by record_mem_id;
    
select record_mem_id, SUM(TO_DATE(record_end, 'hh24miss') - TO_DATE(record_start, 'hh24miss'))
from record
    group by record_mem_id;
    
    
--1. 일단 timestamp 자체가 서로 자료형이 같아서 그냥 빼지는거같음    
select Record_start, record_end, record_end - Record_start time_difference
from record;

select record_end - Record_start time_difference
from record
where record_mem_id = 'a';

--2. 이러고 그냥 더할수 없어서 second 단위로 바꿔준다.     
 select Record_start, record_end, 
        to_number(to_char(record_end,'sssss')) - to_number(to_char(Record_start,'sssss')) seconds_difference
from record; 

--3. 자료형을 number로 변환해주고 그 다음 더한다.
select record_mem_id, sum (86400 * (trunc(record_end) - trunc(Record_start)) + to_number(to_char(record_end,'sssss')) - to_number(to_char(Record_start,'sssss'))) total_time_difference
from record
    group by record_mem_id;
    
-- 4. 다시 시간으로 변환해주기
select record_mem_id, numtodsinterval( sum(  86400 * (trunc(record_end) - trunc(Record_start)) + to_number(to_char(record_end,'sssss')) - to_number(to_char(Record_start,'sssss')))
        , 'second') time_difference
from record
    group by record_mem_id;




-- 일간 랭킹 시간 구하기
select SUBJECT_ID, SUBJECT_NAME ,DIFFTIME    
from (SELECT SUBJECT_ID, SUBJECT_NAME,SUBJECT_DEL_DATE  FROM SUBJECT WHERE MEM_ID ='won' ) t1   
FULL JOIN 
	( SELECT RECORD_SUBJECT_ID, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME 
	  FROM RECORD WHERE RECORD_MEM_ID = 'won' and to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd')
	  group by cube(RECORD_SUBJECT_ID) ) t2 
on (SUBJECT_ID = RECORD_SUBJECT_ID) 
where subject_id is null;




SELECT 
  record_mem_id,
  NUMTODSINTERVAL(SUM(
    (CAST(record_end AS DATE) - CAST(record_start AS DATE)) * 86400
  ), 'SECOND') AS total_study_time
FROM 
  record
GROUP BY 
  record_mem_id;



--월간 랭킹

SELECT TITLE, BOARD_WRITER, to_char(WRITE_TIME, 'yyyy-mm-dd hh:mi') WRITE_TIME, BOARD_LIKE, CONTENT FROM BOARD WHERE BOARD_ID = 62
;

select * from board;
select * from board_reply;


delete from board_reply;
commit;


--댓글 
INSERT INTO BOARD_REPLY 
		VALUES((SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY) , #{boardId}, #{replyWriterid}, #{replyContent},
				default, (SELECT NVL(MAX(reply_ref),0)+1 FROM BOARD_REPLY), 1, 1);
                
--댓글 예시    
INSERT INTO BOARD_REPLY 
		VALUES((SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY) , 62,'song','알겠습니다',
				default, (SELECT NVL(MAX(reply_ref),0)+1 FROM BOARD_REPLY), 1, 1);
                
INSERT INTO BOARD_REPLY 
		VALUES((SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY) , 62,'kim','헤이헤이',
				default, (SELECT NVL(MAX(reply_ref),0)+1 FROM BOARD_REPLY), 1, 1);                
                
                
--대댓글
INSERT INTO BOARD_REPLY 
		VALUES((SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY) , 62,'kim','헤이헤이',
				default, #{reply_ref}, (SELECT NVL(MAX(reply_step),0)+1 FROM BOARD_REPLY where reply_id=#{reply_id}),  (SELECT NVL(MAX(reply_level),0)+1 FROM BOARD_REPLY));

--대댓글 예시
INSERT INTO BOARD_REPLY 
		VALUES((SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY) , 62,'','헤이헤이',
				default, 3, (SELECT NVL(MAX(reply_step),0)+1 FROM BOARD_REPLY where reply_id= ),  (SELECT NVL(MAX(reply_level),0)+1 FROM BOARD_REPLY));
            
INSERT INTO BOARD_REPLY 
		VALUES((SELECT NVL(MAX(REPLY_ID),0)+1 FROM BOARD_REPLY) , 62, 'seo', '감사합니다.',
				default, (SELECT NVL(MAX(reply_ref),0)+1 FROM BOARD_REPLY), 1, 1);
            
desc board_reply;


SELECT REPLY_ID, REPLY_WRITER_ID ,REPLY_CONTENT, REPLY_WRITE_TIME, REPLY_LEVEL, REPLY_REF, REPLY_STEP
		FROM BOARD_REPLY
		WHERE BOARD_ID = 62
			ORDER BY REPLY_REF ASC, REPLY_STEP;
            
select * from board_reply;
delete from board_reply 
    where REPLY_ID = 4 
    and  ( select reply_ref  from board_reply where REPLY_ID = 4 ) 
    
    ;
 select * 
 from ( select reply_ref, reply_step, reply_level  from board_reply where REPLY_ID = 4 ) t1
 where reply_step any<(select 
 ;
