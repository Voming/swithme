create or replace NONEDITIONABLE PROCEDURE PRO_DDAY_CREATE(P_NAME CHAR,P_LAST_DAY NUMBER) 
AS
    v_saved varchar2(4000);
    v_dbdate varchar2(10);
    v_cursor INTEGER;
begin
    v_saved:=' CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."'||P_NAME||'"  AS';

    FOR I in REVERSE 0..P_LAST_DAY-1 loop
        v_saved :=  v_saved|| ' select TRUNC(SYSDATE-'||I||') DDAY from dual ';
        if I > 0 then
            v_saved :=  v_saved|| ' union ';
        END IF;
    END LOOP;

  --CREATE TABLE명령어 화면에 출력 
    DBMS_OUTPUT.PUT_LINE(v_saved);

-- 테이블 생성
    v_cursor := DBMS_SQL.OPEN_CURSOR;  
    DBMS_SQL.PARSE(v_cursor, v_saved, dbms_sql.v7);
    DBMS_SQL.CLOSE_CURSOR(v_cursor);
    commit;
END;
/

create or replace NONEDITIONABLE procedure PRO_MONTH_CREATE(P_NAME CHAR,P_LAST_MONTH NUMBER) AS 
    v_dbdate varchar2(10);
    v_cursor INTEGER;
    V_CREATE  VARCHAR2(4000);
BEGIN
    V_CREATE  :=' CREATE OR REPLACE FORCE NONEDITIONABLE VIEW '||P_NAME||' ("MMONTH") AS ';
    FOR I IN REVERSE 0..P_LAST_MONTH-1 LOOP
        V_CREATE := V_CREATE||' SELECT TRUNC(ADD_MONTHS(SYSDATE, -'||I||'),'|| CHR(39)||'month'|| CHR(39)||') AS MMONTH FROM  DUAL';
        IF I > 0 THEN
            V_CREATE := V_CREATE||' UNION ';    
        END IF;
    END LOOP;
    --DBMS_OUTPUT.PUT_LINE(V_CREATE);
--테이블 생성    
    v_cursor := DBMS_SQL.OPEN_CURSOR;  
    DBMS_SQL.PARSE(v_cursor, V_CREATE, dbms_sql.v7);
    DBMS_SQL.CLOSE_CURSOR(v_cursor);
    COMMIT;
END;
/
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

create or replace NONEDITIONABLE PROCEDURE PRO_SUBJECT_INSERT(P_MEM_ID_PK subject.mem_id%TYPE, P_SUBJECT_NAME subject.subject_name%TYPE,P_MAXCOUNT NUMBER)
IS  
    --SUBJECT 모든 컬럼 가져오기
    V_S SUBJECT%ROWTYPE;
begin
 for I in 1..P_MAXCOUNT loop
    select SEQ_SUBJECT_ID.NEXTVAL INTO V_S.SUBJECT_ID FROM DUAL;
    V_S.MEM_ID := P_MEM_ID_PK;
    INSERT INTO SUBJECT
    VALUES(
        V_S.SUBJECT_ID,
        V_S.MEM_ID,
        P_SUBJECT_NAME||I,
        default,
        null,
        I
    );
    END LOOP;
    COMMIT;
END;
/

create or replace NONEDITIONABLE PROCEDURE PRO_TEST_DELETE
IS
    v_dropseqsql1 VARCHAR2(100);
    v_createseqsql1 VARCHAR2(100);
     v_dropseqsql2 VARCHAR2(100);
    v_createseqsql2 VARCHAR2(100);
     v_dropseqsql3 VARCHAR2(100);
    v_createseqsql3 VARCHAR2(100);
    v_cursor INTEGER;
BEGIN
	delete from ind_engineer;
    delete from descr_ind;

    delete from MASTER_CRAFTSMENT;
    delete from descr_master;

    delete from pro_engineer;
    delete from descr_pro;
    commit;
    
    -- CREATE TABLE명령어 생성
    v_dropseqsql1 := 'drop sequence SEQ_DESCR_PRO';
    v_createseqsql1 := 'create sequence SEQ_DESCR_PRO';
    v_dropseqsql2 := 'drop sequence SEQ_DESCR_MASTER';
    v_createseqsql2 := 'create sequence SEQ_DESCR_MASTER';
    v_dropseqsql3 := 'drop sequence SEQ_DESCR_IND';
    v_createseqsql3 := 'create sequence SEQ_DESCR_IND';
    --CREATE TABLE명령어 화면에 출력  
--    DBMS_OUTPUT.PUT_LINE(v_dropseqsql);
--    DBMS_OUTPUT.PUT_LINE(v_createseqsql);
       
    
    EXECUTE IMMEDIATE v_dropseqsql1; 
    EXECUTE IMMEDIATE v_createseqsql1; 
     EXECUTE IMMEDIATE v_dropseqsql2; 
    EXECUTE IMMEDIATE v_createseqsql2; 
     EXECUTE IMMEDIATE v_dropseqsql3; 
    EXECUTE IMMEDIATE v_createseqsql3; 
--    
END;
/