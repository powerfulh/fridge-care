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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/fri/js/hh/main.js"></script>

<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
div.dimension1{
	height:320px;
	word-wrap:break;
}
div.dimension2{
	width:200px;
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
input.dimension1{
	width:100%;
}
input.dimension2{
	width:140px;
}
input.dimension3{
	width:90%;
	height:35px;
	margin-bottom:5px;
}
a.dimension2{
	width:200px;
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
      <c:if test="${not empty SID}">
	      <div class="w3-card w3-round w3-white">
	        <div class="w3-container">
	         <h4 class="w3-center">My Profile</h4>
	         <p class="w3-center"><img src="/fri/img/avatar/${AVT}" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
	         <hr>
	         <p><i class="fa fa-id-badge fa-fw w3-margin-right w3-text-theme"></i>${SID}</p>
	         
	         <p class="w3-btn w3-border w3-hover-blue change05bgc" id="logoutbtn"><i class="fa fa-sign-out fa-fw w3-margin-right w3-text-theme"></i> 로그아웃</p>
	        </div>
	      </div>
      </c:if>
      <br>
      <!-- 로그인 안했을때 -->
      <c:if test="${empty SID}">
	      <div class="w3-card w3-round w3-white">
	        <form class="w3-container w3-padding" method="get" action="/fri/hh/logincheck.fri" id="loginform">
	        <div class="w3-padding">
	        	<div class="inline dimension3">ID</div>
	        	<input name="inputid" class="dimension2">
	        </div>
	        <div class="w3-padding">
	        	<div class="inline dimension3">PW</div>
	        	<input name="inputpw" class="dimension2" type="password">
	        </div>
	         <div class="w3-btn w3-border w3-hover-blue change05bgc dimension2" id="loginbtn">
	         	<i class="fa fa-sign-in fa-fw w3-margin-right w3-text-theme"></i> 로그인
	         </div>
	         <a class="w3-btn w3-border w3-hover-blue change05bgc dimension2" id="joinbtn" href="/fri/hh/joinpage.fri">
	         	<i class="fa fa-user-plus fa-fw w3-margin-right w3-text-theme"></i> 회원가입
	         </a>
	        </form>
	      </div>
      </c:if>
      <br>
      
      <!-- Accordion -->
      <div class="w3-round">
		<div class="w3-blue w3-round-large w3-center dimension7 w3-padding w3-margin-top">My refri</div>
		<form action="/fri/search.fri" method="get">
			<!-- <input type="hidden" name="catagory" value="한"> -->
			<input class="w3-gray w3-round-large w3-center dimension3 w3-padding-small inline w3-button w3-hover-cyan change05bgc" type="submit" value="레시피 찾기">
		</form>
		<c:if test="${not empty SID}">
			<div class="w3-blue w3-round-large w3-center dimension7 w3-padding w3-margin-top">Our refri</div>
			<form action="/fri/recipeAdd.fri" method="get">
				<input class="w3-gray w3-round-large w3-center dimension3 w3-padding-small inline w3-button w3-hover-cyan change05bgc" type="submit" value="내 레시피 작성">
			</form>
		</c:if>
		<div class="w3-blue w3-round-large w3-center dimension7 w3-padding w3-margin-top">HQ refri</div>
		<form action="/fri/partnerBoard.fri" method="get">
			<input class="w3-gray w3-round-large w3-center dimension3 w3-padding-small inline w3-button w3-hover-cyan change05bgc" type="submit" value="파트너 레시피 보기">
		</form>
		<div class="w3-teal w3-round-large w3-center dimension7 w3-padding w3-margin-top w3-button w3-hover-cyan change05bgc">Feedback / Q &amp; A</div>
      </div>
      <br>
      
      <br>
      
      <br>
      
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
      
      <form class="w3-container w3-card w3-round w3-margin-bottom w3-margin-left w3-margin-right clickable latelyuploadbtn" method="get" action="/fri/resipiPage.fri"><br>
      	<input type="hidden" name="bno" value="${LUVO.bno}">
        <img src="/fri/img/avatar/${LUVO.tname}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">${LUVO.sdate}</span>
        <h4>${LUVO.title}</h4><br>
        <hr class="w3-clear">
        <p>${LUVO.id}</p>
          <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-col">
              <img src="/fri/upload/${LUVO.savename}" style="width:100%" alt="thumbsnail" class="w3-margin-bottom">
            </div>
        </div>
      </form>
      
      
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center w3-light-gray">
        <form class="w3-container w3-btn w3-white" method="get" action="/fri/resipiPage.fri">
        	<input type="hidden" name="bno" value="${WVO.bno}">
          <p>주간 인기 레시피</p>
          <img src="/fri/img/thumb/${WVO.tname}" alt="Thumb" style="width:100%;">
          <p><strong>${WVO.title}</strong></p>
          <p>${WVO.id}</p>
        </form>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-center w3-light-gray">
        <form class="w3-container w3-btn w3-white" method="get" action="/fri/resipiPage.fri">
        	<input type="hidden" name="bno" value="${MVO.bno}">
          <p>월간 인기 레시피</p>
          <img src="/fri/img/thumb/${MVO.tname}" alt="Thumb" style="width:100%;">
          <p><strong>${MVO.title}</strong></p>
          <p>${MVO.id}</p>
        </form>
      </div>
      <br>
      
      
      <div class="w3-card w3-round w3-white dimension1 w3-hide">
        <div class="w3-container">
        	<div class="w3-red h240 w3-margin-bottom">
	        	<p>채팅내용 w3-red 는 기능 구현후 지울거임
        	</div>
        	<input class="dimension1">
        </div>
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
  공지사항
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>
 

</body>
</html>