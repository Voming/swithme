------ 2차 DML ------
----이거 쓰면 안됨 수정해야함
desc subject;
CREATE OR REPLACE PROCEDURE PRO_RECORD_INSERT(P_MEM_ID record.record_mem_id%TYPE, P_SUBJECT_NAME subject.subject_name%TYPE, P_DAY VARCHAR2)
IS
BEGIN
    -- 다음 시퀀스 값을 선택합니다.
    DECLARE
        V_SEQ_RECORD_ID NUMBER;
    BEGIN
        SELECT SEQ_RECORD_ID.nextval INTO V_SEQ_RECORD_ID FROM DUAL;

        -- record 테이블에 삽입합니다.
        --01
        INSERT INTO record (RECORD_ID, RECORD_SUBJECT_ID, RECORD_MEM_ID, RECORD_START, RECORD_END)
        VALUES (
            V_SEQ_RECORD_ID,
            (SELECT SUBJECT_ID FROM SUBJECT WHERE MEM_ID = P_MEM_ID AND SUBJECT_NAME = P_SUBJECT_NAME),
            P_MEM_ID,
            TO_DATE('2024-04-' || P_DAY || ' 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
            TO_DATE('2024-04-' || P_DAY || ' 10:00:00', 'YYYY-MM-DD HH24:MI:SS')
        );
        
        --02
        INSERT INTO record (RECORD_ID, RECORD_SUBJECT_ID, RECORD_MEM_ID, RECORD_START, RECORD_END)
        VALUES (
            V_SEQ_RECORD_ID,
            (SELECT SUBJECT_ID FROM SUBJECT WHERE MEM_ID = P_MEM_ID AND SUBJECT_NAME = P_SUBJECT_NAME),
            P_MEM_ID,
            TO_DATE('2024-04-' || P_DAY || ' 11:00:00', 'YYYY-MM-DD HH24:MI:SS'),
            TO_DATE('2024-04-' || P_DAY || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS')
        );
        --03
        INSERT INTO record (RECORD_ID, RECORD_SUBJECT_ID, RECORD_MEM_ID, RECORD_START, RECORD_END)
        VALUES (
            V_SEQ_RECORD_ID,
            (SELECT SUBJECT_ID FROM SUBJECT WHERE MEM_ID = P_MEM_ID AND SUBJECT_NAME = P_SUBJECT_NAME),
            P_MEM_ID,
            TO_DATE('2024-04-' || P_DAY || ' 11:00:00', 'YYYY-MM-DD HH24:MI:SS'),
            TO_DATE('2024-04-' || P_DAY || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS')
        );
        -- 트랜잭션을 커밋합니다.
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- 필요한 경우 예외를 처리합니다.
            ROLLBACK;
            RAISE;
    END;
END;
/
exec PRO_RECORD_INSERT('song','python','01');

select* from record;

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

