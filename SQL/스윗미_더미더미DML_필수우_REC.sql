------ 2차 DML ------
----이거 쓰면 안됨
--hyuk,song
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='song' and subject_name='python') 
    ,'song',(SELECT TO_DATE('2024-04-10 12:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-08 17:30:53', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='song' and subject_name='JAVA') 
    ,'song',(SELECT TO_DATE('2024-04-10 18:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-08 20:30:47', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='song' and subject_name='토익') 
    ,'song',(SELECT TO_DATE('2024-04-10 06:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-08 07:40:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='song' and subject_name='토익') 
    ,'song',(SELECT TO_DATE('2024-04-10 09:50:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-08 11:23:22', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='song' and subject_name='spring') 
    ,'song',(SELECT TO_DATE('2024-04-10 08:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-08 09:40:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));

--------

insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='C#') 
    ,'hyuk',(SELECT TO_DATE('2024-04-10 12:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-08 17:30:53', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='HTML') 
    ,'hyuk',(SELECT TO_DATE('2024-04-10 18:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-08 20:30:47', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='천칭') 
    ,'hyuk',(SELECT TO_DATE('2024-04-10 06:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-08 07:40:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='C#') 
    ,'hyuk',(SELECT TO_DATE('2024-04-10 09:50:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-08 11:23:22', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='HTML') 
    ,'hyuk',(SELECT TO_DATE('2024-04-10 08:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 09:40:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));

-------------------------------------04-09 hyuk
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='C#') 
    ,'hyuk',(SELECT TO_DATE('2024-04-12 12:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 17:30:53', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='HTML') 
    ,'hyuk',(SELECT TO_DATE('2024-04-12 18:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 20:30:47', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='천칭') 
    ,'hyuk',(SELECT TO_DATE('2024-04-12 06:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 07:40:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='HTML') 
    ,'hyuk',(SELECT TO_DATE('2024-04-12 09:50:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 11:23:22', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='천칭') 
    ,'hyuk',(SELECT TO_DATE('2024-04-12 08:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 09:40:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
--------------------------------------------
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='C#') 
    ,'hyuk',(SELECT TO_DATE('2024-04-11 12:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 17:30:53', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='HTML') 
    ,'hyuk',(SELECT TO_DATE('2024-04-11 18:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 20:30:47', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='천칭') 
    ,'hyuk',(SELECT TO_DATE('2024-04-11 06:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 07:40:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='C#') 
    ,'hyuk',(SELECT TO_DATE('2024-04-11 09:50:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 11:23:22', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));
insert into record values(SEQ_RECORD_ID.nextval
    ,(select SUBJECT_ID from SUBJECT where mem_id='hyuk' and subject_name='HTML') 
    ,'hyuk',(SELECT TO_DATE('2024-04-11 08:30:15', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_START FROM dual),(SELECT TO_DATE('2024-04-09 09:40:00', 'YYYY-MM-DD HH24:MI:SS') AS RECORD_END FROM dual));

