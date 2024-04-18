--------맴버아이디, 과목이름i, 추가할 과목 수---------
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

