$(document).ready(function(){
	$('#sabtn1').click(function(){
		$('#second').css('display', 'block');
	});
	$('#sabtn2').click(function(){
		var tmp = $('#thumb').val();
		var emptycheck = $('#title').val();
		if(!tmp){
			alert('썸네일이 등록되지 않았습니다.');
			return;
		}
		if(emptycheck == ''){
			alert('제목을 적지 않았습니다');
			return;
		}
		emptycheck = $('#category').val();
		if(emptycheck == '#'){
			alert('요리종류가 정해지지 않았습니다');
			return;
		}
		emptycheck = $('.boardpart').get();
		imgscheck = $('input[name="image"]').get();
		for(var i = 0; i < emptycheck.length; i++){
			var bpbody = emptycheck[i].value;
			if(bpbody == ''){
				emptycheck[i].setAttribute('disabled' , true);
			}
		}
		for(var i = 0; i < imgscheck.length; i++){
			if(imgscheck[i].value == ''){
				alert('모든 조리과정에는 이미지 첨부가 필요합니다');
				for(var i = 0; i < emptycheck.length; i++){
					emptycheck[i].removeAttribute('disabled');
				}
				return;
			}
		}
		emptycheck = $('.boardpart').not('.boardpart[disabled]').get();
		for(var i = 0; i < emptycheck.length; i++){
			var bpbody = emptycheck[i].value;
		}
		if(emptycheck.length == 0){
			alert('조리과정을 적지 않았습니다');
			emptycheck = $('.boardpart').get();
			for(var i = 0; i < emptycheck.length; i++){
				emptycheck[i].removeAttribute('disabled');
			}
			return;
		}
	//	alert('여기까지 오면 서브밋');
		$('#frm').submit();
	});
	
	$('#inbtn').click(function(){
		var txt = $('.inbox').html();
		$('#selfr').append(
			'<select class="inbox w3-col m7 txt14 mabottom" name="inboxList">'+txt+'</select>'
		);
	});
	
	var txt2 = $('#reci').html();
	$('#rebtn').click(function(){
		$('#reci').append(
			txt2
		);
		$('.image').off();
		$('.image').change(function(e){
			try{
				var ipath = URL.createObjectURL(e.target.files[0]);
				$(this).next().next().attr('src', ipath);
				var tmp2 = $(this).val();
				tmp2 = tmp2.substring(tmp2.lastIndexOf('\\') + 1);
				$(this).next().val(tmp2);
				$(this).next().attr('disabled' , false);
			}catch(error){
				$(this).next().attr('disabled' , true);
				$(this).next().next().attr('src', '/fri/img/upload/noimage.jpg');
			}
		});
	});
	
	$('#thumb').change(function(e){
		var ipath = URL.createObjectURL(e.target.files[0]);
		$('#tImg').attr('src', ipath);
	});
	
	$('.image').change(function(e){
		try{
			var ipath = URL.createObjectURL(e.target.files[0]);
			$(this).next().next().attr('src', ipath);
			var tmp2 = $(this).val();
			tmp2 = tmp2.substring(tmp2.lastIndexOf('\\') + 1);
			$(this).next().val(tmp2);
			$(this).next().attr('disabled' , false);
		}catch(error){
			$(this).next().attr('disabled' , true);
			$(this).next().next().attr('src', '/fri/img/upload/noimage.jpg');
		}
	});
	
});