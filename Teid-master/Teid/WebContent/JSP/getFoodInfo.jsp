<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.*" %>
<%@ page import="java.util.*" %>

<%	
	String loginId = request.getParameter("loginId");
	String choicedFoodCode = request.getParameter("fCode");
	FoodDao foodDao = FoodDao.getInstance();
	Food choicedFood = foodDao.getFoodInfo(choicedFoodCode);
	
	String result = "";
	
	result += "[{\"choicedCode\":\"" + choicedFood.getCode() + "\",";
	result += "\"choicedCatg\":\"" + choicedFood.getPart() + "\",";
	result += "\"choicedName\":\"" + choicedFood.getName() + "\",";
	result += "\"choicedServ\":\"" + Float.toString(choicedFood.getServing()) + choicedFood.getMeasure() + "\",";
	result += "\"choicedKcal\":\"" + choicedFood.getKcal() + "\",";
	result += "\"choicedWatr\":\"" + choicedFood.getWater() + "\",";
	result += "\"choicedProt\":\"" + choicedFood.getProtein() + "\",";
	result += "\"choicedFat\":\"" + choicedFood.getFat() + "\",";
	result += "\"choicedCarb\":\"" + choicedFood.getCarbohydrate() + "\",";
	result += "\"choicedSugr\":\"" + choicedFood.getSugar() + "\",";
	result += "\"choicedFibr\":\"" + choicedFood.getFiber() + "\",";
	result += "\"choicedNatr\":\"" + choicedFood.getNatrium() + "\",";
	result += "\"choicedCole\":\"" + choicedFood.getColesterol() + "\",";
	result += "\"choicedSatf\":\"" + choicedFood.getSaturatedfat() + "\",";
	result += "\"choicedTrnf\":\"" + choicedFood.getTransfat() + "\"}]";
	
	out.println(result);

//	response.sendRedirect("all_diet.jsp?choicedCatg=" + URLEncoder.encode(choicedFood.getPart(),"UTF-8") 
//						+ "&choicedName=" + URLEncoder.encode(choicedFood.getName(),"UTF-8")
//						+ "&choicedServ=" + URLEncoder.encode(Float.toString(choicedFood.getServing()) + choicedFood.getMeasure(),"UTF-8")
//						+ "&choicedKcal=" + choicedFood.getKcal()
//						+ "&choicedWatr=" + choicedFood.getWater()
//						+ "&choicedProt=" + choicedFood.getProtein()
//						+ "&choicedFat=" + choicedFood.getFat()
//						+ "&choicedCarb=" + choicedFood.getCarbohydrate()
//						+ "&choicedSugr=" + choicedFood.getSugar()
//						+ "&choicedFibr=" + choicedFood.getFiber()
//						+ "&choicedNatr=" + choicedFood.getNatrium()
//						+ "&choicedCole=" + choicedFood.getColesterol()
//						+ "&choicedSatf=" + choicedFood.getSaturatedfat()
//						+ "&choicedTrnf=" + choicedFood.getTransfat()
//			);
%>



