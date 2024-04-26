desc descr_ind;
desc ind_engineer;

-- 기본 값 넣기
insert all 
	into descr_ind values (SEQ_DESCR_IDN.nextval, #{decription})
	into ind_engineer (DESCR_ID, DOCREGSTARTDT, DOCREGENDDT, DOCEXAMDT, DOCPASSDT, PRACREGSTARTDT, PRACREGENDDT, PRACEXAMSTARTDT, PRACEXAMENDDT, PRACPASSDT) 
    values (SEQ_DESCR_IDN.nextval, #{DOCREGSTARTDT, #{DOCREGENDDT}, #{DOCEXAMDT}, #{DOCPASSDT}, #{PRACREGSTARTDT}, #{PRACREGENDDT}, #{PRACEXAMSTARTDT}, #{PRACEXAMENDDT}, #{PRACPASSDT}) 
select * from dual;


MERGE INTO P
    USING dual
        ON (ID = 'AAA')
    WHEN NOT MATCHED THEN
        INSERT (ID, NAME, BIRTH)
        VALUES ('AAA', '홍길동', '2000-01-01')
    WHEN MATCHED THEN 
        UPDATE SET
            NAME='홍길동',
            BIRTH='2000-01-01'; 

delete from descr_ind;

SELECT SEQ_DESCR_IDN.nextval, '테스트중' from dual;
SELECT SEQ_DESCR_IDN.nextval, '테스트중' from dual where not exists (select d.description from descr_ind d where d.description = '테스트중');

--FROM DUAL NOT EXISTS 
INSERT INTO descr_ind(DESCR_ID,description )
    SELECT SEQ_DESCR_IDN.nextval,'테스트중'
    FROM DUAL WHERE NOT EXISTS
    (select * from descr_ind  where description = '테스트중');

select * from descr_ind;

desc descr_ind;
desc ind_engineer;

--실행 결과를 출력하도록 설정
SET SERVEROUTPUT ON
 
--스크립트 경과 시간을 출력하도록 설정
SET TIMING ON


CREATE OR REPLACE PROCEDURE insert_or_update_indengineer_data (
    p_descrId NUMBER,
    p_docregstartdt DATE,
    p_docregenddt DATE,
    p_docexamdt DATE,
    p_docpassdt DATE,
    p_pracregstartdt DATE,
    p_pracregenddt DATE,
    p_pracexamstartdt DATE,
    p_pracexamenddt DATE,
    p_pracpassdt DATE,
    p_docregstartdtEx DATE,
    p_docregenddtEx DATE,
    p_pracregstartdtEx DATE,
    p_pracregenddtEx DATE
) AS
BEGIN
    -- 중복된 descrId가 있는지 확인하고 있으면 업데이트, 없으면 삽입
    IF EXISTS (
        SELECT 1
        FROM IndengineerDto
        WHERE descrId = p_descrId
    ) THEN
        -- 중복된 값이 없는 열만 업데이트
        UPDATE IndengineerDto
        SET docregstartdtEx = COALESCE(docregstartdtEx, p_docregstartdtEx),
            docregenddtEx = COALESCE(docregenddtEx, p_docregenddtEx),
            pracregstartdtEx = COALESCE(pracregstartdtEx, p_pracregstartdtEx),
            pracregenddtEx = COALESCE(pracregenddtEx, p_pracregenddtEx)
        WHERE descrId = p_descrId;
    ELSE
        -- 중복된 값이 없는 열에는 새로운 값 삽입
        INSERT INTO IndengineerDto (
            descrId,
            docregstartdt,
            docregenddt,
            docexamdt,
            docpassdt,
            pracregstartdt,
            pracregenddt,
            pracexamstartdt,
            pracexamenddt,
            pracpassdt,
            docregstartdtEx,
            docregenddtEx,
            pracregstartdtEx,
            pracregenddtEx
        ) VALUES (
            p_descrId,
            p_docregstartdt,
            p_docregenddt,
            p_docexamdt,
            p_docpassdt,
            p_pracregstartdt,
            p_pracregenddt,
            p_pracexamstartdt,
            p_pracexamenddt,
            p_pracpassdt,
            p_docregstartdtEx,
            p_docregenddtEx,
            p_pracregstartdtEx,
            p_pracregenddtEx
        );
    END IF;
END;
/