<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8">
<title>Happy House 목록 조회</title>
<meta name="description"
	content="The Project a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="author">
<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="fontawesome/css/all.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/popup.css" rel="stylesheet">
<link href="css/typography-default.css" rel="stylesheet">
<link href="css/bt.css" rel="stylesheet">
<link href="css/light.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdgUFP7WNqnjlmJ0OS__3Nf9Et7aOoxnI&callback=initMap&libraries=&v=weekly"></script>
<script>
	let map;
	function initMap() {
		map = new google.maps.Map(document.getElementById("map"), {
			center : {
				lat : 37.5013068,
				lng : 127.037471
			},
			zoom : 17
		});
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".page-item").click(function() {
			
			$("#pg").val(($(this).attr("data-pg")));
			
			$("#pageform").attr("action", "${root}/house/search").submit();
		});
		

	});
</script>
<style>
.banner {
	background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)),
		url(./img/house2.jpeg);
	background-position: 70% 50%;
	background-size: cover;
	height: 350px;
}
</style>
</head>
<body>
	<%@include file="../viewers/header.jsp" %>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">  
	</form>

		<!--HAPPY HOUSE 행복한 우리집-->
		<div class="banner dark-translucent-bg">
			<div class="container-fluid">
				<div class="justify-content-center">
					<h1 class=""
						style="text-align: center; color: white; margin-top: 50px;">HAPPY
						HOUSE</h1>
					<hr>
					<p style="text-align: center; color: white;">행복한 우리집</p>
				</div>
			</div>
		</div>



		<div class="row">
			<section>
				<aside class="col-lg-12 order-lg-1">
					<div class="sidebar">
						<div class="block clearfix" id="houseInfo">
							<h3 class="title">거래 정보</h3>
							<div class="separator-2"></div>

							<c:forEach var="list" items="${houseList}" varStatus="vs">
								<div class="media margin-clear">
									<div class="media-body">
										<h4>${list.aptName}</h4>
										<h6 class="media-heading" id="deal">거래금액
											:${list.dealAmount}만원</h6>
										<h6 class="media-heading" id="deal">면적: ${list.area}</h6>
										<p class="small margin-clear">
											<i class="fa fa-calendar pr-10"></i>${list.buildYear}
											(${list.dealMonth}) (${list.dealDay})
										</p>
									</div>
								</div>
								<hr>
							</c:forEach>
						</div>
						<table>
								<tr>
									<td>
									${navigation.navigator}
									</td>
								</tr>
						</table>
					</div>

				</aside>
				
				<form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="pg" id="pg" value="1">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="skey">
			    <option value="userid" selected="selected">아이디</option>
			    <option value="articleno">글번호</option>
			    <option value="subject">제목</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="sword">
			  <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
			</section>
			
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="spp" id="spp" onchange="javascript:countList();">
			    <option value="10" selected="selected">10개씩보기</option>
			    <option value="20">20개씩보기</option>
			    <option value="50">50개씩보기</option>
			  </select>
			</td>
	  	</tr>
	  </table>

			
			<!--지도 부분-->
			<div class="container justify-content-right"
				style="margin-top: 50px;">

				<div id="map"
					style="width: 800px; height: 400px; margin-left: auto; margin-right: auto;"></div>
			</div>
		</div>
		
		<%@include file="../viewers/footer.jsp" %>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/popup.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/tem.js"></script>
		<script src="js/custom.js"></script>
</body>
</html>