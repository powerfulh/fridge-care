$(function(){
	var parameter = location.search;
	var parameter = parameter.substr(1);
	switch(parameter){
		case 'removerid':localStorage.removeItem('RID');
		break;
		case 'fail':alert('회원정보가 맞지 않습니다');
		break;
	}
	var rid = $('#saverid').html();
	if(rid != null && rid !=''){
		localStorage.setItem('RID' , rid);
	}
	$('#inputid').val(localStorage.getItem('RID'));
	var getrid = localStorage.getItem('RID');
	if(getrid != null){
		$('#inputsetrid').attr('checked' , 'true');
	}
	$('#loginbtn').click(function(){
		var inputid = $('input[name="inputid"]').val();
		if(inputid == ''){
			return;
		}
		$('#loginform').submit();
	});
	$('#logoutbtn').click(function(){
		$(location).attr('href' , '/fri/hh/logout.fri');
	});
	$('#myinfobtn').click(function(){
		$(location).attr('href' , '/fri/hh/myinfo.fri');
	});
});