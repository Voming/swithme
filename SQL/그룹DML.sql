select * from sgroup;

SELECT SGROUP_ID, SGROUP_NAME, SGROUP_IMG_PATH,
		SGROUP_IMG_NAME FROM SGROUP
		WHERE SGROUP_ID IN
		(SELECT SGROUP_ID
		FROM
		SGROUP_MEMBER
		WHERE
		SGROUP_MEM_ID ='b');
        
select s.*, count(*) OVER(PARTITION BY 1) from         
(SELECT *  FROM SGROUP
    JOIN SGROUP_MEMBER USING (SGROUP_ID)
		WHERE SGROUP_ID = '53') s;
        
SELECT S.SGROUP_ID, S.SGROUP_NAME, S.SGROUP_OPEN,
		S.SGROUP_PWD, S.SGROUP_EXPLAIN, S.SGROUP_IMG_PATH, S.SGROUP_IMG_NAME, S.SGROUP_MEM_ID,
		COUNT(*) OVER(PARTITION BY 1) MEM_COUNT FROM
		(SELECT * FROM SGROUP
		JOIN
		SGROUP_MEMBER USING (SGROUP_ID)
		WHERE SGROUP_ID = '53') S;


    
select * from sgroup_member;
insert into SGROUP_MEMBER(sgroup_id, sgroup_mem_id) VALUES (53, 'song');
insert into SGROUP_MEMBER(sgroup_id, sgroup_mem_id) VALUES (53, 'won');
commit;


select *from member;

select * from record  where record_mem_id = 'oh';




--원본 기록 있는 사용자만 나옴
SELECT
    round(SUM(to_number(to_char(record_end, 'HH24MISS')) - to_number(to_char(record_start, 'HH24MISS'))) / 100) AS "SUM_MIN", record_mem_id AS "MEMID"
FROM
    record
WHERE record_start >= ( sysdate - 7 ) AND  record_mem_id IN (SELECT SGROUP_MEM_ID FROM SGROUP_MEMBER WHERE SGROUP_ID = '53')
GROUP BY record_mem_id;

--원본 기록 있는 사용자만 나옴
SELECT
    round(SUM(to_number(to_char(record_end, 'HH24MISS')) - to_number(to_char(record_start, 'HH24MISS'))) / 100) 
FROM
    record
WHERE record_start >= ( sysdate - 7 ) AND  record_mem_id = 'song';



select sum(to_number(TO_DATE(record_end, 'HH24MISS') - TO_DATE(record_start, 'HH24MISS')))
from record where record_mem_id = 'song'
and record_start >=(SYSDATE-14) ;

SELECT TO_CHAR((record_end - record_start),'HH24MISS')from record where record_mem_id = 'song'
and record_start >=(SYSDATE-7) ;



select record_end - record_start, record_mem_id
from record where record_mem_id = 'song'
and record_start >=(SYSDATE-7) ;

SELECT to_number(TO_CHAR(record_end, 'HH24MISS')), to_number(TO_CHAR(record_start, 'HH24MISS')) FROM record;

select TO_CHAR(ROUND(sum(to_number(TO_CHAR(record_end, 'HH24MISS')) - to_number(TO_CHAR(record_start, 'HH24MISS')))/24/60/60),'hh24:mi:ss')
from record where record_mem_id = 'song'
and record_start >=(SYSDATE-7) ;


SELECT      TO_CHAR(TRUNC(SYSDATE) + NUMTODSINTERVAL(1425, 'second'),'hh24:mi:ss') "hh24:mi:ss 로 변환_1번째 방법",
            TO_CHAR(TO_DATE(1425,'sssss'),'hh24:mi:ss') "hh24:mi:ss 로 변환_2번째 방법",       
            TO_CHAR(TRUNC(1425/3600),'FM9900') || ':' ||
            TO_CHAR(TRUNC(MOD(1425,3600)/60),'FM00') || ':' ||
            TO_CHAR(MOD(1425,60),'FM00') "hh24:mi:ss 로 변환_3번째 방법"
FROM        DUAL;

SELECT
    SYSDATE + 1, -- 현재시간 + 1일
    SYSDATE + 1/24, -- 현재시간 + 1시간
    SYSDATE + 1/24/60,  -- 현재시간 + 1분
    SYSDATE + 1/24/60/60,  -- 현재시간 + 1초
    (SYSDATE - (SYSDATE -1)) *24, -- 오늘날짜 - 어제날짜 경과한 시간 시간단위 환산
    (SYSDATE - (SYSDATE -1)) *24*60, -- 오늘날짜 - 어제날짜 경과한 시간 분단위 환산
    (SYSDATE - (SYSDATE -1)) *24*60*60 -- 오늘날짜 - 어제날짜 경과한 시간 초단위 환산
FROM DUAL;

SELECT    DECODE (TRUNC (2000 / 60), 0, '', TRUNC (2000 / 60) || '시간 ')
       || LPAD ((MOD (2000, 60)), 2, '0')
       || '분'
  FROM DUAL;
  
  
select sum(to_number(TO_CHAR((record_end- record_start), 'HH24MISS')))
from record where record_mem_id = 'song'
and record_start >=(SYSDATE-7) ;

SELECT      TO_CHAR(TRUNC(171425/(3600*24)),'FM00') || ':' ||
            MOD(TRUNC(171425/3600),24) || ':' || 
            TO_CHAR(TRUNC(MOD(171425,3600)/60),'FM00') || ':' ||
            TO_CHAR(MOD(171425,60),'FM00') "dd:hh:mm:ss 로 변경"
FROM        DUAL;

select * from sgroup;

update sgroup set sgroup_explain= '수정중'
where sgroup_id = 52;



select * from (
select * from sgroup order by DBMS_RANDOM.RANDOM
)
where rownum <= 20;

select * from sgroup where sgroup_name like '%번%';


select SUBJECT_ID, SUBJECT_NAME ,DIFFTIME    
from (SELECT SUBJECT_ID, SUBJECT_NAME  FROM SUBJECT WHERE MEM_ID ='song'  AND SUBJECT_DEL_DATE IS NULL) t1   
	FULL JOIN 
	( SELECT RECORD_SUBJECT_ID, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME 
	  FROM RECORD WHERE RECORD_MEM_ID ='song'  and to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd') 
	  group by cube(RECORD_SUBJECT_ID) ) t2 
	on (SUBJECT_ID = RECORD_SUBJECT_ID) 
ORDER BY SUBJECT_ID ASC NULLS FIRST;

select SUBJECT_ID, SUBJECT_NAME ,DIFFTIME, SUBJECT_COLOR 
from (SELECT SUBJECT_ID, SUBJECT_NAME ,SUBJECT_COLOR  FROM SUBJECT WHERE MEM_ID ='song' AND SUBJECT_DEL_DATE IS NULL) t1   
	FULL JOIN 
	( SELECT RECORD_SUBJECT_ID, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME 
	  FROM RECORD WHERE RECORD_MEM_ID = 'song'  and to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd') 
	  group by RECORD_SUBJECT_ID ) t2 
	on (SUBJECT_ID = RECORD_SUBJECT_ID) 
ORDER BY SUBJECT_ID ASC NULLS FIRST;



select * from sgroup_member;

SELECT * FROM SGROUP
		WHERE SGROUP_ID = 53;
--그룹원 일주일 통계 - 코드 테이블 기준     
SELECT
NUMTODSINTERVAL ( sum(RECORD_END - RECORD_START) ,'day') AS "SUM_MIN",
		RECORD_MEM_ID AS "MEM_ID"
		FROM
		RECORD
        WHERE RECORD_START >= ( SYSDATE - 7	) AND
		RECORD_MEM_ID IN (SELECT	SGROUP_MEM_ID FROM SGROUP_MEMBER WHERE		SGROUP_ID = 53)
		GROUP BY RECORD_MEM_ID
        ;

--그룹원 전부 일주일 통계 - 그룹 멤버 테이블 기준
SELECT 
		s.sgroup_mem_id AS "MEM_ID",
        NUMTODSINTERVAL( sum(r.RECORD_END - r.RECORD_START) ,'day') AS "SUM_MIN"
		FROM SGROUP_MEMBER s
        join RECORD  r on (s.sgroup_mem_id = r.record_mem_id)
        WHERE  r.RECORD_START >= ( SYSDATE - 7 ) and sgroup_id = 53
        GROUP BY s.sgroup_mem_id
        ;    
        
        
--모든 멤버 출력 및 널은 0으로 표시   
SELECT 
		s.sgroup_mem_id AS "MEM_ID",
        nvl( substr( to_char(NUMTODSINTERVAL( sum(r.RECORD_END - r.RECORD_START),'day'), 'hh24:mi:ss'), 10, 10), '0') AS "SUM_MIN"
		FROM SGROUP_MEMBER s
        left join (select * from  RECORD WHERE  RECORD_START >= ( SYSDATE - 7 ) ) r on (s.sgroup_mem_id = r.record_mem_id)
        where sgroup_id = 53
        GROUP BY s.sgroup_mem_id
        ;   
        

--SELECT COUNT(*)
--    FROM T_MEMBER
--    WHERE TO_CHAR(JOINDATE, 'yyyymmdd') =
--        TO_CHAR(TRUNC(sysdate,'iw')-7, 'yyyymmdd'


--그룹원 한명 일주일 통계 - 그룹 멤버 테이블 기준
SELECT 
		s.sgroup_mem_id AS "MEM_ID",
        NUMTODSINTERVAL( sum(r.RECORD_END - r.RECORD_START) ,'day') AS "SUM_MIN"
		FROM SGROUP_MEMBER s
        join RECORD  r on (s.sgroup_mem_id = r.record_mem_id)
          WHERE  r.RECORD_START BETWEEN SYSDATE - 3 and SYSDATE - 2
        GROUP BY s.sgroup_mem_id
        ;    
        
select * from record;
              
-- 지난주 일요일
SELECT TRUNC(sysdate, 'd')-7 지난주일요일 FROM DUAL;
-- 지난주 주간날짜
SELECT SYSDATE 오늘
    ,TRUNC(sysdate,'d')-7 일
    ,TRUNC(sysdate,'d')-6 월
    ,TRUNC(sysdate,'d')-5 화
    ,TRUNC(sysdate,'d')-4 수
    ,TRUNC(sysdate,'d')-3 목
    ,TRUNC(sysdate,'d')-2 금
    ,TRUNC(sysdate,'d')-1 토
FROM DUAL;

select "aaa" mem_id, to_char(SYSDATE - 1, 'yyyy-mm-dd d') d1, to_char(SYSDATE - 2, 'yyyy-mm-dd d') d2,  to_char(SYSDATE - 3, 'yyyy-mm-dd day') d3,  to_char(SYSDATE - 4, 'yyyy-mm-dd day') d4, 
 to_char(SYSDATE - 5, 'yyyy-mm-dd day') d5,  to_char(SYSDATE - 6, 'yyyy-mm-dd day') d6,  to_char(SYSDATE - 7, 'yyyy-mm-dd day') d7 
 from dual
; 
select 'aaa' mem_id, to_char(SYSDATE - 1, 'yyyy-mm-dd dy') d1, to_char(SYSDATE - 2, 'yyyy-mm-dd dy') d2
 from dual 
union
--;
SELECT a.sgroup_mem_id mem_id,
    (SELECT 
        to_char(NUMTODSINTERVAL( sum(r.RECORD_END - r.RECORD_START) ,'day'), 'hh24:mi:ss')
		FROM SGROUP_MEMBER s
        join RECORD  r on (s.sgroup_mem_id = r.record_mem_id)
          WHERE  r.RECORD_START BETWEEN SYSDATE - 2 and SYSDATE - 1
          and  s.sgroup_mem_id = a.sgroup_mem_id
        )
    AS "d1"
    ,(SELECT 
        to_char(NUMTODSINTERVAL( sum(r.RECORD_END - r.RECORD_START) ,'day'), 'hh24:mi:ss')
		FROM SGROUP_MEMBER s
        join RECORD  r on (s.sgroup_mem_id = r.record_mem_id)
          WHERE  r.RECORD_START BETWEEN SYSDATE - 3 and SYSDATE - 2
          and  s.sgroup_mem_id = a.sgroup_mem_id
       )
    AS "d2"
--    (SELECT 
--        NUMTODSINTERVAL( sum(r.RECORD_END - r.RECORD_START) ,'day')
--		FROM SGROUP_MEMBER s
--        join RECORD  r on (s.sgroup_mem_id = r.record_mem_id)
--          WHERE  r.RECORD_START BETWEEN SYSDATE - 2 and SYSDATE - 1
--          and  s.sgroup_mem_id = a.sgroup_mem_id
--        )
--    AS "d1"
--    ,(SELECT 
--        NUMTODSINTERVAL( sum(r.RECORD_END - r.RECORD_START) ,'day')
--		FROM SGROUP_MEMBER s
--        join RECORD  r on (s.sgroup_mem_id = r.record_mem_id)
--          WHERE  r.RECORD_START BETWEEN SYSDATE - 3 and SYSDATE - 2
--          and  s.sgroup_mem_id = a.sgroup_mem_id
--       )
--    AS "d2"
FROM SGROUP_MEMBER a
 where a.sgroup_id = '53'
  GROUP BY a.sgroup_mem_id
 ;



select '그룹원' mem_id, to_char(SYSDATE - 7, 'dy') d1, to_char(SYSDATE - 6, 'dy') d2, to_char(SYSDATE - 5, 'dy') d3, to_char(SYSDATE - 4, 'dy') d4
, to_char(SYSDATE - 3, 'dy') d5, to_char(SYSDATE - 2, 'dy') d6, to_char(SYSDATE - 1, 'dy') d7
 from dual 
union
SELECT a.sgroup_mem_id mem_id
    ,(SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        
        FROM (
            SELECT
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM record 
                WHERE trunc(record_end) = trunc(sysdate-7)
                and record_mem_id =  a.sgroup_mem_id
                )))
    AS "d1"
     ,(SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        
        FROM (
            SELECT
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM record 
                WHERE trunc(record_end) = trunc(sysdate-6)
                and record_mem_id =  a.sgroup_mem_id
                )))
    AS "d1"  ,(SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        
        FROM (
            SELECT
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM record 
                WHERE trunc(record_end) = trunc(sysdate-5)
                 and record_mem_id = a.sgroup_mem_id
                )))
    AS "d1"  ,(SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        
        FROM (
            SELECT
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM record 
                WHERE trunc(record_end) = trunc(sysdate-4)
                 and record_mem_id =  a.sgroup_mem_id
                )))
    AS "d1"  ,(SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        
        FROM (
            SELECT
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM record 
                WHERE trunc(record_end) = trunc(sysdate-3)
                and record_mem_id =  a.sgroup_mem_id
                )))
    AS "d1"  ,(SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        
        FROM (
            SELECT
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM record 
                WHERE trunc(record_end) = trunc(sysdate-2)
                 and record_mem_id =  a.sgroup_mem_id
                )))
    AS "d1"  ,(SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        
        FROM (
            SELECT
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM record 
                WHERE trunc(record_end) = trunc(sysdate-1)
                and record_mem_id =  a.sgroup_mem_id
                )))
    AS "d1"
FROM SGROUP_MEMBER a
 where a.sgroup_id = '53'
GROUP BY a.sgroup_mem_id
 ;
 
 --시간 합 올바르게 계산
 SELECT 
     nvl(FLOOR(total_seconds / 3600),'00')  || ':' ||
     nvl(FLOOR(MOD(total_seconds, 3600) / 60),'00')    || ':' ||
     nvl(MOD(total_seconds, 60),'00')  as sum_min
FROM (
    SELECT 
        SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
            (EXTRACT(MINUTE FROM difftime) * 60) + 
            EXTRACT(SECOND FROM difftime)) AS total_seconds
    FROM (
        SELECT 
            NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
        FROM 
            record
        WHERE 
            record_mem_id = 'hyuk' and RECORD_end >= ( SYSDATE - 30 )
    )
);

select * from record;
-- 00:00:00 으로 표시
SELECT 
    nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
    nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
    nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
FROM (
    SELECT 
        SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
            (EXTRACT(MINUTE FROM difftime) * 60) + 
            EXTRACT(SECOND FROM difftime)) AS total_seconds
    FROM (
        SELECT 
            NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
        FROM 
            record
        WHERE 
            record_mem_id = 'b' 
            and trunc(record_end) = trunc(sysdate-1)
            and RECORD_end >= ( SYSDATE - 30 ))
        );
        
 -- 00:00:00 으로 표시
SELECT 
    nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
    nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
    nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
FROM (
    SELECT 
        SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
            (EXTRACT(MINUTE FROM difftime) * 60) + 
            EXTRACT(SECOND FROM difftime)) AS total_seconds
    FROM (
        SELECT 
            NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
        FROM 
            record
        WHERE trunc(record_end) = trunc(sysdate-1)
        )
        );
               
        
select '그룹원' mem_id, to_char(SYSDATE - 7, 'dy') d1, to_char(SYSDATE - 6, 'dy') d2, to_char(SYSDATE - 5, 'dy') d3, to_char(SYSDATE - 4, 'dy') d4
, to_char(SYSDATE - 3, 'dy') d5, to_char(SYSDATE - 2, 'dy') d6, to_char(SYSDATE - 1, 'dy') d7
 from dual 
union
SELECT a.sgroup_mem_id "mem_id"
    , (SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        FROM (
            SELECT 
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM 
                    record r join SGROUP_MEMBER  s on (s.sgroup_mem_id = r.record_mem_id)
                WHERE  trunc(record_end) = trunc(sysdate-1)
               
                    )
                ) GROUP BY  r.record_mem_id
        )AS "d1"
   , (SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        FROM (
            SELECT 
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM 
                    record
                WHERE 
                    record_mem_id = 'b' 
                    and trunc(record_end) = trunc(sysdate-1)
                    and RECORD_end >= ( SYSDATE - 30 ))
                )
        )AS "d2"
         , (SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        FROM (
            SELECT 
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM 
                    record
                WHERE 
                    record_mem_id = 'b' 
                    and trunc(record_end) = trunc(sysdate-1)
                    and RECORD_end >= ( SYSDATE - 30 ))
                )
        )AS "d3"
         , (SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        FROM (
            SELECT 
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM 
                    record
                WHERE 
                    record_mem_id = 'b' 
                    and trunc(record_end) = trunc(sysdate-1)
                    and RECORD_end >= ( SYSDATE - 30 ))
                )
        )AS "d4"
         , (SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        FROM (
            SELECT 
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM 
                    record
                WHERE 
                    record_mem_id = 'b' 
                    and trunc(record_end) = trunc(sysdate-1)
                    and RECORD_end >= ( SYSDATE - 30 ))
                )
        )AS "d5"
         , (SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        FROM (
            SELECT 
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM 
                    record
                WHERE 
                    record_mem_id = 'b' 
                    and trunc(record_end) = trunc(sysdate-1)
                    and RECORD_end >= ( SYSDATE - 30 ))
                )
        )AS "d6"
         , (SELECT 
        nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
        nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
        nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00')  as sum_min
        FROM (
            SELECT 
                SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
                    (EXTRACT(MINUTE FROM difftime) * 60) + 
                    EXTRACT(SECOND FROM difftime)) AS total_seconds
            FROM (
                SELECT 
                    NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime
                FROM 
                    record
                WHERE trunc(record_end) = trunc(sysdate-1)
                ))
        )AS "d7"
FROM SGROUP_MEMBER a
 where a.sgroup_id = '53'
  GROUP BY a.sgroup_mem_id
 ;