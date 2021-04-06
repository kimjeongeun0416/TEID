<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String loginId = request.getParameter("loginId");

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemInfo(loginId);
	
	String status = request.getParameter("status");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>식단기록</title>
    <link rel="stylesheet" href="../css/edit_profile.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../js/jquery.main.js"></script>
</head>
<body>
	<div id="wrap">
        <nav id="navTop">
            <ul id="topMenu">
                <li data-menuanchor="logo"><a href="index.jsp?loginId=<%=loginId%>"><img src="../images/Teid_logo.png" alt="logo" class="img_logo"></a></li>
                <li><a href="index.jsp?loginId=<%=loginId%>">Home</a></li>
                <li><a href="index.jsp?loginId=<%=loginId%>#2st">사이트 소개</a></li>
                <li><a href="index.jsp?loginId=<%=loginId%>#3st">추천 식단</a></li>
                <li><a href="index.jsp?loginId=<%=loginId%>#4st">식단왕</a></li>
                <li><a href="index.jsp?loginId=<%=loginId%>#5st">Contact Us</a></li>
                <%
	            if(loginId == null || Objects.equals(loginId, "null"))
	        	{
		        %>
		        	<li class="mypage"><a href="login.jsp">MyPage</a></li>
		        	<li class="logsin"><a href="login.jsp">Login/SignIn</a></li>
		        <%		
	        	}
	            else
	            {
	            %>
	           		<li class="mypage"><a href="mypage.jsp?loginId=<%=loginId%>">MyPage</a></li>
	           		<li class="logsin"><a href="login.jsp">Logout</a></li>
	            <%
	            }
	            %>
            </ul>
        </nav> 
        <div id="header">
            <div class="hd_title">
                <h2>My Page</h2>
                <h4>정보 수정</h4>
            </div>
        </div>
        <div id="contents">
        <form action="edit_Process.jsp?loginId=<%=loginId %>" method="post" class = "signup_form">
            <div class="profile_lst">
                <ul>
                    <li>아이디</li>
                    <li><%=loginId %></li>
                    <li>기존 비밀번호</li>
                    <%
                    if(Objects.equals(status, "pwdWrong") )
					{
					%>
						<li><input type="password" name="pw" placeholder="기존 비밀번호 불일치"></li>
					<%
					}
					else
					{
					%>
						<li><input type="password" name="pw"></li>
					<%
					}
					%>
					
                    <li>변경 비밀번호</li>
                    <%
					
					if(Objects.equals(status, "pwdIncorrect"))
					{
					%>
						<li><input type="password" name="renewPw" placeholder="변경 비밀번호 불일치"></li> 
					<%		
					}
					else
					{
					%>
						<li><input type="password" name="renewPw"></li> 
					<%
					}
					%>  
                    <li>변경 비밀번호 확인</li>
                    <li><input type="password" name="renewPw2"></li>
                    <li>이름</li>
                    <li><%=member.getName() %></li>
                    <li>전화번호</li>
                    <li><%=member.getPhone() %></li>    
                    <li>이메일</li>
                    <li><%=member.getEmail() %></li>              
                </ul>
                <div class="btn_area">
                	<div class="back_btn"><a href="mypage.jsp?loginId=<%=loginId%>">뒤로가기</a> </div>
                    <input type="reset" value="초기화" class="cancle_btn">         
                   	<input type="submit" value="수정" class="edit_btn">                       
                </div>
             </div>
          </form>      
            </div>
        </div>
        <div id="footer">

        </div>
    </div>
</body>
</html>