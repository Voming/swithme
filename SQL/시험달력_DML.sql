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
--FROM DUAL NOT EXISTS 
INSERT INTO descr_ind(DESCR_ID,description )
    SELECT SEQ_DESCR_IDN.nextval,'테스트중'
    FROM DUAL WHERE NOT EXISTS
    (select * from descr_ind  where description = '테스트중');

--INSERT IGNORE
INSERT IGNORE INTO User (userEmail, userPassword) VALUES ("a@a.com", 1234);


select * from descr_ind;

SELECT SEQ_DESCR_IDN.nextval, '테스트중' from dual;
SELECT SEQ_DESCR_IDN.nextval, '테스트중' from dual where not exists (select d.description from descr_ind d where d.description = '테스트중');