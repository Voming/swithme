--------날짜 계산을 위한 프로시저---------
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
--

---월 묶음
create or replace procedure PRO_MONTH_CREATE(P_NAME CHAR,P_LAST_MONTH NUMBER) AS 
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