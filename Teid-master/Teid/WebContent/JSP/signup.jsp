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
	<title>회원가입</title>
	<!-- CSS 연결 -->
	<link rel="stylesheet" href="../css/signUp.css">
	<link rel="stylesheet" href="../css/jquery.fullPage.css">
	<link rel="stylesheet" href="../css/colorbox.css">
	 <!-- jquery CDN 연결 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- JavaScript 연결 -->
	<script src="../js/jquery.signup.js"></script> 
	<script src="../js/jquery.fullPage.js"></script>
	<script src="../js/jquery.colorbox.js"></script>
</head>
<body>
	<!-- 회원가입화면 시작 -->
	<div id="wrap">
		<div class="signup_area">
			<div class="signup_logo">
				<a href="index.jsp"><img src="../images/Teid_logo.png" alt="logo" class="big_logo"></a>
				<!-- 로고 -->
			</div>
			<form action="signup_Process.jsp" method="post" class = "signup_form">
				<table class = "signup_lst">
					<div class="img_sel">
						<!--<div class="profile_area"> <!-- 이미지 선택하면 여기에 선택한 이미지 보이게 기능 -->
						<img id="img" class="profile_area" src="../images/pp1.png">
						<!--</div>	-->					
					</div>
					<tr>
						<td align="right"><font size="2">이미지 선택</font></td>
						<td><input type="radio" name="PIC" value="1"
							checked="checked"  class="signup_input"><font size="2">   pic1</font> 
							<input type="radio" name="PIC" value="2" class="signup_input"><font size="2">   pic2</font>
							<input type="radio" name="PIC" value="3" class="signup_input"><font size="2">   pic3</font>
						</td>
					</tr>
					<tr>
						<td align="right"><font size="2">아이디(*) </font></td>
						
						<%
						if(Objects.equals(status, "idNotFound") )
						{
						%>
						<td><input type="text" class="signup_input" name="ID" placeholder="아이디를 입력하세요."></td>
						<%
						}
						else
						{
						%>
						<td><input type="text" class="signup_input" name="ID" placeholder="필수"></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td align="right"><font size="2">비밀번호(*) </font></td>
						<%
						if(Objects.equals(status, "pwdIncorrect") )
						{
						%>
						<td><input type="password" class="signup_input" name="PW" placeholder="비밀번호를 확인하세요."></td>
						<%
						}
						else
						{
						%>
						<td><input type="password" class="signup_input" name="PW" placeholder="필수"></td>
						<%
						}
						%>
					</tr>	
					<tr>
						<td align="right"><font size="2">비밀번호 확인(*) </font></td>
						<td><input type="password" class="signup_input" name="PW_double" placeholder="필수"></td>
					</tr>
					<tr>
						<td align="right"><font size="2">이름(*) </font></td>
						<%
						if(Objects.equals(status, "nameNotFound") )
						{
						%>
						<td><input type="text" class="signup_input" name="NAME" placeholder="이름을 입력하세요."></td>
						<%
						}
						else
						{
						%>
						<td><input type="text" class="signup_input" name="NAME" placeholder="필수"></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td align="right"><font size="2">성별(*) </font></td>
						<td><input type="radio" name="SEX" value="1"
							checked="checked"  class="signup_input"><font size="2">    남</font> 
							<input type="radio" name="SEX" value="2" class="signup_input"><font size="2">    여</font>
						</td>
						<%
							if(Objects.equals(status, "sexNotFound") )
							{
						%>
						</tr>
						<td></td>
							<td>성별을 선택하세요.</td>
						<tr>
						<%
							}
						%>
					</tr>
					<tr>
						<td align="right"><font size="2">나이(*) </font></td>
						<%
						if(Objects.equals(status, "ageNotFound") )
						{
						%>
						<td><input type="text" class="signup_input" name="AGE" placeholder="나이를 입력하세요."></td>
						<%
						}
						else
						{
						%>
						<td><input type="text" class="signup_input" name="AGE" placeholder="필수"></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td align="right"><font size="2">전화번호 </font></td>
						<td><input type="tel"  class="signup_input" name="PHONE"></td>
					</tr>
					<tr>
						<td align="right"><font size="2">E-mail </font></td>
						<td><input type="text" class="signup_input" name="EMAIL"></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<select name="DIET_THEME" id="dt">
			                    <option value="0">관심있는 식단 테마를 선택해주세요.</option>
			                    <option value="1">다이어트식</option>
			                    <option value="2">건강식</option>
			                    <option value="3">키토제닉식</option>
			                    <option value="4">저염식</option>
			                    <option value="5">비건식</option>
		                	</select>
		                </td>
					</tr>					
					<tr>
						<td align="right"><font size="2">신장</font></td>
						<td><input type="text" class="signup_input" name="HEIGHT"></td>
					</tr>
					<tr>
						<td align="right"><font size="2">체중</font></td>
						<td><input type="text" class="signup_input" name="WEIGHT"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="가입" class="btn_signup">
							<input type="reset" value="취소" class="btn_signup">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>