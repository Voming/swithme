-----시퀀스
DROP SEQUENCE "SEQ_GROUP_ID";
CREATE SEQUENCE "SEQ_GROUP_ID";

DROP SEQUENCE "SEQ_BOARD_ID";
CREATE SEQUENCE "SEQ_BOARD_ID" ;

DROP SEQUENCE "SEQ_RECORD_ID";
CREATE SEQUENCE "SEQ_RECORD_ID";

DROP SEQUENCE "SEQ_REPLY_ID";
CREATE SEQUENCE "SEQ_REPLY_ID" ;

DROP SEQUENCE "SEQ_SUBJECT_ID";
CREATE SEQUENCE "SEQ_SUBJECT_ID" ;

DROP SEQUENCE "SEQ_DESCR_PRO";
CREATE SEQUENCE "SEQ_DESCR_PRO";

DROP SEQUENCE "SEQ_DESCR_MASTER";
CREATE SEQUENCE "SEQ_DESCR_MASTER";

DROP SEQUENCE "SEQ_DESCR_IDN";
CREATE SEQUENCE "SEQ_DESCR_IDN";

-----DROP﻿
DROP TABLE "SGROUP" CASCADE CONSTRAINTS;
DROP TABLE "SGROUP_MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "SUBJECT" CASCADE CONSTRAINTS;
DROP TABLE "DESCR_PRO" CASCADE CONSTRAINTS;
DROP TABLE "DESCR_MASTER" CASCADE CONSTRAINTS;
DROP TABLE "DESCR_IND" CASCADE CONSTRAINTS;
DROP TABLE "BOARD" CASCADE CONSTRAINTS;
DROP TABLE "RECORD" CASCADE CONSTRAINTS;
DROP TABLE "BOARD_REPLY" CASCADE CONSTRAINTS;
DROP TABLE "PRO_ENGINEER" CASCADE CONSTRAINTS;
DROP TABLE "MASTER_CRAFTSMENT" CASCADE CONSTRAINTS;
DROP TABLE "IND_ENGINEER" CASCADE CONSTRAINTS;

CREATE TABLE "RECORD" (
	"RECORD_ID"	NUMBER		NOT NULL,
	"RECORD_SUBJECT_ID"	NUMBER		NOT NULL,
	"RECORD_MEM_ID"	VARCHAR2(20)		NOT NULL,
	"RECORD_START"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"RECORD_END"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL
);

COMMENT ON COLUMN "RECORD"."RECORD_ID" IS '학습기록순서,시퀀스';

COMMENT ON COLUMN "RECORD"."RECORD_SUBJECT_ID" IS '과목 아이디,시퀀스';

COMMENT ON COLUMN "RECORD"."RECORD_MEM_ID" IS '과목명이랑 PK';

COMMENT ON COLUMN "RECORD"."RECORD_START" IS '공부시작시간';

COMMENT ON COLUMN "RECORD"."RECORD_END" IS '공부종료시간';


CREATE TABLE "SUBJECT" (
	"SUBJECT_ID"	NUMBER		NOT NULL,
	"MEM_ID"	VARCHAR2(20)		NOT NULL,
	"SUBJECT_NAME"	VARCHAR2(20)		NOT NULL,
	"SUBJECT_ADD_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"SUBJECT_DEL_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"SUBJECT_COLOR"	CHAR(1)		NOT NULL
);

COMMENT ON COLUMN "SUBJECT"."SUBJECT_ID" IS '과목 아이디,시퀀스';

COMMENT ON COLUMN "SUBJECT"."MEM_ID" IS '과목명이랑 PK';

COMMENT ON COLUMN "SUBJECT"."SUBJECT_NAME" IS '과목명(사용자 자유설정)';

COMMENT ON COLUMN "SUBJECT"."SUBJECT_ADD_DATE" IS '과목추가시간';

COMMENT ON COLUMN "SUBJECT"."SUBJECT_DEL_DATE" IS '과목삭제시간(과목 삭제 안한게  최대 5개)';

COMMENT ON COLUMN "SUBJECT"."SUBJECT_COLOR" IS '과목 색상 숫자(핑크, 연두 ,노랑, 파랑, 보라)';

CREATE TABLE "MEMBER" (
	"MEM_ID"	VARCHAR2(20)		NOT NULL,
	"MEM_PWD"	VARCHAR2(50)		NOT NULL,
	"MEM_EMAIL"	VARCHAR2(100)		NOT NULL,
	"MEM_RECORD_ING"	CHAR(1)	DEFAULT 0	NOT NULL,
	"MEM_COMMENT"	VARCHAR2(1000)		NULL,
	"MEM_ACTIVE"	CHAR(1)	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEM_ID" IS '영문자, 숫자';

COMMENT ON COLUMN "MEMBER"."MEM_PWD" IS '영문자, 숫자';

COMMENT ON COLUMN "MEMBER"."MEM_EMAIL" IS '이메일';

COMMENT ON COLUMN "MEMBER"."MEM_RECORD_ING" IS '공부중(1), 공부안함(0)';

COMMENT ON COLUMN "MEMBER"."MEM_COMMENT" IS '각오 한마디';

COMMENT ON COLUMN "MEMBER"."MEM_ACTIVE" IS '탈퇴(0), 활동중(1)';


CREATE TABLE "BOARD" (
	"BOARD_ID"	NUMBER		NOT NULL,
	"BOARD_WRITER"	VARCHAR2(20)		NOT NULL,
	"TITLE"	VARCHAR2(120)		NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NOT NULL,
	"WRITE_TIME"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_LIKE"	NUMBER	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_ID" IS '게시글번호,시퀀스';

COMMENT ON COLUMN "BOARD"."BOARD_WRITER" IS '게시글 작성자ID';

COMMENT ON COLUMN "BOARD"."TITLE" IS '글제목';

COMMENT ON COLUMN "BOARD"."CONTENT" IS '글내용';

COMMENT ON COLUMN "BOARD"."WRITE_TIME" IS '글작성시간';

COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."BOARD_LIKE" IS '좋아요 수';

CREATE TABLE "BOARD_REPLY" (
	"REPLY_ID"	NUMBER		NOT NULL,
	"BOARD_ID"	NUMBER		NOT NULL,
	"REPLY_WRITER_ID"	VARCHAR2(20)		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"REPLY_WRITE_TIME"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"REPLY_REF"	NUMBER		NULL,
	"REPLY_STEP"	NUMBER(3)	DEFAULT 1	NOT NULL,
	"REPLY_LEVEL"	NUMBER(2)	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "BOARD_REPLY"."REPLY_ID" IS '댓글,시퀀스';

COMMENT ON COLUMN "BOARD_REPLY"."BOARD_ID" IS '댓글 적은 글번호';

COMMENT ON COLUMN "BOARD_REPLY"."REPLY_WRITER_ID" IS '댓글 작성자 아이디';

COMMENT ON COLUMN "BOARD_REPLY"."REPLY_CONTENT" IS '댓글내용';

COMMENT ON COLUMN "BOARD_REPLY"."REPLY_WRITE_TIME" IS '댓글작성시간';

COMMENT ON COLUMN "BOARD_REPLY"."REPLY_REF" IS '최초 댓글의 번호, BOARD_REPLY_ID';

COMMENT ON COLUMN "BOARD_REPLY"."REPLY_STEP" IS '최초 댓글 기준으로 몇 번째인지';

COMMENT ON COLUMN "BOARD_REPLY"."REPLY_LEVEL" IS '댓글, 대댓글, 대대댓글';

CREATE TABLE "SGROUP" (
	"SGROUP_ID"	NUMBER		NOT NULL,
	"SGROUP_NAME"	VARCHAR2(30)		NOT NULL,
	"SGROUP_OPEN"	CHAR(1)	DEFAULT 0	NOT NULL,
	"SGROUP_PWD"	NUMBER		NULL,
	"SGROUP_EXPLAIN"	VARCHAR2(4000)		NULL,
	"SGROUP_IMG_PATH"	VARCHAR2(1000)		NULL,
	"SGROUP_IMG_NAME"	VARCHAR2(200)		NULL
);

COMMENT ON COLUMN "SGROUP"."SGROUP_ID" IS '그룹 아이디,시퀀스';

COMMENT ON COLUMN "SGROUP"."SGROUP_NAME" IS 'UNIQUE';

COMMENT ON COLUMN "SGROUP"."SGROUP_OPEN" IS '공개(0), 비공개(1)(비공개시 비밀번호 필수)';

COMMENT ON COLUMN "SGROUP"."SGROUP_PWD" IS '그룹 비밀번호';

COMMENT ON COLUMN "SGROUP"."SGROUP_EXPLAIN" IS '그룹 설명';

COMMENT ON COLUMN "SGROUP"."SGROUP_IMG_PATH" IS '그룹 대표이미지 파일 위치';

COMMENT ON COLUMN "SGROUP"."SGROUP_IMG_NAME" IS '그룹 대표이미지 파일명';

CREATE TABLE "SGROUP_MEMBER" (
	"SGROUP_ID"	NUMBER		NOT NULL,
	"SGROUP_MEM_ID"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "SGROUP_MEMBER"."SGROUP_ID" IS '그룹 아이디, SEQUENCE';

COMMENT ON COLUMN "SGROUP_MEMBER"."SGROUP_MEM_ID" IS '그룹회원 아이디';




CREATE TABLE "DESCR_PRO" (
	"DESCR_ID"	NUMBER		NOT NULL,
	"DESCRIPTION"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "DESCR_PRO"."DESCR_ID" IS '회차 시퀀스';

COMMENT ON COLUMN "DESCR_PRO"."DESCRIPTION" IS '회차';



CREATE TABLE "PRO_ENGINEER" (
	"DESCRIPTION"	VARCHAR2(30)		NOT NULL,
	"DESCR_ID"	NUMBER		NOT NULL,
	"DOCREGSTARTDT"	DATE		NOT NULL,
	"DOCREGENDDT"	DATE		NOT NULL,
	"DOCREGSTARTDT_EX"	DATE		NULL,
	"DOCREGENDDT_EX"	DATE		NULL,
	"DOCEXAMDT"	DATE		NOT NULL,
	"DOCPASSDT"	DATE		NOT NULL,
	"PRACREGSTARTDT"	DATE		NOT NULL,
	"PRACREGENDDT"	DATE		NOT NULL,
	"PRACREGSTARTDT_EX"	DATE		NULL,
	"PRACREGENDDT_EX"	DATE		NULL,
	"PRACEXAMSTARTDT"	DATE		NOT NULL,
	"PRACEXAMENDDT"	DATE		NOT NULL,
	"PRACPASSDT"	DATE		NOT NULL
);

COMMENT ON COLUMN "PRO_ENGINEER"."DESCRIPTION" IS '회차';

COMMENT ON COLUMN "PRO_ENGINEER"."DESCR_ID" IS '회차 시퀀스';

COMMENT ON COLUMN "PRO_ENGINEER"."DOCREGSTARTDT" IS '필기시험원서접수시작일자';

COMMENT ON COLUMN "PRO_ENGINEER"."DOCREGENDDT" IS '필기시험원서접수종료일자';

COMMENT ON COLUMN "PRO_ENGINEER"."DOCREGSTARTDT_EX" IS '추가 필기 접수 시작';

COMMENT ON COLUMN "PRO_ENGINEER"."DOCREGENDDT_EX" IS '추가 필기 접수 종료';

COMMENT ON COLUMN "PRO_ENGINEER"."DOCEXAMDT" IS '필기시험일자';

COMMENT ON COLUMN "PRO_ENGINEER"."DOCPASSDT" IS '필기시험 합격(예정)자 발표일자';

COMMENT ON COLUMN "PRO_ENGINEER"."PRACREGSTARTDT" IS '면접시험원서접수시작일자';

COMMENT ON COLUMN "PRO_ENGINEER"."PRACREGENDDT" IS '면접시험원서접수종료일자';

COMMENT ON COLUMN "PRO_ENGINEER"."PRACREGSTARTDT_EX" IS '추가 면접 접수 시작';

COMMENT ON COLUMN "PRO_ENGINEER"."PRACREGENDDT_EX" IS '추가 면접 접수 종료';

COMMENT ON COLUMN "PRO_ENGINEER"."PRACEXAMSTARTDT" IS '면접시험시작일자';

COMMENT ON COLUMN "PRO_ENGINEER"."PRACEXAMENDDT" IS '면접시험종료일자';

COMMENT ON COLUMN "PRO_ENGINEER"."PRACPASSDT" IS '합격자발표일자';



CREATE TABLE "MASTER_CRAFTSMENT" (
	"DESCRIPTION"	VARCHAR2(30)		NOT NULL,
	"DESCR_ID"	NUMBER		NOT NULL,
	"DOCREGSTARTDT"	DATE		NOT NULL,
	"DOCREGENDDT"	DATE		NOT NULL,
	"DOCREGSTARTDT_EX"	DATE		NULL,
	"DOCREGENDDT_EX"	DATE		NULL,
	"DOCEXAMDT"	DATE		NOT NULL,
	"DOCPASSDT"	DATE		NOT NULL,
	"PRACREGSTARTDT"	DATE		NOT NULL,
	"PRACREGENDDT"	DATE		NOT NULL,
	"PRACREGSTARTDT_EX"	DATE		NULL,
	"PRACREGENDDT_EX"	DATE		NULL,
	"PRACEXAMSTARTDT"	DATE		NOT NULL,
	"PRACEXAMENDDT"	DATE		NOT NULL,
	"PRACPASSDT"	DATE		NOT NULL
);

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."DESCRIPTION" IS '회차';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."DESCR_ID" IS '회차 시퀀스';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."DOCREGSTARTDT" IS '필기시험원서접수시작일자';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."DOCREGENDDT" IS '필기시험원서접수종료일자';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."DOCREGSTARTDT_EX" IS '추가 필기 접수 시작';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."DOCREGENDDT_EX" IS '추가 필기 접수 종료';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."DOCEXAMDT" IS '필기시험일자';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."DOCPASSDT" IS '필기시험 합격(예정)자 발표일자';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."PRACREGSTARTDT" IS '실기 시험원서접수시작일자';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."PRACREGENDDT" IS '실기 시험원서접수종료일자';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."PRACREGSTARTDT_EX" IS '추가 실기 접수 시작';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."PRACREGENDDT_EX" IS '추가 실기  접수 종료';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."PRACEXAMSTARTDT" IS '실기 시험시작일자';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."PRACEXAMENDDT" IS '실기 시험종료일자';

COMMENT ON COLUMN "MASTER_CRAFTSMENT"."PRACPASSDT" IS '합격자발표일자';



CREATE TABLE "IND_ENGINEER" (
	"DESCRIPTION"	VARCHAR2(30)		NOT NULL,
	"DESCR_ID"	NUMBER		NOT NULL,
	"DOCREGSTARTDT"	DATE		NOT NULL,
	"DOCREGENDDT"	DATE		NOT NULL,
	"DOCREGSTARTDT_EX"	DATE		NULL,
	"DOCREGENDDT_EX"	DATE		NULL,
	"DOCEXAMDT"	DATE		NOT NULL,
	"DOCPASSDT"	DATE		NOT NULL,
	"PRACREGSTARTDT"	DATE		NOT NULL,
	"PRACREGENDDT"	DATE		NOT NULL,
	"PRACREGSTARTDT_EX"	DATE		NULL,
	"PRACREGENDDT_EX"	DATE		NULL,
	"PRACEXAMSTARTDT"	DATE		NOT NULL,
	"PRACEXAMENDDT"	DATE		NOT NULL,
	"PRACPASSDT"	DATE		NOT NULL
);

COMMENT ON COLUMN "IND_ENGINEER"."DESCRIPTION" IS '회차';

COMMENT ON COLUMN "IND_ENGINEER"."DESCR_ID" IS '회차 시퀀스';

COMMENT ON COLUMN "IND_ENGINEER"."DOCREGSTARTDT" IS '필기시험원서접수시작일자';

COMMENT ON COLUMN "IND_ENGINEER"."DOCREGENDDT" IS '필기시험원서접수종료일자';

COMMENT ON COLUMN "IND_ENGINEER"."DOCREGSTARTDT_EX" IS '추가 필기 접수 시작';

COMMENT ON COLUMN "IND_ENGINEER"."DOCREGENDDT_EX" IS '추가 필기 접수 종료';

COMMENT ON COLUMN "IND_ENGINEER"."DOCEXAMDT" IS '필기시험일자';

COMMENT ON COLUMN "IND_ENGINEER"."DOCPASSDT" IS '필기시험 합격(예정)자 발표일자';

COMMENT ON COLUMN "IND_ENGINEER"."PRACREGSTARTDT" IS '실기 시험원서접수시작일자';

COMMENT ON COLUMN "IND_ENGINEER"."PRACREGENDDT" IS '실기 시험원서접수종료일자';

COMMENT ON COLUMN "IND_ENGINEER"."PRACREGSTARTDT_EX" IS '추가 실기 접수 시작';

COMMENT ON COLUMN "IND_ENGINEER"."PRACREGENDDT_EX" IS '추가 실기  접수 종료';

COMMENT ON COLUMN "IND_ENGINEER"."PRACEXAMSTARTDT" IS '실기 시험시작일자';

COMMENT ON COLUMN "IND_ENGINEER"."PRACEXAMENDDT" IS '실기 시험종료일자';

COMMENT ON COLUMN "IND_ENGINEER"."PRACPASSDT" IS '합격자발표일자';



CREATE TABLE "DESCR_MASTER" (
	"DESCR_ID"	NUMBER		NOT NULL,
	"DESCRIPTION"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "DESCR_MASTER"."DESCR_ID" IS '회차 시퀀스';

COMMENT ON COLUMN "DESCR_MASTER"."DESCRIPTION" IS '회차';



CREATE TABLE "DESCR_IND" (
	"DESCR_ID"	NUMBER		NOT NULL,
	"DESCRIPTION"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "DESCR_IND"."DESCR_ID" IS '회차 시퀀스';

COMMENT ON COLUMN "DESCR_IND"."DESCRIPTION" IS '회차';


ALTER TABLE "RECORD" ADD CONSTRAINT "PK_RECORD" PRIMARY KEY (
	"RECORD_ID",
	"RECORD_SUBJECT_ID",
	"RECORD_MEM_ID"
);

ALTER TABLE "SUBJECT" ADD CONSTRAINT "PK_SUBJECT" PRIMARY KEY (
	"SUBJECT_ID",
	"MEM_ID"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEM_ID"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_ID"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "PK_BOARD_REPLY" PRIMARY KEY (
	"REPLY_ID"
);

ALTER TABLE "SGROUP" ADD CONSTRAINT "PK_SGROUP" PRIMARY KEY (
	"SGROUP_ID"
);

ALTER TABLE "SGROUP_MEMBER" ADD CONSTRAINT "PK_SGROUP_MEMBER" PRIMARY KEY (
	"SGROUP_ID",
	"SGROUP_MEM_ID"
);

ALTER TABLE "DESCR_PRO" ADD CONSTRAINT "PK_DESCR_PRO" PRIMARY KEY (
	"DESCR_ID"
);

ALTER TABLE "PRO_ENGINEER" ADD CONSTRAINT "PK_PRO_ENGINEER" PRIMARY KEY (
	"DESCRIPTION"
);

ALTER TABLE "MASTER_CRAFTSMENT" ADD CONSTRAINT "PK_MASTER_CRAFTSMENT" PRIMARY KEY (
	"DESCRIPTION"
);

ALTER TABLE "IND_ENGINEER" ADD CONSTRAINT "PK_IND_ENGINEER" PRIMARY KEY (
	"DESCRIPTION"
);

ALTER TABLE "DESCR_MASTER" ADD CONSTRAINT "PK_DESCR_MASTER" PRIMARY KEY (
	"DESCR_ID"
);

ALTER TABLE "DESCR_IND" ADD CONSTRAINT "PK_DESCR_IND" PRIMARY KEY (
	"DESCR_ID"
);

--복합 FK로 설정하고 unique 설정은 제외함 --> unique 설정 시 MEM_ID당 하나의 SUBJECT테이블만 생성됨
ALTER TABLE "RECORD" ADD CONSTRAINT "FK_SUBJECT_TO_RECORD_1" FOREIGN KEY (
	"RECORD_SUBJECT_ID","RECORD_MEM_ID"
)
REFERENCES "SUBJECT" (
	"SUBJECT_ID","MEM_ID"
);

ALTER TABLE "SUBJECT" ADD CONSTRAINT "FK_MEMBER_TO_SUBJECT_1" FOREIGN KEY (
	"MEM_ID"
)
REFERENCES "MEMBER" (
	"MEM_ID"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
	"BOARD_WRITER"
)
REFERENCES "MEMBER" (
	"MEM_ID"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "FK_BOARD_TO_BOARD_REPLY_1" FOREIGN KEY (
	"BOARD_ID"
)
REFERENCES "BOARD" (
	"BOARD_ID"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_REPLY_1" FOREIGN KEY (
	"REPLY_WRITER_ID"
)
REFERENCES "MEMBER" (
	"MEM_ID"
);

ALTER TABLE "SGROUP_MEMBER" ADD CONSTRAINT "FK_SGROUP_TO_SGROUP_MEMBER_1" FOREIGN KEY (
	"SGROUP_ID"
)
REFERENCES "SGROUP" (
	"SGROUP_ID"
);

ALTER TABLE "SGROUP_MEMBER" ADD CONSTRAINT "FK_MEMBER_TO_SGROUP_MEMBER_1" FOREIGN KEY (
	"SGROUP_MEM_ID"
)
REFERENCES "MEMBER" (
	"MEM_ID"
);

ALTER TABLE "PRO_ENGINEER" ADD CONSTRAINT "FK_DESCR_PRO_TO_PRO_ENGINEER_1" FOREIGN KEY (
	"DESCR_ID"
)
REFERENCES "DESCR_PRO" (
	"DESCR_ID"
);

ALTER TABLE "MASTER_CRAFTSMENT" ADD CONSTRAINT "FK_DESCR_MASTER_TO_MASTER_CRAFTSMENT_1" FOREIGN KEY (
	"DESCR_ID"
)
REFERENCES "DESCR_MASTER" (
	"DESCR_ID"
);

ALTER TABLE "IND_ENGINEER" ADD CONSTRAINT "FK_DESCR_IND_TO_IND_ENGINEER_1" FOREIGN KEY (
	"DESCR_ID"
)
REFERENCES "DESCR_IND" (
	"DESCR_ID"
);

