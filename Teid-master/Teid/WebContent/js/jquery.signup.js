$(document).ready(function () {
	//var radio = $('input[name="PIC"]:checked');
	var radio = $("input[type=radio][name='PIC']");
	//alert(radio);
	radio.change(function() {
		var chkVal = $("input[type=radio][name='PIC']:checked").val();
		$("#img").attr("src", "../images/pp" + chkVal + ".png");
	});

});