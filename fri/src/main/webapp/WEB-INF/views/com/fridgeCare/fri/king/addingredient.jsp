<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="/fri/css/leftside.css">
<link rel="stylesheet" type="text/css" href="/fri/css/w3.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/fri/js/juhyun/addNoticeProc.js"></script>
<script type="text/javascript" src="/fri/js/hh/leftbar.js"></script>

<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}

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
		<h1><a href="/fri/hh/main.fri">냉장고를 부탁해!</a></h1>
	</div>
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3" style="max-width:1400px; min-width:240px">
      <!-- Profile -->
      <c:if test="${not empty SID}">
      	<span class="w3-hide" id="saverid">${param.setrid}</span>
	      <div class="w3-card w3-round w3-white">
	      	<c:if test="${GRADE == 1}">
		        <div class="w3-container">
		         <h4 class="w3-center">My Profile</h4>
		         <p class="w3-center"><img src="/fri/img/avatar/${AVT}" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
		         <hr>
		         <p><i class="fa fa-id-badge fa-fw w3-margin-right w3-text-theme"></i>${SID}</p>
		         <p class="w3-btn w3-border w3-hover-blue change05bgc" id="myinfobtn"><i class="fa fa-info fa-fw w3-margin-right w3-text-theme"></i> 내 정보 보기</p>
		         <p class="w3-btn w3-border w3-hover-blue change05bgc" id="logoutbtn"><i class="fa fa-sign-out fa-fw w3-margin-right w3-text-theme"></i> 로그아웃</p>
		        </div>
	      	</c:if>
	      	<c:if test="${GRADE == 2}">
		        <div class="w3-container w3-yellow">
		         <h4 class="w3-center">My Profile</h4>
		         <p class="w3-center"><img src="/fri/img/avatar/${AVT}" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
		         <hr>
		         <p><i class="fa fa-id-badge fa-fw w3-margin-right w3-text-theme"></i>${SID}</p>
		         <p class="boldfont"><i class="fa fa-check fa-fw w3-margin-right w3-text-theme"></i>파트너 유저</p>
		         <p class="w3-btn w3-border w3-hover-blue change05bgc" id="myinfobtn"><i class="fa fa-info fa-fw w3-margin-right w3-text-theme"></i> 내 정보 보기</p>
		         <p class="w3-btn w3-border w3-hover-blue change05bgc" id="logoutbtn"><i class="fa fa-sign-out fa-fw w3-margin-right w3-text-theme"></i> 로그아웃</p>
		        </div>
	      	</c:if>
	      </div>
      </c:if>
      <!-- 로그인 안했을때 -->
      <c:if test="${empty SID}">
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
	         	<i class="fa fa-user-plus fa-fw w3-margin-right w3-text-theme"></i> 회원가입
	         </a>
	         <a class="w3-btn w3-border w3-hover-blue change05bgc dimension2" id="pwfindbtn" href="/fri/hh/pwfind.fri">
	         	<i class="fa fa-user-plus fa-fw w3-margin-right w3-text-theme"></i> 비밀번호 찾기/변경
	         </a>
	         <div class="w3-btn w3-hide" id="ajaxtest">test</div>
	         <div class="w3-btn w3-hide" id="test2">mail test</div>
	         <a class="w3-btn w3-hide" href="/fri/hh/transtest.fri">trans test</a>
	        </form>
	      </div>
      </c:if>
      <br>
      
      <!-- menu sidebar -->
      <div class="w3-round">
      	<c:if test="${not empty ADMIN}">
			<a class="w3-teal w3-round-large w3-center w3-padding w3-button w3-hover-cyan change05bgc" href="/fri/juhyun/admin/admin.fri">관리자 페이지</a>
		</c:if>
		<div class="w3-blue w3-round-large w3-center dimension7 w3-padding w3-margin-top">나의 냉장고!</div>
		<form action="/fri/hyunuk/search.fri" method="get">
			<input class="w3-round-large w3-center dimension3 w3-padding-small inline w3-button w3-light-blue w3-hover-cyan change05bgc" type="submit" value="레시피 찾기">
		</form>
		<c:if test="${not empty SID}">
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
    <!-- Middle Column --> <!-- 작업할 곳 -->
    <form method="get" action="/fri/king/addingredientproc.fri" class="w3-col m9">
    	<div class="w3-col w3-center">
	    	<span class="w3-col m3 w3-margin">재료 이름</span>
	    	<input class="w3-col w3-margin m4" id="name" name="inputname" required>
    	</div>
    	<div class="w3-col w3-center w3-border">
	    	<div class="w3-padding">
				<span>재료종류</span>
				<select name="inputcategory">
					<option value="meat">고기류
					<option value="bean">콩류
					<option value="vegetable">채소류
					<option value="fruit">과일류
					<option value="seafood">해산물
					<option value="seasoning">조미료
					<option value="dairy">유제품
					<option value="noodles">면류
					<option value="cereal">곡류
				</select>
	    	</div>
	    	<div>
	    		<div class="w3-margin-top">
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" required value="apple.png"><br><img alt="apple" src="/fri/img/ingredient/apple.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="bean.png"><br><img alt="bean" src="/fri/img/ingredient/bean.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="bread.png"><br><img alt="bread" src="/fri/img/ingredient/bread.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="chicken.png"><br><img alt="chicken" src="/fri/img/ingredient/chicken.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="crab.png"><br><img alt="crab" src="/fri/img/ingredient/crab.png"></div>
	    		</div>
	    		<div class="w3-margin-top">
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="drink.png"><br><img alt="drink" src="/fri/img/ingredient/drink.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="egg.png"><br><img alt="egg" src="/fri/img/ingredient/egg.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="fish.png"><br><img alt="fish" src="/fri/img/ingredient/fish.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="liquid.png"><br><img alt="liquid" src="/fri/img/ingredient/liquid.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="meat.png"><br><img alt="meat" src="/fri/img/ingredient/meat.png"></div>
	    		</div>
	    		<div class="w3-margin-top">
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="milk.png"><br><img alt="milk" src="/fri/img/ingredient/milk.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="mushroom.png"><br><img alt="mushroom" src="/fri/img/ingredient/mushroom.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="noodle.png"><br><img alt="noodle" src="/fri/img/ingredient/noodle.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="onion.png"><br><img alt="onion" src="/fri/img/ingredient/onion.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="potato.png"><br><img alt="potato" src="/fri/img/ingredient/potato.png"></div>
	    		</div>
	    		<div class="w3-margin-top">
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="rice.png"><br><img alt="rice" src="/fri/img/ingredient/rice.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="shell.png"><br><img alt="shell" src="/fri/img/ingredient/shell.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="spoon.png"><br><img alt="spoon" src="/fri/img/ingredient/spoon.png"></div>
	    			<div class="inline"><input type="radio" class="w3-radio" name="inputimage" value="squid.png"><br><img alt="squid" src="/fri/img/ingredient/squid.png"></div>
	    		</div>
	    	</div>
	    	<input class="w3-button w3-border w3-red w3-hover-orange w3-border-black w3-round-xxlarge w3-margin change05bgc" type="submit">
    	</div>
	    <div class="w3-padding">
	    	<h2>재료 목록</h2>
	    	<c:forEach var="data" items="${LIST}">
		    	<div class="inline w3-margin">
		    		<div class=""><img alt="재료이미지" src="/fri/img/ingredient/${data.iiname}"></div>
		    		<div>이름: ${data.iname}</div>
		    		<div>분류: ${data.category}</div>
		    	</div>
	    	</c:forEach>
	    </div>
    </form>
    
    <!-- End Middle Column -->
    
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