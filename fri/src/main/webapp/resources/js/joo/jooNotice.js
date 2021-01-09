$(document).ready(function(){
	$('.FBbtn').click(function(){
		location.href = '/fri/king/FBdetail.fri?target=' + $(this).children().html();
	});
});