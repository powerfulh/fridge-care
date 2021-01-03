$(function(){
	var parameter = location.search;
	var parameter = parameter.substr(1);
	if(parameter == 'edit'){
		alert('수정 성공');
	}
	switch(parameter){
		case 'secessionfail':alert('탈퇴처리에 실패했어요\n시간이 오래 지난경우 세션이 끊어졌을수 있어요');
		break;
	}
	$('#inputpwre').keyup(function(){
		var pwrule = /^[a-zA-Z1-9]{6,12}$/;
		if(pwrule.test($('#inputpw').val())){
			if($('#inputpw').val() == $('#inputpwre').val()){
				$('#submitbtn').removeClass('w3-disabled');
				$('#pwrecheck').html('일치');
			}else{
				$('#submitbtn').addClass('w3-disabled');
				$('#pwrecheck').html('불일치');
			}
		}else{
			$('#submitbtn').addClass('w3-disabled');
			$('#pwrecheck').html('형식에 맞지 않음');
		}
	});
	$('#secessionbtn').click(function(){
		var SC = confirm('탈퇴하시겠습니까?');
		if(SC){
			location.href = '/fri/hh/secession.fri';
		}
	});
});
function sizecheck(input){
	if (input.files && input.files[0].size > (10 * 1024 * 1024)) {
        alert("10메가 이하만 가능합니다");
        input.value = null;
		return;
    }
	var files = input.files[0];
	var reader = new FileReader();
	reader.onload = function(e){
			$("#imgpreview").attr('src' , e.target.result);
	}
	reader.readAsDataURL(files);
}