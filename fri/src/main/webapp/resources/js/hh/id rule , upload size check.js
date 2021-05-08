$(function(){
	$('#idcheckbtn').click(function(){
		var sid = $('#inputid').val();
		var idrule = /^[a-zA-Z0-9]{3,8}$/;
		if(!idrule.test(sid)){
			alert('아이디는 3~8자 영어여야 합니다')
			return;
		}
	});
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
});
function sizecheck(input){
	 if (input.files && input.files[0].size > (10 * 1024 * 1024)) {
        alert("10메가 이하만 가능합니다");
        input.value = null;
    }
}