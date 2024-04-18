--아이디, 과목이름, 날짜 / 4월로 지정됨
exec PRO_RECORD_INSERT_MORNING('won','D_1','02');
exec PRO_RECORD_INSERT_LUNCH('won','D_2','02');
exec PRO_RECORD_INSERT_DINNER('won','D_3','02');

exec PRO_RECORD_INSERT_MORNING('won','D_1','18');
exec PRO_RECORD_INSERT_LUNCH('won','D_2','18');
exec PRO_RECORD_INSERT_DINNER('won','D_3','18');
--delete from record;
select * from record order by record_id asc;
commit;