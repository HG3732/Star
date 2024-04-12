DROP SEQUENCE SEQ_BOARD_ID;
CREATE SEQUENCE SEQ_BOARD_ID;

DROP TABLE "EDU_BOOK";
    DROP TABLE "EDU_LIST";
DROP TABLE "BOARD_FILE";
DROP TABLE "BOARD_REPLY";
    DROP TABLE "BOARD_COMMUNITY";
DROP TABLE "MEMBER";
    DROP TABLE "MEMBER_GRADE";

CREATE TABLE "MEMBER" (
	"MEMBER_ID"	VARCHAR2(15)		NOT NULL,
	"MEMBER_ADMIN"	NUMBER(1)	DEFAULT 0	NOT NULL,
	"MEMBER_NAME"	VARCHAR2(10)		NOT NULL,
	"MEMBER_PWD"	VARCHAR2(20)		NOT NULL,
	"MEMBER_EMAIL"	VARCHAR(20)		NOT NULL,
	"MEMBER_ADDRESS"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '영문자, 숫자, 4~15글자';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADMIN" IS '금지회원(-1),일반회원(0), 관리자(1), 마스터 (2)';

COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_PWD" IS '영어,숫자,특수기호포함 12~20글자';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '@A.COM은 따로 구현';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDRESS" IS '주소...';


CREATE TABLE "EDU_LIST" (
	"EDU_ID"	NUMBER		NOT NULL,
	"EDU_SUBJECT"	VARCHAR2(100)		NOT NULL,
	"EDU_ADDRESS"	VARCHAR2(300)		NOT NULL,
	"EDU_PARTICIPANT"	VARCHAR2(30)		NOT NULL,
	"EDU_DAY"	VARCHAR2(6)		NOT NULL,
	"EDU_MONTH"	VARCHAR2(7)		NOT NULL,
	"EDU_BOOK_START"	DATE		NOT NULL,
	"EDU_BOOK_END"	DATE		NOT NULL,
	"EDU_START"	DATE		NOT NULL,
	"EDU_END"	DATE		NOT NULL,
	"EDU_WRITE_TIME"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
);

COMMENT ON COLUMN "EDU_LIST"."EDU_ID" IS '교육 게시 번호';

COMMENT ON COLUMN "EDU_LIST"."EDU_SUBJECT" IS '교육명 한글 33자, 영문 100자 이하';

COMMENT ON COLUMN "EDU_LIST"."EDU_ADDRESS" IS '교육장주소 한글 100자 이하';

COMMENT ON COLUMN "EDU_LIST"."EDU_PARTICIPANT" IS '대상 (초등학생, 구분없음, 성인, 
초등1~6학년, 초등1~3학년, 
초등4~6학년, 가족, 초등4학년 이상 
중 선택)';

COMMENT ON COLUMN "EDU_LIST"."EDU_DAY" IS '운영요일 (월, 화, 수, 목, 금, 토, 일, 매일 중 선택)';

COMMENT ON COLUMN "EDU_LIST"."EDU_MONTH" IS '해당년월 (YYYY-MM 형식)';

COMMENT ON COLUMN "EDU_LIST"."EDU_BOOK_START" IS '교육 신청 시작날짜';

COMMENT ON COLUMN "EDU_LIST"."EDU_BOOK_END" IS '교육 신청 종료날짜';

COMMENT ON COLUMN "EDU_LIST"."EDU_START" IS '교육 운영 시작날짜';

COMMENT ON COLUMN "EDU_LIST"."EDU_END" IS '교육 운영 종료날짜';

COMMENT ON COLUMN "EDU_LIST"."EDU_WRITE_TIME" IS '교육 등록 시간';

CREATE TABLE "BOARD_COMMUNITY" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_WRITER"	VARCHAR2(15)		NULL,
	"BOARD_TITLE"	VARCHAR2(20)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"BOARD_WRITE_TIME"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"HIT"	NUMBER	DEFAULT 1	NOT NULL,
	"MEMBER_ADMIN"	NUMBER(1)	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "BOARD_COMMUNITY"."BOARD_NO" IS '해당 글번호';

COMMENT ON COLUMN "BOARD_COMMUNITY"."BOARD_WRITER" IS '작성자, NULL은 관리자에 의해 삭제될 경우, default는 작성자ID';

COMMENT ON COLUMN "BOARD_COMMUNITY"."BOARD_TITLE" IS '글제목';

COMMENT ON COLUMN "BOARD_COMMUNITY"."BOARD_CONTENT" IS '글내용';

COMMENT ON COLUMN "BOARD_COMMUNITY"."BOARD_WRITE_TIME" IS '작성일';

COMMENT ON COLUMN "BOARD_COMMUNITY"."HIT" IS '기본값 1';

COMMENT ON COLUMN "BOARD_COMMUNITY"."MEMBER_ADMIN" IS '일반회원(0), 관리자(1), 마스터 (2)';

CREATE TABLE "EDU_BOOK" (
	"EDU_BOOK_ID"	VARCHAR2(15)		NOT NULL,
	"EDU_ID"	NUMBER		NOT NULL,
	"EDU_BOOK_PHONE"	VARCHAR2(11)		NOT NULL,
	"EDU_PART_LEVEL"	VARCHAR2(10)		NOT NULL,
	"EDU_PART_NAME"	VARCHAR2(10)		NOT NULL,
	"EDU_PART_GEN"	CHAR(2)		NOT NULL,
	"EDU_PART_SCHOOL"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "EDU_BOOK"."EDU_BOOK_ID" IS '영문자, 숫자, 4~15글자';

COMMENT ON COLUMN "EDU_BOOK"."EDU_ID" IS '교육 게시 번호';

COMMENT ON COLUMN "EDU_BOOK"."EDU_BOOK_PHONE" IS '-없이 최대 11자';

COMMENT ON COLUMN "EDU_BOOK"."EDU_PART_LEVEL" IS '초등(1~6), 중등(1~6), 고등(1~6), 성인 중 선택';

COMMENT ON COLUMN "EDU_BOOK"."EDU_PART_NAME" IS '수강자명';

COMMENT ON COLUMN "EDU_BOOK"."EDU_PART_GEN" IS '남(m), 여(f) 중 선택';

COMMENT ON COLUMN "EDU_BOOK"."EDU_PART_SCHOOL" IS '참여 학교명';

CREATE TABLE "BOARD_REPLY" (
	"B_REPLY_ID"	NUMBER		NOT NULL,
	"B_REPLY_NO"	NUMBER		NOT NULL,
	"B_REPLY_WRITER"	VARCHAR2(15)		NOT NULL,
	"B_REPLY_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"B_REPLY_WRITE_TIME"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"B_REPLY_LEVEL"	NUMBER(2)	DEFAULT 1	NOT NULL,
	"B_REPLY_REF"	NUMBER		NULL,
	"B_REPLY_STEP"	NUMBER(3)	DEFAULT 1	NOT NULL,
	"MEMBER_ADMIN"	NUMBER(1)	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "BOARD_REPLY"."B_REPLY_ID" IS '댓글';

COMMENT ON COLUMN "BOARD_REPLY"."B_REPLY_NO" IS '해당 글번호';

COMMENT ON COLUMN "BOARD_REPLY"."B_REPLY_WRITER" IS '댓글작성자';

COMMENT ON COLUMN "BOARD_REPLY"."B_REPLY_CONTENT" IS '댓글내용';

COMMENT ON COLUMN "BOARD_REPLY"."B_REPLY_WRITE_TIME" IS '댓글작성시간';

COMMENT ON COLUMN "BOARD_REPLY"."B_REPLY_LEVEL" IS '댓글1,대댓글2,대대댓글3';

COMMENT ON COLUMN "BOARD_REPLY"."B_REPLY_REF" IS '최초댓글(B_REPLY_LEVEL:1)의번호 B_REPLY_ID';

COMMENT ON COLUMN "BOARD_REPLY"."B_REPLY_STEP" IS '최초댓글기준으로 몇번째 위치인지 나타냄';

COMMENT ON COLUMN "BOARD_REPLY"."MEMBER_ADMIN" IS '일반회원(0), 관리자(1), 마스터 (2)';

CREATE TABLE "MEMBER_GRADE" (
	"MEMBER_ADMIN"	NUMBER(1)	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "MEMBER_GRADE"."MEMBER_ADMIN" IS '일반회원(0), 관리자(1), 마스터 (2)';

CREATE TABLE "BOARD_FILE" (
	"B_NO"	NUMBER		NOT NULL,
	"FILE_ID"	NUMBER		NULL,
	"FILE_PATH"	VARCHAR2(1000)		NULL,
	"FILE_ORIGINAL_NAME"	VARCHAR2(300)		NULL
);

COMMENT ON COLUMN "BOARD_FILE"."B_NO" IS '해당 글번호';

COMMENT ON COLUMN "BOARD_FILE"."FILE_ID" IS '파일번호';

COMMENT ON COLUMN "BOARD_FILE"."FILE_PATH" IS '파일 경로명';

COMMENT ON COLUMN "BOARD_FILE"."FILE_ORIGINAL_NAME" IS '파일 오리지날 명';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_ID"
);

ALTER TABLE "EDU_LIST" ADD CONSTRAINT "PK_EDU_LIST" PRIMARY KEY (
	"EDU_ID"
);

ALTER TABLE "BOARD_COMMUNITY" ADD CONSTRAINT "PK_BOARD_COMMUNITY" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "EDU_BOOK" ADD CONSTRAINT "PK_EDU_BOOK" PRIMARY KEY (
	"EDU_BOOK_ID",
	"EDU_ID"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "PK_BOARD_REPLY" PRIMARY KEY (
	"B_REPLY_ID"
);

ALTER TABLE "MEMBER_GRADE" ADD CONSTRAINT "PK_MEMBER_GRADE" PRIMARY KEY (
	"MEMBER_ADMIN"
);

ALTER TABLE "BOARD_FILE" ADD CONSTRAINT "PK_BOARD_FILE" PRIMARY KEY (
	"B_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_MEMBER_GRADE_TO_MEMBER_1" FOREIGN KEY (
	"MEMBER_ADMIN"
)
REFERENCES "MEMBER_GRADE" (
	"MEMBER_ADMIN"
);

ALTER TABLE "BOARD_COMMUNITY" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_COMMUNITY_1" FOREIGN KEY (
	"BOARD_WRITER"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
);

ALTER TABLE "BOARD_COMMUNITY" ADD CONSTRAINT "FK_MEMBER_GRADE_TO_BOARD_COMMUNITY_1" FOREIGN KEY (
	"MEMBER_ADMIN"
)
REFERENCES "MEMBER_GRADE" (
	"MEMBER_ADMIN"
);

ALTER TABLE "EDU_BOOK" ADD CONSTRAINT "FK_MEMBER_TO_EDU_BOOK_1" FOREIGN KEY (
	"EDU_BOOK_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
);

ALTER TABLE "EDU_BOOK" ADD CONSTRAINT "FK_EDU_LIST_TO_EDU_BOOK_1" FOREIGN KEY (
	"EDU_ID"
)
REFERENCES "EDU_LIST" (
	"EDU_ID"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "FK_BOARD_COMMUNITY_TO_BOARD_REPLY_1" FOREIGN KEY (
	"B_REPLY_NO"
)
REFERENCES "BOARD_COMMUNITY" (
	"BOARD_NO"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_REPLY_1" FOREIGN KEY (
	"B_REPLY_WRITER"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "FK_MEMBER_GRADE_TO_BOARD_REPLY_1" FOREIGN KEY (
	"MEMBER_ADMIN"
)
REFERENCES "MEMBER_GRADE" (
	"MEMBER_ADMIN"
);

ALTER TABLE "BOARD_FILE" ADD CONSTRAINT "FK_BOARD_COMMUNITY_TO_BOARD_FILE_1" FOREIGN KEY (
	"B_NO"
)
REFERENCES "BOARD_COMMUNITY" (
	"BOARD_NO"
);
