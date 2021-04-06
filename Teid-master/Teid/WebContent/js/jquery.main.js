//탭메뉴
$(document).ready(function () {
    $(".tab_wrap .tab_cnt").hide();
    $(".tab_wrap .tab_cnt").eq(0).show();
    //$("ul.tab li").eq(0).addClass("selected");
    
    $(".selected").text();
    $(".tab_wrap .tab_cnt").hide();
    $(".tab_wrap .tab_cnt").eq($(".selected").index()).show();
    
    $("ul.tab li").click(function () {
        $("ul.tab li").removeClass();
        $(this).addClass("selected");
        $(".tab_wrap .tab_cnt").hide();
        $(".tab_wrap .tab_cnt").eq($(this).index()).show();
    });
});

var foodName = "";

//모달창
$(document).ready(function() {
/*
	//구버전 추가하기버튼
	clickadd = function (name){
		foodName = name;
		
        $(".modal_bg").css({"display":"block"});
        $(".food_time_modal").css({"display":"block"});
	}
*/
	clickadd = function (loginId, foodCode){
		$.ajax({
			url: "getFoodInfo.jsp",
			type: "post",
			data: {
				loginId:loginId,
				fCode:foodCode,
			},
			dataType:"JSON",
			success : function(result)
			{
				$("#choicedName").html(result[0].choicedName);
				$("#choicedServ").html(result[0].choicedServ);
				$("#choicedKcal").html(result[0].choicedKcal);
				$("#choicedCarb").html(result[0].choicedCarb);
				$("#choicedSugr").html(result[0].choicedSugr);
				$("#choicedProt").html(result[0].choicedProt);
				$("#choicedFat").html(result[0].choicedFat);
				$("#choicedSatf").html(result[0].choicedSatf);
				$("#choicedTrnf").html(result[0].choicedTrnf);
				$("#choicedCole").html(result[0].choicedCole);
				$("#choicedNatr").html(result[0].choicedNatr);
				$("#choicedWatr").html(result[0].choicedWatr);
				$("#choicedFibr").html(result[0].choicedFibr);
			},
			error : function()
			{
                alert('Error : ajax post fail');
            }
		});
		$(".modal_bg").css({"display":"block"});
        $(".food_time_modal").css({"display":"block"});
	}
	
	clickaddBookmark = function (loginId){
		var name = $("#choicedName").text();
		var serv = $("#choicedServ").text();
		var when = $("input[name='select']:checked").val();
		if(when==null)
		{
			alert("언제 먹을지 선택하세요");
			$(".modal_bg").css({"display":"block"});
        	$(".food_time_modal").css({"display":"block"});
			return;
		}
		
		$.ajax({
			url: "setBookmark.jsp",
			type: "post",
			data: {
				loginId:loginId,
				fName:name,
				when:when,
			},
			success : function(result)
			{
				
			},
			error : function()
			{
                alert('Error : ajax post fail');
            }
		});
		$("input[name='select']").prop("checked", false);
		$(".modal_bg").css({"display":"none"});
        $(".food_time_modal").css({"display":"none"});
	}
	
    $(".modal_cancle").click(function(){
        $(".modal_bg").css({"display":"none"});
        $(".food_time_modal").css({"display":"none"});
    });
	
/*	
 	//구버전 추가버튼
  	clickaddBookmark = function (loginId){
		var when = $("input[name='select']:checked").val();
		
		if(when==null)
		{
			alert("언제 먹을지 선택하세요");
			$(".modal_bg").css({"display":"block"});
        	$(".food_time_modal").css({"display":"block"});
			return;
		}
		
		$.ajax({
			url: "setBookmark.jsp",
			type: "post",
			data: {
				loginId:loginId,
				fName:foodName,
				when:when,
			},
			success : function(result)
			{
				
			},
			error : function()
			{
                alert('Error : ajax post fail');
            }
		});
        $(".modal_bg").css({"display":"none"});
        $(".select_time_modal").css({"display":"none"});
	}

    $(".modal_close").click(function(){
        $(".modal_bg").css({"display":"none"});
        $(".select_time_modal").css({"display":"none"});
    });
*/
});


$(document).keydown(function(event) {
	if (event.keyCode == '27') {
		$(".modal_bg").css({"display":"none"});
		$(".select_time_modal").css({"display":"none"});
	}
});
