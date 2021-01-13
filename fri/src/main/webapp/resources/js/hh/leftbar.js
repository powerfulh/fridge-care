$(function(){
	var parameter = location.search;
	var parameter = parameter.substr(1);
	var PC = parameter.indexOf('removerid'); // parameter check
	if(PC != -1){
		localStorage.removeItem('RID');
	}
	PC = parameter.indexOf('fail');
	if(PC != -1){
		alert('회원정보가 맞지 않습니다');
	}
	PC = parameter.indexOf('deleteR');
	if(PC != -1){
		alert('레시피가 삭제되었습니다');
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
	$('#fqabtn').click(function(){
		$(location).attr('href' , '/fri/joo/notice.fri');
	});
});