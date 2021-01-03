$(document).ready(function(){
	
	$('#wbtn1').click(function(){
		$('#frm1').submit();
	});
	$('#wbtn2').click(function(){
		$('#frm2').submit();
	});
	$('#wbtn3').click(function(){
		$('#frm3').submit();
	});
	
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
});