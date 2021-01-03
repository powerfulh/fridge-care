<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 설명 페이지</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="/fri/css/my.css">
<link rel="stylesheet" type="text/css" href="/fri/css/w3.css">
<link rel="stylesheet" type="text/css" href="/fri/css/cls.css">
<link rel="stylesheet" href="/fri/css/leftside.css">
<link rel="stylesheet" href="/fri/css/hh.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/fri/js/juhyun/resipiPage.js"></script>
<script type="text/javascript" src="/fri/js/hh/leftbar.js"></script>
<!--
<script type="text/javascript" src="/cls/js/"></script>
-->
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
.clickable:hover{
	background-color:beige;
	cursor:pointer;
}
</style>
</head>
<body class="">

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
  <div class="w3-col w3-card w3-margin-bottom w3-round">
		<h1><a href="/fri/">냉장고를 부탁해!</a></h1>
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
    <div class="w3-col m7 w3-margin-left">
		<div class="w3-col w3-center">
			<div class="w3-col w3-border">
				<h5 class="w3-col m7 w3-border-left">${RESIPI.title}</h5>
				<h5 class="w3-col m2 w3-border-left">조회수 : ${RESIPI.cnt}</h5>
				<h5 class="w3-col m3 w3-border-left">${RESIPI.bdate}</h5>
			</div>
			<div class="w3-col m2">
			<h4 class="w3-left w3-padding">음식 설명</h4>
			</div>
			<div class="w3-col m8 w3-margin-top w3-margin-bottom" style="text-align: center;" >
				<img style="width:100%" src="/fri/img/thumb/${RESIPI.dir}">
			</div>
			<div class="w3-col m2"><p></p></div>
			
			<h3 class="w3-col">${RESIPI.time}분 소요</h3>
			<c:forEach var="body" items="${BODY}">
			<div class="w3-col w3-border-bottom w3-border-top">
				<div class="w3-col m8 w3-left w3-padding w3-margin-top">${body.body}</div>
				<div class="w3-col m4 w3-right">
						<img class="w3-col" src="/fri/img/upload/${body.dir}">
				</div>
			</div>
			</c:forEach>
			
			<div class="w3-col w3-border-bottom">
				<div class="w3-col w3-border">필요한 재료 리스트</div>
			<c:forEach var="ingred" items="${INGRED}">
				<div class="w3-col m2">
					<h4>${ingred}</h4>
				</div>
			</c:forEach>
			</div>
			
			<c:if test="${not empty RESIPI.video}">
				<iframe width="480" height="320" src="https://www.youtube.com/embed/${RESIPI.video}"></iframe>
			</c:if>
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<div class="w3-col m2 w3-border w3-center w3-button" id="lbtn" style="margin-left: 315px;">추천</div>
			</div>
			<div class="w3-col w3-margin-bottom">
				<h6 class="w3-col m2 w3-center" style="margin-left: 315px;">${RESIPI.lcount}</h6>
			</div>
			<form method="POST" action="/fri/juhyun/recipe/resipiLikeCount.fri" id="lfrm">
				<input type="hidden" name="bno" value="${RESIPI.bno}">
				<input type="hidden" name="mno" value="${MNO}">
				<input type="hidden" name="lcnt" value="${LCNT}">
			</form>
			<div class="w3-col w3-border">
				<h4 class="w3-col">한줄 리뷰를 해주세요</h4>
				<c:if test="${not empty SID}">
					<c:if test="${CNT eq '0'}">
					<form method="POST" action="/fri/juhyun/recipe/resipiReply.fri" class="w3-col w3-border-bottom w3-padding w3-margin-top" id="rfrm">
						<input class="w3-col m8" style="height: 40px;" id="body" name="body">
						<input type="hidden" name="bno" value="${RESIPI.bno}">
						<input type="hidden" id="mno" name="mno" value="${MNO}">
						<div class="w3-col m4 w3-button w3-border" id="rbtn">작성</div>
					</form>
					</c:if>
				</c:if>
				
				<c:if test="${CNT eq '1'}">
					<h4>리뷰 작성을 완료했습니다.</h4>
				</c:if>
				
				<div class="w3-col w3-border-bottom">
					<span class="w3-col m2 w3-border">아이디</span>
					<div class="w3-col m8 w3-border">댓글 내용</div>
					<span class="w3-col m2 w3-border">작성일</span>
				</div>
				
				<c:forEach var="reply" items="${REPLY}">
				<div class="w3-col w3-border-bottom">
					<span class="w3-col m2 w3-border-bottom">${reply.id}</span>
					<div class="w3-col m7 w3-border-bottom">${reply.body}</div>
					<span class="w3-col m3 w3-border-bottom">${reply.bdate}</span>
				</div>
				</c:forEach>
				
			</div>
			
			<div class="w3-col w3-margin-top">
				<form method="GET" action="/fri/juhyun/recipe/resipiPage.fri" name="pfrm" id="pfrm" class="w3-bar w3-border w3-round">
					<input type="hidden" id="bno" name="bno" value="${RESIPI.bno}">
					<input type="hidden" id="nowPage" name="nowPage">
					<!-- 이전 버튼 처리 -->
				  	<c:if test="${PAGE.startPage != 1}">
				  		<span class="w3-bar-item w3-button w3-hover-deep-orange pagebtn" id="${PAGE.startPage - 1}"><i class="fa fa-chevron-left"></i></span>
				  	</c:if>
				  
				  	<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
				  		<span class="w3-bar-item w3-button w3-hover-lime pagebtn" id="${page}">${page}</span>
				  	</c:forEach>
				  
					<!-- 다음 버튼 처리 -->
				  	<c:if test="${PAGE.endPage != PAGE.totalPage}">
				  		<span class="w3-bar-item w3-button w3-hover-deep-orange pagebtn" id="${PAGE.endPage + 1}"><i class="fa fa-chevron-right"></i></span>
				  	</c:if>
				</form>
			</div>
			
			<c:if test="${not empty OTHER}">
			<div class="w3-col w3-margin-top">
				<div class="w3-col w3-border-bottom">가지고 있는 재료로 가능한 요리</div>
				<c:forEach var="other" items="${OTHER}">
					<div class="w3-col m2 w3-padding-right w3-center w3-button w3-margin-right other" name="${other.bno}">
						<img class="w3-col" src="/fri/img/thumb/${other.dir}" id="" style="height: 100px;">
						<h6 class="w3-col" id="">${other.title}</h6>
					</div>
					<form method="GET" action="/fri/juhyun/recipe/resipiPage.fri" id="${other.bno}">
						<input type="hidden" name="bno" value="${other.bno}">
					</form>
				</c:forEach>
			</div>
			</c:if>
			<c:if test="${SID == RESIPI.id}">
				<div class="w3-col">
					<div class="w3-teal w3-round-large w3-center dimension7 w3-padding w3-margin-top w3-button w3-hover-cyan change05bgc" id="deletebtn">삭제</div>
				</div>
			</c:if>
		</div>
     </div>
     
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
	<div class="w3-col m1">
    <!-- End Right Column -->
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
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

</body>
</html>