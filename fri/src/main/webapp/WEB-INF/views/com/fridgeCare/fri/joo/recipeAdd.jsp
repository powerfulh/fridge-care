<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<link rel="stylesheet" href="/fri/css/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="/fri/css/cls.css">
<link rel="stylesheet" href="/fri/css/leftside.css">
<link rel="stylesheet" href="/fri/css/hh.css">
<script type="text/javascript" src="/fri/js/joo/jquery-latest.min.js"></script>
<script type="text/javascript" src="/fri/js/joo/recipeAdd.js"></script>
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
.change05bgc{
	transition: background-color .5s;
}
</style>
</head>
<body class="">


<!-- Page  Container -->
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
     	 <div class="w3-content w3-center w3-indigo w3-card-4">
    	     <h1 class="w3-padding w3-margin-top w3-center">냉장고를 부탁해</h1>
    	  </div>
<%--<c:if test="${ADDCNT eq 0}">--%>
      <form method="POST" action="/fri/joo/recipeAddProc.fri" id="frm" name="frm" encType="multipart/form-data">
			<input type="hidden" name="id" value="${SID}">
		<div class="m6 w3-col w3-padding w3-margin-bottom">
			<div class="w3-col">
				<label class="w3-col w3-left-align w3-padding txt16 clsbold">게시글 제목 </label>
				<input type="text" class="w3-input w3-border w3-padding" id="title" name="title" placeholder="내용을 입력하세요!">
			</div>
	            <label class="w3-col w3-padding txt16 clsbold">요 리 종 류</label> 
	               <select class="w3-col m7 txt14" name="category" id="category" >
	                  <option value="#">선택</option>
	                  <option value="KR">한식</option>
	                  <option value="CH">중식</option>
	                  <option value="JP">일식</option>
	                  <option value="WE">양식</option>
	                  <option value="FU">퓨전</option>
	               </select> <br>
	            <label class="w3-col w3-padding txt16 clsbold">소 요 시 간</label> 
	               <select class="w3-col m7 txt14" name="time" id="time" >
	                  <option value="10">5~15분</option>
	                  <option value="20">15~25분</option>
	                  <option value="35">25~45분</option>
	                  <option value="50">45~60분</option>
	                  <option value="80">한시간 이상</option>
	               </select> <br>
	            <label class="w3-col w3-padding txt16 clsbold">조 리 상 황 </label>
	               <select class="w3-col m7 txt14" name="situat" id="situat" >
		                <option value="SELF">자취요리</option>
		                <option value="DRINK">술안주</option>
		                <option value="SIDE">집반찬</option>
		                <option value="FULL">든든하게</option>
		            </select>
	         </div>
	         <div class="m6 w3-col w3-padding w3-margin-bottom">
	         	<div class="m3 w3-margin w3-padding">
		     		<input type="file" id="thumb" name="thumb">
		     		<img src="/fri/img/thumb/noimage.jpg" id="tImg" style="width:300px; height:200px; padding-top:10px;">
		     	</div>
	         </div>
		     <div class="w3-col w3-padding w3-margin-top">
		     	<div class="w3-col w3-margin-top"> 
		     		<div class="w3-col">
			    		<label class="w3-col w3-padding txt16 clsbold">요 리 재 료 </label>
		     		</div>
			     		<div class="w3-col" id="selfr">
								<select class="inbox w3-col m7 txt14 mabottom" name="inboxList">
							<c:forEach var="data" items="${LIST}">
									<option value="${data}">${data}</option>
							</c:forEach>
								</select>
				            	<div class="w3-col m2" style="padding-left: 10px;">
				            		<div class="w3-button w3-center w3-teal" id="inbtn">항목추가</div>
				            	</div>
			     		</div>
				    <label class="w3-col w3-padding txt14 clsbold">참고할 유튜브 링크를 적어주세요 </label>
    	 			<input type="text" class="w3-col w3-border m7" name="video" value="" placeholder="video">
	         	</div>
	       	</div>
		     
		     <div class="w3-col w3-center w3-margin-top w3-margin-bottom">
		       	<div class="w3-button w3-center m4 w3-blue txt16 clsbold" style="height: 50px; width: 300px;" id="sabtn1">다음</div>
		     </div>
<%--</c:if>--%>
<%--<c:if test="${ADDCNT eq 1}">--%>
			<div id="second" style="display: none;">
		       	<div class="w3-col w3-padding w3-margin-top">
			     	<div class="w3-col w3-margin-top"> 
			     		<div class="w3-col">
				    		<label id="make" class="w3-col l4 m12 s12 w3-left-align w3-padding txt16 clsbold">조 리 과 정: </label>
			     		</div>
			     		<div id="reci">
				     		<div class="w3-col m8">
								<textarea class="w3-col w3-border w3-input w3-margin-bottom boardpart" rows="8" name="body" placeholder="조리과정 설명" style="overflow: auto; resize: none;"></textarea>
				     		</div>
				     		<div class="w3-col m4">
					     		<input type="file" name="image" class="image">
					     		<input type="hidden" name="fname" value="noimage.jpg">
					     		<img src="/fri/img/upload/noimage.jpg" style="width: 200px; height: 165px;">
				     		</div>
			     		</div>
			     	</div>
						<div class="w3-button w3-center w3-teal m2" id="rebtn">항목추가</div>
			     </div>
		     <div class="w3-col w3-center w3-margin-top w3-margin-bottom">
			       	<div class="w3-button w3-center m4 w3-blue txt16 clsbold" style="height: 50px; width: 300px;" id="sabtn2">저장</div>
		     </div>
	     </div>
	     </form>
<%--</c:if>--%>
    </div>
    <!-- End Middle Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
<!-- </div> -->
</div>

<!-- Footer -->
<footer class="w3-container w3-center w3-theme-d3">
  <h5>Footer</h5>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>
</body>
</html>