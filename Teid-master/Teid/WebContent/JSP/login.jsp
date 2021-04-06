<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>

<%
	String loginId = request.getParameter("loginId");
	String status = request.getParameter("status");
%>

<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- CSS 연결 -->
	<link rel="stylesheet" href="../css/login.css">
	<link rel="stylesheet" href="../css/jquery.fullPage.css">
	<link rel="stylesheet" href="../css/colorbox.css"> 
	<!-- jquery CDN 연결 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- JavaScript 연결 -->
	<script src="../js/jquery.main.js"></script>
	<script src="../js/jquery.fullPage.js"></script>
	<script src="../js/jquery.colorbox.js"></script>
	
</head>
<body>
	<!-- 로그인 영역 시작 -->
	<div id="wrap">
		<div class="login_area">
			<div class="login-logo">
				<a href="index.jsp?loginId=<%=loginId%>"><img src="../images/Teid_logo.png"
					alt="logo" class="big_logo"></a>
				<!-- 로고 -->
			</div>
			<div class="login-page">
				<form action="login_Process.jsp?loginId=<%=loginId%>" class="login-form" method="post">
				<%
				if(Objects.equals(status, "idNotFound"))
				{
				%>
					<input type="text" placeholder="ID를 확인해주세요." class="username" name="ID"> 
				<%
				}
				else
				{
				%>
					<input type="text" placeholder="username" class="username" name="ID"> 
				<%
				}
				%>
				
				
				<%
				if(Objects.equals(status, "pwIncorrect"))
				{
				%>
					<input type="password" placeholder="비밀번호를 확인해주세요." class="password" name="PW"> 
				<%
				}
				else
				{
				%>
					<input type="password" placeholder="password" class="password" name="PW">
				<%
				}
				%>
					
					
					<input type="submit" value="로그인" class="btn_login">
					<p class="message">
						회원가입하지 않으셨나요? <a href="signup.jsp">회원가입</a>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>