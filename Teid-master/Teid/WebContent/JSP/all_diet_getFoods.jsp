<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.*" %>
<%@ page import="java.util.*" %>
<%
	String category = request.getParameter("category");
	String foodName = request.getParameter("foodName");
	
	Food food = new Food();
	List<Food> list = null;

%>