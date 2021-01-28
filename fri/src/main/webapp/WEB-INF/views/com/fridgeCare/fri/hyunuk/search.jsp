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
<link rel="stylesheet" href="/fri/css/leftside.css">
<link rel="stylesheet" href="/fri/css/hh.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/fri/js/hyunuk/search.js"></script>
<script type="text/javascript" src="/fri/js/hh/leftbar.js"></script>
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}
.clickable:hover {
	background-color: beige;
	cursor: pointer;
}

.search-ingre {
	width: 100%;
}

#ckbox {
	width: 900px;
	height: auto;
	margin: 5px;
	border: 2px solid red;
}

#ckbox label {
	font-size: 23px;
}

#ckbox p {
	font-size: 30px;
	text-align: center;
}

#big_sort {
	text-align: center;
	width: 100px;
	border: 1px solid;
}

#big_sort button {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border: 1px solid blue;
	margin: 2px;
	width: 98%;
	height: 30px;
}

#big_sort button:hover {
	background-color: orange;
}

.small_sort {
	text-align: center;
	width: 400px;
	border: 1px dotted red;
}

ul li {
	list-style: none;
	margin-left: 20px;
}
</style>
</head>
<body class="">
	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 20px">
		<div class="w3-col w3-card w3-margin-bottom w3-round">
			<h1>
				<a href="/fri/hh/main.fri">냉장고를 부탁해!</a>
			</h1>
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
      <br>
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
		<div class="w3-teal w3-round-large w3-center dimension7 w3-padding w3-margin-top w3-button w3-hover-cyan change05bgc" id="fqabtn">Feedback / Q &amp; A</div>
      </div>
      <br>
      
    
    <!-- End Left Column -->
    </div>
			<!-- Middle Column -->
			<!-- 작업할 곳 -->
			<div class="w3-col m9">
				<div class="w3-container w3-card w3-round w3-margin-bottom w3-margin-left w3-margin-right" style="background-color: #E8EAEE;">
					<div style="height: auto"> 
						<h2 style="text-align: center;">냉장고를 부탁해!</h2>
						<h1 style="text-align: center;">냉장고에 잠자는 재료들로 레시피를 찾아보세요!</h1>
						<input name="utf8" type="hidden" value=""> <input
							type="hidden" name="sort" value="">
						<div id="ckbox" style="border: 0px solid;">
							<div style="background-color: #fff; margin: 10px; padding: 10px;">
								<h3 style="text-align: center;">상황에 맞는 음식</h3>
								<form method="POST" action="/fri/hyunuk/checked.fri" id="sitbox" class="ckfrm">
									<div style="text-align: center; margin-top: 10px;">
										<input type="checkbox" style="zoom: 2.0; margin-left: 5px;"
											id="categori1" name="situat" value="SELF" class="chksituat">
											<label for="category1">자취요리</label>
										<input type="checkbox" style="zoom: 2.0; margin-left: 5px;"
											id="categori2" name="situat" value="DRINK" class="chksituat"> 
											<label for="category2">술안주</label>
										<input type="checkbox" style="zoom: 2.0; margin-left: 5px;"
											id="categori3" name="situat" value="SIDE" class="chksituat">
											<label for="category3">집반찬</label>
										<input type="checkbox" style="zoom: 2.0; margin-left: 5px;"
											id="categori4" name="situat" value="FULL" class="chksituat">
											<label for="category4">든든하게</label>
									</div>
								</form>
							</div>
							<div style="background-color: #fff; margin: 10px; padding: 10px;">
								<h3 style="text-align: center;">요리 구분  </h3>
								<div style="text-align: center; margin-top: 10px;">
									<input type="checkbox" style="zoom: 2.0; margin-left: 5px;"	id="categori1" name="category" class="chkcategory" value="KR">
										 <label for="categori2">한식</label>
									<input type="checkbox" name="category" style="zoom: 2.0; margin-left: 5px;"	id="category2" name="category" class="chkcategory" value="CH">
										 <label for="categori3">중식</label>
									<input type="checkbox" name="category" style="zoom: 2.0; margin-left: 5px;"	id="category3" name="category" class="chkcategory" value="JP">
										 <label for="categori4">일식</label>
									<input type="checkbox" name="category" style="zoom: 2.0; margin-left: 5px;"	id="category4" name="category" class="chkcategory" value="WE">
										 <label for="categori5">양식</label>
									<input type="checkbox" name="category" style="zoom: 2.0; margin-left: 5px;" id="category5" name="category" class="chkcategory" value="FU">
										 <label for="categori5">퓨전</label>
								</div>
							</div>
						</div>
						<!-- 버튼 선택 -->
						<div style="text-align: center; display: inline-block;">
							<div id="big_sort"
								style="width: 20%; margin: 20px; display: inline-block; height: 600px; float: left;">
								<button class="ingbtn1">육류</button>
								<button class="ingbtn2">콩두부</button>
								<button class="ingbtn3">채소류</button>
								<button class="ingbtn4">과일류</button>
								<button class="ingbtn5">해산물</button>
								<button class="ingbtn6">조미료</button>
								<button class="ingbtn7">유제품</button>
								<button class="ingbtn8">면류</button>
							</div>

							<!-- 선택가능한 재료 띄워주는 곳 -->
							<div class="small_sort"
								style="width: 42%; margin: 20px; display: inline-block; height: 600px; float: left;">
								<h3>선택 가능한 재료</h3>
								<hr>
								<ul style="padding-inline-start: 0px;" id="ing">
									<c:forEach var="ingred" items="${LIST}">
										<li style="margin-left: 0px;">
											<div id="${ingred.ino}"	class="iList w3-hide w3-button ${ingred.category}">
											<span class="w3-hide">${ingred.iname}</span>
												<img src="/fri/img/ingredient/${ingred.iiname}"
													alt="${ingred.iname}" /> <strong>${ingred.iname}</strong>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
							<!-- 선택한 재료 띄워주는 곳 -->
							<div style="margin: 20px; border: 1px solid; display: inline-block; height: 600px; float: left; width: 25%;">
								<h3>내가 선택한 재료</h3>
								<div id="selected">
								<ul style="padding-inline-start: 0px;">
									<c:forEach var="ingred" items="${LIST}">
										<li style="margin-left: 0px;">
											<div id="${ingred.ino}" class="sList w3-hide w3-button ${ingred.iname}">
												<span class="w3-hide">${ingred.iname}</span>
												<img src="/fri/img/ingredient/${ingred.iiname}"
													alt="${ingred.iname}" /> <strong>${ingred.iname}</strong>
											</div>
										</li>
									</c:forEach>
								</ul>
								<button id="sbtn">검색하기</button>
								</div>
							</div>
						</div>
						<!-- 레시피 검색 결과 -->
						<div class="" style="overflow:scroll;width: 940px;height: 1030px;border: 1px solid;margin-bottom: 20px;margin-left: -;margin-top: 20px;margin-right: 10px;margin-left: 10px;">
							<div class="tit_area">
								<h2>
									조건에 맞는 레시피가 <strong><span id="total"></span></strong>개 있습니다.
								</h2>
								<div class="sort_area">
									
								</div>
							</div>
						</div>

						</div>
					</div>
				</div>
				<!-- End Middle Column -->
			</div>
			<!-- End Grid -->
		</div>
		<!-- End Page Container -->
	<br>

	<!-- Footer -->
	<footer class="w3-container w3-theme-d3 w3-padding-16">
		<h5>Footer</h5>
	</footer>

	<footer class="w3-container w3-theme-d5">
		<p>
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				target="_blank">w3.css</a>
		</p>
	</footer>
</body>
</html>