select a.DIFFTIME "a1", a.record_date  "a2",
s.SUBJECT_NAME  "a3", s.SUBJECT_COLOR  "a4"
from v_record a 
join subject s 
on(a.RECORD_MEM_ID=s.MEM_ID) 
where TRUNC(a.RECORD_DATE)=TRUNC(SYSDATE) and s.mem_id='won'
;





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
--/
--select 62500/60/60 a from dual;

-------------------------------------------------------------------------------------------------------------------------


--30일 날짜 프로시저 성공...!
--exec PRO_DDAY_CREATE('V_TEST',2);
--select * from v_test;
--drop view V_test;
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
----한 달 누적시간 생성 // 과목 구분 X------------------------------
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

--SELECT TRUNC(SYSDATE,'month') AS this_month,
--       TRUNC(ADD_MONTHS(SYSDATE, -1),'month') AS month
--FROM dual;


--달 별 프로시저 성공!!!
--exec PRO_MONTH_CREATE('V_MMONTH12',12);
--월 별 총 학습시간 -------------------------------------------------
select TO_CHAR(MMONTH,'mm') ONLY_DATE, NVL(DIFFTIME, 0) DIFFTIME  from V_MMONTH12
left join
(select to_char(record_date,'yy-mm') RDAY, round(sum(DIFFTIME),0) DIFFTIME from V_RECORD_SEC where RECORD_MEM_ID='won'group by to_char(record_date,'yy-mm')) 
on TO_CHAR(MMONTH,'yy-mm') = RDAY
order by mmonth;

select to_char(record_date,'mm') from V_RECORD_SEC;
--월 별 과목별 총 학습시간-----------------------------------------------------

select t1.SUBJECT_NAME, SUBJECT_COLOR "COLOR", TO_CHAR(mmonth,'mm') ONLY_DATE, NVL(ROUND(DIFFTIME), 0) DIFFTIME
	from 
		(select * from (select SUBJECT_NAME, SUBJECT_COLOR from subject where mem_id= 'won') t1 cross join V_MMONTH12 ) t1
		left join 
		(select SUBJECT_NAME, to_char((RECORD_DATE),'yy-mm') as RDAY, round(sum(DIFFTIME),0) DIFFTIME from V_RECORD_SEC where RECORD_MEM_ID =  'won' group by SUBJECT_NAME, to_char((RECORD_DATE),'yy-mm') order by rday) t2
		on t1.SUBJECT_NAME = t2.SUBJECT_NAME and TO_CHAR( t1.MMONTH,'yy-mm') = RDAY
	order by t1.subject_name ASC, mmonth ASC;
--
----DONE---------------------------------------------------------------------------------------------------------------------













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

