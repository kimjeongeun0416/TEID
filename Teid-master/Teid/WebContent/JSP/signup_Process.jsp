<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.*" %>    
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("ID");
	String pw = request.getParameter("PW");
	String pw_double = request.getParameter("PW_double");
	String name = request.getParameter("NAME");
	String sex = request.getParameter("SEX");
	int age = 0;
	String phone;
	String email;
	String dietTheme;
	String pic;
	int height = 0;
	int weight = 0;
	int score = 100;
	
	
	if(id.length() == 0)
	{
		response.sendRedirect("signup.jsp?status=idNotFound");
	}
	else if(pw.length()==0 || pw_double.length()==0 || !Objects.equals(pw, pw_double))
	{
		response.sendRedirect("signup.jsp?status=pwdIncorrect");
	}
	else if(name.length() == 0)
	{
		response.sendRedirect("signup.jsp?status=nameNotFound");
	}
	else if(sex.length() == 0)
	{
		response.sendRedirect("signup.jsp?status=sexNotFound");
	}
	else if(request.getParameter("AGE").length()==0)
	{
		response.sendRedirect("signup.jsp?status=ageNotFound");
	}
	else
	{
		pic = request.getParameter("PIC");
		age = Integer.parseInt(request.getParameter("AGE"));
		phone = request.getParameter("PHONE");
		email = request.getParameter("EMAIL");
		dietTheme = request.getParameter("DIET_THEME");
		if(request.getParameter("HEIGHT").length()!=0)
		{
			height = Integer.parseInt(request.getParameter("HEIGHT"));	
		}
		if(request.getParameter("WEIGHT").length()!=0)
		{
			weight = Integer.parseInt(request.getParameter("WEIGHT"));
		}
		score = 100;
		
		Member member = new Member();
		member.setImage(pic);
		member.setId(id);
		member.setPw(pw);
		member.setName(name); 
		member.setGender(sex);
		member.setAge(age);
		member.setPhone(phone);
		member.setEmail(email);
		member.setService(dietTheme);
		member.setHeight(height);
		member.setWeight(weight);
		member.setScore(score);
		
		
		MemberDao memDao = MemberDao.getInstance();
		memDao.setMember(member);
		
		//response.sendRedirect("signup.jsp?status=signupOK");
		response.sendRedirect("login.jsp");
	}
	
	
%>