--  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME"."V_DDAY4" ("DDAY") AS 
--  select TRUNC(SYSDATE-3) dday from dual
--union
--select TRUNC(SYSDATE-2) dday from dual
--union
--select TRUNC(SYSDATE-1) dday from dual
--union
--select TRUNC(SYSDATE-0) dday from dual;

desc member;
--------맴버아이디, 과목이름i, 추가할 과목 수---------
create or replace NONEDITIONABLE PROCEDURE PRO_DDAY_CREATE(P_VIWE_NAME CHARACTER,P_LAST_DAY NUMBER)
DECLARE
     I NUMBER:= P_LAST_DAY;
begin
    EXECUTE IMMEDIATE 'CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SWITHME".V_DDAY30 ("DDAY") AS' 
    
    for I in REVERSE P_LAST_DAY..0 loop
        select TRUNC(SYSDATE-I) dday from dual
        union
    
    END LOOP;
         select TRUNC(SYSDATE) dday from dual;
    COMMIT;
END;