select * from ind_engineer;
delete from ind_engineer;

select * from descr_ind;
delete from descr_ind;

commit;

SELECT
    *
FROM master_craftsment;


select d.description, e.* from ind_engineer e join descr_ind d on (e.descr_id = d.descr_id);

desc ind_engineer;

SELECT D.DESCRIPTION, E.DOCREGSTARTDT, E.DOCREGENDDT, E.DOCREGSTARTDT_EX, E.DOCREGENDDT_EX, E.DOCEXAMDT, E.DOCPASSDT
	, E.PRACREGSTARTDT, E.PRACREGENDDT, E.PRACREGSTARTDT_EX, E.PRACREGENDDT_EX, E.PRACEXAMSTARTDT, E.PRACEXAMENDDT, E.PRACPASSDT
	 FROM IND_ENGINEER E JOIN DESCR_IND D ON (E.DESCR_ID = D.DESCR_ID);
     
SELECT D.DESCRIPTION, E.DOCREGSTARTDT, E.DOCREGENDDT, E.DOCREGSTARTDT_EX, E.DOCREGENDDT_EX, E.DOCEXAMDT, E.DOCPASSDT
	, E.PRACREGSTARTDT, E.PRACREGENDDT, E.PRACREGSTARTDT_EX, E.PRACREGENDDT_EX, E.PRACEXAMSTARTDT, E.PRACEXAMENDDT, E.PRACPASSDT
	 FROM PRO_ENGINEER E JOIN DESCR_PRO D ON (E.DESCR_ID = D.DESCR_ID);
     
SELECT D.DESCRIPTION, E.DOCREGSTARTDT, E.DOCREGENDDT, E.DOCREGSTARTDT_EX, E.DOCREGENDDT_EX, E.DOCEXAMDT, E.DOCPASSDT
	, E.PRACREGSTARTDT, E.PRACREGENDDT, E.PRACREGSTARTDT_EX, E.PRACREGENDDT_EX, E.PRACEXAMSTARTDT, E.PRACEXAMENDDT, E.PRACPASSDT
	 FROM MASTER_CRAFTSMENT E JOIN DESCR_MASTER D ON (E.DESCR_ID = D.DESCR_ID);
    
delete from ind_engineer;
delete from descr_ind;
    
delete from MASTER_CRAFTSMENT;
delete from descr_master;
    
delete from pro_engineer;
delete from descr_pro;
commit;

select * from MASTER_CRAFTSMENT;


SET SERVEROUTPUT ON;

create or replace PROCEDURE PRO_TEST_DELETE
IS
BEGIN
	delete from ind_engineer;
    delete from descr_ind;
    
    delete from MASTER_CRAFTSMENT;
    delete from descr_master;
    
    delete from pro_engineer;
    delete from descr_pro;
END;
/

COMMIT;
create sequence SEQ_DESCR_PRO;
drop sequence SEQ_DESCR_PRO;
EXEC PRO_TEST_DELETE();
select SEQ_DESCR_PRO.nextval from dual;
