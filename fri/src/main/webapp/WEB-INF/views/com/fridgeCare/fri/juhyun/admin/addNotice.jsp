<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="/fri/css/my.css">
<link rel="stylesheet" type="text/css" href="/fri/css/w3.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/fri/js/juhyun/addNoticeProc.js"></script>

<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
input.dimension2{
	width:140px;
}
div.dimension3{
	width:25px;
}
div.dimension7{
	height:40px;
	margin-bottom:5px;
}
div.dimension8{
	width:90%;
	height:35px;
	margin-bottom:5px;
}


.clickable:hover{
	background-color:beige;
	cursor:pointer;
}
.inline{
	display:inline-block;
}

span.inactivepage{
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .5s;
	border: 1px solid #ddd;
}
span.inactivepage:hover{
	background-color: yellow;
}
span.activepage{
	float: left;
	padding: 8px 16px;
	background-color: green;
	color: white;
	border: 1px solid #4CAF50;
}
.change05bgc{
	transition: background-color .5s;
}
</style>
</head>
<body class="">


<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<div class="w3-col w3-card w3-margin-bottom w3-round">
		<h1><a href="/fridgeCare/">냉장고를 부탁해!</a></h1>
	</div>
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile --> <!-- 로그인 한 경우 hide 클라스를 지워준다 -->
      <div class="w3-card w3-round w3-white w3-hide">
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         <p class="w3-center"><img src="/cls/img/avatar/m3.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ID</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> Loc</p>
         <p class="w3-btn w3-border w3-hover-blue change05bgc"><i class="fa fa-edit fa-fw w3-margin-right w3-text-theme"></i> edit</p>
        </div>
      </div>
      <br>
      <!-- 로그인 안했을때 -->
      <div class="w3-card w3-round w3-white">
        <form class="w3-container w3-padding">
        <div class="w3-padding">
        	<div class="inline dimension3">ID</div>
        	<input name="inputid" class="dimension2">
        </div>
        <div class="w3-padding">
        	<div class="inline dimension3">PW</div>
        	<input name="inputid" class="dimension2">
        </div>
         <div class="w3-btn w3-border w3-hover-blue change05bgc dimension2" id="loginbtn">
         	<i class="fa fa-sign-in fa-fw w3-margin-right w3-text-theme"></i> 로그인
         </div>
         <div class="w3-btn w3-border w3-hover-blue change05bgc dimension2">
         	<i class="fa fa-user-plus fa-fw w3-margin-right w3-text-theme"></i> 회원가입
         </div>
        </form>
      </div>
      <br>
      
      <!-- Accordion -->
      <div class="w3-round">
		<div class="w3-blue w3-round-large w3-center dimension7 w3-padding w3-margin-top">My refri</div>
		<div class="w3-gray w3-round-large w3-center dimension8 w3-padding-small inline w3-button w3-hover-cyan change05bgc">c1</div>
		<div class="w3-gray w3-round-large w3-center dimension8 w3-padding-small inline w3-button w3-hover-cyan change05bgc">c2</div>
		<div class="w3-gray w3-round-large w3-center dimension8 w3-padding-small inline w3-button w3-hover-cyan change05bgc">c3</div>
		<div class="w3-gray w3-round-large w3-center dimension8 w3-padding-small inline w3-button w3-hover-cyan change05bgc">c4</div>
		<div class="w3-blue w3-round-large w3-center dimension7 w3-padding w3-margin-top">Our refri</div>
		<div class="w3-light-blue w3-round-large w3-center dimension8 w3-padding-small inline w3-button w3-hover-cyan change05bgc">submit</div>
		<div class="w3-light-blue w3-round-large w3-center dimension8 w3-padding-small inline w3-button w3-hover-cyan change05bgc">view</div>
		<div class="w3-blue w3-round-large w3-center dimension7 w3-padding w3-margin-top">HQ refri</div>
		<div class="w3-light-blue w3-round-large w3-center dimension8 w3-padding-small inline w3-button w3-hover-cyan change05bgc">regist</div>
		<div class="w3-light-blue w3-round-large w3-center dimension8 w3-padding-small inline w3-button w3-hover-cyan change05bgc">view</div>
		<div class="w3-teal w3-round-large w3-center dimension7 w3-padding w3-margin-top w3-button w3-hover-cyan change05bgc">Feedback / Q &amp; A</div>
      </div>
      <br>
      
      <br>
      
      
    
    <!-- End Left Column -->
    </div>
    <!-- Middle Column --> <!-- 작업할 곳 -->
    <div class="w3-col m3 w3-button w3-border" id="noticebtn">공지사항</div>
    <div class="w3-col m3 w3-button w3-border" id="qnabtn">QnA</div>
    <div class="w3-col m3 w3-button w3-border" id="fnqbtn">FAQ</div>
    <form method="POST" action="/fri/juhyun/admin/addNoticeProc.fri" class="w3-col m9 w3-hide" id="frm1">
    	<div class="w3-col w3-center">
	    	<div class="w3-col m3 w3-margin">공지사항 제목 </div>
	    	<input class="w3-col m7 w3-gray w3-margin" id="title" name="title">
    	</div>
    	<div class="w3-col w3-center w3-border">
	    	<div class="w3-col w3-margin">공지 내용 </div>
	    	<div class="w3-col m1"><p></p></div>
	    	<input class="w3-col m10" style="height: 400px;" id="body" name="body">
	    	<div class="w3-col m5"><p></p></div>
	    	<div class="w3-col m2 w3-button w3-border w3-red w3-hover-orange w3-border-black w3-round-xxlarge w3-margin" id="wbtn1">등록</div> 
    	</div>
    </form>
    
    <form method="POST" action="/fri/juhyun/admin/addQnAProc.fri" class="w3-col m9 w3-hide" id="frm2">
    	<div class="w3-col w3-center">
	    	<div class="w3-col w3-margin">QnA 질문 </div>
	    	<div class="w3-col m2 w3-margin-left"><p></p></div>
	    	<input class="w3-col m7 w3-gray w3-margin" style="height: 400px;" id="title" name="title">
    	</div>
    	<div class="w3-col w3-center w3-border">
	    	<div class="w3-col w3-margin">답변 </div>
	    	<div class="w3-col m1"><p></p></div>
	    	<input class="w3-col m10" style="height: 400px;" id="body" name="body">
	    	<div class="w3-col m5"><p></p></div>
	    	<div class="w3-col m2 w3-button w3-border w3-red w3-hover-orange w3-border-black w3-round-xxlarge w3-margin" id="wbtn2">등록</div> 
    	</div>
    </form>
    
    <form method="POST" action="/fri/juhyun/admin/addFAQProc.fri" class="w3-col m9 w3-hide" id="frm3">
    	<div class="w3-col w3-center">
	    	<div class="w3-col m3 w3-margin">FAQ 제목 </div>
	    	<input class="w3-col m7 w3-gray w3-margin" id="title" name="title">
    	</div>
    	<div class="w3-col w3-center w3-border">
	    	<div class="w3-col w3-margin">내용 </div>
	    	<div class="w3-col m1"><p></p></div>
	    	<input class="w3-col m10" style="height: 400px;" id="body" name="body">
	    	<div class="w3-col m5"><p></p></div>
	    	<div class="w3-col m2 w3-button w3-border w3-red w3-hover-orange w3-border-black w3-round-xxlarge w3-margin" id="wbtn3">등록</div> 
    	</div>
    <!-- End Middle Column -->
    </form>
    
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>Footer</h5>
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

</body>
</html>