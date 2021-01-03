$(function(){
	$('#idcheckbtn').click(function(){
		var sid = $('#inputid').val();
		var idrule = /^[a-zA-Z0-9]{3,8}$/;
		if(!idrule.test(sid)){
			alert('아이디는 3~8자 영어여야 합니다')
			return;
		}
		$.ajax({
			url:'/fri/hh/idCheck.fri' ,
			type:'POST' ,
			dataType:'json' ,
			data:{
				id:sid
			} ,
			success:function(data){
				if(data.result == 'OK'){
					var c = confirm('사용가능한 아이디입니다\n사용하시겠습니까?');
					if(c){
						$('#idcheckbtn').addClass('w3-hide');
						$('#idresetbtn').removeClass('w3-hide');
						$('#inputid').attr('readonly' , true);
						$('#submitbtn').attr('disabled' , false);
					}else{
						$('#submitbtn').attr('disabled' , true);
					}
				}else{
					alert('이미 사용중인 아이디입니다');
					$('#submitbtn').attr('disabled' , true);
				}
			} ,
			error:function(){
				alert('잠시후 다시 시도해주십시오');
			}
		})
	});
	$('#idresetbtn').click(function(){
		$('#idresetbtn').addClass('w3-hide');
		$('#idcheckbtn').removeClass('w3-hide');
		$('#submitbtn').attr('disabled' , true);
		$('#inputid').attr('readonly' , false);
	});
	$('#mailcheckbtn').click(function(){
		var smail = $('#inputmail').val();
		if(smail.length < 1){
			return;
		}
		$.ajax({
			url:'/fri/hh/mailcheck.fri' ,
			type:'POST' ,
			dataType:'json' ,
			data:{
				mail:smail
			} ,
			success:function(data){
				if(data.result == 'OK'){
					var c = confirm('사용가능한 메일입니다\n사용하시겠습니까?');
					if(c){
					//	$('#mailcheckbtn').addClass('w3-hide');
						$('#submitbtn').attr('disabled' , false);
					}else{
						$('#submitbtn').attr('disabled' , true);
					}
				}else{
					alert('이미 사용중인 메일입니다');
					$('#submitbtn').attr('disabled' , true);
				}
			} ,
			error:function(){
				alert('잠시후 다시 시도해주십시오');
			}
		})
	});
	$('#inputmail').keyup(function(){
		$('#submitbtn').attr('disabled' , true);
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