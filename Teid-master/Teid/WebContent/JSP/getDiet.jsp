<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.diet.*" %>
<%@ page import="com.food.*" %>
<%@ page import="java.util.*" %>

<%
	String loginId = request.getParameter("loginId");
	String ymd = request.getParameter("ymd");
	System.out.println("getDiet(loginId, ymd) : " + loginId + ", " + ymd);

	DietDao dietDao = DietDao.getInstance();
	Diet diet = dietDao.getDiet(loginId, ymd);

	
	String result = "";
	result += "[{\"allBreakfast\":\"" + diet.getBreakfast() + "\",";
	result += "\"allLunch\":\"" + diet.getLunch() + "\",";
	result += "\"allDinner\":\"" + diet.getDinner() + "\",";
	result += "\"allSnack\":\"" + diet.getSnack() + "\",";
	result += "\"memo\":\"" +  diet.getMemo() + "\",";
	result += "\"score\":\"" + Integer.toString(diet.getScore()) + "\"}]";

	out.println(result);
%>