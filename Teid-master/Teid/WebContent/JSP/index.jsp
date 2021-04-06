<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.*" %>
<%@ page import="com.food.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	String loginId = request.getParameter("loginId");
	System.out.println("loginId : " + loginId); 
	
	MemberDao memberDao = MemberDao.getInstance();
	Member loginMember = memberDao.getMemInfo(loginId);
	String service = loginMember.getService();
	if(Objects.equals(service, "null") || service==null || service=="0")
	{
		service = "1";
		System.out.println("service = \"1\";");
	}
	
	System.out.println("service : " + service);
	
	FoodDao foodDao = FoodDao.getInstance();
	
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TEID</title>
    <!-- 로그인 CSS 연결 -->
    <link rel="stylesheet" href="../css/main.css"> 
    <!-- CSS 연결 -->
    <link rel="stylesheet" href="../css/jquery.fullPage.css">
    <!-- 로그인 CSS 연결 -->
    <link rel="stylesheet" href="../css/colorbox.css">
    <!-- jquery CDN 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- JavaScript 연결 -->
    <script src="../js/jquery.main.js"></script>
    <!-- JavaScript 연결 -->
    <script src="../js/jquery.fullPage.js"></script>
    <!-- JavaScript 연결 -->
    <script src="../js/jquery.colorbox.js"></script>
    <script>
        $(document).ready(function () {
            $("#fullpage").fullpage({
                anchors: ["1st", "2st", "3st", "4st", "5st"],
                menu: "#topMenu"
            });
            $(".modal").colorbox({
                rel: 'modal'
            });
        });
    </script>
</head>
<body>
	<nav id="navTop">
        <ul id="topMenu">
            <li data-menuanchor="logo"><a href="index.jsp?loginId=<%=loginId%>"><img src="../images/Teid_logo.png" alt="logo"
                        class="img_logo"></a></li>
            <li data-menuanchor="1st"><a href="#1st">Home</a></li>
            <li data-menuanchor="2st"><a href="#2st">사이트 소개</a></li>
            <li data-menuanchor="3st"><a href="#3st">추천 식단</a></li>
            <li data-menuanchor="4st"><a href="#4st">식단왕</a></li>
            <li data-menuanchor="5st"><a href="#5st">Contact Us</a></li>
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
    <div id="fullpage">
        <div class="section pages" id="page1" data-anchor="1st">
            <div class="main_cnt" id="home">
                <img src="../images/Teid_logo.png" alt="logo" class="big_logo">
                <p>당신의 식단을 바꿔드립니다.</p>
				<a href="index.jsp?loginId=<%=loginId%>#3st">맞춤식단 고르기</a>
            </div>
        </div>
        <div class="section pages" id="page2" data-anchor="2st">
            <div class="main_cnt" id="info" >
                <p>
                <span>TEID</span>는<br> 회원 맞춤형 엄선된 식단표를 제공하고 있습니다.</p>
                <p>TEID : "DIET"의 알파벳을 거꾸로 뒤집은 단어로써,
                당신의 단조로운 식생활에 “소소하지만 확실한 활력소”를 더해주는 것을 철학으로 삼고 있습니다.<br>
       TEID와 함께 어제보다 오늘 더 건강하게 변화해가는 자신의 모습을 느껴보세요<br> 그리고 그 순간을 남겨보세요!</p>
            </div>

        </div>
        <div class="section pages" id="page3" data-anchor="3st">
            <div class="tab_wrap">
                <ul class="tab">
                <%
                String[] serviceArr = {"다이어트식","건강식","키토제닉식","저염식","비건식"};
                for(int i=0; i<5; i++)
                {
                	if(Integer.parseInt(service) == i+1)
                	{
                		System.out.println("if service : " + service);
                %>
                		<li class="selected"><a href="#"><%=serviceArr[i] %></a></li>
                <%
                	}		
                	else
                	{
                %>
                		<li><a href="#"><%=serviceArr[i] %></a></li>
                <%		
                	}
                }
                %>
<%--                    
					<li class="selected"><a href="#">다이어트식</a></li>
                    <li><a href="#">건강식</a></li>
                    <li><a href="#">키토제닉식</a></li>
                    <li><a href="#">저염식</a></li>
                    <li><a href="#">비건식</a></li>
 --%>
                </ul>
                <div class="tab_lst">
                	<%-- 다이어트식 --%>
                	<div class="tab_cnt">
	                <%
	                List<Food> lowFatFoods = foodDao.getThemeFoods("fd_fat/fd_serving < 0.005 order by rand()");
                	for(int i=0; i<24; i++)
                	{
                		Food food = lowFatFoods.get(i);
                		if(i%8 == 0)
                		{
                			if(i == 0)
                			{
	                %>
	                	<div class="tab_item_lst">
                            <ul class="tab_item_cnt">
                            	<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
	                <%	
                			}
                			else
                			{
            		%>
            					
        					</ul>
                        </div>
                        <div class="tab_item_lst">
                            <ul class="tab_item_cnt">
                            	<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
	                <%	
                			}
	                %>
	                	
	                <%		
                		}
                		else
                		{
           			%>
	           					<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
           			<%		
                		}
                	}
	                %>
	                		</ul>
	                    </div>
                	</div>

					<%-- 건강식 --%>
					<div class="tab_cnt">
	                <%
	                List<Food> highProteinFoods = foodDao.getThemeFoods("fd_protein/fd_serving > 0.25 order by rand()");
                	for(int i=0; i<24; i++)
                	{
                		Food food = highProteinFoods.get(i);
                		if(i%8 == 0)
                		{
                			if(i == 0)
                			{
	                %>
	                	<div class="tab_item_lst">
                            <ul class="tab_item_cnt">
                            	<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
	                <%	
                			}
                			else
                			{
            		%>
            					
        					</ul>
                        </div>
                        <div class="tab_item_lst">
                            <ul class="tab_item_cnt">
                            	<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
	                <%	
                			}
	                %>
	                	
	                <%		
                		}
                		else
                		{
           			%>
	           					<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
           			<%		
                		}
                	}
	                %>
	                		</ul>
	                    </div>
                	</div>
                	
                	<%-- 키토 --%>
                	<div class="tab_cnt">
	                <%
	                List<Food> ketogenicFoods = foodDao.getThemeFoods("fd_carbohydrate/fd_serving < 0.02 AND fd_fat/fd_serving > 0.05 AND fd_fiber/fd_serving > 0.0005 order by rand()");
                	for(int i=0; i<24; i++)
                	{
                		Food food = ketogenicFoods.get(i);
                		if(i%8 == 0)
                		{
                			if(i == 0)
                			{
	                %>
	                	<div class="tab_item_lst">
                            <ul class="tab_item_cnt">
                            	<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
	                <%	
                			}
                			else
                			{
            		%>
            					
        					</ul>
                        </div>
                        <div class="tab_item_lst">
                            <ul class="tab_item_cnt">
                            	<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
	                <%	
                			}
	                %>
	                	
	                <%		
                		}
                		else
                		{
           			%>
	           					<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
           			<%		
                		}
                	}
	                %>
	                		</ul>
	                    </div>
                	</div>
                	 
                	<%-- 저염식 --%>
                	<div class="tab_cnt">
	                <%
	                List<Food> lowNatriumFoods = foodDao.getThemeFoods("fd_part NOT IN('수산가공품') AND (fd_natrium/1000)/fd_serving < 0.0008 order by rand()");
                	for(int i=0; i<24; i++)
                	{
                		Food food = lowNatriumFoods.get(i);
                		if(i%8 == 0)
                		{
                			if(i == 0)
                			{
	                %>
	                	<div class="tab_item_lst">
                            <ul class="tab_item_cnt">
                            	<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
	                <%	
                			}
                			else
                			{
            		%>
            					
        					</ul>
                        </div>
                        <div class="tab_item_lst">
                            <ul class="tab_item_cnt">
                            	<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
	                <%	
                			}
	                %>
	                	
	                <%		
                		}
                		else
                		{
           			%>
	           					<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
           			<%		
                		}
                	}
	                %>
	                		</ul>
	                    </div>
                	</div>
                	
                	<%-- 비건식 --%>
                	<div class="tab_cnt">
	                <%
	                List<Food> veganFoods = foodDao.getThemeFoods("fd_part like '%채소%' AND fd_part NOT like '%탕%' AND fd_part NOT like '%전골%' order by rand()");
                	for(int i=0; i<24; i++)
                	{
                		Food food = veganFoods.get(i);
                		if(i%8 == 0)
                		{
                			if(i == 0)
                			{
	                %>
	                	<div class="tab_item_lst">
                            <ul class="tab_item_cnt">
                            	<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
	                <%	
                			}
                			else
                			{
            		%>
            					
        					</ul>
                        </div>
                        <div class="tab_item_lst">
                            <ul class="tab_item_cnt">
                            	<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
	                <%	
                			}
	                %>
	                	
	                <%		
                		}
                		else
                		{
           			%>
	           					<li><%=food.getName() + " (" + food.getServing() + food.getMeasure() + ")"%></li>
	                            <li class="add"><a href="#" onclick="clickadd('<%=loginId%>', '<%=food.getCode()%>');">추가하기</a></li>
           			<%		
                		}
                	}
	                %>
	                		</ul>
	                    </div>
                	</div>
                        
                    
                </div>
            </div>
            <div class="all_diet">
            <%
            if(loginId == null || Objects.equals(loginId, "null"))
        	{
	        %>
	        	<a href="login.jsp">전체 식단 보러가기</a>
	        <%		
        	}
            else
            {
            %>
           		<a href="all_diet.jsp?loginId=<%=loginId%>">전체 식단 보러가기</a>
            <%
            }
            %>
                
            </div>
            <!-- 모달창-->
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
					<div><a class='modal_ok' href="#" onclick="clickaddBookmark('<%=loginId %>');">추가</a></div>
					<div class='modal_cancle'>취소</div>
				</div>
				<div id='footer'>
				</div>
			</div>
			
<%--
			<!-- 모달창 구버전 -->
			<div class="modal_bg"></div>
            <div class="select_time_modal">
                <div class="modal_cnt">
                    <h2>추가할 시간대 선택</h2>
                    <input type="radio" id="bf" name="select" value="breakfast">
                    <label for="bf">아침</label>
                    <br>
                    <input type="radio" id="lc" name="select" value="lunch">
                    <label for="lc">점심</label>
                    <br>
                    <input type="radio" id="dn" name="select" value="dinner">
                    <label for="dn">저녁</label>
                    <br>
                    <input type="radio" id="sn" name="select" value="snack">
                    <label for="sn">간식</label>
                </div>
                <div class="modal_close">취소</div>
                <div class="modal_ok"><a href="#" onclick="clickaddBookmark('<%=loginId %>');">추가</a></div>
            </div>
 --%>
        </div>
        <div class="section pages" id="page4" data-anchor="4st">
            <div class="main_cnt" id="diet">
                <p>식단왕</p>
                <p>실시간 식단왕은 누구일까요?</p>
                <a href="ranking.jsp?loginId=<%=loginId%>">랭킹보러가기</a>
            </div>
            
            <% //List<Member> list = (List<Member>)request.getAttribute("list");
	        MemberDao md = MemberDao.getInstance();
	        List<Member> list = md.getMemberScore();
	        %>
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
        <div class="section pages" id="page5" data-anchor="5st">
            <div class="main_cnt" id="contact">
                <div class="contact_title">
                    <p>Contact Us</p>
                    <p>궁금하신 점은 문의해주세요!</p>
                </div>
                <div class="contact_cnt">
                    <div class="contact_address">
                        <img src="../images/img_location.png" alt="location">
                        <p>서울특별시 강서구 화곡로 179 대한상공회의소 서울기술교육센터</p>
                    </div>
                    <div class="contact_phone">
                        <img src="../images/img_phone.png" alt="phone">
                        <p>02)311-1000</p>
                    </div>
                    <div class="contact_email">
                        <img src="../images/img_email.png" alt="email">
                        <p>www.kccistc.net</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<!-- 테스트용 주석임 무시해도됌 -->
