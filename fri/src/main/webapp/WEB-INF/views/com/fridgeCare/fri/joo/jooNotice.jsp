<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<link rel="stylesheet" href="/fri/css/w3.css">
<link rel="stylesheet" href="/fri/css/cls.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="/fri/css/cls.css">
<link rel="stylesheet" href="/fri/css/leftside.css">
<link rel="stylesheet" href="/fri/css/hh.css">
<script type="text/javascript" src="/fri/js/joo/jquery-latest.min.js"></script>
<script type="text/javascript" src="/fri/js/joo/jooNotice.js"></script>
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
</style>
</head>
<body class="">

<form method="POST" action="/fri/joo/noticeAnswerProc.fri" id="frm1" name="frm1">
	<input type="hidden" name="nupno" id="nupno" value="">
	<input type="hidden" name="nbody" id="nbody" value="">
</form>
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
		<c:if test="${not empty SID}">
			<div class="w3-light-blue w3-round-large w3-center dimension8 w3-padding-small inline w3-button w3-hover-cyan change05bgc" id="partnerbtn">파트너 유저 신청</div>
		</c:if>
		<div class="w3-teal w3-round-large w3-center dimension7 w3-padding w3-margin-top w3-button w3-hover-cyan change05bgc" id="fqabtn">Feedback / Q &amp; A</div>
      </div>
      <br>
      
    
    <!-- End Left Column -->
    </div>
    
<!-- Middle Column --> <!-- 작업할 곳 -->
	<!-- 레시피 테이블 : 이름, 종류, 재료, 영상주소, 조리시간, 상황/
		 이미지테이블 : 업로드 이름, 파일크기, 경로/
		 썸내일 테이블 : 경로, 이름
		 보드 테이블 : 제목  /
		 바디 테이블 : 내용 -->
    <div class="w3-col m9">
      	<div class="w3-container w3-card w3-round w3-margin-bottom w3-margin-left w3-margin-right">
      <!-- 이곳에 꿈과 희망을 펼치세요 -->
      	<div class="w3-col btnfr">
      		<h2 class="w3-button w3-teal nbtn">공지사항</h2>
      		<h2 class="w3-button w3-teal fbtn w3-center">FAQ</h2>
      		<h2 class="w3-button w3-green qbtn w3-right">QNA</h2>
      	</div>
      	<div class="notice" style="display: none;">
			<div class="w3-col w3-padding table-list">
				<div class="w3-col w3-center list">
					<div class="w3-col hd">
						<div class="w3-col m2 no">번 호</div>
						<div class="w3-col m5 title">제 목</div>
						<div class="w3-col m3 date">작 성 일</div>
						<div class="w3-col m2 click">조회수</div>
					</div>
				<c:forEach var="data" items="${LIST}">
					<div class="w3-col cont w3-border-bottom" id="${data.nno}">
						<div class="w3-col m2 no">${data.nno}</div>
						<div class="w3-col m5 title">${data.ntitle}</div>
						<div class="w3-col m3 date">${data.sdate}</div>
						<div class="w3-col m2 click">${data.nclick}</div>
						<div class="w3-col w3-padding w3-margin-bottom body" style="display: none;"></div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
		<div class="faq" style="display: none;">
			<div class="w3-col w3-padding table-list">
				<div class="w3-col w3-center list">
					<div class="w3-col hd">
						<div class="w3-col m2 no">번 호</div>
						<div class="w3-col m5 title">제 목</div>
						<div class="w3-col m3 date">작 성 일</div>
						<div class="w3-col m2 click">조회수</div>
					</div>
				<c:forEach var="fdata" items="${FLIST}">
					<div class="w3-col cont w3-border-bottom" id="${fdata.nno}">
						<div class="w3-col m2 no">${fdata.nno}</div>
						<div class="w3-col m5 title">${fdata.ntitle}</div>
						<div class="w3-col m3 date">${fdata.sdate}</div>
						<div class="w3-col m2 click">${fdata.nclick}</div>
						<div class="w3-col w3-padding w3-margin-bottom body" style="display: none;"></div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
      	<div class="qna" style="display: none;">
			<div class="w3-col w3-padding table-list">
				<div class="w3-col w3-center list">
					<div class="w3-col hd">
						<div class="w3-col m2 no">번 호</div>
						<div class="w3-col m5 title">제 목</div>
						<div class="w3-col m3 date">작 성 일</div>
						<div class="w3-col m2 click">조회수</div>
					</div>
				<c:forEach var="qdata" items="${QLIST}">
					<div class="w3-col cont w3-border-bottom" id="${qdata.nno}">
						<div class="w3-col">
							<div class="w3-col m2 no">${qdata.nno}</div>
							<div class="w3-col m5 title">${qdata.ntitle}</div>
							<div class="w3-col m3 date">${qdata.sdate}</div>
							<div class="w3-col m2 click">${qdata.nclick}</div>
						</div>
						<div class="w3-col" style="display: none;">
							<div class="w3-col w3-padding w3-margin-bottom body"></div>
							<div class="m2 w3-right w3-button w3-green w3-padding w3-margin-bottom body mbtn">답변달기</div>
						</div>
						<div class="w3-col w3-padding w3-margin-bottom w3-border-top" style="display: none;"></div>
					</div>
					<div class="w3-col w3-center" style="display: none;">
						<div class="w3-center w700 inblock">
							<h5 class="w3-purple w3-center w3-padding mb10">QnA 답변달기</h5>
							<textarea class="w3-input w3-border h72" id="w${qdata.nno}"></textarea>
							<span class="w3-col m2 w3-left w3-button w3-small w3-lime w3-hover-light-green w3-margin-bottom rbtn">닫기</span>
							<span class="w3-col m2 w3-right w3-button w3-small w3-pink w3-hover-purple w3-margin-bottom wrbtn">완료</span>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>

    <!-- End Middle Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
<!-- </div> -->
</div>
</div>

<!-- Footer -->
<footer class="w3-container w3-center w3-theme-d3">
  <h5>Footer</h5>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>
</body>
</html>