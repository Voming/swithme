--  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."V_DDAY4" ("DDAY") AS 
--  select TRUNC(SYSDATE-3) dday from dual
--union
--select TRUNC(SYSDATE-2) dday from dual
--union
--select TRUNC(SYSDATE-1) dday from dual
--union
--select TRUNC(SYSDATE-0) dday from dual;

desc member;
--------날짜 계산을 위한 프로시저---------
create or replace PROCEDURE PRO_DDAY_CREATE(P_NAME CHAR,P_LAST_DAY NUMBER)AS
     v_saved varchar2(4000);
begin
    v_saved:=' CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."'||P_NAME||'" ("DDAY") AS';
    
    FOR I in REVERSE P_LAST_DAY..0 loop
        v_saved :=  v_saved|| ' select TRUNC(SYSDATE-'||I||') dday from dual ';
        if I > 0 then
            v_saved :=  v_saved|| ' union ';
        END IF;
    END LOOP;
    COMMIT;
END;
--
SELECT TRUNC(SYSDATE,'month') AS this_month,
       TRUNC(ADD_MONTHS(SYSDATE, -1),'month') AS month
FROM dual;
---
create or replace procedure PRO_MONTH_CREATE(P_NAME CHAR,P_LAST_MONTH NUMBER) AS 
    V_CREATE  VARCHAR2(4000);
BEGIN
    V_CREATE  :=' CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."'||P_NAME||'" ("MMONTH") AS ';
    FOR I IN REVERSE P_LAST_MONTH..0 LOOP
        V_CREATE := V_CREATE||' SELECT TRUNC(ADD_MONTHS(SYSDATE, -'||I||'),'|| CHR(39)||'month'|| CHR(39)||') AS MMONTH FROM dual';
        IF I > 0 THEN
            V_CREATE := V_CREATE||' UNION ';    
        END IF;
    END LOOP;
    COMMIT;
END;
