---광명 시간합 구하다.....
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
-----00:00:00으로 표현 
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
            and TRUNC(RECORD_END) = TRUNC(SYSDATE)
            and RECORD_end >= ( SYSDATE - 30 )
    )
);
select trunc(sysdate) from dual;
------당일 과목합계
SELECT 
    j.mem_id AS "MEM_ID",
     NUMTODSINTERVAL( sum(r.RECORD_END - r.RECORD_START) ,'day') AS "SUM_MIN"
    FROM SUBJECT j
    join RECORD  r on (j.mem_id = r.record_mem_id)
    WHERE  r.RECORD_end = SYSDATE  and MEM_ID='won'
    GROUP BY   j.mem_id
    ;   
-----------과목 시간 합계 리스트 사용불가 추후에 공부시간만 뽑아올 때 사용가능--
SELECT RECORD_SUBJECT_ID
,(SELECT SUBJECT_NAME from SUBJECT where SUBJECT_ID=RECORD_SUBJECT_ID) AS SUBJECT_NAME
, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME
from RECORD
where RECORD_MEM_ID ='won' and to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd')
GROUP BY CUBE(RECORD_SUBJECT_ID)
;


------------------------------------------- 방법 1
SELECT RECORD_SUBJECT_ID
, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME
from RECORD
where RECORD_MEM_ID ='won' 
    and to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd')
GROUP BY CUBE(RECORD_SUBJECT_ID)
;

SELECT SUBJECT_ID, SUBJECT_NAME,MEM_ID 
    -- 여기 시간
    , (
    SELECT SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) 
    from RECORD
    where RECORD_MEM_ID = 'won'
        and to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd')
        and SUBJECT_ID = RECORD_SUBJECT_ID
    ) DIFFTIME
from SUBJECT 
where MEM_ID ='won'

union
SELECT null, null,null
    -- 여기 시간
    , SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8)  as DIFFTIME
from RECORD 
where RECORD_MEM_ID = 'won'
        and to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd')

;
-----------당일 과목별 공부시간 합계--
--SUBJECT_COLOR
---------------------------------- 방법 2 total 시간이 가장 위로
select SUBJECT_ID, SUBJECT_NAME ,DIFFTIME,SUBJECT_COLOR
from 
(
SELECT SUBJECT_ID, SUBJECT_NAME,SUBJECT_DEL_DATE ,SUBJECT_COLOR
FROM SUBJECT 
WHERE MEM_ID ='won' 
) t1 
FULL JOIN
(
SELECT RECORD_SUBJECT_ID, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME
FROM RECORD 
WHERE RECORD_MEM_ID = 'won'
        and to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd')
group by cube(RECORD_SUBJECT_ID)
) t2

on (SUBJECT_ID = RECORD_SUBJECT_ID)
WHERE SUBJECT_DEL_DATE IS NULL
ORDER BY SUBJECT_ID ASC NULLS FIRST
;

------------당일 과목별 공부시간 합계 + 색깔 // chart //cube X---------------------------------------
select SUBJECT_ID, SUBJECT_NAME ,DIFFTIME ,SUBJECT_COLOR 
from 
(
SELECT SUBJECT_ID, SUBJECT_NAME  ,SUBJECT_COLOR ,SUBJECT_DEL_DATE
FROM SUBJECT 
WHERE MEM_ID ='won'
) t1 
FULL JOIN
(
SELECT RECORD_SUBJECT_ID, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME
FROM RECORD 
WHERE RECORD_MEM_ID = 'won'
        and TRUNC(RECORD_END)=TRUNC(SYSDATE)
group by RECORD_SUBJECT_ID
) t2
on (SUBJECT_ID = RECORD_SUBJECT_ID)
WHERE SUBJECT_DEL_DATE IS NULL
;
---------일일 과목별 학습 시간---사용-----------------------
SELECT distinct SUBJECT_NAME
, SUBJECT_COLOR COLOR
, SUBSTR(DIFFTIME,12,8) DIFFTIME
, TRUNC(SYSDATE) as ONLY_DATE    
from V_RECORD 
join (select * from subject where MEM_ID ='won') using (SUBJECT_NAME)
where RECORD_MEM_ID ='won' and TRUNC(RECORD_DATE) = TRUNC(SYSDATE)
;
--------유저 각오--------------------------------------------------------------
SELECT MEM_COMMENT FROM MEMBER WHERE MEM_ID='song';

--오늘 총 학습 시간----------------------------------------------------------
--방법1 초단위
select SUM(DIFFTIME) as DIFFTIME from v_record_sec where TO_CHAR(RECORD_DATE, 'YYYY-MM-DD')=TO_CHAR(SYSDATE, 'YYYY-MM-DD') AND RECORD_MEM_ID='won';
--방법2 초단위 x
SELECT SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME
from RECORD
where RECORD_MEM_ID ='won' and to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd')
;

------------------------------------------------------------------------
SELECT
    SYSDATE + 1, -- 현재시간 + 1일
    SYSDATE + 1/24, -- 현재시간 + 1시간
    SYSDATE + 1/24/60 as "지금시간 +1분",  -- 현재시간 + 1분
    SYSDATE + 1/24/60/60as "지금시간  + 1초",  -- 현재시간 + 1초
    (SYSDATE - (SYSDATE -1)) *24 "어제날짜 경과한 시간 시간단위 환산", -- 오늘날짜 - 어제날짜 경과한 시간 시간단위 환산
    (SYSDATE - (SYSDATE -1)) *24*60 "어제날짜 경과한 분단위 환산", -- 오늘날짜 - 어제날짜 경과한 시간 분단위 환산
    (SYSDATE - (SYSDATE -1)) *24*60*60 "어제날짜 경과한 초단위 환산"-- 오늘날짜 - 어제날짜 경과한 시간 초단위 환산
FROM DUAL;
------------30일간 당일 공부시간 합계 // chart //cube O---------------------------------------
------방법1?? 과목 아이디,이름, 공부시간, 과목색깔.
select SUBJECT_ID, SUBJECT_NAME ,DIFFTIME  
from 
(
SELECT SUBJECT_ID, SUBJECT_NAME
FROM SUBJECT 
WHERE MEM_ID ='won' 
) t1 
FULL JOIN
(
SELECT RECORD_SUBJECT_ID, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME
FROM RECORD 
WHERE RECORD_MEM_ID = 'won'
        and TRUNC(RECORD_END)=TRUNC(SYSDATE-0)
group by RECORD_SUBJECT_ID
) t2

on (SUBJECT_ID = RECORD_SUBJECT_ID)
--WHERE SUBJECT_DEL_DATE IS NULL
ORDER BY SUBJECT_ID ASC NULLS FIRST
;
------방법2???
SELECT 
    TO_CHAR(RECORD_MONTH, 'YYYY-MM') AS month,
    nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
    nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
    nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00') AS sum_min
FROM (
    SELECT 
        TRUNC(RECORD_END, 'MM') AS RECORD_MONTH,
        SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
            (EXTRACT(MINUTE FROM difftime) * 60) + 
            EXTRACT(SECOND FROM difftime)) AS total_seconds
    FROM (
        SELECT 
            NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime,
            RECORD_END
        FROM 
            record
        WHERE 
            record_mem_id = 'b' 
            --AND RECORD_end >= (SYSDATE - 30)
              AND TRUNC(RECORD_END) = TRUNC(SYSDATE-0)
        GROUP BY
            RECORD_END
    )
    GROUP BY
        TRUNC(RECORD_END, 'MM')
);
---
SELECT 
		s.sgroup_mem_id AS "MEM_ID",
        NUMTODSINTERVAL( sum(r.RECORD_END - r.RECORD_START) ,'day') AS "SUM_MIN"
		FROM SGROUP_MEMBER s
        join RECORD  r on (s.sgroup_mem_id = r.record_mem_id)
        WHERE  r.RECORD_START >= ( SYSDATE - 7 ) and sgroup_id = 53
        GROUP BY s.sgroup_mem_id
        ; 
--한 달 공부 시간 통계 1년--사용
select TO_CHAR(MMONTH,'mm') ONLY_DATE, NVL(DIFFTIME, 0) DIFFTIME  from V_MMONTH12
left join
(select to_char(record_date,'yy-mm') RDAY, round(sum(DIFFTIME),0) DIFFTIME from V_RECORD_SEC where RECORD_MEM_ID= 'won' group by to_char(record_date,'yy-mm')) 
on TO_CHAR(MMONTH,'yy-mm') = RDAY
order by MMONTH
;

-----월 공부시간 합 // 한달 총 공부시간 -- 
SELECT 
    TO_CHAR(RECORD_MONTH, 'YYYY-MM') AS month,
    nvl2(FLOOR(total_seconds / 3600), LPAD(FLOOR(total_seconds / 3600), 2, '0'), '00') || ':' ||
    nvl2(FLOOR(MOD(total_seconds, 3600) / 60), LPAD(FLOOR(MOD(total_seconds, 3600) / 60), 2, '0'), '00') || ':' ||
    nvl2(MOD(total_seconds, 60), LPAD(MOD(total_seconds, 60), 2, '0'), '00') AS sum_min
FROM (
    SELECT 
        TRUNC(RECORD_END, 'MM') AS RECORD_MONTH,
        SUM((EXTRACT(HOUR FROM difftime) * 3600) + 
            (EXTRACT(MINUTE FROM difftime) * 60) + 
            EXTRACT(SECOND FROM difftime)) AS total_seconds
    FROM (
        SELECT 
            NUMTODSINTERVAL(SUM((RECORD_END - RECORD_START)), 'day') AS difftime,
            RECORD_END
        FROM 
            record
        WHERE 
            record_mem_id = 'won' 
            --AND RECORD_end >= (SYSDATE - 30)
              AND TO_CHAR(RECORD_END, 'YYYY-MM') = TO_CHAR(SYSDATE, 'YYYY-MM') -- 월이 동일한 경우만 선택
            -- AND TRUNC(RECORD_END, 'MM') BETWEEN ADD_MONTHS(SYSDATE, -2) AND ADD_MONTHS(SYSDATE, -1) -- 두 달 전인 경우만 선택
        GROUP BY
            RECORD_END
    )
    GROUP BY
        TRUNC(RECORD_END, 'MM')
);
--------------------------------------

select record_mem_id, to_char(record_start,'YYYY-MM-DD HH24:Mi:SS'), to_char(record_end,'YYYY-MM-DD HH24:Mi:SS') from record where record_mem_id = 'song';

SELECT NUMTODSINTERVAL(sum((RECORD_END - RECORD_START)),'day')  from record  WHERE record_mem_id='b';
SELECT SUM(EXTRACT(DAY FROM (RECORD_END - RECORD_START))) AS total_days FROM record  WHERE record_mem_id='b';

SELECT 
    SUM((EXTRACT(HOUR FROM (SELECT NUMTODSINTERVAL(sum((RECORD_END - RECORD_START)),'day')  from record  WHERE record_mem_id='b')) * 3600) + 
        (EXTRACT(MINUTE FROM (SELECT NUMTODSINTERVAL(sum((RECORD_END - RECORD_START)),'day')  from record  WHERE record_mem_id='b')) * 60) + 
        EXTRACT(SECOND FROM (SELECT NUMTODSINTERVAL(sum((RECORD_END - RECORD_START)),'day')  from record  WHERE record_mem_id='b'))) AS total_seconds
FROM 
    record;
---chat 2차
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
            record_mem_id = 'won' and RECORD_end >= ( SYSDATE - 30 )
    )
);


----
select * from record where record_mem_id='b';
select r.record_mem_id AS "MEM_ID",   NUMTODSINTERVAL( sum(r.RECORD_END - r.RECORD_START) ,'day') AS "SUM_MIN"
from record r join subject s on (r.record_mem_id = s.mem_id )
where  r.RECORD_end >= ( SYSDATE - 30 )  
GROUP BY  r.record_mem_id
having r.record_mem_id = 'b';

--chat
select
    r.record_mem_id AS "MEM_ID",
    -- 초로 계산된 총 학습 시간을 NUMTODSINTERVAL 함수를 사용하여 다시 변환
    NUMTODSINTERVAL(sum((r.RECORD_END - r.RECORD_START)), 'day') AS "SUM_MIN"
from
    record r
    join subject s on (r.record_mem_id = s.mem_id)
where
    r.RECORD_end >= (SYSDATE - 30)  
GROUP BY
    r.record_mem_id
HAVING
    r.record_mem_id = 'b';
--
commit;

--구분선------------
select SUBJECT_ID, SUBJECT_NAME ,DIFFTIME ,RECORD_START,SUBJECT_COLOR
from 
--
(
SELECT SUBJECT_ID, SUBJECT_NAME  ,SUBJECT_COLOR 
FROM SUBJECT 
WHERE MEM_ID ='won'
) t1 
--
FULL JOIN
--
(
SELECT to_char(RECORD_START,'yyyy-mm-dd' ), SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME
FROM RECORD 
WHERE RECORD_MEM_ID = 'won'
            AND RECORD_START >= SYSDATE - 30 -- 30일 이전부터의 레코드를 고려
        GROUP BY
            cube( RECORD_SUBJECT_ID)--,to_char(RECORD_START, 'yyyy-mm-dd')
) t2
--
on (SUBJECT_ID = RECORD_SUBJECT_ID)

;

-----
select (sysdate-30) from dual;
-------------------------------------------------------------------------------
---수정 전
select SUBJECT_ID, SUBJECT_NAME ,DIFFTIME 
from 
(
SELECT SUBJECT_ID, SUBJECT_NAME  ,SUBJECT_COLOR ,SUBJECT_DEL_DATE
FROM SUBJECT 
WHERE MEM_ID ='won'
) t1 
FULL JOIN
(
SELECT RECORD_SUBJECT_ID, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME
FROM RECORD 
WHERE RECORD_MEM_ID = 'won'
        and to_char(RECORD_START, 'yyyy-mm-dd') =  to_char(SYSDATE, 'yyyy-mm-dd')
group by cube(RECORD_SUBJECT_ID)--,to_char(RECORD_START, 'yyyy-mm-dd')
) t2
on (SUBJECT_ID = RECORD_SUBJECT_ID)
WHERE SUBJECT_ID IS NULL
;

--일일 ranking 00:00:00출력----------------------------------------------
SELECT record_mem_id, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME
from RECORD
where to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd')
group by record_mem_id
order by DIFFTIME desc
;
--일일 ranking 사용----------------------------------------------

select record_mem_id, sum(NVL(DIFFTIME, 0)) DIFFTIME  from V_RECORD_SEC where TO_CHAR(RECORD_DATE,'yy-mm-dd')= TO_CHAR(sysdate,'yy-mm-dd') group by record_mem_id order by DIFFTIME desc
;

--월간 랭킹 -사용
select TO_CHAR(MMONTH,'mm') ONLY_DATE,record_mem_id, NVL(DIFFTIME, 0) DIFFTIME  from V_MMONTH12
left join
(select to_char(record_date,'yy-mm') RDAY, round(sum(DIFFTIME),0) DIFFTIME,record_mem_id from V_RECORD_SEC group by to_char(record_date,'yy-mm'),record_mem_id) 
on TO_CHAR(MMONTH,'yy-mm') = RDAY
where TO_CHAR(MMONTH,'yy-mm') = TO_CHAR(sysdate,'yy-mm')
order by difftime desc
;









---더미--------------------------------------------------------------------------------
select * from record where record_mem_id='won' order by record_end desc
;

desc subject;

select 
SUBJECT_NAME
,nvl((select RECORD_SUBJECT_ID from record where SUBJECT_ID=RECORD_SUBJECT_ID),'NULL') as subject_id
from subject
where MEM_ID ='won' and SUBJECT_DEL_DATE IS NULL
;

select RECORD_SUBJECT_ID from record join subject on SUBJECT_ID=RECORD_SUBJECT_ID group by RECORD_SUBJECT_ID;



update subject set subject_del_date = sysdate  where subject_id = 42;
select SUBJECT_ID ,
MEM_ID ,
SUBJECT_NAME ,
SUBJECT_ADD_DATE ,
SUBJECT_DEL_DATE ,
SUBJECT_COLOR 
from SUBJECT where mem_id='won';

select RECORD_ID ,
RECORD_SUBJECT_ID ,
RECORD_MEM_ID ,
RECORD_START ,
RECORD_END  from record where record_mem_id='won';


INSERT INTO SUBJECT VALUES(SEQ_SUBJECT_ID.nextval,'song','aa',DEFAULT,NULL,'1');
INSERT INTO SUBJECT VALUES(SEQ_SUBJECT_ID.nextval,?,?,DEFAULT,NULL,?);

select * from MEMBER;
select * from subject;
select SUBJECT_NAME from subject where MEM_ID='won' and SUBJECT_DEL_DATE IS NULL;


select * from subject
where mem_id ='won'
;





SELECT RECORD_SUBJECT_ID
				, (SELECT SUBJECT_NAME from SUBJECT where SUBJECT_ID=RECORD_SUBJECT_ID) AS SUBJECT_NAME
			, SUBSTR(NUMTODSINTERVAL( SUM( CAST(record_end as DATE) - CAST(record_start as DATE) ), 'day' ), 12, 8) as DIFFTIME
			 from record
		 where record_mem_id ='won' and to_char(record_start, 'yyyymmdd') =  to_char(sysdate, 'yyyymmdd')
	 group by cube(record_subject_id);

select  record_start, (systimestamp - record_start)  DIFFRIME from record;
select record_start difftime from record;

SELECT 
--ROUND((record_end - record_start), 2) AS dd1
(record_end - record_start) AS dd1
,cast(record_end as date) - cast(record_start as date) AS dd2
,(cast(record_end as date) - cast(record_start as date)) *1000/60   AS dd3
--, record_end, record_start
  FROM record
  ;
  
  
  
  
  

SELECT 
    numtodsinterval( sum( cast(record_end as date) - cast(record_start as date) ), 'day' ) as a
    -- 오류 timestamp-timestamp--- sum(timestamp-timestamp),numtodsinterval( sum( record_end - record_start  ), 'day' ) as b
    , sum( cast(record_end as date) - cast(record_start as date) ) as c
  FROM record
  group by record_subject_id
  ;
SELECT 
    numtodsinterval( sum( cast(record_end as date) - cast(record_start as date) ), 'day' ) as a
--    , to_char(numtodsinterval( sum( cast(record_end as date) - cast(record_start as date) ), 'day' ), 'hh24:mm:dd') as d
    , substr(numtodsinterval( sum( cast(record_end as date) - cast(record_start as date) ), 'day' ), 12, 8) as e
    -- 오류 timestamp-timestamp--- sum(timestamp-timestamp),numtodsinterval( sum( record_end - record_start  ), 'day' ) as b
    , sum( cast(record_end as date) - cast(record_start as date) ) as c
  FROM record
  group by record_subject_id
  ;

  
  
  with x as (
  select '01:23:45' val from dual union all
  select '02:15:30' from dual
) 
select numtodsinterval( sum( to_date( val, 'hh24:mi:ss' ) - trunc( sysdate, 'MM' ) ), 'day' ) as a
  from x;
  select * from subject where MEM_ID='won';
delete from subject where subject_id>=50;
commit;