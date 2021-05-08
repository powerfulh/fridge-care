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
			url:'https://api.twitch.tv/helix/search/channels?query=captainrabbit_',
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("client-id","xfgs4yoqyurihzrmpwr5cya3982qfx");
	            xhr.setRequestHeader("Authorization","Bearer 2gbdx6oar67tqtcmt49t3wpcgycthx");
	        },
			success: function (res) {
	            console.log(res);
	        }
		})
	});
});