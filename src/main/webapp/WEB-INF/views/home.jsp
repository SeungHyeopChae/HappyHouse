<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome :)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${root}/css/home.css">
<script src="${root}/js/homeevent.js"></script>
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
					<a class="fa fa-arrow-down fa-2x" href="#"> <img id="arrowimg"
						src="img/down_arrow.png">
					</a>
				</div>
			</div>

		</div>
		<div class="cnt02">
			<p>About HappyHouse</p>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="img/pic1.png" alt="Los Angeles">
					</div>

					<div class="item">
						<img src="img/pic2.png" alt="Chicago">
					</div>

					<div class="item">
						<img src="img/pic3.png" alt="New York">
					</div>
					<div class="item">
						<img src="img/pic4.png" alt="New York">
					</div>
					<div class="item">
						<img src="img/pic5.png" alt="New York">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

		</div>
		<div class="cnt03">
			<p>함께 해보시겠어요 ?</p>
			<div class="getStart">
				<a href="${root }/index" class="button">시작하기</a>
			</div>
		</div>
		<div class="cnt04">
			<p id="lastpg">About Us</p>

			<div id="intro">
			<div id="jaypic" class="row">
				<div class="col-md-2"><img src="img/jay.jpeg" class="img-circle" width="150" height="150"></div>
				<div class="col-md-4"><h4>SSAFY 5기 구미 3반 이재민</h4></div>
				
			</div>
			<div id="seungpic" class="row">
				<div class="col-md-2"><img src="img/seungH.jpeg" class="img-circle" width="150"
					height="150"></div>
					<div class="col-md-4"><h4>SSAFY 5기 구미 3반 채승협</h4></div>
			</div>
			
			</div>
			
		</div>
	</div>
</body>
</html>