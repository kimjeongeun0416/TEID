<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String loginId = request.getParameter("loginId");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>식단왕</title>
    <!-- CSS 연결 -->
    <link rel="stylesheet" href="../css/ranking.css">
    <!-- jquery CDN 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- JavaScript 연결 -->
    <script src="js/jquery.main.js"></script>
    <script src="js/jquery.mypage.js"></script>
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
        
        <%
        MemberDao md = MemberDao.getInstance();
        List<Member> list = md.getMemberScore();
        %>
        
        <div class="rank_title">
            <h1>식단왕</h1>
        </div>
        <div class="rank_pic">
        	<div class="grid-box">
        	<%
        	int size = list.size();
            if(size > 3)
            {
            	size = 3;
            }
            
            if(size != 0)
            {
	        	for (int i=0; i<size; i++) 
	        	{
	            	Member mem = list.get(i);
            %>            
            
                <div class="grid-item">
            <%
	                if(i==0) 
	                { 
            %>
                    <img src="../images/crown.png" alt="왕관" class="king">
            <%
                	} 
            %>
                    <img src="../images/pp<%=mem.getImage()%>.png" alt="사람">
                    <p><%=mem.getId()%></p>
                </div>
            <%
            	} 
            }
            %>
            </div>
        </div> 
        
        <div class="rank_lst">
           <p>순위표</p>
            <ul>
            <%
            size = list.size();
            if(size > 10)
            {
            	size = 10;
            }
            if(size != 0)
            {
	            for (int i=0; i<size; i++) 
	            {
	            	Member mem = list.get(i);
            %>
                <li><%=i+1 %></li>
                <li><%=mem.getId()%></li>
                <li><%=mem.getScore()%>점</li>
            <%
            	} 
            }
            %>

            </ul>
        </div>
        
        <div id="footer">
        </div>
    </div> 
</body>
</html>