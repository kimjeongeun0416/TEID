<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.*" %>
<%@ page import="com.bookmark.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");
	String loginId = request.getParameter("loginId");
	
	
	int pageSize = 20; // 한 페이지에 출력할 레코드 수

	// 페이지 링크를 클릭한 번호 / 현재 페이지
	String pageNum = request.getParameter("pageNum");
	
	if (pageNum == null) // 클릭한게 없으면 1번 페이지
	{ 
		pageNum = "1";
	}
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = (currentPage - 1) * pageSize;
	//int endRow = currentPage * pageSize

	int count = 0;
	FoodDao foodDao = FoodDao.getInstance();
	count = foodDao.getCount(); // 데이터베이스에 저장된 총 갯수

	List<Food> list = null;
	
	String category = request.getParameter("category");
	String foodName = request.getParameter("foodName");
	
	if(Objects.equals(category, "null"))
	{
		category=null;
	}
	
	if(Objects.equals(foodName, "null"))
	{
		foodName=null;
	}
	
	if (count > 0) 
	{
		// getList()메서드 호출 / 해당 레코드 반환
		list = foodDao.getAllFoods(startRow, pageSize, category, foodName);
	}
	
	
	BookmarkDao bookmarkDao = BookmarkDao.getInstance();
	Bookmark bookmark = bookmarkDao.getBookmark(loginId);
	

%>

<%
	List<String> partList = null;
	partList = foodDao.getAllPart();
	Collections.sort(partList);
%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체식단</title>
<link rel="stylesheet" href="../css/all_diet.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../js/jquery.main.js"></script>
<script src="../js/jquery.all_diet.js"></script>
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
           <div class="myDiet">
               <h2>내 식단</h2>
               <div class="all_diet_lst">
                   <ul class="all_diet_cnt" id=breakfast>
                       <li>아침</li>
                       <li></li>
                       	<%
                       		List<String> breakList = bookmark.getBreakfast();
                       		for(int i=0; i<breakList.size(); i++)
                       		{
                       			Food foodTmp = foodDao.getFoodInfo(breakList.get(i));
                		%>
                			<li id="li_bookmark"><%=foodTmp.getName()%>(<%=Float.toString(foodTmp.getServing()) + foodTmp.getMeasure()%>)</li>
                       	<%
                       			
                       		}
                      	%>
                        
                   </ul>
               </div>
               <div class="all_diet_lst">
                   <ul class="all_diet_cnt" id=lunch>
                       <li>점심</li>
                       <li></li>
                       <%
                       		List<String> lunchList = bookmark.getLunch();
                       		for(int i=0; i<lunchList.size(); i++)
                       		{
                       			Food foodTmp = foodDao.getFoodInfo(lunchList.get(i));
                		%>
                			<li id="li_bookmark"><%=foodTmp.getName()%>(<%=Float.toString(foodTmp.getServing()) + foodTmp.getMeasure()%>)</li>
                       	<%
                       			
                       		}
                      	%>
                   </ul>
               </div>
               <div class="all_diet_lst">
                   <ul class="all_diet_cnt" id=dinner>
                       <li>저녁</li>
                       <li></li>
                       <%
                       		List<String> dinnerList = bookmark.getDinner();
                       		for(int i=0; i<dinnerList.size(); i++)
                       		{
                       			Food foodTmp = foodDao.getFoodInfo(dinnerList.get(i));
                		%>
                			<li id="li_bookmark"><%=foodTmp.getName()%>(<%=Float.toString(foodTmp.getServing()) + foodTmp.getMeasure()%>)</li>
                       	<%
                       			
                       		}
                      	%>
                   </ul>
               </div>
               <div class="all_diet_lst">
                   <ul class="all_diet_cnt" id=snack>
                       <li>간식</li>
                       <li></li>
                       <%
                       		List<String> snackList = bookmark.getSnack();
                       		for(int i=0; i<snackList.size(); i++)
                       		{
                       			Food foodTmp = foodDao.getFoodInfo(snackList.get(i));
                		%>
                			<li id="li_bookmark"><%=foodTmp.getName()%>(<%=Float.toString(foodTmp.getServing()) + foodTmp.getMeasure()%>)</li>
                       	<%
                       			
                       		}
                      	%>
                   </ul>
               </div>
               <div class="date_sel">
               	   <input type='date' id='select_date'>
               </div>

               	<div class="btn_reset">		<%-- 정은아 부탁해 --%>
					<a href="#" onclick="clickDelBookmark('<%=loginId%>', 'loginId=<%=loginId%>&pageNum=<%=pageNum%>&category=<%=category%>&foodName=<%=foodName%>');">삭제</a>

				</div>
               <div class="save_diet">
                   <a href="#">저장하기</a>
               </div>
           </div>
           <!--모달창-->
            <div class="modal_bg"></div>
            <div class="save_modal">
               <div class="modal_cnt">
                  <h2>내 식단에 저장하시겠습니까?</h2>
                  <p></p>
               </div>
               <div class="save_modal_ok"><a href="#" onclick="clickSaveDiet('<%=loginId%>')">확인</a></div>
               <div class="save_modal_cancle">취소</div>                
            </div>            
        </div>
        <div id="contents">
        	<form action="all_diet.jsp?loginId=<%=loginId%>" method="post">
            <h2>전체 음식</h2>
            <div class="search_ctg">
                <select name="category" id="ctg">
                
                <%
                	if(category=="" || category==null || foodName.length()>0)
                	{
           		%>	
           			<option value="">전체</option>
           		
           		<%	
                	}
                	else
                	{
                %>
                	<option><%=category%></option>
                	<option value="">전체</option>
                <%	
                	}
                %>  
                    
                    <% 
                    for (int i = 0; i < partList.size(); i++) 
					{
						String part = partList.get(i); // 반환된 list에 담긴 참조값 할당
					%>
					
					<option><%=part%></option>
					
					<%	
					}
					%>
				
                </select>
            </div>
            <div class="search_sch">
            	<%
           		if(foodName==null)
           		{		
            	%>
            		<input type="text" placeholder="음식명 입력" name="foodName">
            	<%	
           		}
           		else
           		{
       			%>
        			<input type="text" value='<%=foodName%>' name="foodName">
        		<%		
           		}
            	%>
               	<input type="submit" value="검색" id="search_foods">
            </div>
            </form>
             <table class="diet_lst">
                <tr>
                	<th>번호</th>
                    <th>카테고리</th>
                    <th>음식명</th>
                    <th>1회 제공량</th>
                    <th>열량</th>
                </tr>
                <%
				if (count > 0) // 데이터베이스에 데이터가 있으면
				{ 
					int number = (currentPage - 1) * pageSize + 1; // 글 번호 순번 
					for (int i = 0; i < list.size(); i++) 
					{
						Food food = list.get(i); // 반환된 list에 담긴 참조값 할당
				%>
				
				<tr>
					<td><%=number++%></td>
					<td><%=food.getPart()%></td>
					<td>
					<a href="#" onclick="clickName('<%=loginId%>', '<%=food.getCode()%>');"><%=food.getName()%></a>
					</td>
					<td><%=food.getServing() + food.getMeasure()%></td>
					<td><%=food.getKcal()%></td>
				</tr>
                <%
					}
				} 
				else // 데이터가 없으면
				{ 
				%>
				<tr>
					<td colspan="6" align="center">없음</td>
				</tr>
				<%
				}
				%>
                <tr>
					<td colspan="6" align="center">
					<%	// 페이징  처리
						if(count > 0){
							// 총 페이지의 수
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 10;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<a href="all_diet.jsp?loginId=<%=loginId%>&pageNum=<%=startPage - 10%>&category=<%=category%>&foodName=<%=foodName%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++) // 페이지 블록 번호
							{ 
								if(i == currentPage) // 현재 페이지에는 링크를 설정하지 않음
								{ 
					%>
									[<%=i %>]
					<%									
								}
								else // 현재 페이지가 아닌 경우 링크 설정
								{ 
					%>
									<a href="all_diet.jsp?loginId=<%=loginId%>&pageNum=<%=i%>&category=<%=category%>&foodName=<%=foodName%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount) // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
							{ 
					%>
								<a href="all_diet.jsp?loginId=<%=loginId%>&pageNum=<%=startPage + 10 %>&category=<%=category%>&foodName=<%=foodName%>">[다음]</a>
					<%			
							}
						}
					%>
					</td>
				</tr>

            </table> 
        </div>
        <!--모달창-->	
        <div class='modal_bg'></div>
		<div class='food_time_modal'>
			<div class='modal_cnt'>
				<div id='food_info_modal'>
					<h2 id='choicedName'>이름</h2>
					<p>영양성분</p>
					<ul class='food_info'>
						<li>1회제공량</li>
						<li id='choicedServ'>111</li>
						<li>에너지(kcal)</li>
						<li id='choicedKcal'>222</li>
						<li>탄수화물(g)</li>
						<li id='choicedCarb'>333</li>
						<li class='sm_txt'>총당류(g)</li>
						<li id='choicedSugr'>444</li>
						<li>단백질(g)</li>
						<li id='choicedProt'>555</li>
						<li>지방(g)</li>
						<li id='choicedFat'>666</li>
						<li class='sm_txt'>총 포화지방산(g)</li>
						<li id='choicedSatf'>777</li>
						<li class='sm_txt'>트랜스지방산(g)</li>
						<li id='choicedTrnf'>888</li>
						<li>콜레스테롤(mg)</li>
						<li id='choicedCole'>999</li>
						<li>나트륨(mg)</li>
						<li id='choicedNatr'>101010</li>
						<li>수분(g)</li>
						<li id='choicedWatr'>111111</li>  
						<li>총식이섬유(g)</li>
						<li id='choicedFibr'>121212</li> 
					</ul>
				</div>
				<div id='select_time_modal'> 
					<h2>추가할 시간대 선택</h2>
					<input type='radio' id='bf' name='select' value='breakfast'>
					<label for='bf'>아침</label>
					<input type='radio' id='lc' name='select' value='lunch'>
					<label for='lc'>점심</label>
					<input type='radio' id='dn' name='select' value='dinner'>
					<label for='dn'>저녁</label>
					<input type='radio' id='sn' name='select' value='snack'>
					<label for='sn'>간식</label>
				</div>
				<div><a class='modal_ok' href="#" onclick="clickAddFood('<%=loginId %>');">추가</a></div>
				<div class='modal_cancle'>취소</div>
			</div>
			<div id='footer'>
			</div>
		</div>
	</div>     
</body>
</html>