<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.*" %>    
<%@ page import="java.util.*" %>

<%
	String loginId = request.getParameter("loginId");
	//String ID = "aaa";
	String pw = request.getParameter("pw");
	String renewPw = request.getParameter("renewPw");
	String renewPw2 = request.getParameter("renewPw2");
	
	MemberDao memberDao = MemberDao.getInstance();
	String realPw = memberDao.getPassword(loginId);
	
	if(!Objects.equals(pw, realPw))
	{
		response.sendRedirect("edit_profile.jsp?loginId=" + loginId + "&status=pwdWrong");
	}
	else if(!Objects.equals(renewPw, renewPw2))
	{
		response.sendRedirect("edit_profile.jsp?loginId=" + loginId + "&status=pwdIncorrect");
	}
	else
	{
		MemberDao memDao = MemberDao.getInstance();
		memDao.editMember(loginId, pw, renewPw);
		
		response.sendRedirect("mypage.jsp?loginId=" + loginId);
	}
	

%>
