<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.*" %>
<%@ page import="java.util.*" %>


<%
	request.setCharacterEncoding("UTF-8");
	String foodName = request.getParameter("foodName");
	
	System.out.println("foodName : " + foodName);
	response.sendRedirect("all_diet.jsp");
%>