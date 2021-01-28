$(document).ready(function(){
	$('.FBbtn').click(function(){
		location.href = '/fri/king/FBdetail.fri?target=' + $(this).children().html();
	});
	$('#LNbtn').click(function(){
		location.href = '/fri/king/noticedetail.fri?target=' + $(this).children().html();
	});
	$('.noticebtn').click(function(){
		location.href = '/fri/king/noticedetail.fri?target=' + $(this).children().html();
	});
	$('#deletenoticebtn').click(function(){
		var confirm1 = confirm('정말로 삭제하시겠습니까?');
		if(confirm1){
			$('#deletenoticeform').submit();
		}
	});
	$('#RAS').click(function(){
		var string = $('#body').val();
		if(string == ''){
			return;
		}
		var int1 = string.indexOf('\n');
		while(int1 != -1){
			$('#body').val(string.replace(/\n/ , '<br>'));
			string = $('#body').val();
			int1 = string.indexOf('\n');
		}
		$('#FBanswerform').submit();
	});
});