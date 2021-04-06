DROP DATABASE food_DB;
CREATE DATABASE food_DB;
USE food_DB;

CREATE TABLE food_table								/* 전부 필수 */
(
/*	fd_num			INT auto_increment PRIMARY KEY, /* 번호 (29926개 확인하려고 넣음) */
	fd_code			CHAR(7) NOT NULL PRIMARY KEY,	/* 식품코드 */
    fd_db			CHAR(4) NOT NULL,				/* DB군 */
    fd_db2			CHAR(4) NOT NULL,				/* 상용제품 */
    fd_name			CHAR(80) NOT NULL,				/* 식품명 */
    fd_part			CHAR(20) NOT NULL,				/* 식품상세분류 */
    fd_serving		FLOAT NOT NULL,					/* 1회제공량 */
    fd_measure		CHAR(2) NOT NULL,				/* 내용량_단위 */
    fd_kcal			FLOAT NOT NULL,					/* 에너지(㎉) */
    fd_water		FLOAT NOT NULL,					/* 수분(g) */
    fd_protein		FLOAT NOT NULL,					/* 단백질(g) */
    fd_fat			FLOAT NOT NULL,					/* 지방(g) */ 
    fd_carbohydrate	FLOAT NOT NULL,					/* 탄수화물 */
    fd_sugar		FLOAT NOT NULL,					/* 총당류(g) */
    fd_fiber		FLOAT NOT NULL,					/* 총 식이섬유(g) */
    fd_natrium		FLOAT NOT NULL,					/* 나트륨(㎎) */
    fd_colesterol	FLOAT NOT NULL,					/* 콜레스테롤(㎎) */
    fd_saturatedfat	FLOAT NOT NULL,					/* 총 포화 지방산(g) */
    fd_transfat		FLOAT NOT NULL					/* 트랜스 지방산(g) */

);

CREATE TABLE member_table
(
	mem_id			CHAR(20) NOT NULL PRIMARY KEY,	/* 아이디(필수) */
    mem_pw			CHAR(20) NOT NULL,				/* 비밀번호(필수) */
    mem_name 		CHAR(10) NOT NULL,				/* 이름(필수) */
    mem_gender		CHAR(1) NOT NULL,				/* 성별(필수, 남/여)) */
    mem_age			TINYINT UNSIGNED NOT NULL,		/* 0 ~ 255(필수) */
    mem_phone		CHAR(11) NULL,					/* 전화번호(선택) */
	mem_email		CHAR(30) NULL,					/* 이메일(선택) */
    mem_service		CHAR(1) NULL,					/* 제공받을 식단(선택, 체중감량, 당뇨 등) */
    mem_image		CHAR(1) NULL,					/* 대표이미지(선택) */
    mem_height		TINYINT UNSIGNED NULL,		/* 신장(선택) */
    mem_weight		TINYINT UNSIGNED NULL,		/* 체중(선택) */
    mem_score		INT UNSIGNED NOT NULL			/* 점수 */
);

CREATE TABLE diet_table
(
	dt_id			CHAR(20) NOT NULL,				/* 아이디(필수) */
    dt_date			DATE NOT NULL,					/* 날짜(필수)*/
/*    dt_breakfast	CHAR(7) NULL,					/* 아침(선택) */
/*    dt_lunch		CHAR(7) NULL,					/* 점심(선택) */
/*    dt_dinner		CHAR(7) NULL,					/* 저녁(선택) */
/*    dt_snack		CHAR(7) NULL,					/* 간식(선택) */
	dt_breakfast	VARCHAR(255) NULL,				/* 아침메뉴들(선택) */
    dt_lunch		VARCHAR(255) NULL,				/* 점심메뉴들(선택) */
    dt_dinner		VARCHAR(255) NULL,				/* 저녁메뉴들(선택) */
    dt_snack		VARCHAR(255) NULL,				/* 간식메뉴들(선택) */
    dt_memo			VARCHAR(255) NULL,				/* 메모(선택, 255까지 가변길이) */
    dt_score		INT NOT NULL,						/* 좋아요:10 싫어요:-10 그외:0 */
    FOREIGN KEY(dt_id) REFERENCES member_table(mem_id)			/* 회원은 member테이블에 있어야함 */
/*    FOREIGN KEY(dt_breakfast) REFERENCES food_table(fd_code),	/* 아침은 food테이블에 있어야함 */
/*    FOREIGN KEY(dt_lunch) REFERENCES food_table(fd_code),		/* 점심은 food테이블에 있어야함 */
/*    FOREIGN KEY(dt_dinner) REFERENCES food_table(fd_code),		/* 저녁은 food테이블에 있어야함 */
/*	FOREIGN KEY(dt_snack) REFERENCES food_table(fd_code)		/* 간식은 food테이블에 있어야함 */
);

CREATE TABLE bookmark_table
(
	dt_id			CHAR(20) NOT NULL,				/* 아이디(필수) */
    dt_breakfast	CHAR(7) NULL,					/* 아침(필수) */
    dt_lunch		CHAR(7) NULL,					/* 점심(필수) */
    dt_dinner		CHAR(7) NULL,					/* 저녁(필수) */
    dt_snack		CHAR(7) NULL,					/* 간식(선택) */
/*    dt_memo			VARCHAR(255) NULL,				/* 메모(선택, 255까지 가변길이) */
	FOREIGN KEY(dt_id) REFERENCES member_table(mem_id),			/* 회원은 member테이블에 있어야함 */
    FOREIGN KEY(dt_breakfast) REFERENCES food_table(fd_code),	/* 아침은 food테이블에 있어야함 */
    FOREIGN KEY(dt_lunch) REFERENCES food_table(fd_code),		/* 점심은 food테이블에 있어야함 */
    FOREIGN KEY(dt_dinner) REFERENCES food_table(fd_code),		/* 저녁은 food테이블에 있어야함 */
	FOREIGN KEY(dt_snack) REFERENCES food_table(fd_code)		/* 간식은 food테이블에 있어야함 */
);


SELECT * FROM food_table;
SELECT * FROM member_table;
SELECT * FROM diet_table;
SELECT * FROM bookmark_table;


SELECT fd_part, fd_name, fd_fat, fd_serving, fd_measure FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND fd_fat/fd_serving < 0.005 order by rand();
SELECT fd_name, fd_protein, fd_serving, fd_measure FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND fd_protein/fd_serving > 0.25 order by rand();
SELECT fd_name, fd_carbohydrate, fd_protein, fd_fat, fd_fiber, fd_serving, fd_measure FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND fd_carbohydrate/fd_serving < 0.02 AND fd_fat/fd_serving > 0.05 AND fd_fiber/fd_serving > 0.0005 order by rand();
SELECT fd_part, fd_name, fd_natrium, fd_serving, fd_measure FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND fd_part NOT IN('수산가공품') AND (fd_natrium/1000)/fd_serving < 0.0008 order by rand();
SELECT fd_name, fd_part FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND fd_part like '%채소%' AND fd_part NOT like '%탕%' AND fd_part NOT like '%전골%' order by rand();


SELECT fd_name, fd_serving, fd_measure FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND fd_fat/fd_serving < 0.01 order by rand();
SELECT fd_name, fd_serving, fd_measure FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND fd_protein/fd_serving > 0.25 order by rand();
SELECT fd_name, fd_serving, fd_measure FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND fd_carbohydrate/fd_serving < 0.02 AND fd_fat/fd_serving > 0.05 AND fd_fiber/fd_serving > 0.0005 order by rand();
SELECT fd_name, fd_serving, fd_measure FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND (fd_natrium/1000)/fd_serving < 0.0008 order by rand();
SELECT fd_name, fd_serving, fd_measure FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND fd_part like '%채소%' order by rand();






TRUNCATE diet_table;
INSERT INTO diet_table VALUES('aaa', '2020-12-31', '꿩불고기', null, null, '꿩불고기', null, 0);

INSERT INTO bookmark_table VALUES('D000008', null, null, null);
INSERT INTO bookmark_table VALUES('D000017', null, null, null);
INSERT INTO bookmark_table VALUES(null, 'D000025', null, null);
INSERT INTO bookmark_table VALUES(null, 'D000029', null, null);
INSERT INTO bookmark_table VALUES(null, null, 'D000020', null);
INSERT INTO bookmark_table VALUES(null, null, 'D000023', null);
INSERT INTO bookmark_table VALUES(null, null, null, 'D000028');
INSERT INTO bookmark_table VALUES(null, null, null, 'D000022');
INSERT INTO bookmark_table VALUES(null, null, null, 'D000006');

/*INSERT INTO food_table VALUES('R003147', '농축산물', '장수풍뎅이 유충 말린것', '기타', 100, 'g', 502, 6.1, 44.62, 27.21, 19.55, 0, 0, 40, 0, 0.18, 0.01);
*/


TRUNCATE member_table;
SELECT count(*) FROM food_table;
/*SELECT * FROM (SELECT rownum rn, fd_code, fd_db, fd_name, fd_part from (SELECT * FROM food_table)) WHERE rn between 1 and 10;*/

SELECT * FROM diet_table WHERE dt_id='aaa' and dt_date='2020-11-02';
SELECT dt_snack FROM diet_table WHERE dt_id='aaa' and dt_date='2020-11-01';

SELECT mem_pw FROM member_table WHERE mem_id='simspon';
SELECT mem_name, mem_phone, mem_email FROM member_table WHERE mem_id='original11';
SELECT mem_score FROM member_table WHERE mem_id='aaa';

UPDATE diet_table SET dt_memo="개잘한듯", dt_score=10 WHERE dt_id='aaa' and dt_date='2020-12-31';


SELECT dt_breakfast FROM bookmark_table WHERE NOT dt_breakfast is NULL;

TRUNCATE member_table;
TRUNCATE diet_table;
TRUNCATE bookmark_table;

DROP TABLE bookmark_table;
DROP TABLE diet_table;
DROP TABLE member_table;
DROP TABLE food_table;



insert into member_table values ("aaa","111","abd","남",22,null,null,null,1,180,80,0);
insert into member_table values ("aqa","111","aqwer","남",22,null,null,null,2,180,80,1);
insert into member_table values ("qwer","111","asfdgd","남",22,null,null,null,3,180,80,5);
insert into member_table values ("asadf","111","asfgnbd","남",22,null,null,null,1,180,80,67);
insert into member_table values ("axcb","111","abdgvbcd","남",22,null,null,null,2,180,80,23);
insert into member_table values ("asfh","111","axbd","남",22,null,null,5,3,180,80,45);
insert into member_table values ("aasdfga","111","abndgd","남",22,null,null,4,1,180,80,2);
insert into member_table values ("aqrt","111","zcvb","남",22,null,null,3,2,180,80,75);
insert into member_table values ("asdhf","111","zcbxbd","남",22,null,null,2,3,180,80,8);
insert into member_table values ("asgdf","111","absdfga","남",22,null,null,1,1,180,80,111);


SELECT * FROM diet_table WHERE dt_id='aaa' and dt_date='2020-11-25';
UPDATE diet_table SET dt_breakfast=CONCAT(dt_breakfast,'신규값'), dt_lunch=CONCAT(dt_lunch,'신규값') , dt_dinner=CONCAT(dt_dinner,'신규값'), dt_snack=CONCAT(dt_snack,'신규값') WHERE dt_id='aaa' and dt_date='2020-11-18';
INSERT INTO diet_table VALUES('aaa', '2020-11-01', null, '돼지갈비, 도미구이', null, null, null);
UPDATE diet_table SET dt_breakfast=CONCAT(IFNULL(dt_breakfast, ""), IFNULL(null, "밥")), dt_lunch=CONCAT(dt_lunch, IFNULL(', 밥', "")) , dt_dinner=CONCAT(dt_dinner, IFNULL('밥', "")), dt_snack=CONCAT(dt_snack, null) WHERE dt_id='aaa' and dt_date='2020-11-01';
INSERT INTO diet_table VALUES('aaa', '2020-11-25', null, null, null, null, "메모 ㅋㅋㅋ");

SELECT * FROM diet_table;


UPDATE member_table SET mem_score=mem_score+-100 WHERE mem_id='original10';
SELECT * FROM member_table;

SELECT * FROM member_table ORDER BY mem_score DESC;
TRUNCATE member_table;
DROP TABLE diet_table;

INSERT INTO bookmark_table VALUES('aaa', null, null, 'D000006', null);
DELETE FROM bookmark_table WHERE dt_id='aaa';
SELECT dt_dinner FROM bookmark_table WHERE dt_id='aaa' AND NOT dt_dinner is NULL;

SET @ROWNUM:=0;
SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A;
SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A, (SELECT @ROWNUM:=0) TMP WHERE fd_db NOT IN('가공식품');
SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A, (SELECT @ROWNUM:=0) TMP WHERE fd_db NOT IN('가공식품') LIMIT 0, 20;
SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A, (SELECT @ROWNUM:=0) TMP WHERE fd_db NOT IN('가공식품') AND fd_name='꿩불고기' LIMIT 0, 20;
SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A, (SELECT @ROWNUM:=0) TMP WHERE fd_db NOT IN('가공식품') AND fd_part='육류구이' LIMIT 0, 20;
SELECT DISTINCT fd_part FROM food_table WHERE fd_db NOT IN('가공식품');
SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A, (SELECT @ROWNUM:=0) TMP WHERE fd_db NOT IN('가공식품') AND fd_name like '%국%' LIMIT 0, 20;
SELECT * FROM food_table WHERE fd_name='꿩불고기';