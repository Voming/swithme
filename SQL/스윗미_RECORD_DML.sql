--record RECORD_START,RECORD_END -> SYSDATE로 변경
ALTER TABLE RECORD MODIFY(RECORD_START DATE);
ALTER TABLE RECORD MODIFY(RECORD_END DATE);
--subject도 같이 변경 SUBJECT_ADD_DATE,SUBJECT_DEL_DATE 
ALTER TABLE SUBJECT MODIFY(SUBJECT_ADD_DATE DATE);
ALTER TABLE SUBJECT MODIFY(SUBJECT_DEL_DATE DATE);
desc subject;
--아이디, 과목이름, 날짜 / 4월로 지정됨
exec PRO_RECORD_INSERT_MORNING('won','D_1','02');
exec PRO_RECORD_INSERT_LUNCH('won','D_2','02');
exec PRO_RECORD_INSERT_DINNER('won','D_3','02');
--17일
exec PRO_RECORD_INSERT_DINNER('won','D_1','17');
--18일
exec PRO_RECORD_INSERT_MORNING('won','D_1','18');
exec PRO_RECORD_INSERT_LUNCH('won','D_2','18');
exec PRO_RECORD_INSERT_DINNER('won','D_3','18');

--19일
exec PRO_RECORD_INSERT_MORNING('won','D_3','19');
exec PRO_RECORD_INSERT_LUNCH('won','SQL','19');
exec PRO_RECORD_INSERT_DINNER('won','D_1','19');

exec PRO_RECORD_INSERT_MORNING('song','JAVA','19');
exec PRO_RECORD_INSERT_LUNCH('song','spring','19');
exec PRO_RECORD_INSERT_DINNER('song','C#','19');

--22일
exec PRO_RECORD_INSERT_MORNING('song','JAVA','22');
exec PRO_RECORD_INSERT_LUNCH('song','spring','22');
exec PRO_RECORD_INSERT_DINNER('song','C#','22');

exec PRO_RECORD_INSERT_MORNING('won','D_3','22');
exec PRO_RECORD_INSERT_LUNCH('won','SQL','22');
exec PRO_RECORD_INSERT_DINNER('won','D_1','22');

--delete from record;
select * from subject -- where --record_mem_id='won' order by record_end desc
;
select * from record --where record_mem_id='song'
;
--delete from record ;
select *from subject  WHERE SUBJECT_ID = 173 AND MEM_ID = 'a';
UPDATE SUBJECT SET SUBJECT_DEL_DATE = sysdate  WHERE SUBJECT_ID = 173 AND MEM_ID = 'a';
rollback;
desc subject;
commit;
