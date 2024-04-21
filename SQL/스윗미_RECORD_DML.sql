--아이디, 과목이름, 날짜 / 4월로 지정됨
exec PRO_RECORD_INSERT_MORNING('won','D_1','02');
exec PRO_RECORD_INSERT_LUNCH('won','D_2','02');
exec PRO_RECORD_INSERT_DINNER('won','D_3','02');

exec PRO_RECORD_INSERT_MORNING('won','D_1','18');
exec PRO_RECORD_INSERT_LUNCH('won','D_2','18');
exec PRO_RECORD_INSERT_DINNER('won','D_3','18');

--19일
exec PRO_RECORD_INSERT_MORNING('won','D_3','19');
exec PRO_RECORD_INSERT_LUNCH('won','SQL','19');
exec PRO_RECORD_INSERT_DINNER('won','D_1','19');

exec PRO_RECORD_INSERT_MORNING('song','JAVA','19');
exec PRO_RECORD_INSERT_LUNCH('song','spring','19');
exec PRO_RECORD_INSERT_DINNER('song','C#','19');
--21일
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='won' and subject_name='D_4') 
    ,'won',(SELECT TO_DATE('2024-04-21 08:00:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-21 08:30:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='won' and subject_name='D_5') 
    ,'won',(SELECT TO_DATE('2024-04-21 08:40:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-21 08:50:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
exec PRO_RECORD_INSERT_MORNING('won','D_1','21');
exec PRO_RECORD_INSERT_LUNCH('won','D_2','21');
exec PRO_RECORD_INSERT_DINNER('won','D_3','21');
--delete from record;
select * from record where record_mem_id='won' order by record_end desc
;
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='won' and subject_name='D_5') 
    ,'won',(SELECT TO_DATE('2024-04-21 07:40:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),null);



UPDATE RECORD SET RECORD_END = to_date('20240421075010', 'yyyymmddhh24miss')
 where RECORD_SUBJECT_ID =32 and RECORD_MEM_ID='won' and RECORD_END IS NULL;
--불필요한 과목 del_date 없데이트
--update subject set subject_del_date = default   where subject_id in (137,102,101,82,48,43);
--select * from subject where subject_id in (137,102,101,82,48,43);
commit;