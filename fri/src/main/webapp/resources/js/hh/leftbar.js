$(function(){
	$('#loginbtn').click(function(){
		var inputid = $('input[name="inputid"]').val();
		if(inputid == ''){
			return;
		}
		$('#loginform').submit();
	});
	$('#fqabtn').click(function(){
		$(location).attr('href' , '/fri/joo/notice.fri?page=1');
	});
	
	$('#twitchbtn').click(function(){
		$.ajax({
			type:'GET',
			url:'/fri/hh/twitch.fri',
			dataType:'json',
			success: function (res) {
	            console.log(res);
	        }
		})
	});
});