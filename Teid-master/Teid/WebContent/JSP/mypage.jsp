<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.*" %>   
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String loginId = request.getParameter("loginId");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemInfo(loginId);
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MyPage</title>
    <link rel="stylesheet" href="../css/mypage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../js/jquery.main.js"></script>
    <script src="../js/jquery.mypage.js"></script>
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
                <h4>식단 기록</h4>
                <div class="info_edit"><a href="edit_profile.jsp?loginId=<%=loginId%>">정보 수정</a></div>
            </div>
        </div>
        <div id="contents">
        	<div class="myScore">
        		<p><%=member.getName() %></p>
        		<br>
        		<p class="myRealScore">내 점수  : <%=member.getScore() %>점</p>
        	</div>
            <table id="calendar">
                <tr>
                    <!-- label은 마우스로 클릭을 편하게 해줌 -->
                    <td>
                        <label onclick="prevCalendar('<%=loginId%>')">
                            < </label>
                    </td>
                    <td align="center" id="tbCalendarYM" colspan="5">
                        yyyy년 m월</td>
                    <td><label onclick="nextCalendar('<%=loginId%>')">>

                        </label></td>
                </tr>
                <tr>
                    <td align="center">
                        <font color="#F79DC2">일
                    </td>
                    <td align="center">월</td>
                    <td align="center">화</td>
                    <td align="center">수</td>
                    <td align="center">목</td>
                    <td align="center">금</td>
                    <td align="center">
                        <font color="skyblue">토
                    </td>
                </tr>
            </table>
            
            <!--모달창-->
            <div id="modal_bg"></div>
            <div id="rec_diet_modal">
                <div class="modal_cnt">
                    <h2 id="mdCalendarMD">m월d일</h2>
                    <div id="diet_lst">
                        <div class="d_lst" >
	                        <ul id=breakfast>
		                       <li>아침</li>
		                       <li></li>
		                   	</ul>
                        </div>
                        <div class="d_lst">
                            <ul id="lunch">
		                       <li>점심</li>
		                       <li></li>
		                   	</ul>
                        </div>
                        <div class="d_lst">
                            <ul id="dinner">
		                       <li>저녁</li>
		                       <li></li>
		                   	</ul>
                        </div>
                        <div class="d_lst">
                            <ul id="snack">
		                       <li>간식</li>
		                       <li></li>
		                   	</ul>
                        </div>
                    </div>                    
                    <div class="diet_memo">
                        <textarea row="5" cols="50" class="noresize" placeholder="오늘 식단에 대한 기록을 해보세요."></textarea>
                    </div>
                    <div class="d_grade"> <!-- 아이콘 버튼 누르면 색이 찬 아이콘으로 변경 -->
                        <img src="../images/icon_good.png" id="good_icon">
                        <img src="../images/icon_good_select.png" id="good_icon_s">
                        <img src="../images/icon_bad.png" id="bad_icon">
                        <img src="../images/icon_bad_select.png" id="bad_icon_s">
                    </div>
                </div>
                <div id="btn_save">
                	<a id="modal_save" href='#' onclick="clickSave('<%=loginId%>');">저장</a>
                </div>
                <div id="modal_close">취소</div>
            </div>
            <script language="javascript" type="text/javascript">
                buildCalendar('<%=loginId%>');
            </script>
        </div>
        <div id="footer">

        </div>
    </div>
</body>
</html>