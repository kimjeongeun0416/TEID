<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.*" %>
<%@ page import="com.bookmark.*" %>
<%@ page import="java.util.*" %>
    
<%
	String loginId = request.getParameter("loginId");
	String name = request.getParameter("fName");
	String when = request.getParameter("when");
	FoodDao foodDao = FoodDao.getInstance();
	String code = foodDao.getFoodCode(name);
	
	BookmarkDao bookmarkDao = BookmarkDao.getInstance();
	bookmarkDao.setBookmark(loginId, code, when);
	System.out.println("setBookmark(loginId, code, when) : " + loginId + ", " + code + ", " + when);
%>