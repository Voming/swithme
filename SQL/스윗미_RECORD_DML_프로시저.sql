------3월

--------RECORE ISNERT 프로시저 MORNING 9:00~11:30----------------------------------------
create or replace NONEDITIONABLE PROCEDURE PRO_RECORD_MMDD_MORNING(P_MEM_ID record.record_mem_id%TYPE, P_SUBJECT_NAME subject.subject_name%TYPE, P_MONTH NUMBER, P_DAY NUMBER)
IS
        V_SEQ_RECORD_ID NUMBER;
         V_I_NUMBER NUMBER;
         P_MAXCOUNT CONSTANT NUMBER := 11;
BEGIN
    -- 다음 시퀀스 값을 선택합니다.

    for I in 9..P_MAXCOUNT loop
        V_I_NUMBER := I;

        SELECT SEQ_RECORD_ID.nextval INTO V_SEQ_RECORD_ID FROM DUAL;

        -- record 테이블에 삽입합니다.
        --01
        INSERT INTO record (RECORD_ID, RECORD_SUBJECT_ID, RECORD_MEM_ID, RECORD_START, RECORD_END)
        VALUES (
            V_SEQ_RECORD_ID,
            (SELECT SUBJECT_ID FROM SUBJECT WHERE MEM_ID = P_MEM_ID AND SUBJECT_NAME = P_SUBJECT_NAME),
            P_MEM_ID,
            TO_DATE('2024-'||TO_CHAR(P_MONTH, 'FM00')||'-' || TO_CHAR(P_DAY, 'FM00') || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':00:00', 'YYYY-MM-DD HH24:MI:SS'),

            TO_DATE('2024-'||TO_CHAR(P_MONTH, 'FM00')||'-' || TO_CHAR(P_DAY, 'FM00') || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':30:00', 'YYYY-MM-DD HH24:MI:SS')
        );

    end loop;
        -- 트랜잭션을 커밋합니다.
    COMMIT;
    EXCEPTION WHEN OTHERS THEN
        -- 필요한 경우 예외를 처리합니다.
        ROLLBACK;
        -- 이전에 정의된 예외를 발생
            RAISE;
END;
/

--------RECORE ISNERT 프로시저 LUNCH 13:00~17:30----------------------------------------
create or replace NONEDITIONABLE PROCEDURE PRO_RECORD_MMDD_LUNCH(P_MEM_ID record.record_mem_id%TYPE, P_SUBJECT_NAME subject.subject_name%TYPE, P_MONTH NUMBER, P_DAY NUMBER)
IS
        V_SEQ_RECORD_ID NUMBER;
         V_I_NUMBER NUMBER;
         P_MAXCOUNT CONSTANT NUMBER := 17;
BEGIN
    -- 다음 시퀀스 값을 선택합니다.

    for I in 13..P_MAXCOUNT loop
        V_I_NUMBER := I;

        SELECT SEQ_RECORD_ID.nextval INTO V_SEQ_RECORD_ID FROM DUAL;

        -- record 테이블에 삽입합니다.
        --01
        INSERT INTO record (RECORD_ID, RECORD_SUBJECT_ID, RECORD_MEM_ID, RECORD_START, RECORD_END)
        VALUES (
            V_SEQ_RECORD_ID,
            (SELECT SUBJECT_ID FROM SUBJECT WHERE MEM_ID = P_MEM_ID AND SUBJECT_NAME = P_SUBJECT_NAME),
            P_MEM_ID,
            TO_DATE('2024-'||TO_CHAR(P_MONTH, 'FM00')||'-' || TO_CHAR(P_DAY, 'FM00') || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':00:00', 'YYYY-MM-DD HH24:MI:SS'),

            TO_DATE('2024-'||TO_CHAR(P_MONTH, 'FM00')||'-' || TO_CHAR(P_DAY, 'FM00') || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':30:00', 'YYYY-MM-DD HH24:MI:SS')
        );

    end loop;
        -- 트랜잭션을 커밋합니다.
    COMMIT;
    EXCEPTION WHEN OTHERS THEN
        -- 필요한 경우 예외를 처리합니다.
        ROLLBACK;
        -- 이전에 정의된 예외를 발생
            RAISE;
END;
/
--------RECORE ISNERT 프로시저 DINNER 18:00~22:30----------------------------------------
create or replace NONEDITIONABLE PROCEDURE PRO_RECORD_MMDD_DINNER(P_MEM_ID record.record_mem_id%TYPE, P_SUBJECT_NAME subject.subject_name%TYPE, P_MONTH NUMBER, P_DAY NUMBER)
IS
        V_SEQ_RECORD_ID NUMBER;
         V_I_NUMBER NUMBER;
         P_MAXCOUNT CONSTANT NUMBER := 22;
BEGIN
    -- 다음 시퀀스 값을 선택합니다.

    for I in 18..P_MAXCOUNT loop
        V_I_NUMBER := I;

        SELECT SEQ_RECORD_ID.nextval INTO V_SEQ_RECORD_ID FROM DUAL;

        -- record 테이블에 삽입합니다.
        --01
        INSERT INTO record (RECORD_ID, RECORD_SUBJECT_ID, RECORD_MEM_ID, RECORD_START, RECORD_END)
        VALUES (
            V_SEQ_RECORD_ID,
            (SELECT SUBJECT_ID FROM SUBJECT WHERE MEM_ID = P_MEM_ID AND SUBJECT_NAME = P_SUBJECT_NAME),
            P_MEM_ID,
            TO_DATE('2024-'||TO_CHAR(P_MONTH, 'FM00')||'-' || TO_CHAR(P_DAY, 'FM00') || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':00:00', 'YYYY-MM-DD HH24:MI:SS'),

            TO_DATE('2024-'||TO_CHAR(P_MONTH, 'FM00')||'-' || TO_CHAR(P_DAY, 'FM00') || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':30:00', 'YYYY-MM-DD HH24:MI:SS')
        );

    end loop;
        -- 트랜잭션을 커밋합니다.
    COMMIT;
    EXCEPTION WHEN OTHERS THEN
        -- 필요한 경우 예외를 처리합니다.
        ROLLBACK;
        -- 이전에 정의된 예외를 발생
            RAISE;
END;
/
commit;
------4월
--------RECORE ISNERT 프로시저 MORNING 9:00~11:30----------------------------------------
create or replace NONEDITIONABLE PROCEDURE PRO_RECORD_INSERT_MORNING(P_MEM_ID record.record_mem_id%TYPE, P_SUBJECT_NAME subject.subject_name%TYPE, P_DAY VARCHAR2)
IS
        V_SEQ_RECORD_ID NUMBER;
         V_I_NUMBER NUMBER;
         P_MAXCOUNT CONSTANT NUMBER := 11;
BEGIN
    -- 다음 시퀀스 값을 선택합니다.

    for I in 9..P_MAXCOUNT loop
        V_I_NUMBER := I;

        SELECT SEQ_RECORD_ID.nextval INTO V_SEQ_RECORD_ID FROM DUAL;

        -- record 테이블에 삽입합니다.
        --01
        INSERT INTO record (RECORD_ID, RECORD_SUBJECT_ID, RECORD_MEM_ID, RECORD_START, RECORD_END)
        VALUES (
            V_SEQ_RECORD_ID,
            (SELECT SUBJECT_ID FROM SUBJECT WHERE MEM_ID = P_MEM_ID AND SUBJECT_NAME = P_SUBJECT_NAME),
            P_MEM_ID,
            TO_DATE('2024-04-' || P_DAY || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':00:00', 'YYYY-MM-DD HH24:MI:SS'),

            TO_DATE('2024-04-' || P_DAY || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':30:00', 'YYYY-MM-DD HH24:MI:SS')
        );

    end loop;
        -- 트랜잭션을 커밋합니다.
    COMMIT;
    EXCEPTION WHEN OTHERS THEN
        -- 필요한 경우 예외를 처리합니다.
        ROLLBACK;
        -- 이전에 정의된 예외를 발생
            RAISE;
END;
/

--------RECORE ISNERT 프로시저 LUNCH 13:00~17:30----------------------------------------
create or replace NONEDITIONABLE PROCEDURE PRO_RECORD_INSERT_LUNCH(P_MEM_ID record.record_mem_id%TYPE, P_SUBJECT_NAME subject.subject_name%TYPE, P_DAY VARCHAR2)
IS
        V_SEQ_RECORD_ID NUMBER;
         V_I_NUMBER NUMBER;
         P_MAXCOUNT CONSTANT NUMBER := 17;
BEGIN
    -- 다음 시퀀스 값을 선택합니다.

    for I in 13..P_MAXCOUNT loop
        V_I_NUMBER := I;

        SELECT SEQ_RECORD_ID.nextval INTO V_SEQ_RECORD_ID FROM DUAL;

        -- record 테이블에 삽입합니다.
        --01
        INSERT INTO record (RECORD_ID, RECORD_SUBJECT_ID, RECORD_MEM_ID, RECORD_START, RECORD_END)
        VALUES (
            V_SEQ_RECORD_ID,
            (SELECT SUBJECT_ID FROM SUBJECT WHERE MEM_ID = P_MEM_ID AND SUBJECT_NAME = P_SUBJECT_NAME),
            P_MEM_ID,
            TO_DATE('2024-04-' || P_DAY || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':00:00', 'YYYY-MM-DD HH24:MI:SS'),

            TO_DATE('2024-04-' || P_DAY || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':30:00', 'YYYY-MM-DD HH24:MI:SS')
        );

    end loop;
        -- 트랜잭션을 커밋합니다.
    COMMIT;
    EXCEPTION WHEN OTHERS THEN
        -- 필요한 경우 예외를 처리합니다.
        ROLLBACK;
        -- 이전에 정의된 예외를 발생
            RAISE;
END;
/
--------RECORE ISNERT 프로시저 DINNER 18:00~22:30----------------------------------------
create or replace NONEDITIONABLE PROCEDURE PRO_RECORD_INSERT_DINNER(P_MEM_ID record.record_mem_id%TYPE, P_SUBJECT_NAME subject.subject_name%TYPE, P_DAY VARCHAR2)
IS
        V_SEQ_RECORD_ID NUMBER;
         V_I_NUMBER NUMBER;
         P_MAXCOUNT CONSTANT NUMBER := 22;
BEGIN
    -- 다음 시퀀스 값을 선택합니다.

    for I in 18..P_MAXCOUNT loop
        V_I_NUMBER := I;

        SELECT SEQ_RECORD_ID.nextval INTO V_SEQ_RECORD_ID FROM DUAL;

        -- record 테이블에 삽입합니다.
        --01
        INSERT INTO record (RECORD_ID, RECORD_SUBJECT_ID, RECORD_MEM_ID, RECORD_START, RECORD_END)
        VALUES (
            V_SEQ_RECORD_ID,
            (SELECT SUBJECT_ID FROM SUBJECT WHERE MEM_ID = P_MEM_ID AND SUBJECT_NAME = P_SUBJECT_NAME),
            P_MEM_ID,
            TO_DATE('2024-04-' || P_DAY || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':00:00', 'YYYY-MM-DD HH24:MI:SS'),

            TO_DATE('2024-04-' || P_DAY || ' '||TO_CHAR(V_I_NUMBER, 'FM00')||':30:00', 'YYYY-MM-DD HH24:MI:SS')
        );

    end loop;
        -- 트랜잭션을 커밋합니다.
    COMMIT;
    EXCEPTION WHEN OTHERS THEN
        -- 필요한 경우 예외를 처리합니다.
        ROLLBACK;
        -- 이전에 정의된 예외를 발생
            RAISE;
END;
/
commit;

--select*from subject;

