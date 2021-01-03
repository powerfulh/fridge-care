$(document).ready(function(){
	$('.btn').click(function(){
		var tno = $(this).next().html();
		
		$('#bno').val(tno);
		$('#frm').submit();
	});
	
	$('.pagebtn').click(function(){
		// 어떤 버튼이 클릭됬는지 알아낸다.
		var sno = $(this).attr('id');
		
		if(!sno){
			// sno가 null 또는 Undefined 인 경우는 페이지번호 버튼이다.
			sno = $(this).text();
			alert(sno);
		}
		
		$('#nowPage').val(sno);
		$('#pfrm').submit();
	});
});