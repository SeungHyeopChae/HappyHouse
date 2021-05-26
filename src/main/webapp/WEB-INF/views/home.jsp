<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Let me know you ! :)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/home.css">
<script src="./js/homeevent.js"></script>
</head>
<body>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<div class="header">
    <ul>
        <li class="on" class="a"><a href="#">Welcome !</a></li>
        <li><a href="#">About HappyHouse</a></li>
        <li><a href="#">Start</a></li>
        <li><a href="#">About us</a></li>
    </ul>
</div>
<div class="content">
    <div class="cnt01">
    	<p>HAPPY HOUSE</p>
    	<div class="arrowing">
    	<div class="arrow bounce">
		<a class="fa fa-arrow-down fa-2x" href="#">
			<img id="arrowimg" src="img/down_arrow.png">
		</a>
		</div>
    	</div>
     	
    </div>
    <div class="cnt02"><p>About HappyHouse</p>
    <div class="arrowing">
    	<div class="arrow bounce">
		<a class="fa fa-arrow-down fa-2x" href="#">
			<img id="arrowimg" src="img/down_arrow.png"></a>
		</div>
    	</div>
    </div>
    <div class="cnt03"><p>함께 해보시겠어요 ?</p>
    <div class="getStart">
    	<a href="#" class="button">시작하기</a>
    </div>
    </div>
    <div class="cnt04"><p>CONTENT04</p></div>
</div>
</body>
</html>