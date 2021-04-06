package com.rank;

public class Rank {
//	mem_id			CHAR(20) NOT NULL PRIMARY KEY,	/* 아이디(필수) */
//    mem_pw			CHAR(20) NOT NULL,				/* 비밀번호(필수) */
//    mem_name 		CHAR(10) NOT NULL,				/* 이름(필수) */
//    mem_gender		CHAR(1) NOT NULL,				/* 성별(필수, 남/여)) */
//    mem_age			TINYINT UNSIGNED NOT NULL,		/* 0 ~ 255(필수) */
//    mem_phone		CHAR(11) NULL,					/* 전화번호(선택) */
//	mem_email		CHAR(30) NULL,					/* 이메일(선택) */
//    mem_service		CHAR(1) NULL,					/* 제공받을 식단(선택, 체중감량, 당뇨 등) */
//    mem_image		CHAR(1) NULL,					/* 대표이미지(선택) */
//    mem_height		TINYINT UNSIGNED NOT NULL,		/* 신장(선택) */
//    mem_weight		TINYINT UNSIGNED NOT NULL,		/* 체중(선택) */
//    mem_score		INT UNSIGNED NOT NULL			/* 점수 */
	
	private String id;
	private int score;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
}
