<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.*" %>
<%@ page import="com.bookmark.*" %>
<%@ page import="com.diet.*" %>
<%@ page import="java.util.*" %>
    
<%
	String loginId = request.getParameter("loginId");
System.out.println("loginId : " + loginId);
	BookmarkDao bookmarkDao = BookmarkDao.getInstance();
	Bookmark bookmark = bookmarkDao.getBookmark(loginId);
	
	List<String> breakList = bookmark.getBreakfast();
	List<String> lunchList = bookmark.getLunch();
	List<String> dinnerList = bookmark.getDinner();
	List<String> snackList = bookmark.getSnack();
	
	String date = request.getParameter("date");
	String allBreakfast = "";
	String allLunch = "";
	String allDinner = "";
	String allSnack = "";
	
	FoodDao foodDao = FoodDao.getInstance();
	
	for(int i=0; i<breakList.size(); i++)
	{
		Food food = foodDao.getFoodInfo(breakList.get(i));
		
		allBreakfast += food.getName();
		allBreakfast += " (" + Float.toString(food.getServing()) + food.getMeasure() + ")";
		allBreakfast += ", ";
	}
	if(allBreakfast != "")
	{
		allBreakfast = allBreakfast.substring(0, allBreakfast.length()-2);
	}
	else
	{
		allBreakfast = null;
	}
	
	
	for(int i=0; i<lunchList.size(); i++)
	{
		Food food = foodDao.getFoodInfo(lunchList.get(i));
		
		allLunch += food.getName();
		allLunch += " (" + Float.toString(food.getServing()) + food.getMeasure() + ")";
		allLunch += ", ";
	}
	if(allLunch != "")
	{
		allLunch = allLunch.substring(0, allLunch.length()-2);
	}
	else
	{
		allLunch = null;
	}
	
	for(int i=0; i<dinnerList.size(); i++)
	{
		Food food = foodDao.getFoodInfo(dinnerList.get(i));
		
		allDinner += food.getName();
		allDinner += " (" + Float.toString(food.getServing()) + food.getMeasure() + ")";
		allDinner += ", ";
	}
	if(allDinner != "")
	{
		allDinner = allDinner.substring(0, allDinner.length()-2);
	}
	else
	{
		allDinner = null;
	}
	
	for(int i=0; i<snackList.size(); i++)
	{
		Food food = foodDao.getFoodInfo(snackList.get(i));
		
		allSnack += food.getName();
		allSnack += " (" + Float.toString(food.getServing()) + food.getMeasure() + ")";
		allSnack += ", ";
	}
	if(allSnack != "")
	{
		allSnack = allSnack.substring(0, allSnack.length()-2);
	}
	else
	{
		allSnack = null;
	}

	DietDao dietDao = DietDao.getInstance();
	dietDao.setDiet(loginId, date, allBreakfast, allLunch, allDinner, allSnack, null, 0);
	System.out.println("setDiet(loginId, date, allBreakfast, allLunch, allDinner, allSnack, null, 0) : " + loginId + ", " + date);
%>