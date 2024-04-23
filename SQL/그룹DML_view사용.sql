select * from record;

select v.difftime, 
(select sgroup_member.sgroup_mem_id from sgroup_member where v.record_mem_id = sgroup_member.sgroup_mem_id and) from v_record_week v ;

select * from sgroup_member;

insert into sgroup_member VALUES (1, 'song');
commit;

select s.sgroup_mem_id AS "MEM_ID"
, NVL( SUBSTR(TO_CHAR(v.difftime , 'HH24:MI:SS'), 12, 8), '0') AS "SUM_MIN"
from sgroup_member s
left join v_record_week v on( v.record_mem_id = s.sgroup_mem_id )
where s.sgroup_id = '1'
order by SUM_MIN desc;


select * from V_RECORD_WO_SUBJECT_W_GROUP;

SELECT '그룹원' MEM_ID, 
		TO_CHAR(SYSDATE - 7, 'DY') as "d1", TO_CHAR(SYSDATE - 6, 'DY') as "d2", TO_CHAR(SYSDATE - 5, 'DY') as "d3", TO_CHAR(SYSDATE - 4, 'DY') as "d4"
		, TO_CHAR(SYSDATE - 3, 'DY') as "d5", TO_CHAR(SYSDATE - 2, 'DY') as "d6", TO_CHAR(SYSDATE-1, 'DY') as "d7"
FROM DUAL
UNION
select sgroup_mem_id, 
    NVL(SUBSTR((select difftime from V_RECORD_WO_SUBJECT_W_GROUP  
        where trunc(record_date) = trunc(SYSDATE - 7) and sgroup_mem_id = a.sgroup_mem_id)
        , 12, 8), '0' ) as "d1",
    NVL(SUBSTR((select difftime from V_RECORD_WO_SUBJECT_W_GROUP 
        where trunc(record_date) = trunc(SYSDATE - 6) and sgroup_mem_id = a.sgroup_mem_id)
        , 12, 8), '0') as "d2",
    NVL(SUBSTR((select difftime from V_RECORD_WO_SUBJECT_W_GROUP  
        where trunc(record_date) = trunc(SYSDATE - 5) and sgroup_mem_id = a.sgroup_mem_id)
        , 12, 8), '0') as "d3",
    NVL(SUBSTR((select difftime from V_RECORD_WO_SUBJECT_W_GROUP  
        where trunc(record_date) = trunc(SYSDATE - 4) and sgroup_mem_id = a.sgroup_mem_id)
        , 12, 8), '0') as "d4",
    NVL(SUBSTR((select difftime from V_RECORD_WO_SUBJECT_W_GROUP  
        where trunc(record_date) = trunc(SYSDATE - 3) and sgroup_mem_id = a.sgroup_mem_id)
        , 12, 8), '0') as "d5",
    NVL(SUBSTR((select difftime from V_RECORD_WO_SUBJECT_W_GROUP  
        where trunc(record_date) = trunc(SYSDATE - 2) and sgroup_mem_id = a.sgroup_mem_id)
        , 12, 8), '0') as "d6",
    NVL(SUBSTR((select difftime from V_RECORD_WO_SUBJECT_W_GROUP  
        where trunc(record_date) = trunc(SYSDATE - 1) and sgroup_mem_id = a.sgroup_mem_id)
        , 12, 8), '0')  as "d7"
from V_RECORD_WO_SUBJECT_W_GROUP a
where a.sgroup_id = '1'
;

select * from record  where record_start BETWEEN trunc(SYSDATE - 7) AND trunc(SYSDATE) and record_mem_id ='song';