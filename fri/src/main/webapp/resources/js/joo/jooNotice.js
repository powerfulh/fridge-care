$(document).ready(function(){
	$('.FBbtn').click(function(){
		location.href = '/fri/king/FBdetail.fri?target=' + $(this).children().html();
	});
	$('#LNbtn').click(function(){
		location.href = '/fri/king/noticedetail.fri?target=' + $(this).children().html();
	});
});