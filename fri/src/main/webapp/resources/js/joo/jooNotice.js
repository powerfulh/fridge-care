$(document).ready(function(){
	$('.cont').click(function(){
//		$('.body').css('display', 'none');
		var sno = $(this).attr('id');
		var el = $(this);
		var tmp = $(el).children().eq(4).html();
		if(!tmp){
			$.ajax({
				url: '/fri/joo/noticeBody.fri',
				type: 'POST',
				dataType: 'json',
				data: {
					nno: sno
				},
				success: function(obj){
					//$('.mbtn').css('display','none');
					$(el).children().eq(0).children().eq(3).text(obj.nclick);
					$(el).children().eq(1).children().eq(0).text(obj.nbody);
					$(el).children().eq(1).stop().slideDown(200);
					if(obj.subbody == null){
					} else{
						$('.mbtn').css('display','none');
						$(el).children().eq(2).text(obj.subbody);
						$(el).children().eq(2).stop().slideDown(200);
					}
					/*$(el).children().eq(2).css('display', 'none');*/
				},
				error: function(){
					alert('### error ###')
				}
			});
		} else {
			$(el).children().last().stop().slideDown(200);
		}
	});
	
	$('.nbtn').click(function(){
		$('.faq').css('display','none');
		$('.qna').css('display','none');
		$('.notice').css('display','block');
	});
	$('.fbtn').click(function(){
		$('.notice').css('display','none');
		$('.qna').css('display','none');
		$('.faq').css('display','block');
	});
	$('.qbtn').click(function(){
		$('.notice').css('display','none');
		$('.faq').css('display','none');
		$('.qna').css('display','block');
	});
	$('.mbtn').click(function(){
		var tno = $(this).parent().parent().attr('id');
		$('#nupno').val(tno);
		$(this).parent().parent().next().css('display','block');
	});
	$('.wrbtn').click(function(){
		var tno = $(this).parent().parent().prev().attr('id');
		var tid = '#w' + tno;
		var tbody = $(tid).val();
		$('#nupno').val(tno);
		$('#nbody').val(tbody);
		$('#frm1').submit();
	});
	$('.rbtn').click(function(){
		$(this).parent().parent().css('display','none');
	});
	
});