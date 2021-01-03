$(function(){
	var parameter = location.search;
	var parameter = parameter.substr(1);
	if(parameter == 'fail'){
		alert('세션에 저장된 아이디가 없습니다 \n여러번 시도해도 안될경우 고객센터로 문의하세요');
	}
	$('#checkbtn').click(function(){
		var inputid = $('#inputid').val();
		var inputmail = $('#inputmail').val();
		if(inputid == ''){
			return;
		}
		$.ajax({
			url:'/fri/hh/sendpwfindmail.fri' ,
			type:'POST' ,
			dataType:'json' ,
			data:{
				id:inputid ,
				mail:inputmail
			} ,
			success:function(data){
				if(data.result == 'OK'){
					alert('인증메일이 전송되었습니다');
					$('#ANdiv').removeClass('w3-hide');
					$('#inputid').attr('disabled' , true);
					$('#inputmail').attr('disabled' , true);
				}else{
					alert(data.result);
				}
			} ,
			error:function(){
				alert('잠시후 다시 시도해주십시오');
			}
		})
	});
	$('#ANcheckbtn').click(function(){
		var inputAN = $('#inputAN').val();
		if(inputAN == ''){
			return;
		}
		$.ajax({
			url:'/fri/hh/pwfindproc.fri' ,
			type:'POST' ,
			dataType:'json' ,
			data:{
				AN:inputAN
			} ,
			success:function(data){
				if(data.result == 'OK'){
					location.href = '/fri/hh/pwchange.fri';
				}else{
					alert('인증번호가 틀려요');
				}
			} ,
			error:function(){
				alert('잠시후 다시 시도해주십시오');
			}
		})
	});
	$('#inputpw').keyup(function(){
		var pwrule = /^[a-zA-Z1-9]{6,12}$/;
		if(pwrule.test($('#inputpw').val())){
			$('#pwcheck').html('');
			$('#inputpwre').attr('disabled' , false);
		}else{
			$('#submitbtn').attr('disabled' , true);
			$('#inputpwre').attr('disabled' , true);
			$('#pwcheck').html('형식에 맞지 않음');
		}
	});
	$('#inputpwre').keyup(function(){
		if($('#inputpw').val() == $('#inputpwre').val()){
			$('#submitbtn').attr('disabled' , false);
			$('#pwrecheck').html('일치');
		}else{
			$('#submitbtn').attr('disabled' , true);
			$('#pwrecheck').html('불일치');
		}
	});
	
	$('#checkbtn2').click(function(){
		var notdata = $('#nottest .ntc').not('.w3-hide').children('span').get();
		var totaldata = '';
		for(var i = 0; i < notdata.length; i++){
			totaldata += notdata[i].innerHTML + '|';
		}
		alert(totaldata);
	});
});