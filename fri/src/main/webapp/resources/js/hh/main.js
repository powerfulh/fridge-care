$(function(){
	var parameter = location.search;
	var parameter = parameter.substr(1);
	switch(parameter){
		case 'pwchange':alert('비밀번호가 변경되었습니다');
		break;
		case 'secession':alert('탈퇴 성공');
		break;
	}
	$('#luvoform').click(function(){
		$(this).submit();
	});
	$('#wvoform').click(function(){
		$(this).submit();
	});
	$('#mvoform').click(function(){
		$(this).submit();
	});
	$('#partnerbtn').click(function(){
		$.ajax({
			url:'/fri/hh/partner.fri' ,
			type:'POST' ,
			dataType:'json' ,
			traditional:true ,
			success:function(data){
				if(data.result == 'OK'){
					var confirm1 = confirm('파트너 유저 신청이 가능합니다\n신청하시겠습니까?');
					if(confirm1){
						partnerproc();
					}
				}else{
					alert('작성글이 15개 이상이어야 파트회원 신청이 가능합니다')
				}
			} ,
			error:function(){
				alert('잠시후 다시 시도해주십시오');
			}
		})
	});
	
	$('#ajaxtest').click(function(){
		var Situat = ['aa' , 'ab' , 'bb'];
		$.ajax({
			url:'/fri/hh/ajaxtest.fri' ,
			type:'POST' ,
			dataType:'json' ,
			traditional:true ,
			data:{
				ajaxdata:Situat
			} ,
			success:function(){
				alert(Situat);
			} ,
			error:function(){
				alert('잠시후 다시 시도해주십시오');
			}
		})
	});
	$('#test2').click(function(){
		$.ajax({
			url:'/fri/hh/mailtest.fri' ,
			type:'POST' ,
			dataType:'json' ,
			data:{
				ajaxdata:'call'
			} ,
			success:function(data){
				alert(data.result);
			} ,
			error:function(){
				alert('잠시후 다시 시도해주십시오');
			}
		})
	});
});
function partnerproc(){
	$.ajax({
			url:'/fri/hh/partnerproc.fri' ,
			type:'POST' ,
			dataType:'json' ,
			success:function(data){
				if(data.result == 'OK'){
					alert('파트너 유저로 등급이 변경되었습니다')
				}else{
					alert('파트너 유저 신청에 실패했습니다')
				}
			} ,
			error:function(){
				alert('잠시후 다시 시도해주십시오');
			}
	})
}