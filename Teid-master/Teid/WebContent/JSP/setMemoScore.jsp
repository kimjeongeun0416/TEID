<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.diet.*" %>
<%@ page import="com.member.*" %>
<%@ page import="java.util.*" %>

<%
	String loginId = request.getParameter("loginId");
	String memo = request.getParameter("memo");
	String date = request.getParameter("date");
	String score = request.getParameter("score");
	
	DietDao dietDao = DietDao.getInstance();
	dietDao.setMemoScore(loginId, date, memo, Integer.parseInt(score));
	System.out.println("setMemoScore(loginId, date, memo, Integer.parseInt(score)) : " + loginId + ", " + date);
	
	MemberDao memberDao = MemberDao.getInstance();
	memberDao.setScore(loginId, Integer.parseInt(score));

	Member member = memberDao.getMemInfo(loginId);
	
	
	String result = "";
	result += "[{\"memberScore\":\"" + Integer.toString(member.getScore()) + "\"}]";

	out.println(result);
%>