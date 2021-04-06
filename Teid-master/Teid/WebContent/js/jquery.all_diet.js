//모달창
$(document).ready(function() {
    $(".save_diet").click(function(){
    	var date = $('#select_date').val();
        var breakfast = $("#breakfast").children().eq(2).text();
        var lunch = $("#lunch").children().eq(2).text();
        var dinner = $("#dinner").children().eq(2).text();
        var snack = $("#snack").children().eq(2).text();
        
        if(breakfast=="" && lunch=="" && dinner=="" && snack=="")
        {
        	alert("메뉴를 선택하세요");
        	return;
        }
        if(date=="")
        {
        	alert("날짜를 선택하세요");
        	return;
        }
        $(".modal_bg").css({"display":"block"});
        $(".save_modal").css({"display":"block"});
    });
    
	clickSaveDiet = function (loginId){
		var date = $('#select_date').val();
    	$.ajax({
			url: "setDiet.jsp",
			type: "get",
			data: {
				//id:id,
				loginId:loginId,
				date:date,
			},
			success : function(result)
			{
				
			},
			error : function()
			{
                alert('Error : ajax post fail!!');
            }
		});
    	$(".modal_bg").css({"display":"none"});
        $(".save_modal").css({"display":"none"});
	}

/*    $(".save_modal_ok").click(function(){
    	var date = $('#select_date').val();
    	$.ajax({
			url: "setDiet.jsp",
			type: "get",
			data: {
				//id:id,
				date:date,
			},
			success : function(result)
			{
				
			},
			error : function()
			{
                alert('Error : ajax post fail!!');
            }
		});
    	$(".modal_bg").css({"display":"none"});
        $(".save_modal").css({"display":"none"});
        //location.replace("mypage.jsp")
    });
*/   
    $(".save_modal_cancle").click(function(){
        $(".modal_bg").css({"display":"none"});
        $(".save_modal").css({"display":"none"});
    });
    
    clickDelBookmark = function (loginId, param){
    	
		$.ajax({
			url: "delBookmark.jsp",
			type: "post",
			data: {
				loginId:loginId,
			},
			success : function(result)
			{
				var arr = document.querySelectorAll("#li_bookmark");
				for (var i=0; i<arr.length; i++){
				  	arr[i].remove();
				}
			},
			error : function()
			{
                alert('Error : ajax post fail');
            }
		});

		location.replace("all_diet.jsp?" + param);
	}
});

$(document).ready(function() {
	
	clickName = function (loginId, foodCode){
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
	
	clickAddFood = function (loginId){
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
				if(when=='breakfast')
				{
					$("#breakfast").append("<li>" + name + "("+ serv + ")</li>");
				}
				else if(when=='lunch')
				{
					$("#lunch").append("<li>" + name + "("+ serv + ")</li>");
				}
				else if(when=='dinner')
				{
					$("#dinner").append("<li>" + name + "("+ serv + ")</li>");
				}
				else if(when=='snack')
				{
					$("#snack").append("<li>" + name + "("+ serv + ")</li>");
				}
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

});



$(document).keydown(function(event) {
	if (event.keyCode == '27') {
		$(".modal_bg").css({"display":"none"});
		$(".food_time_modal").css({"display":"none"});
        $(".save_modal").css({"display":"none"});
	}
});



