<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/fri/css/w3.css">
<link rel="stylesheet" type="text/css" href="/fri/css/cls.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(function(){
		$('#frm').submit();
	});
</script>
</head>
<body>
	<form method="POST" action="${VIEW}" id="frm">
		<input type="hidden" name="addcnt" value="${ADDCNT}">
	</form>
</body>