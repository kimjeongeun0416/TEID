package com.member;

public class Member {
//	mem_id			CHAR(20) NOT NULL PRIMARY KEY,	/* 아이디(필수) */
//  mem_pw			CHAR(20) NOT NULL,				/* 비밀번호(필수) */
//  mem_name 		CHAR(10) NOT NULL,				/* 이름(필수) */
//  mem_gender		CHAR(1) NOT NULL,				/* 성별(필수, 남/여)) */
//  mem_age			TINYINT UNSIGNED NOT NULL,		/* 0 ~ 255(필수) */
//  mem_phone		CHAR(11) NULL,					/* 전화번호(선택) */
//	mem_email		CHAR(30) NULL,					/* 이메일(선택) */
//  mem_service		CHAR(1) NULL,					/* 제공받을 식단(선택, 체중감량, 당뇨 등) */
//  mem_image		CHAR(1) NULL,					/* 대표이미지(선택) */
//  mem_height		TINYINT UNSIGNED NOT NULL,		/* 신장(선택) */
//  mem_weight		TINYINT UNSIGNED NOT NULL,		/* 체중(선택) */
//  mem_score		INT UNSIGNED NOT NULL			/* 점수 */
	
	private String id;
	private String pw;
	private String name;
	private String gender;
	private int age;
	private String phone;
	private String email;
	private String service;
	private String image;
	private int height;
	private int weight;
	private int score;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	
	
}
