$(document).ready(function(){
	var parameter = location.search;
	var parameter = parameter.substr(1);
	switch(parameter){
		case 'add':alert('성공적으로 추가되었습니다');
		break;
	}
	$('#noticebtn').click(function(){
		$('#frm1').removeClass("w3-hide");
		$('#qnabtn').removeClass("w3-hide");
		$('#faqbtn').removeClass("w3-hide");
		
		$('#noticebtn').addClass('w3-hide');
		$('#frm2').addClass('w3-hide');
		$('#frm3').addClass('w3-hide');
	});
	$('#qnabtn').click(function(){
		$('#frm2').removeClass("w3-hide");
		$('#noticebtn').removeClass("w3-hide");
		$('#faqbtn').removeClass("w3-hide");
		
		$('#qnabtn').addClass('w3-hide');
		$('#frm1').addClass('w3-hide');
		$('#frm3').addClass('w3-hide');
	});
	$('#faqbtn').click(function(){
		$('#frm3').removeClass("w3-hide");
		$('#noticebtn').removeClass("w3-hide");
		$('#qnabtn').removeClass("w3-hide");
		
		$('#faqbtn').addClass('w3-hide');
		$('#frm1').addClass('w3-hide');
		$('#frm2').addClass('w3-hide');
	});
	$('#RAS').click(function(){
		var string = $('#body').val();
		var int1 = string.indexOf('\n');
		while(int1 != -1){
			$('#body').val(string.replace(/\n/ , '<br>'));
			string = $('#body').val();
			int1 = string.indexOf('\n');
		}
		$('#frm1').submit();
	});
});