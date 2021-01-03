$(document).ready(function(){
	$('#abtn').click(function(){
		var body = $('#body').val();
		if(body == ''){
			alert('단어를 입력해주세요');
			return;
		}else{
			$('#frm').submit();
		}
	});
});