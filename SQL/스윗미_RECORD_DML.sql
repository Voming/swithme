--아이디, 과목이름, 날짜 / 4월로 지정됨
exec PRO_RECORD_INSERT_MORNING('won','D_1','02');
exec PRO_RECORD_INSERT_LUNCH('won','D_2','02');
exec PRO_RECORD_INSERT_DINNER('won','D_3','02');

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
select * from record where record_mem_id='song';
--delete from record ;

commit;
