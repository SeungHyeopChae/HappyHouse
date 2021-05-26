<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
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
<link href="${root}/fontawesome/css/all.css" rel="stylesheet">
<link href="${root}/css/style.css" rel="stylesheet">
<link href="${root}/css/popup.css" rel="stylesheet">
<link href="${root}/css/typography-default.css" rel="stylesheet">
<link href="${root}/css/bt.css" rel="stylesheet">
<link href="${root}/css/light.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		url(${root}/img/house2.jpeg);
	background-position: 70% 50%;
	background-size: cover;
	height: 350px;
}
</style>
</head>
<body>
	<%@include file="viewers/header.jsp" %>
	
	<form name="pageform" id="pageform" method="POST" action="">
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
		<div class="col-lg-1"></div>
		<div class="col-lg-3">
			<div class="sidebar">

				<div class="block clearfix" id="houseInfo">
					<table>
						<tr>
							<td>
								<h3>거래 정보</h3>
							</td>
							<td><select class="form-control ml-5" name="spp" id="spp"
								onchange="javascript:countList();">
									<option value="10" selected="selected">5개씩보기</option>
									<option value="20">10개씩보기</option>
									<option value="50">20개씩보기</option>
							</select></td>
						</tr>
					</table>



					<div class="separator-2"></div>

					<c:forEach var="list" items="${houseList}" varStatus="vs">
						<div class="media margin-clear">
							<div class="media-body">
								<h4>
									<a href="${root}/house/detail?no=${list.no}">${list.aptName}</a>
								</h4>
								<h6 class="media-heading" id="deal">거래금액
									:${list.dealAmount}만원</h6>
								<h6 class="media-heading" id="deal">면적: ${list.area}</h6>
								<p class="small margin-clear">
									<i class="fa fa-calendar pr-10"></i>${list.dealYear}
									(${list.dealMonth}) (${list.dealDay})
								</p>
							</div>
						</div>
						<hr>
					</c:forEach>
				</div>

			</div>
		</div>


		<!--지도 부분-->
		<div class="col-sm-8">
			<div class="container justify-content-right"
				style="margin-top: 70px;">

				<div id="map" style="width: 100%; height: 350px;"></div>
			</div>



		</div>

	</div>


	<div class="row2">
		<div class="col-lg-12">
			<p>${navigation.navigator}</p>
		</div>
	</div>








	<footer id="footer" class="clearfix " style="margin-top: 50px;">
		<div class="footer">
			<div class="container">
				<div class="footer-inner">
					<div class="row">
						<div class="col-md-1">
							<div class="footer-content">
								<img alt="" src="${root}/img/logo.png" width="100">
							</div>
						</div>
						<div class="col-md-8">
							<div class="footer-content">
								<h2 class="title">Find Us</h2>
								<div class="separator-2"></div>
								<ul class="list-icons">
									<li><i class="fa fa-map-marker pr-2 text-default"></i>(SSAFY)
										서울시 강남구 테헤란로 멀티스퀘어</li>
									<li><i class="fa fa-phone pr-2 text-default"></i>
										1544-9001</li>
									<li><a href="#"><i class="fa fa-envelope-o pr-2"></i>admin@ssafy.com</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="subfooter">
			<div class="container">
				<div class="subfooter-inner">
					<div class="row">
						<div class="col-md-12">
							<p class="text-center">Copyright by SSAFY. All rights
								reserved.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/js/popup.min.js"></script>
	<script src="${root}/js/slick.min.js"></script>
	<script src="${root}/js/tem.js"></script>
	<script src="${root}/js/custom.js"></script>



	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25135de355b0c11f7e6e55d88edc8003"></script>

	<script>
				
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				var nlat;
				var nlng;
				var ndong;
				<c:if test="${latlng ne null}">
				nlat = "${latlng.lat}";
				nlng = "${latlng.lng}";
				ndong = "${latlng.dong}";
				</c:if>
				console.log(nlat);
				console.log(nlng);
				console.log(ndong);

				var mapContainer = document.getElementById('map');
				var mapOption = {
					center : new kakao.maps.LatLng(Number(nlat), Number(nlng)),
					level : 5
				// 지도의 확대 레벨
				};

				var map = new kakao.maps.Map(mapContainer, mapOption);

				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
				var imageSize = new kakao.maps.Size(24, 35);
				var markerImage = new kakao.maps.MarkerImage(imageSrc,
						imageSize);

				$.ajax({
					url : "${root}/house/list",
					type : "POST",
					data : {
						"dong" : ndong
					},
					success : function(data) {
						for (let i = 0; i < data.length; i++) {
							var tmp = {
								tile : data[i].aptName,
								latlng : new kakao.maps.LatLng(
										Number(data[i].lat),
										Number(data[i].lng))
							}
							var marker = new kakao.maps.Marker({
								map : map,
								position : tmp.latlng,
								title : tmp.title,
								image : markerImage
							});
						}
					}
				})
			</script>
	<%@include file="viewers/footer.jsp"%>
	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/js/popup.min.js"></script>
	<script src="${root}/js/slick.min.js"></script>
	<script src="${root}/js/tem.js"></script>
	<script src="${root}/js/custom.js"></script>
</body>
</html>