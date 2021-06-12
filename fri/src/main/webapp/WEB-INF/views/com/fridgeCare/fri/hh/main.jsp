<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fridgeCare</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="/fri/css/hh.css">
<link rel="stylesheet" href="/fri/css/leftside.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/fri/js/hh/main.js"></script>
<script type="text/javascript" src="/fri/js/hh/leftbar.js"></script>

<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
div.dimension1{
	height:320px;
	word-wrap:break;
}
input.dimension1{
	width:100%;
}

.clickable:hover{
	background-color:beige;
	cursor:pointer;
}
.h240{
	height:240px;
}
body{
	min-width:1020px;
}
.inline{
	display:inline-block;
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
		<h1><a href="/fri/hh/main.fri">냉장고를 부탁해!</a></h1>
	</div>
	<!-- The Grid -->
	<div class="w3-row" style="min-width:1000px">
    	<!-- Left Column -->
		<div class="w3-col m3" style="max-width:1400px; min-width:240px">
      	<!-- Profile -->
      	<!-- 로그인 안했을때 -->
	    <div class="w3-card w3-round w3-white">
	        <form class="w3-container w3-padding" method="get" action="/fri/hh/logincheck.fri" id="loginform">
		        <div class="w3-padding">
		        	<div class="inline dimension3">ID</div>
		        	<input name="inputid" class="dimension2" id="inputid">
		        	<span class="pt8 w3-margin-left">ID 기억</span>
			        <input type="checkbox" class="w3-check" name="idcookie" id="inputsetrid">
		        </div>
		        <div class="w3-padding">
		        	<div class="inline dimension3">PW</div>
		        	<input name="inputpw" class="dimension2" type="password">
		        </div>
		         <div class="w3-btn w3-border w3-hover-blue change05bgc dimension2" id="loginbtn">
		         	<i class="fa fa-sign-in fa-fw w3-margin-right w3-text-theme"></i> 로그인
		         </div>
		         <a class="w3-btn w3-border w3-hover-blue change05bgc dimension2" id="joinbtn" href="/fri/hh/joinpage.fri">
		         	<i class="fa fa-user-plus fa-fw w3-margin-right w3-text-theme"></i> 트위치 디벨로퍼
		         </a>
		         <a class="w3-btn w3-border w3-hover-blue change05bgc dimension2" id="pwfindbtn" href="/fri/hh/pwfind.fri">
		         	<i class="fa fa-user-plus fa-fw w3-margin-right w3-text-theme"></i> 비밀번호 찾기/변경
		         </a>
		         <div class="w3-btn w3-hide" id="ajaxtest">test</div>
		         <div class="w3-btn w3-hide" id="test2">mail test</div>
		         <a class="w3-btn w3-hide" href="/fri/hh/transtest.fri">trans test</a>
	        </form>
		</div>
      	<br>
      	<!-- menu sidebar -->
      	<div class="w3-round">
	      	<c:if test="${not empty ADMIN}">
				<a class="w3-teal w3-round-large w3-center w3-padding w3-button w3-hover-cyan change05bgc" href="/fri/juhyun/admin/admin.fri">관리자 페이지</a>
			</c:if>
			<div class="w3-blue w3-round-large w3-center dimension7 w3-padding w3-margin-top">twitch</div>
			<div>
				<input class="w3-round-large w3-center dimension3 w3-padding-small inline w3-button w3-light-blue w3-hover-cyan change05bgc" type="button" value="api call" id="twitchbtn">
			</div>
			<c:if test="${not empty SID}"><!-- 레시피 추가 관련 다 없앨 예정 -->
				<div class="w3-blue w3-round-large w3-center dimension7 w3-padding w3-margin-top">우리들의 냉장고!!</div>
				<form action="/fri/joo/recipeAdd.fri" method="get">
					<input class="w3-round-large w3-center dimension3 w3-padding-small inline w3-button w3-light-blue w3-hover-cyan change05bgc" type="submit" value="내 레시피 작성">
				</form>
			</c:if>
			<div class="w3-blue w3-round-large w3-center dimension7 w3-padding w3-margin-top">고급 냉장고(파트너 유저)</div>
			<form action="/fri/juhyun/partner/partner.fri" method="get">
				<input class="w3-round-large w3-center dimension3 w3-padding-small inline w3-button w3-light-blue w3-hover-cyan change05bgc" type="submit" value="파트너 레시피 보기">
			</form>
			<c:if test="${not empty SID}">
				<div class="w3-light-blue w3-round-large w3-center dimension8 w3-padding-small inline w3-button w3-hover-cyan change05bgc" id="partnerbtn">파트너 유저 신청</div>
			</c:if>
			<div class="w3-teal w3-round-large w3-center dimension7 w3-padding w3-margin-top w3-button w3-hover-cyan change05bgc" id="fqabtn">Feedback / Q &amp; A</div>
      	</div>
      	<br>
    <!-- End Left Column -->
    </div>
    <!-- Middle Column -->
    <div class="w3-col m7">
      <form class="w3-card w3-round w3-margin-left w3-margin-right clickable w3-padding" method="get" action="/fri/juhyun/recipe/resipiPage.fri" id="luvoform">
      	<div>
      		트게더 미러
      	</div>
      </form>
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center w3-light-gray">
        <form class="w3-container w3-btn w3-white" method="get" action="/fri/juhyun/recipe/resipiPage.fri" id="wvoform">
        	<input type="hidden" name="bno" value="${WVO.bno}">
          <p>주간 인기 레시피</p>
          <img src="/fri/img/thumb/${WVO.tname}" alt="Thumb" style="width:100%;">
          <p><strong>${WVO.title}</strong></p>
          <p>${WVO.id}</p>
        </form>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-center w3-light-gray">
        <form class="w3-container w3-btn w3-white" method="get" action="/fri/juhyun/recipe/resipiPage.fri" id="mvoform">
        	<input type="hidden" name="bno" value="${MVO.bno}">
          <p>월간 인기 레시피</p>
          <img src="/fri/img/thumb/${MVO.tname}" alt="Thumb" style="width:100%;">
          <p><strong>${MVO.title}</strong></p>
          <p>${MVO.id}</p>
        </form>
      </div>
      <br>
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
	<a href="/fri/king/noticelist.fri">공지사항</a>
</footer>
<footer class="w3-container w3-theme-d5">
  <p><a href="/fri/king/videotag.fri">video tag</a></p>
</footer>

</body>
</html>