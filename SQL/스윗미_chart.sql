select a.DIFFTIME "a1", a.record_date  "a2",
s.SUBJECT_NAME  "a3", s.SUBJECT_COLOR  "a4"
from v_record a 
join subject s 
on(a.RECORD_MEM_ID=s.MEM_ID) 
where TRUNC(a.RECORD_DATE)=TRUNC(SYSDATE) and s.mem_id='won'
;

select * from v_record;
-- 당일 과목별 학습시간
select SUBJECT_NAME, substr(difftime,12,8) DIFFTIME, substr(RECORD_DATE,7,2) as ONLY_DATE,
    (select SUBJECT_COLOR from subject where SUBJECT.SUBJECT_NAME = V_RECORD.SUBJECT_NAME  ) as "COLOR"
from V_RECORD where RECORD_MEM_ID = 'won' and TRUNC(RECORD_DATE) = TRUNC(SYSDATE);

select SUBJECT_NAME
,(select SUBJECT_COLOR from subject where SUBJECT.SUBJECT_NAME = V_RECORD_SEC.SUBJECT_NAME  ) as "COLOR"
, to_char(round(DIFFTIME,0)) as DIFFTIME
, substr(RECORD_DATE,7,2) as ONLY_DATE
from V_RECORD_SEC where RECORD_MEM_ID = 'won' and TRUNC(RECORD_DATE) = TRUNC(SYSDATE)
order by subject_name asc, only_date asc
;

-- 현재 일자 기준 최근 4일 이내 과목별 학습시간 -----
-------------------------  현재상황 4일동안 각 과목별 학습 시간(초단위)가 필요함 : 일자만 갖고있는 view생성
-------------------------  --> 4일,과목이름,컬러는 공통부분임 
-------------------------  cross join으로 서로를 join시켜줌 4일에 과목 하나를 연결 과목 수 * 4일 = 총 행
-------------------------  과목의 공부기록이 없으면 기록되도록 설정


--  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."V_DDAY4" ("DDAY") AS 
--  select TRUNC(SYSDATE-3) dday from dual
--union
--select TRUNC(SYSDATE-2) dday from dual
--union
--select TRUNC(SYSDATE-1) dday from dual
--union
--select TRUNC(SYSDATE-0) dday from dual;

-------------------------  과목이름, 컬러, 과목당 날짜 cross join
(select * from (select SUBJECT_NAME, SUBJECT_COLOR from subject where mem_id='won') t1 cross join v_dday4 );
----최종본
select t1.SUBJECT_NAME, SUBJECT_COLOR "COLOR", trunc(DDAY) ONLY_DATE, NVL(DIFFTIME, 0) DIFFTIME
from (select * from (select SUBJECT_NAME, SUBJECT_COLOR from subject where mem_id='won') t1 cross join v_dday4 ) t1
left join 
(select SUBJECT_NAME, RECORD_DATE, to_char(DIFFTIME) DIFFTIME from V_RECORD_SEC where RECORD_MEM_ID = 'won') t2 --과목명,기록날짜,학습시간
on t1.SUBJECT_NAME = t2.SUBJECT_NAME and dday = trunc(t2.RECORD_DATE)
order by t1.subject_name asc, dday asc
;
---최종본	ver.2  더 이쁜
select t1.SUBJECT_NAME, SUBJECT_COLOR "COLOR", TO_CHAR(DDAY,'MM-DD') ONLY_DATE, NVL(DIFFTIME, 0) DIFFTIME
	from 
		(select * from (select SUBJECT_NAME, SUBJECT_COLOR from subject where mem_id= 'won') t1 cross join v_dday4 ) t1
		left join 
		(select SUBJECT_NAME, RECORD_DATE, DIFFTIME from V_RECORD_SEC where RECORD_MEM_ID =  'won') t2
		on t1.SUBJECT_NAME = t2.SUBJECT_NAME and DDAY = TRUNC(t2.RECORD_DATE)
	order by t1.subject_name ASC, DDAY ASC;

select * from V_RECORD;
select * from V_RECORD_SEC;
select * from V_RECORD_WO_SUBJECT;

----******  시간 차이를 초단위로 변환한 view생성 
--
--CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."V_RECORD_SEC" ("RECORD_SUBJECT_ID", "SUBJECT_NAME", "RECORD_MEM_ID", "RECORD_DATE", "DIFFTIME") AS 
--  SELECT RECORD_SUBJECT_ID
--, (SELECT SUBJECT_NAME FROM SUBJECT WHERE RECORD_SUBJECT_ID = SUBJECT_ID) AS SUBJECT_NAME
--, RECORD_MEM_ID
--, TRUNC(RECORD_START) RECORD_DATE
--, SUM(RECORD_END - RECORD_START) *24*60*60 DIFFTIME
--FROM RECORD 
--GROUP BY RECORD_SUBJECT_ID, RECORD_MEM_ID, TRUNC(RECORD_START);

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."V_RECORD_WO_SUBJECT" ("RECORD_MEM_ID", "RECORD_DATE", "DIFFTIME") AS 
  SELECT RECORD_MEM_ID
    , TRUNC(RECORD_START) RECORD_DATE
    , NUMTODSINTERVAL( SUM(RECORD_END - RECORD_START) ,'DAY') DIFFTIME
FROM RECORD 
GROUP BY RECORD_MEM_ID, TRUNC(RECORD_START);



--/
--select 62500/60/60 a from dual;
--view 생성코드------------------------------------------------------------------------------------------
  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."V_RECORD" ("RECORD_SUBJECT_ID", "SUBJECT_NAME", "RECORD_MEM_ID", "RECORD_DATE", "DIFFTIME") AS 
  SELECT RECORD_SUBJECT_ID
, (SELECT SUBJECT_NAME FROM SUBJECT WHERE RECORD_SUBJECT_ID = SUBJECT_ID) AS SUBJECT_NAME
, RECORD_MEM_ID
    , TRUNC(RECORD_START) RECORD_DATE
    , NUMTODSINTERVAL( SUM(RECORD_END - RECORD_START) ,'DAY') DIFFTIME
FROM RECORD 
GROUP BY RECORD_SUBJECT_ID, RECORD_MEM_ID, TRUNC(RECORD_START);
----
--30일간 일별 학습시간 ONLY_DATE,DIFFTIME-----------------------------------------------------------------------------------------------------------------------

select TO_CHAR(DDAY,'MM-DD') ONLY_DATE, NVL(ROUND(DIFFTIME), 0) DIFFTIME
from V_DDAY30 
left join (select trunc(record_date) rday, sum(DIFFTIME) DIFFTIME from V_RECORD_SEC where RECORD_MEM_ID='won'group by trunc(record_date)) 
on dday = rday order by DDAY ASC;

--30일간 일별 과목별 학습시간---------------------------------------------------------------------------------------------
select t1.SUBJECT_NAME, SUBJECT_COLOR "COLOR", TO_CHAR(DDAY,'MM-DD') ONLY_DATE, NVL(ROUND(DIFFTIME), 0) DIFFTIME
	from 
		(select * from (select SUBJECT_NAME, SUBJECT_COLOR from subject where mem_id= 'won') t1 cross join v_dday30 ) t1
		left join 
		(select SUBJECT_NAME, RECORD_DATE, DIFFTIME from V_RECORD_SEC where RECORD_MEM_ID =  'won') t2
		on t1.SUBJECT_NAME = t2.SUBJECT_NAME and DDAY = TRUNC(t2.RECORD_DATE)
	order by t1.subject_name ASC, ONLY_DATE ASC;
----------------------------------
--과목별 누적그래프 생성
---실패1
with acc_data as(
select TO_CHAR(DDAY,'MM-DD') ONLY_DATE, NVL(ROUND(DIFFTIME), 0) DIFFTIME,lag( NVL(ROUND(DIFFTIME), 0),1,0) over(order by TO_CHAR(DDAY,'MM-DD')) as demi
from V_DDAY30 
left join (select trunc(record_date) rday, sum(DIFFTIME) DIFFTIME from V_RECORD_SEC where RECORD_MEM_ID='won'group by trunc(record_date)) 
on dday = rday order by DDAY ASC)
select ONLY_DATE,DIFFTIME,demi,lag(demi,1,0) over(order by only_date) demi2, (DIFFTIME+demi+lag(demi,1,0) over(order by only_date)) as IWANTTHIS from acc_data
;
---실패2
WITH joined_data AS (
    SELECT 
        TO_CHAR(DDAY,'MM-DD') AS ONLY_DATE, 
        NVL(ROUND(DIFFTIME), 0) AS DIFFTIME
    FROM V_DDAY30 
    LEFT JOIN (
        SELECT TRUNC(record_date) AS rday, 
               SUM(DIFFTIME) AS DIFFTIME 
        FROM V_RECORD_SEC 
        WHERE RECORD_MEM_ID = 'won'
        GROUP BY TRUNC(record_date)
    ) ON DDAY = rday
    ORDER BY DDAY ASC
),
merged_data AS (
    SELECT 
        ONLY_DATE,
        DIFFTIME,
        LAG(DIFFTIME, 1, 0) OVER (ORDER BY ONLY_DATE) AS PREV_DIFFTIME,
        LAG(DIFFTIME, 2, 0) OVER (ORDER BY ONLY_DATE) AS PREV_DIFFTIME2,
         LAG(DIFFTIME, 1, 0) OVER (ORDER BY ONLY_DATE) AS PREV_DIFFTIME3
    FROM joined_data
)
SELECT 
    ONLY_DATE,
    -- LAG 함수를 사용하여 이전 행의 DIFFTIME 값을 가져옵니다.
    -- 이전 값이 없는 경우 기본값 0을 사용합니다.
    -- 현재 행의 DIFFTIME과 이전 행의 DIFFTIME을 더하여 누적 DIFFTIME을 계산합니다.
    (DIFFTIME + PREV_DIFFTIME),
     (DIFFTIME + PREV_DIFFTIME+PREV_DIFFTIME2) as "22",
     (DIFFTIME + PREV_DIFFTIME+PREV_DIFFTIME2+PREV_DIFFTIME3) as "33"
FROM merged_data
ORDER BY ONLY_DATE ASC;
-- 과목 구분없는 누적값-----------------------------------------------------
SELECT 
    TO_CHAR(DDAY,'MM-DD') AS ONLY_DATE, 
    -- 1행부터 현재 행까지의 DIFFTIME 값을 누적해서 구합니다.
    SUM(NVL(ROUND(DIFFTIME), 0)) OVER (ORDER BY DDAY ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS DIFFTIME
FROM V_DDAY30 
LEFT JOIN (
    SELECT TRUNC(record_date) AS rday, 
           SUM(DIFFTIME) AS DIFFTIME 
    FROM V_RECORD_SEC 
    WHERE RECORD_MEM_ID = 'won'
    GROUP BY TRUNC(record_date)
) ON DDAY = rday
ORDER BY DDAY ASC;
----한 달 누적시간 생성 ------------------------------
SELECT TRUNC(SYSDATE,'month') AS this_month,
       TRUNC(ADD_MONTHS(SYSDATE, -1),'month') AS month
FROM dual;

select to_CHAR(trunc(record_date,'month'),'MM') ONLY_DATE,round(sum(difftime)) DIFFTIME from V_RECORD_SEC where record_mem_id='won' and trunc(record_date,'month')=trunc(sysdate,'month') group by to_CHAR(trunc(record_date,'month'),'MM');

--30일 날짜 프로시저 성공...!
exec PRO_DDAY_CREATE('V_DDAY30',30);
select * from V_DDAY30;
--달 별 프로시저 성공아님...
exec PRO_MONTH_CREATE('V_MMONTH12',11);
select * from V_MMONTH12;



-------------------------------------------------------
select SUBJECT_NAME, substr(difftime,12,8) DIFFTIME, substr(RECORD_DATE,7,2) as ONLY_DATE,
    (select SUBJECT_COLOR from subject where SUBJECT.SUBJECT_NAME = V_RECORD.SUBJECT_NAME  ) as "COLOR"
from V_RECORD where RECORD_MEM_ID ='won' and TRUNC(RECORD_DATE) = TRUNC(SYSDATE);
-- 
select * from v_record_wo_subject;
select DIFFTIME ,RECORD_DATE FROM v_record_wo_subject where RECORD_MEM_ID='won';

--select  ADD_MONTHS(difftime, 24 * SUBSTR(difftime, 9, 2))   from v_record_week;
select  *   from v_record_week;

----------------------------------------X
select SUBJECT_NAME, substr(difftime,12,8 ) DIFFTIME, substr(RECORD_DATE,7,2) as ONLY_DATE,
    (select SUBJECT_COLOR from subject where SUBJECT.SUBJECT_NAME = V_RECORD.SUBJECT_NAME  ) as "COLOR"
from V_RECORD where RECORD_MEM_ID = 'won' and TRUNC(RECORD_DATE) >= TRUNC(SYSDATE-3)
order by subject_name asc, only_date asc
;

--X 현재 일자 기준 최근 4일 이내 과목별 학습시간 --difftime이 00:00:00으로 표현됨 최종본에선 second로 변환
select SUBJECT_NAME, substr(difftime,12,8 ) DIFFTIME, substr(RECORD_DATE,7,2) as ONLY_DATE,
    (select SUBJECT_COLOR from subject where SUBJECT.SUBJECT_NAME = V_RECORD.SUBJECT_NAME  ) as "COLOR"
from V_RECORD where RECORD_MEM_ID = 'won' and TRUNC(RECORD_DATE) >= TRUNC(SYSDATE-3)
order by subject_name asc, only_date asc
;
--X 현재 일자 기준 최근 4일 이내 과목별 학습시간
select SUBJECT_NAME
,(select SUBJECT_COLOR from subject where SUBJECT.SUBJECT_NAME = V_RECORD_SEC.SUBJECT_NAME  ) as "COLOR"
, to_char(DIFFTIME)
, substr(RECORD_DATE,7,2) as ONLY_DATE
    
from V_RECORD_SEC where RECORD_MEM_ID = 'won' and TRUNC(RECORD_DATE) >= TRUNC(SYSDATE-3)
order by subject_name asc, only_date asc
;
------------------------------------

