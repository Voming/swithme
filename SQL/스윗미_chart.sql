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

-- 현재 일자 기준 최근 4일 이내 과목별 학습시간
select SUBJECT_NAME, substr(difftime,12,8 ) DIFFTIME, substr(RECORD_DATE,7,2) as ONLY_DATE,
    (select SUBJECT_COLOR from subject where SUBJECT.SUBJECT_NAME = V_RECORD.SUBJECT_NAME  ) as "COLOR"
from V_RECORD where RECORD_MEM_ID = 'won' and TRUNC(RECORD_DATE) >= TRUNC(SYSDATE-3)
order by subject_name asc, only_date asc
;

-- 현재 일자 기준 최근 4일 이내 과목별 학습시간
select SUBJECT_NAME, substr(difftime,12,8 ) DIFFTIME, substr(RECORD_DATE,7,2) as ONLY_DATE,
    (select SUBJECT_COLOR from subject where SUBJECT.SUBJECT_NAME = V_RECORD.SUBJECT_NAME  ) as "COLOR"
from V_RECORD where RECORD_MEM_ID = 'won' and TRUNC(RECORD_DATE) >= TRUNC(SYSDATE-3)
order by subject_name asc, only_date asc
;
-- 현재 일자 기준 최근 4일 이내 과목별 학습시간
select SUBJECT_NAME
,(select SUBJECT_COLOR from subject where SUBJECT.SUBJECT_NAME = V_RECORD_SEC.SUBJECT_NAME  ) as "COLOR"
, to_char(DIFFTIME)
, substr(RECORD_DATE,7,2) as ONLY_DATE
    
from V_RECORD_SEC where RECORD_MEM_ID = 'won' and TRUNC(RECORD_DATE) >= TRUNC(SYSDATE-3)
order by subject_name asc, only_date asc
;

------------------------------------
select * from V_RECORD;
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."V_RECORD_SEC" ("RECORD_SUBJECT_ID", "SUBJECT_NAME", "RECORD_MEM_ID", "RECORD_DATE", "DIFFTIME") AS 
  SELECT RECORD_SUBJECT_ID
, (SELECT SUBJECT_NAME FROM SUBJECT WHERE RECORD_SUBJECT_ID = SUBJECT_ID) AS SUBJECT_NAME
, RECORD_MEM_ID
, TRUNC(RECORD_START) RECORD_DATE
, SUM(RECORD_END - RECORD_START) *24*60*60 DIFFTIME
FROM RECORD 
GROUP BY RECORD_SUBJECT_ID, RECORD_MEM_ID, TRUNC(RECORD_START);
/
select 62500/60/60 a from dual;

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."V_RECORD" ("RECORD_SUBJECT_ID", "SUBJECT_NAME", "RECORD_MEM_ID", "RECORD_DATE", "DIFFTIME") AS 
  SELECT RECORD_SUBJECT_ID
, (SELECT SUBJECT_NAME FROM SUBJECT WHERE RECORD_SUBJECT_ID = SUBJECT_ID) AS SUBJECT_NAME
, RECORD_MEM_ID
    , TRUNC(RECORD_START) RECORD_DATE
    , NUMTODSINTERVAL( SUM(RECORD_END - RECORD_START) ,'DAY') DIFFTIME
FROM RECORD 
GROUP BY RECORD_SUBJECT_ID, RECORD_MEM_ID, TRUNC(RECORD_START);
----------------------------------

select SUBJECT_NAME, substr(difftime,12,8) DIFFTIME, substr(RECORD_DATE,7,2) as ONLY_DATE,
    (select SUBJECT_COLOR from subject where SUBJECT.SUBJECT_NAME = V_RECORD.SUBJECT_NAME  ) as "COLOR"
from V_RECORD where RECORD_MEM_ID ='won' and TRUNC(RECORD_DATE) = TRUNC(SYSDATE);
-- 
select * from v_record_wo_subject;
select DIFFTIME ,RECORD_DATE FROM v_record_wo_subject where RECORD_MEM_ID='won';

--select  ADD_MONTHS(difftime, 24 * SUBSTR(difftime, 9, 2))   from v_record_week;
select  *   from v_record_week;

