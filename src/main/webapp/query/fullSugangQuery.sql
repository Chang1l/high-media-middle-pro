--------------------------------------------------------
--  파일이 생성됨 - 수요일-9월-28-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ALLREVIEW
--------------------------------------------------------

  CREATE TABLE "TEST"."ALLREVIEW" 
   (	"REVIEW_NAME" VARCHAR2(100 BYTE), 
	"REVIEW_JOB" VARCHAR2(100 BYTE), 
	"REVIEW_CONTENTS" VARCHAR2(1000 BYTE), 
	"M_ID" VARCHAR2(100 BYTE), 
	"ALL_REVIEW_ID" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "TEST"."BOARD" 
   (	"B_NO" NUMBER, 
	"M_ID" VARCHAR2(20 BYTE), 
	"B_SUBJECT" VARCHAR2(500 BYTE), 
	"B_CONTENT" VARCHAR2(2000 BYTE), 
	"B_FILE" VARCHAR2(50 BYTE), 
	"B_READCOUNT" NUMBER DEFAULT 0, 
	"B_DATE" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COURSE
--------------------------------------------------------

  CREATE TABLE "TEST"."COURSE" 
   (	"C_NO" NUMBER, 
	"C_TITLE" VARCHAR2(1000 BYTE), 
	"P_NAME" VARCHAR2(20 BYTE), 
	"C_DATE" TIMESTAMP (6), 
	"C_VOL" NUMBER, 
	"C_CONTENT" VARCHAR2(3000 BYTE), 
	"C_IMG" VARCHAR2(20 BYTE), 
	"C_RESDATE" TIMESTAMP (6), 
	"C_RESALTDATE" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PROFESSOR
--------------------------------------------------------

  CREATE TABLE "TEST"."PROFESSOR" 
   (	"P_ID" NUMBER(6,0), 
	"P_NAME" VARCHAR2(20 BYTE), 
	"P_RECORD1" VARCHAR2(200 BYTE), 
	"P_RECORD2" VARCHAR2(200 BYTE), 
	"P_RECORD3" VARCHAR2(200 BYTE), 
	"P_IMG" VARCHAR2(60 BYTE), 
	"P_WORD" VARCHAR2(150 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REGIST
--------------------------------------------------------

  CREATE TABLE "TEST"."REGIST" 
   (	"G_NO" NUMBER, 
	"C_NO" NUMBER, 
	"M_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REPLY
--------------------------------------------------------

  CREATE TABLE "TEST"."REPLY" 
   (	"R_NO" NUMBER, 
	"M_ID" VARCHAR2(20 BYTE), 
	"R_COMMENT" VARCHAR2(2000 BYTE), 
	"B_NO" NUMBER, 
	"R_DATE" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "TEST"."REVIEW" 
   (	"REVIEW_NAME" VARCHAR2(100 BYTE), 
	"REVIEW_JOB" VARCHAR2(100 BYTE), 
	"REVIEW_CONTENTS" VARCHAR2(2000 BYTE), 
	"REVIEW_ID" NUMBER(10,0), 
	"REVIEW_COUNT" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TEST.ALLREVIEW
SET DEFINE OFF;
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('김채윤','자영업','이 가격에도 훌륭한 강의가 있을 수 있구나.. 그리고 김사라 선생님의 진심어린 강의와 차분한 목소리~ 중요한 포인트를 집어가며 해주신 강의가 저에게 매우 도움이 되었습니다. 감사합니다.','testtest',1);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('박서우','대학생','어떻게 공부해야 할까 방법이 궁금했는데.. 명확한 답을 주셔서 감사합니다. 내가 준비해야 되는 것 잘 기억하겠습니다.','parkswoo',3);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('백혜연','주부','초보를 위한 강의이기에 이해하는 것이 필수이겠지만 실제로 제가 따라해 볼 수 있는 예제들이 있어 좋았습니다. 무언가 아쉬운 마음이 드는 것은 어쩔 수 없네요.','heyun0809',4);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('고현영','대학생','지난번 무료 기초강의 듣고 너무 좋아서 신청했는데, 일정 때문에 오늘에서야 들엇어요. 가격 몇십배의 내용이 담겨 있는 강의네요. 다른 학원 기웃거리지 않고 이 학원에서 집중하고 따라가야겠어요. 진심을 담은 강의 정말 감사합니다!!','lovelygo',5);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('권지하','취업준비생','가격 이상의 가치를 하는 강의였습니다. 제가 막연히 고민하던 것들을 어떻게 실행해야 할지 가닥을 잡을 수 있었어요.','downloadman',6);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('심진환','회사원','개발자를 하려고 마음 먹었다면 정말 도움이 되는 강의일 것 같아요. 제가 별 생각 없이 수강 신청했다가 이왕 하는거 제대로 해봐야겠다는 생각이 드네요. 도움 감사합니다.','iamironman',7);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('권규일','회사원','실직적인 내용이 가득찬 강의였어요 감사합니다 ^^','atom0529',8);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('류광혁','대학생','초보 입장에서 차근 차근 자세한 설명 감사합니다.','div_is_not',9);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('김상희','회사원','미라 교수님~~♥♥ 대에박!!!! 강의며 내용이며 질은 두말하면 입아프고~~ 열띈 피드백도 또 놀라웠는데~~~ >.< 넘넘넘 감사드려요~~~~*^^* 감동에 또 감동! 감탄에 감탄!한 마케팅 강의였습니다.','jsp_wondergirls',10);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('이병철','공시생','마이크 고슬링 교수님 인간미부터 만점입니다. 앞으로도 잘 부탁합니다.','lms060307',11);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('이남준','자영업','저 스스로에게 적용하려니 어렵네요. 비유하자면 나는 부페에 앉은 비둘기 그 자체;','pitter_lee',12);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('박철정','회사원','늦은 시간까지 질의응답해주심과 강의 모두 감동이었습니다. 강의 내용은 너무 좋았으나 듣는 제가 따라가지 못하는 부분이 있었어요. 반복에 반복을 통해 제 것으로 만들어보겠슴니다.','hello_kitti_07',13);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('손성원','교사','귀에 쏙 들어오는 깔끔한 강의였습니다.','strong_son_1013',14);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('전인혜','웹 디자이너','진심을 다해서 강의해주시고 관리해주시는 모습이 좋았습니다.','iam_inhey',15);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('신민훈','취업준비생','프로그래밍의 프자도 모르는 저에게 기초를 다지는 강의 감사합니다.','free_bird03',16);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('심영기','유치원 교사','잘 봤어요. 감사합니다.','thisissparta',17);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('남병일','취업준비생','많은 분들이 아실거에요. 정말 대단하고 빛나는 강의입니다.','south03',18);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('이상호','프로게이머','다 아는 내용이었지만 그래두 들을 만 했어요.','sangholee',19);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('김일환','군인','체계적으로 잘 배웠습니다. 무엇보다 예제를 직접 따라해보며 많이 늘었어요.','hohoho_captain',20);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('김창식','자영업','피자집에 피자가 맛있지','ted_chang02',21);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('나샛별','학생','졸았어요','student_1114',22);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('박상철','개그지망생','구림;','iamironman',23);
Insert into TEST.ALLREVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,M_ID,ALL_REVIEW_ID) values ('송재환','취업준비생','친구한테 소개 받아서 들었는데 퀄리티가 역시 장난 아니었습니다. 많은 가르침 주신 교수님 감사합니다.','testtest',2);
REM INSERTING into TEST.BOARD
SET DEFINE OFF;
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (1,'admin','안녕하세요','반갑습니다',null,34,to_timestamp('22/09/06 09:34:55.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (2,'admin','네트워크','v 인터넷: 지역네트워크를 통신으로 연결한 것
v 네트워크란: 여러대 의 컴퓨터들을 통신회선으로 연결한 것. 그물망처럼 연결된 통신망을 말함.
',null,98,to_timestamp('22/09/07 09:49:47.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (3,'admin','반갑습니다','안
녕
하
세
요
',null,13,to_timestamp('22/09/08 10:06:56.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (4,'admin','HELLO WORLD','HI','boss.png',24,to_timestamp('22/09/08 10:13:31.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (5,'admin','누구나 이용 가능한가요?','누구나 이용 가능합니다',null,123,to_timestamp('22/09/09 10:59:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (6,'admin','강의 이용료 질문','무료입니다',null,80,to_timestamp('22/09/09 10:59:57.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (7,'admin','아이디 변경이 가능한가요?','아이디 변경은 불가능합니다',null,47,to_timestamp('22/09/10 11:02:27.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (8,'admin','회원탈퇴는 어디서 하나요?','회원탈퇴는 어디서 하나요?',null,35,to_timestamp('22/09/11 11:03:11.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (9,'admin',' 아이디, 비밀번호를 분실했어요!','로그인폼에서 찾으시면 됩니다',null,23,to_timestamp('22/09/11 11:03:37.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (10,'admin','회원정보 변경은 어디서 하나요?','로그인 후 계정 설정에서 하면 됩니다',null,90,to_timestamp('22/09/11 11:04:28.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (11,'admin','강의 담기 기능은 무엇인가요?','수강정보 페이지에 저장되어 바로 연결할 수 있도록 하는 기능 입니다',null,47,to_timestamp('22/09/13 11:04:43.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (12,'admin','마이페이지는 어디에 있나요?','마이페이지는 어디에 있나요?',null,40,to_timestamp('22/09/13 11:08:43.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (13,'admin','조회수는 어디서 볼 수 있나요?','게시판 맨 오른쪽부분에 나옵니다',null,26,to_timestamp('22/09/14 11:09:17.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (14,'admin','비회원도 강의 들을 수 있나요?','회원만 가능합니다',null,32,to_timestamp('22/09/14 11:12:26.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (15,'admin','작성한 댓글을 삭제할 수 있나요?','삭제 가능하고 부적절한 글 발견 시 삭제 조치 될 수 있습니다.',null,37,to_timestamp('22/09/15 11:13:05.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (16,'admin','삭제된 글/댓글을 복구할 수 있나요?','삭제된 글/댓글을 복구는 불가능 합니다',null,60,to_timestamp('22/09/15 11:13:15.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (17,'admin','게시판에 글을 올리고 싶어요.','로그인 후 게시판 글쓰기 버튼 클릭하시면 가능합니다',null,4,to_timestamp('22/09/15 11:13:27.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (18,'admin','게시판은 어떤 공간인가요?','자유로운 커뮤니티 공간입니다',null,5,to_timestamp('22/09/15 11:13:42.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (19,'admin','학원 위치가 어디인가요?','메인 화면 맨 아래쪽에 나와있습니다.',null,3,to_timestamp('22/09/15 11:15:38.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (20,'tnwjddl','수강정보 페이지는 무엇인가요?','담은 강의 목록을 볼 수 있는 페이지입니다',null,45,to_timestamp('22/09/15 11:16:55.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (21,'qudghksdl','같은 강의를 여러 번 담을 수 있나요?','한번만 가능합니다.',null,54,to_timestamp('22/09/15 11:17:44.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (22,'dydfkrdl','교수님 정보는 어디서 보나요?','상단 왼쪽탭에 교수님 목록에서 클릭하시면 볼 수 있습니다',null,37,to_timestamp('22/09/15 11:18:20.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (23,'woduddl','수강후기는 어떻게 활용되나요?','수강후기는 어떻게 활용되나요?',null,41,to_timestamp('22/09/15 11:18:52.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (24,'dydwnek','너무 좋은강의 입니다','옛날에 잠시 배운 웹 공부인데 안드로이드에서도 udf가 점점 도입되고 있어서 다시 들으러 왔네요 너무 명 강의라 참고하기 너무 좋습니다 감사합니다',null,35,to_timestamp('22/09/15 11:29:40.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (25,'duddlfdl','오!!!','스크립트 셋업내부에서 코딩하는게 낫겠어요~ 진짜 코드 깔끔하네요! 아주 유용한 팁 감사해요!',null,35,to_timestamp('22/09/16 11:30:05.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (26,'ckdgksdl','윈도우에서 New file 단축키','저도 궁금해서 찾아봤는데 Alt + Insert입니다',null,58,to_timestamp('22/09/16 11:30:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (27,'tnwjddl','감사합니다 강사님','JWT에 대해서 어떠한 인증 로직을 타지도 모르는 채 그냥 기능이 구현되어 있는 코드만 갖다가 쓰다가 이제는 어떠한 로직을 타는지 큰 그림이 잡혔습니다!

앞으로 복습은 더 해야겠지만 잘 활용해서 쓰겠습니다 :)',null,69,to_timestamp('22/09/17 11:30:45.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (28,'eotnek','그냥 궁금해서 물어봅니다','Java, Spring, DB 구조등를 알고 있으면 게시글을 작성하는 홈페이지를 제작할수 있을까여?',null,78,to_timestamp('22/09/17 11:31:16.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (29,'tmdgusdl','강의 자료 업데이트 좀 해주세요','지금 강의에서 보이는 DB, User, Table 생성 등 ptt 강의 자료들이 하나도 안보입니다.

확인 후 업데이트 좀 부탁드리겠습니다 강사님!',null,45,to_timestamp('22/09/18 11:31:40.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (30,'eotnek','이전 강의 안들으신분들','"DRF Example 따라하기"의 "가상환경만들기"를 먼저보고

Pillow설치

한 다음에 실행해보시면서 따라가시면 될 것 같습니다.

저는 이전 강의를 안들어서 좀 당황했네요.',null,25,to_timestamp('22/09/18 11:34:13.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (31,'ckdgksdl','시큐리티 후속편 제작중인가요?','시큐리티 강의를 듣고있습니다.

제작하고 있으신 후속 강의는 지금 듣고 있는 강의 다 듣고 이어

서 들으면 되는가요?

혹시 언제쯤 개강하는지 대략적으로라도 알 수 있을까요?',null,25,to_timestamp('22/09/18 11:36:14.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (32,'tmdgusdl','테스트','테스트',null,35,to_timestamp('22/09/18 11:36:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (33,'tnwjddl','감동이네요','이번 강의도 감동입니다

_each 오,, 이렇게 바꾸니

읽기도 쉽고 성능도 이전 코드에 비해
크게 문제 될건 없고 예외처리도 되고 

와닿네요 

감사합니다',null,81,to_timestamp('22/09/19 11:36:43.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (34,'ckdgksdl','강의 생각보다 많이 있네요','이런곳이 있는줄은 꿈에도 몰랐네요

다들 가봅시다 !',null,65,to_timestamp('22/09/19 11:57:37.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (35,'gkrtjddl','1회차 시작해봅니다..!!','완강까지 열심히 듣고오겠습니다!',null,45,to_timestamp('22/09/19 11:57:57.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (36,'dmsdnek','가보자가보자','완강까지 파이팅',null,32,to_timestamp('22/09/20 11:58:10.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (37,'ckdgksdl','강의 너무 이해가 잘되네요 !!','강의 듣고 안보고 치는데 한번에 이해되서 술술 쳐지네요',null,45,to_timestamp('22/09/21 11:58:22.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (38,'dmsgmlek','안녕하세요','그냥 한번 적어 보고있습니다.',null,12,to_timestamp('22/09/21 11:58:33.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (39,'gusqhrdl','오타가 너무 무섭네요','dispatch 를 disptch 로 해놓고 딴거 보면서 왜 이런거지 빡쳐하다가 오타인걸 겨우 발견해서 겨우 고치네요 ㅠㅠㅠ 

왠만하면 제 손 말고 복붙을 믿어야 겠어요 ㅠㅠㅠㅠㅠ 

오류나면 오타난지 먼저 확인해보세요',null,1,to_timestamp('22/09/21 11:59:36.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (40,'bbbbbbbb','오늘부터시작!','유튜브로 js 기초강의 다 듣고 오늘부터 공부시작해요! 



얼른 재밌게 공부하고 빨리 취업하고 싶네요 ㅎㅎ 화이팅입니다.!!',null,36,to_timestamp('22/09/22 12:00:04.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (41,'tnwjddl','가입을 했으니','무엇부터 들어볼까 손가락이 드릉드릉하구먼',null,45,to_timestamp('22/09/22 12:00:53.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (42,'bbbbbbbb','느낌표살인마네','ㄹㅇㅋㅋ',null,28,to_timestamp('22/09/22 12:01:12.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (43,'gusqhrdl','웹개발 진로에 대하여','안녕하세요.  우선 영한님 강의 정말 잘 듣고 있습니다. ㅎㅎ 그런데 제가 웹 백엔드라는 분야를 처음 시작하여

영한님의 입문 무료강의를 듣고 현재 스프링 핵심 원리 -기본편을 완강한 상태인데 제 주변 사람들은 저보다 먼저 웹 개발을 시작하여서 이미 개발을 잘 해서 프로젝트도 같이 하고 재밌게 개발 이야기를 하는데 저는 이제 입문하는 레벨이라 어떻게 해야할지 

잘 모르겠습니다. 어떻게 하면 저 같은 사람들이 빠르게 성장할 수 있을까요? 강의에서 말씀하신대로 야생형으로 바로 JPA 활용 1강을 듣는게 가장 효율적인가요? 영한님은 이런 상황이라면 어떻게 하셨나여 ㅠㅠ ',null,18,to_timestamp('22/09/22 12:01:25.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (44,'qudghksdl','명강입니다!','안녕하세요. 황경훈님, 공식 서포터즈 OMG입니다.

영한님 강의로 많은 것을 배워가셨으면 좋겠습니다:)',null,35,to_timestamp('22/09/22 12:01:36.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (45,'dmsgmlek','실습 내용이 정말 알차네요!','어떻게 하는지 궁금했던 부분을 다뤄주셨어요',null,12,to_timestamp('22/09/22 12:01:48.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (46,'ehddnjsdl','재미있네요...','덕분에 웃으면서 공부했습니다 :)',null,15,to_timestamp('22/09/22 12:02:19.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (47,'dmsdnek','강의를 들으면 들을수록...','아직 갈길이 멀었네요... 

화이팅해서 공부하겠습니다.',null,25,to_timestamp('22/09/22 12:02:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (48,'qudghksdl','방금가입했어요','방금 가입했어요 소통하러왓습니다.

노트북으로 강의 둘러볼려고하는데 설레이네요',null,15,to_timestamp('22/09/22 12:02:48.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (49,'aaaaaaaa','강좌 잘 보고 있습니다!','다음 강좌도 기다리고 있습니다. 혹시 다음 강좌도 준비 중이신가요? 중급 강좌 찾기가 어렵네요 ',null,25,to_timestamp('22/09/23 12:03:01.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (50,'dmsgmlek','test-나의 게시글일때','음 이런 느낌이구나!',null,38,to_timestamp('22/09/24 12:03:19.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (51,'aaaaaaaa','솔직히...','솔직히... 이거 미리 공부해도 못풀겟네요... ',null,78,to_timestamp('22/09/25 12:03:54.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (52,'dmsdnek','신입 프론트엔드 초봉','신입 프론트엔드 초봉은 어느 정도가 평균일까요?',null,45,to_timestamp('22/09/25 12:04:34.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (53,'dmsgmlek','hello world ㅋㅋㅋㅋ','강의 너무 재밌어요',null,12,to_timestamp('22/09/25 12:04:45.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (54,'ehddnjsdl','잡담이긴한데...','선생님께서 쓰시는 키보드가 궁금하네요..

메멘토 패턴에서 단축키 얘기를 하니까 

키보드 소리가 너무 좋아서 사고 싶네요...',null,35,to_timestamp('22/09/25 12:05:17.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (55,'dmsdnek','휘뚜루마뚜루','슉수수수수슉',null,8,to_timestamp('22/09/25 12:05:28.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (56,'dmsgmlek','강사님 정말 인간적이시네요','편집이라도 하시지ㅠㅠㅋㅋㅋ',null,32,to_timestamp('22/09/25 12:05:39.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (57,'gkrtjddl','html','어렵네여..',null,12,to_timestamp('22/09/25 12:05:59.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (58,'eotnek','개념정리','개념정리 어디에?',null,32,to_timestamp('22/09/25 12:06:10.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (59,'tnguddl','리엑트','으앗... 리엑트에서 죽을맛입니다... 
Javascript, html, css까지 다 훓고 기본적인 리엑트 공부하고 다시 시청하렵니다 ㅎㅎ
좋은 공부 스택 있으면 공유해요!',null,12,to_timestamp('22/09/25 12:06:28.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (60,'eotnek','좋은설명 잘 봤어요.','설명 잘 봤습니다. ',null,32,to_timestamp('22/09/25 12:06:43.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (61,'whdgnsdl','결국이해했습니다..','하나하나 변수마다 뭘 의미하는지 함수는 어떻게 작동하는지 다 풀어서 원리구조를 이해하는데 4시간 걸렸습니다.. ',null,12,to_timestamp('22/09/25 12:07:14.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (62,'tnguddl','마우스 추천 좀','혹시 쓰시는 마우스 중에 괜찮으면 장점이랑 같이 써주실수 있나요?',null,45,to_timestamp('22/09/25 12:08:03.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (63,'whdgnsdl','블로그에 강의 내용 올려도 될까요?','우선 양질의 강의 정말 감사합니다!!!! 너무 잘 듣고 있고 많이 배우고 있어요.
강의를 듣고 머리로만 이해하고 있기에는 어려운 내용이 많아, 정리해서 개인 블로그에 올리려고 하는데 괜찮을까요??
출처는 이 강의 대쉬보드로 밝히도록 하겠습니다!',null,1,to_timestamp('22/09/25 12:08:50.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (64,'tnguddl','오늘 저녁 뭐먹죠?','다이어트나 해야....',null,2,to_timestamp('22/09/25 12:09:10.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (65,'qudghksdl','제가 공부를 너무 안한건가요','따라하면서 하고있는데 하나도 이해가 안가네요..ㅠ
다른분들은 어떻게 이렇게 질문 하나도없이 쭉쭉 나가시는지 모르겠어요.
다시 문법 공부부터 시작해야하는 건가요?아니면 그냥 계속 들어도 되나요',null,12,to_timestamp('22/09/25 12:09:48.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (66,'hot_jjang','이소정 교수님께 딥러닝 기술 4강 질문','4강이 너무 어려워요;',null,3,to_timestamp('22/09/25 09:34:55.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (67,'ted_chang02','자유 게시판인가요?','아무 말이나 써도 됨?',null,2,to_timestamp('22/09/25 10:51:50.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (68,'hohoho_captain','안녕하세요~','냉무',null,35,to_timestamp('22/09/25 11:37:05.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (69,'sangholee','출첵합니당','교수님 정말 친절하시고 유쾌하셔서 수월하게 공부합니다.',null,12,to_timestamp('22/09/25 12:11:14.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (70,'sangholee','고슬링 교수님','한국말 너무 잘함;',null,4,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (71,'south03','이 강의 듣고 취업할 수 있을까요?','이 강의 듣고 취업할 수 있겠죠?',null,7,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (72,'thisissparta','마이크 고슬링 교수님 강의를 듣다가 궁금한 점','어느 나라 사람?',null,3,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (73,'free_bird03','친절한 상담 친절한 교육','박창면 교수님 칭찬합니다.',null,35,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (74,'free_bird03','정보처리기사 따려면 뭐뭐 들어야 해요?','알려주세영',null,12,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (75,'iam_inhey','학원비는 어디서 보나요','냉무',null,8,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (76,'atom0529','자바 넘 어려움..','도와주실분..',null,32,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (77,'heyun0809','엔지니어 실무 들을만 한가요?','들을만 하냐고요',null,3,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (78,'parkswoo','공감','버튼 좀 만들어주세요',null,1,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (79,'lovelygo','밥 같이 먹을 사람','있나여',null,12,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (80,'div_is_not','안양 사는 친구 구해요','같이 밥 먹게;',null,24,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (81,'lms060307','애플펜슬 놓고가신분','이젠 제겁니다',null,25,to_timestamp('22/09/25 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (82,'hello_kitti_07','개발자 vs 서비스기획자 직업선택 고민중','인생일대의 선택',null,2,to_timestamp('22/09/28 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (83,'hello_kitti_07','데이터 접근 핵심 원리는 도대체','무엇일까요',null,5,to_timestamp('22/09/28 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (84,'thisissparta','hey mr. Go Sl Ring ~~','how are you?',null,4,to_timestamp('22/09/28 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (85,'div_is_not','유니티 기초편 들을만 한가요?','들을만 하냐고;',null,1,to_timestamp('22/09/26 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (86,'pitter_lee','컴활 따고 싶은데 엑셀 강의는 없을까요.','만들어주세요',null,3,to_timestamp('22/09/26 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (87,'atom0529','MS Azuer 클라우드 서비스 구축 강의요','얼마에요',null,2,to_timestamp('22/09/26 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (88,'atom0529','나는 할수있다','vs 없다',null,111,to_timestamp('22/09/26 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (89,'jsp_wondergirls','강의 환불신청','합니다',null,7,to_timestamp('22/09/26 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (90,'hello_kitti_07','hello world!','hello world!',null,4,to_timestamp('22/09/26 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (91,'hello_kitti_07','피자 맛있는곳 추천좀//','냉면 말구여',null,56,to_timestamp('22/09/26 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (92,'pitter_lee','파이썬 vs 자바 뭐부터 배울까요?','대답 하세요',null,1,to_timestamp('22/09/26 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (93,'hohoho_captain','CNN 완벽가이드 영어 잘 해야 되나여','아닌가?',null,1,to_timestamp('22/09/26 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (94,'pitter_lee','해킹 잘하고 싶은데..','어디서 배우나여',null,3,to_timestamp('22/09/26 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (95,'iamironman0923','강의 듣기가 안돼요….','환불해주세요',null,45,to_timestamp('22/09/27 03:15:30.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (96,'tnguddl','왜 이렇게 작성하는건지 이해가 안되는데','따라치면서 왜 이렇게 해야되는건지 이해가 안되는데 어떻게 해야되나요?



자바 문법은 이해가 됩니다만.. 왜 이렇게 만드는건지 이해가 안돼요.',null,4,to_timestamp('22/09/27 12:13:51.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (97,'ehddnjsdl','소규모 프로젝트 추천.','안녕하세요 강의잘듣고있습니다.



현재 오프라인 교육과정에 참여중인데, 부족한부분을 강의로 메꾸면서 학습하는중입니다.



다름이 아니라, 2주후에 소규모 팀프로젝트를 진행해야하는데,



주제를 정해야합니다. 주제를 아래 4가지중 정해서 선택해야하는데, 스프링학습에 가장 도움될만한 프로젝트가 무엇일지... 궁금합니다.

한번도 프로젝트를 진행해본적없어서... 질문드려봅니다.

참고로 4인팀, 하루 약8~9시간, 한달 진행입니다.

1. SNS채팅프로그램
2. 협업도구 (trello, 깃SNS)
3. 온라인코딩테스트
4. 쇼핑몰솔루션',null,35,to_timestamp('22/09/28 12:14:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (98,'qudghksdl','내 머리로는','생각할 수 없는 공식이다ㅠㅠ',null,45,to_timestamp('22/09/28 12:14:11.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (99,'woduddl','강사님의.. 휴먼한 부분을 볼 수 있어서 좋네요..ㅎㅎ','ㅎㅎ,,',null,4,to_timestamp('22/09/28 12:14:24.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (100,'gkrtjddl','잼이있네요.','이펙티브 C++하고 STL 책 읽고와야 여기 기초 개념들을 이해하겠네요.

ㅎㅎㅎ 그거 안 읽고 오시는 분들은 낭패 볼 듯~',null,25,to_timestamp('22/09/28 12:14:42.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.BOARD (B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT,B_DATE) values (101,'dmsdnek','추천드립니다!!','고민하시는분은..

무조건 들어보세요!!!',null,1,to_timestamp('22/09/28 12:14:56.000000000','RR/MM/DD HH24:MI:SSXFF'));
REM INSERTING into TEST.COURSE
SET DEFINE OFF;
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1001,'해커를 위한 iOS 앱 모의 해킹 전문 과정','김사라',to_timestamp('22/10/05 00:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),96,'모의해킹 실무에서 iOS 모바일 앱 모의해킹은 이제 필수입니다! iOS 앱 진단을 처음 접하는 분들을 위한 기초 강의입니다. 진단에 필요한 기초적인 선수지식부터 모의해킹 업무에서 다루는 실무 중심 실습으로 구성하였습니다.','1001.jpg',to_timestamp('22/10/01 00:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1002,'버그헌팅과 시나리오 모의해킹 전문가 되기','김사라',to_timestamp('22/10/05 00:00:01.000000000','RR/MM/DD HH24:MI:SSXFF'),85,'버그헌팅(버그바운티)와 모의해킹 업무를 준비하는 분들을 위한 기본 강의입니다. 모의해킹 업무에 필수는 웹 해킹입니다. 웹 해킹을 배우시고 난 후에는 시나리오 기반으로 공부할 수 있는 가상 웹/서버 환경을 이용하여 웹 해킹을 시작으로 시스템 해킹까지 여러 사례를 학습할 수 있도록 가이드 해줍니다.','1002.jpg',to_timestamp('22/10/01 00:00:01.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1003,'AWS 클라우드 서비스 인프라 구축 이해와 해킹, 보안','박창명',to_timestamp('22/10/05 00:00:02.000000000','RR/MM/DD HH24:MI:SSXFF'),72,'IT 서비스가 클라우드 환경으로 빠르게 전환되고 있습니다. 아마존 AWS 클라우드 환경 보안을 위해 알아야 할 기본적인 가상 인프라 구축부터, 각 영역별 보안 위협 모니터링, 취약점 진단 관점을 통해 보안 실무를 배우게 됩니다.','1003.jpg',to_timestamp('22/10/01 00:00:02.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1004,'기초부터 따라하는 디지털포렌식','김미라',to_timestamp('22/10/10 00:00:03.000000000','RR/MM/DD HH24:MI:SSXFF'),94,'기초부터 따라하는 디지털포렌식 강의입니다. 강의를 따라하다보면 "물 흐르듯, 자연스럽게" 실력이 늘어가는 강의를 추구합니다.','1004.jpg',to_timestamp('22/10/07 00:00:03.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1005,'웹 개발자와 정보보안 입문자가 꼭 알아야 할 웹 해킹 & 시큐어 코딩','김사라',to_timestamp('22/10/10 00:00:04.000000000','RR/MM/DD HH24:MI:SSXFF'),78,'정보보안 입문자와 웹 개발자 분들을 위한 웹 해킹 입문 강의! 본 강의를 시작으로 웹 해킹을 재미있게 시작해보세요!','1005.jpg',to_timestamp('22/10/07 00:00:04.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1006,'모의해킹 실무자가 알려주는, 파일 다운로드 취약점 공격 기법과 실무 사례 분석','박창명',to_timestamp('22/10/10 00:00:05.000000000','RR/MM/DD HH24:MI:SSXFF'),65,'웹 해킹 입문자에서부터 실무자까지 쉽게 따라 할 수 있는 파일 다운로드 취약점 공격 기법! 실무에서 사용되는 파일 다운로드 취약점 공격 기법과 심화 공격 기법! 그리고 시큐어 코딩 적용 방법!','1006.jpg',to_timestamp('22/10/07 00:00:05.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1007,'스프링 시큐리티','소찬이',to_timestamp('22/10/17 00:00:06.000000000','RR/MM/DD HH24:MI:SSXFF'),81,'스프링 시큐리티 구동 원리 및 구조를 이해하고 스프링 시큐리티가 제공하는 다양한 기능을 활용하여 웹 애플리케이션에 필요한 인증 및 인가 기능을 설정하는 방법을 살펴봅니다.','1007.jpg',to_timestamp('22/10/01 00:00:06.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1008,'MS Azure 애저 클라우드 서비스 구축 이해와 보안','박창명',to_timestamp('22/10/17 00:00:07.000000000','RR/MM/DD HH24:MI:SSXFF'),57,'IT 서비스가 클라우드 환경으로 빠르게 전환되고 있습니다. MS 애저 클라우드 환경 보안을 위해 알아야 할 기본적인 가상 인프라 구축부터, 각 영역별 서비스 운영, 모니터링 이해, 보안 영역까지 담았습니다.','1008.jpg',to_timestamp('22/10/01 00:00:07.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1009,'딥러닝 CNN 완벽 가이드 - Fundamental 편','윤창명',to_timestamp('22/10/17 00:00:08.000000000','RR/MM/DD HH24:MI:SSXFF'),77,'딥러닝·CNN 핵심 이론부터 다양한 CNN 모델 구현 방법, 실전 문제를 통한 실무 딥러닝 개발 노하우까지, 딥러닝 CNN 기술 전문가로 거듭나고 싶다면 이 강의와 함께하세요 :)','1009.jpg',to_timestamp('22/10/01 00:00:08.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1010,'유니티 머신러닝 에이전트 완전정복 (기초편)','홍길동',to_timestamp('22/10/24 00:00:09.000000000','RR/MM/DD HH24:MI:SSXFF'),92,'이 강의를 통해 수강생은 다양한 강화학습의 이론을 학습하고 이를 직접 구현해 볼 뿐만 아니라 유니티 머신러닝 에이전트를 이용하여 구현한 강화학습 알고리즘을 테스트해볼 강화학습 환경까지 직접 제작해볼 수 있습니다.','1010.jpg',to_timestamp('22/10/14 00:00:22.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1011,'설계독학맛비''s 실전 AI HW 설계를 위한 바이블, CNN 연산 완전정복 (Verilog HDL + FPGA 를 이용한 가속기 실습)','김미라',to_timestamp('22/10/24 00:00:10.000000000','RR/MM/DD HH24:MI:SSXFF'),68,'맛비와 함께 AI 하드웨어의 기본을 공부합니다. 비메모리 설계 전문가로서 좋은 AI HW를 설계하기 위한 필수 지식을 담았습니다.','1011.jpg',to_timestamp('22/10/14 00:00:22.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1012,'실전 인공지능으로 이어지는 딥러닝 개념 잡기','윤창명',to_timestamp('22/10/24 00:00:11.000000000','RR/MM/DD HH24:MI:SSXFF'),97,'다양한 인공 신경망의 구조와 동작 원리를 이해하고 좋은 모델을 만드는데 필요한 필수 지식을 전달하는 강의입니다.','1012.jpg',to_timestamp('22/10/14 00:00:22.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1013,'파이썬을 활용한 머신러닝 딥러닝 입문','윤창명',to_timestamp('22/10/31 00:00:12.000000000','RR/MM/DD HH24:MI:SSXFF'),108,'전통적인 머신러닝과 딥러닝은 많은 부분에서 동일한 원리와 기술 체계에 기반하고 있습니다. 따라서 본 강의에서는 두 가지를 별도의 과목으로 분리하지 않고 하나의 연결된 과정으로 구성하여 입문자가 머신러닝 전반에 걸친 이해도를 높일 수 있도록 하였습니다.','1013.jpg',to_timestamp('22/10/14 00:00:22.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1014,'머신러닝 엔지니어 실무','홍길동',to_timestamp('22/10/31 00:00:13.000000000','RR/MM/DD HH24:MI:SSXFF'),83,'이 강의를 통해 머신러닝 프로젝트에서 겪게될 수 많은 시행착오를 줄일 수 있게 됩니다. 뤼이드의 머신러닝 파이프라인을 총책임지고 있는 제가 기본부터 잘 가르쳐드립니다.','1014.jpg',to_timestamp('22/10/14 00:00:22.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1015,'자바 머신러닝 weka(웨카) 중급','홍길동',to_timestamp('22/10/31 00:00:14.000000000','RR/MM/DD HH24:MI:SSXFF'),98,'자바 머신러닝 저변화를 위한 2번째 강좌 입니다. 설계/코딩 모두 구현가능 하도록 UI와 API 를 제공하는 Weka(웨카)를 소개합니다. 실무에 적용해도 전혀 손색이 없는 사례를 강의로 녹여냈습니다.','1015.jpg',to_timestamp('22/10/14 00:00:22.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1016,'최신 딥러닝 기술 Vision Transformer 개념부터 Pytorch 구현까지','이소정',to_timestamp('22/10/31 00:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),58,'딥러닝 최신 기술 중 하나인 Vision Transformer를 공부하고 Pytorch를 이용하여 논문을 구현하는 강의입니다. 비전 분야의 새로운 미래를 저와 함께 경험해 봐요!','1016.jpg',to_timestamp('22/10/14 00:00:22.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('22/09/26 12:23:55.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1017,'비전공자를 위한 풀스택 맛집지도 만들기 프로젝트!: Front, Back-end 그리고 배포까지','김미라',to_timestamp('22/10/07 00:00:16.000000000','RR/MM/DD HH24:MI:SSXFF'),71,'내가 좋아하는 유튜버의 맛집지도를 만들면서 프론트엔드, 백엔드, 카카오맵 API 사용법, 배포까지 한번에 배울 수 있는 풀스택 맛집지도 강의입니다.','1017.jpg',to_timestamp('22/10/01 00:00:16.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1018,'스프링 프레임워크는 내 손에[스프1탄]','이소정',to_timestamp('22/10/07 00:00:17.000000000','RR/MM/DD HH24:MI:SSXFF'),81,'[스프1탄] 에서는 스프링 프레임워크에서부터 스프링 보안까지 단계별 학습을 통해 웹 기반의 ERP 시스템을 구축하는 백엔드(Java Backend)개발 전문가를 만드는 과정입니다.','1018.jpg',to_timestamp('22/10/01 00:00:17.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1019,'파이썬/장고 웹서비스 개발 완벽 가이드 with 리액트','이박사',to_timestamp('22/10/07 00:00:18.000000000','RR/MM/DD HH24:MI:SSXFF'),157,'파이썬/장고 웹서비스 개발의 기초를 탄탄히 다져보세요. 리액트를 통해 최신 트렌드의 웹 프론트엔드를 경험해보세요. 파이썬만 아시면 시작하실 수 있습니다. 여러분의 상상을 현실로 만들어보세요.','1019.jpg',to_timestamp('22/10/01 00:00:18.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1020,'Do It! 장고+부트스트랩: 파이썬 웹개발의 정석','이박사',to_timestamp('22/10/14 00:00:19.000000000','RR/MM/DD HH24:MI:SSXFF'),102,'만들면서 배우는 파이썬 웹개발 A to Z! 웹 기초부터 블로그 개발, 배포까지 한 번에 배워요.','1020.jpg',to_timestamp('22/10/01 00:00:19.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1021,'비전공자를 위한 진짜 입문 올인원 개발 클래스','이소정',to_timestamp('22/10/14 00:00:20.000000000','RR/MM/DD HH24:MI:SSXFF'),118,'왕초보도 할 수 있는 웹, 서버, 모바일 앱, 머신러닝까지 익히는 끝판왕 풀스택 강의!! 개발을 어디서부터 시작할지 막막했다면 이 강의를 강력 추천할게요. Javascript 하나로 진행합니다!','1021.jpg',to_timestamp('22/10/01 00:00:20.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1022,'스프링 DB 2편 - 데이터 접근 활용 기술','소찬이',to_timestamp('22/10/14 00:00:21.000000000','RR/MM/DD HH24:MI:SSXFF'),88,'백엔드 개발에 필요한 DB 데이터 접근 기술을 활용하고, 완성할 수 있습니다. 스프링 DB 접근 기술의 원리와 구조를 이해하고, 더 깊이있는 백엔드 개발자로 성장할 수 있습니다.','1022.jpg',to_timestamp('22/10/01 00:00:21.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1023,'스프링 DB 1편 - 데이터 접근 핵심 원리','소찬이',to_timestamp('22/10/26 00:00:22.000000000','RR/MM/DD HH24:MI:SSXFF'),57,'백엔드 개발에 필요한 DB 데이터 접근 기술을 기초부터 이해하고, 완성할 수 있습니다. 스프링 DB 접근 기술의 원리와 구조를 이해하고, 더 깊이있는 백엔드 개발자로 성장할 수 있습니다.','1023.jpg',to_timestamp('22/10/14 00:00:22.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into TEST.COURSE (C_NO,C_TITLE,P_NAME,C_DATE,C_VOL,C_CONTENT,C_IMG,C_RESDATE,C_RESALTDATE) values (1024,'<M.B.I.T> 테스트 페이지 만들기! with Django','이박사',to_timestamp('22/10/26 00:00:23.000000000','RR/MM/DD HH24:MI:SSXFF'),40,'개발 유형을 테스트하는 웹 페이지를 만들어보세요! MBTI아닌 MBIT(My Best IT personalities)! ''MBIT 테스트 페이지''를 직접 만들어보며 웹 개발의 전반적인 프로세스를 익혀볼 수 있습니다. (Django 3.1 버전을 사용합니다.)','1024.jpg',to_timestamp('22/10/14 00:00:23.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
REM INSERTING into TEST.MEMBER
SET DEFINE OFF;
REM INSERTING into TEST.PROFESSOR
SET DEFINE OFF;
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (101,'김사라','한울 사이버 보안 고등학교 사이버가디언스 (오프라인) 교육','프리다(Frida)를 이용한 안드로이드 앱 모의해킹 저술','Daver Bug Bounty Program 2019 포상','ksr.jpg','다년간 모의해킹, 콘텐츠 개발, 저술 프로젝트 참여!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (102,'박창명','원올 주식회사 대표','디지털 포렌식의 세계 저술','여울디지털대학교 외래 교수','pcm.jpg','대기업/중소기업 200여곳 이상 보안컨설팅과 교육!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (100,'홍길동','前) 한국 오라클 근무','파이썬 머신러닝 완벽 가이드 저자','AI 프리랜서 컨설턴트','hgd.jpg','머신러닝, 고급 머신러닝, 딥러닝, 최적화 이론, 강화 학습 등의 인공지능 교육 최강자!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (201,'김미라','서울시 SSAC 라이징 프로그래머 서버파트 총괄','실시간 데이터처리 Windows 응용 프로그램 개발 외주 (Qt)','前) IT 스타트업 소프트스퀘어드 교육팀장','woou.jpg','웹, 서버, 데이터를 다루는 개발자!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (202,'윤창명','건국대 몰입형 프로그래밍 과정 강의 진행','네이버커넥트 부스트캠프 웹 백엔드(Node.js) 멘토','서울산업진흥원IT콘텐츠 파트너 (Full Stack)','ycm.jpg','누구나 재밌고 유익하게 배울 수 있는 개발 콘텐츠를 만들겠습니다!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (203,'소찬이','우아한형제들 기술이사 (전: 카카오, SK플래닛)','前) 카카오, SK플래닛 과장','자바 ORM 표준 JPA 프로그래밍 책 저자','scy.jpg','스프링 완전 정복!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (204,'이소정','클래스 101 백엔드 엔지니어','前) 지식공유 스타트업 ''원더풀램프'' 창업','前) 3D 디스플레이 스타트업 ''Tomorrance'' 창업','ysj.jpg','코딩을 포기했던 당신은 잘못이 없어요!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (205,'이박사','S사 데이터 엔지니어','前)Microsoft 개발자대회 Imagine Cup 한국 1등 선발','前)?그로스 컨설팅 팀 ''해킹그로스'' 엔지니어','lps.jpg','학습과 성장에 관심이 많은 개발자&크리에이터입니다!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (103,'이동식','KAC 정보통신 웹 개발자','멋진 형제들 Java & Spring 백엔드 개발자','뉴스랩 NodeJS 서버 개발자 & CTO','armin.jpg','자바 백엔드는 나에게 맡겨라!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (105,'한범수','前) 삼상데이터시스템 소프트 엔지니어','現) 삼상대학교 컴퓨터 공학과 교수',null,'mabe.jpg','컴퓨터 사이언스 기초 지식의 바이블!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (104,'마이크 고슬링','캘거리 대학교 물리학 학사','카네기 멜론 대학교 컴퓨터과학 석사, 박사','前) 문즈 마이크로 시스템즈 수석 소프트 엔지니어','teacher.jpg','자바 심층 분석은 나에게로!');
Insert into TEST.PROFESSOR (P_ID,P_NAME,P_RECORD1,P_RECORD2,P_RECORD3,P_IMG,P_WORD) values (206,'김해진','前) 삼상데이터시스템 소프트 엔지니어','前) 대형 포털 *이버 창립자들 중 1인','現) N그룹 상임이사','arnoud.jpg','검색과 추천 기능이라면 나를 따라올 자 없다!');
REM INSERTING into TEST.REGIST
SET DEFINE OFF;
REM INSERTING into TEST.REPLY
SET DEFINE OFF;
REM INSERTING into TEST.REVIEW
SET DEFINE OFF;
Insert into TEST.REVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,REVIEW_ID,REVIEW_COUNT) values ('김채윤','자영업','이 가격에도 훌륭한 강의가 있을 수 있구나.. 그리고 김사라 선생님의 진심어린 강의와 차분한 목소리~ 중요한 포인트를 집어가며 해주신 강의가 저에게 매우 도움이 되었습니다. 감사합니다.',1,null);
Insert into TEST.REVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,REVIEW_ID,REVIEW_COUNT) values ('고현영','대학생','지난번 무료 기초강의 듣고 너무 좋아서 신청했는데, 일정 때문에 오늘에서야 들엇어요. 가격 몇십배의 내용이 담겨 있는 강의네요. 다른 학원 기웃거리지 않고 이 학원에서 집중하고 따라가야겠어요. 진심을 담은 강의 정말 감사합니다!!',2,null);
Insert into TEST.REVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,REVIEW_ID,REVIEW_COUNT) values ('김상희','회사원','미라 교수님~~♥♥ 대에박!!!! 강의며 내용이며 질은 두말하면 입아프고~~ 열띈 피드백도 또 놀라웠는데~~~ >.< 넘넘넘 감사드려요~~~~*^^* 감동에 또 감동! 감탄에 감탄!한 마케팅 강의였습니다.',3,null);
Insert into TEST.REVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,REVIEW_ID,REVIEW_COUNT) values ('박철정','회사원','늦은 시간까지 질의응답해주심과 강의 모두 감동이었습니다. 강의 내용은 너무 좋았으나 듣는 제가 따라가지 못하는 부분이 있었어요. 반복에 반복을 통해 제 것으로 만들어보겠슴니다.',4,null);
Insert into TEST.REVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,REVIEW_ID,REVIEW_COUNT) values ('김일환','군인','체계적으로 잘 배웠습니다. 무엇보다 예제를 직접 따라해보며 많이 늘었어요.',5,null);
Insert into TEST.REVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,REVIEW_ID,REVIEW_COUNT) values ('이병철','공시생','마이크 고슬링 교수님 인간미부터 만점입니다. 앞으로도 잘 부탁합니다.',6,null);
Insert into TEST.REVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,REVIEW_ID,REVIEW_COUNT) values ('권지하','취업준비생','가격 이상의 가치를 하는 강의였습니다. 제가 막연히 고민하던 것들을 어떻게 실행해야 할지 가닥을 잡을 수 있었어요.',7,null);
Insert into TEST.REVIEW (REVIEW_NAME,REVIEW_JOB,REVIEW_CONTENTS,REVIEW_ID,REVIEW_COUNT) values ('박서우','대학생','어떻게 공부해야 할까 방법이 궁금했는데.. 명확한 답을 주셔서 감사합니다. 내가 준비해야 되는 것 잘 기억하겠습니다.',8,null);
--------------------------------------------------------
--  DDL for Index ALLREVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."ALLREVIEW_PK" ON "TEST"."ALLREVIEW" ("ALL_REVIEW_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007459
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."SYS_C007459" ON "TEST"."BOARD" ("B_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007529
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."SYS_C007529" ON "TEST"."COURSE" ("C_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007530
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."SYS_C007530" ON "TEST"."MEMBER" ("M_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007480
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."SYS_C007480" ON "TEST"."PROFESSOR" ("P_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007538
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."SYS_C007538" ON "TEST"."REGIST" ("G_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007539
--------------------------------------------------------

--------------------------------------------------------
--  DDL for Index SYS_C007602
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."SYS_C007602" ON "TEST"."REPLY" ("R_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table ALLREVIEW
--------------------------------------------------------

  ALTER TABLE "TEST"."ALLREVIEW" MODIFY ("ALL_REVIEW_ID" NOT NULL ENABLE);
  ALTER TABLE "TEST"."ALLREVIEW" ADD CONSTRAINT "ALLREVIEW_PK" PRIMARY KEY ("ALL_REVIEW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "TEST"."BOARD" MODIFY ("M_ID" NOT NULL ENABLE);
  ALTER TABLE "TEST"."BOARD" MODIFY ("B_SUBJECT" NOT NULL ENABLE);
  ALTER TABLE "TEST"."BOARD" MODIFY ("B_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "TEST"."BOARD" ADD CONSTRAINT "B_NO_PK" PRIMARY KEY ("B_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COURSE
--------------------------------------------------------

  ALTER TABLE "TEST"."COURSE" ADD CONSTRAINT "C_NO_PK" PRIMARY KEY ("C_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "TEST"."MEMBER" ADD CONSTRAINT "M_ID_PK" PRIMARY KEY ("M_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROFESSOR
--------------------------------------------------------

  ALTER TABLE "TEST"."PROFESSOR" ADD CONSTRAINT "P_ID_PK" PRIMARY KEY ("P_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST"."PROFESSOR" MODIFY ("P_IMG" NOT NULL ENABLE);
  ALTER TABLE "TEST"."PROFESSOR" MODIFY ("P_NAME" NOT NULL ENABLE);
  ALTER TABLE "TEST"."PROFESSOR" MODIFY ("P_RECORD1" NOT NULL ENABLE);
  ALTER TABLE "TEST"."PROFESSOR" MODIFY ("P_WORD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REGIST
--------------------------------------------------------

  ALTER TABLE "TEST"."REGIST" ADD CONSTRAINT "G_NO_PK" PRIMARY KEY ("G_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "TEST"."REPLY" ADD CONSTRAINT "R_NO_PK" PRIMARY KEY ("R_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST"."REPLY" MODIFY ("R_COMMENT" NOT NULL ENABLE);
  ALTER TABLE "TEST"."REPLY" MODIFY ("M_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "TEST"."REVIEW" MODIFY ("REVIEW_NAME" NOT NULL ENABLE);
  ALTER TABLE "TEST"."REVIEW" MODIFY ("REVIEW_JOB" NOT NULL ENABLE);
  ALTER TABLE "TEST"."REVIEW" MODIFY ("REVIEW_CONTENTS" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "TEST"."REPLY" ADD CONSTRAINT "B_NO_FK" FOREIGN KEY ("B_NO")
	  REFERENCES "TEST"."BOARD" ("B_NO") on delete cascade;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "TEST"."MEMBER" 
   (	"M_ID" VARCHAR2(20 BYTE), 
	"M_PW" VARCHAR2(20 BYTE), 
	"M_NAME" VARCHAR2(20 BYTE), 
	"M_ZIP" VARCHAR2(20 BYTE), 
	"M_ADDR" VARCHAR2(200 BYTE), 
	"M_TEL" VARCHAR2(20 BYTE), 
	"M_BIRTH" VARCHAR2(20 BYTE), 
	"M_EMAIL" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TEST.MEMBER
SET DEFINE OFF;
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('aaaaaaaa','aaaaaaaa','테스트','13959','경기 안양시 만안구 경수대로 995/123-1/ (안양동)','010-2535-1245','2004-01-10','dmsgml@google.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('dmsgmlek','dmsgml01!$!','안은희','13959','경기 안양시 만안구 경수대로 995/123-1/ (안양동)','010-2535-1245','2004-01-10','dmsgml@google.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('gusqhrdl','gusqhr0@','이현복','13958','경기 안양시 만안구 경수대로 1139/154-1/ (안양동)','010-6363-4325','1999-07-12','gusqhr2@kakao.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('tndlsdl','tndls2$!','지수인','13958','경기 안양시 만안구 경수대로 1141-5/102-403/ (안양동)','010-5435-2379','2006-03-17','tndlsdl3@naver.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('whdgnsdl','whdgns4$!','최종훈','13958','경기 안양시 만안구 경수대로 1141-6 (향림아파트)/103-1102/ (안양동)','010-5442-3542','2001-10-14','whdgnsk1@naver.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('woduddl','wodud9$!','장재영','13958','경기 안양시 만안구 경수대로 1159-4 (원유주택)/1-112/ (안양동)','010-9685-5324','2000-02-24','wowodud@google.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('dydfkrdl','dydfkr9!@','김용락','13996','경기 안양시 만안구 관악대로 5/134-13/ (안양동)','010-7646-4324','2007-11-03','dyddydfkr@kakao.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('ehddnjsdl','ehddnjs8$!','김동원','13996','경기 안양시 만안구 관악대로 7 (퍼스트힐3차)/203-113/ (안양동)','010-4363-3255','2006-07-01','ehdnjwl@naver.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('rmsghek','rmsgh8$!','최근호','13996','경기 안양시 만안구 관악대로 9-1/133-704/ (안양동)','010-3547-7754','1997-03-20','rmsghgh@google.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('dydwnek','dydwwn5$!','정용주','13996','경기 안양시 만안구 관악대로 11-1/301-406/ (안양동)','010-6573-3455','1986-06-02','dydwnqq@naver.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('duddlfdl','duddfld8$!','임영일','13995','경기 안양시 만안구 관악대로 39 (성원아파트)/123-1/ (안양동)','010-6343-8758','2002-05-50','duddlf83@naver.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('ckdgksdl','ckdgks4$2','윤창한','13996','경기 안양시 만안구 만안로 153-15 (대성파크뷰)/303-1004/ (안양동)','010-8975-3255','1985-01-09','ckdgks15@google.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('qudghksdl','qudghks24!!','엄병환','14022','경기 안양시 만안구 능곡로 15/23-1/ (안양동)','010-7457-5351','2003-05-30','qudghks3q@kakao.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('tnwjddl','tnwjddl30!','신수정','14005','경기 안양시 만안구 박달로 544-1/108-2009/ (안양동)','010-8568-2434','2007-02-22','tntnwjdwjd@google.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('eotnek','eotn387$!','김대수','14005','경기 안양시 만안구 박달로 550 (해든누리9차)/201-1409/ (안양동)','010-5789-8654','1996-09-26','eotndkeke@naver.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('tnguddl','tngu99d$!','이수형','14005','경기 안양시 만안구 박달로 552-2 (아림빌라)/111-103/ (안양동)','010-7483-5326','1986-03-29','tngud1515@naver.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('dlrahek','dlrahe8$!','이익모','13998','경기 안양시 만안구 냉천로 177/101-201/ (안양동)','010-9866-2236','1996-10-22','dlrah933@naver.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('tmdgusdl','tmdgus38@!','허승현','14001','경기 안양시 만안구 냉천로 196 (중앙시장)/107-1404/ (안양동)','010-0757-5433','2000-11-25','tmdgus351@google.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('gkrtjddl','gkrtjd02@','이학성','14001','경기 안양시 만안구 냉천로 202/301-2201/ (안양동)','010-8769-7832','2001-03-06','gkrgkrtjddl@naver.com');
Insert into TEST.MEMBER (M_ID,M_PW,M_NAME,M_ZIP,M_ADDR,M_TEL,M_BIRTH,M_EMAIL) values ('dmsdnek','dmsdn8@!','신은우','14002','경기 안양시 만안구 냉천로189번길 11 (유성빌라)/203-406/ (안양동)','010-4378-2996','2003-08-20','dmsdn8844@naver.com');
--------------------------------------------------------
--  DDL for Index SYS_C007530
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."SYS_C007530" ON "TEST"."MEMBER" ("M_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "TEST"."MEMBER" ADD CONSTRAINT "M_ID_PK" PRIMARY KEY ("M_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
