<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.*" %>  
<%@ page import="java.util.*" %>

<%
	String loginId = request.getParameter("loginId");
	String id = request.getParameter("ID");
	String pw = request.getParameter("PW");
	
	MemberDao memDao = MemberDao.getInstance();
	String realPw = memDao.getPassword(id);
	
	if(Objects.equals(pw, realPw))
	{
		loginId = id;
		System.out.println("loginId : " + loginId);
		response.sendRedirect("index.jsp?loginId=" + loginId);
	}
	else if(realPw.length()==0)
	{
		response.sendRedirect("login.jsp?&status=idNotFound");
	}
	else
	{
		response.sendRedirect("login.jsp?&status=pwIncorrect");
	}
%>