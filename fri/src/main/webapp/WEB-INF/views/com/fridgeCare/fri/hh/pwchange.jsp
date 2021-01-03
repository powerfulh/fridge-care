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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/fri/js/hh/leftbar.js"></script>
<script type="text/javascript" src="/fri/js/hh/pwfind.js"></script>
<style>
div.dimension1{
	width:110px;
	height:50px;
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
	width:300px;
	height:34px;
	margin:8px;
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
select.dimension1{
	width:200px;
	height:34px;
	margin:8px;
}


.clickable:hover{
	background-color:beige;
	cursor:pointer;
}
.floatleft{
	float:left;
}
body{
	min-width:900px;
}
.margin8{
	margin:8px;
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
<c:if test="${not empty sessionScope.SID}">
	<c:redirect url="/"></c:redirect>
</c:if>
<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px; min-width:800px;">    
	<div class="w3-col w3-card w3-margin-bottom w3-round">
		<h1><a href="/fri/hh/main.fri">냉장고를 부탁해!</a></h1>
	</div>
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
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
      
      <!-- menu sidebar -->
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
		<form action="/fri/juhyun/partner/partner.fri" method="get">
			<input class="w3-gray w3-round-large w3-center dimension3 w3-padding-small inline w3-button w3-hover-cyan change05bgc" type="submit" value="파트너 레시피 보기">
		</form>
		<div class="w3-teal w3-round-large w3-center dimension7 w3-padding w3-margin-top w3-button w3-hover-cyan change05bgc">Feedback / Q &amp; A</div>
      </div>
      <br>
    </div>
    
    
    <!-- Middle Column --> <!-- 작업할 곳 -->
    <div class="w3-col m9" style="min-width:700px">
      
      <form class="w3-container w3-card w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding" method="get" action="/fri/hh/pwchangeproc.fri">
      	<h2>새로운 비밀번호 설정</h2>
		<div class="w3-col m10 w3-margin-left" style="min-width:660px">
			<div class="dimension1 w3-padding floatleft w3-right-align">PW</div>
			<input name="inputpw" class="floatleft dimension1" id="inputpw" required type="password">
			<div class="w3-padding floatleft w3-right-align" id="pwcheck">6자 이상의 대소문자 포함</div>
		</div>
		<div class="w3-col m10 w3-margin-left" style="min-width:660px">
			<div class="dimension1 w3-padding floatleft w3-right-align">PW확인</div>
			<input class="floatleft dimension1" required id="inputpwre" type="password">
			<div class="w3-padding floatleft w3-right-align" id="pwrecheck"></div>
		</div>
		<div class="w3-col m10 w3-center" style="min-width:660px">
			<input class="w3-light-blue w3-round-large w3-center w3-padding w3-button w3-hover-cyan change05bgc margin8" type="submit" id="submitbtn" disabled>
		</div>
      </form>
      
    <!-- End Middle Column -->
    </div>
    
    
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