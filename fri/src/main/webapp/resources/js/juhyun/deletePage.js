$(document).ready(function(){
	$('#sbtn').click(function(){
		var id = $('#id').val();
		if(id == ''){
			alert('조회할 ID를 입력해주세요.');
			return;
		} else{
			$('#frm').attr('action','/fri/juhyun/admin/deletePageProc.fri');
			$('#frm').submit();
		}
	});
	$('#fbtn').click(function(){
		$('.format').html();
		alert('초기화 되었습니다.');
	});
	$('#dbtn').click(function(){
		var cnt1 = $('#id').val();
		var cnt2 = $('.id').html();
		if(cnt1 != '' || cnt2 != ''){
			var access = confirm('정말 삭제 하시겠습니까?');
			
			if(access == true){
				$('#id').val($('.id').html());
				$('#frm').attr('action','/fri/juhyun/admin/delete.fri');
				$('#frm').submit();
			}else{
				return;
			}
		}else{
			alert('아이디를 입력해주세요.');
		}
	});
});