<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.food.*" %>
<%@ page import="com.bookmark.*" %>
<%@ page import="java.util.*" %>

<%
	String loginId = request.getParameter("loginId");
	BookmarkDao bookmarkDao = BookmarkDao.getInstance();
	bookmarkDao.delBookmark(loginId);
	System.out.println("delBookmark(loginId) : " + loginId);
%>