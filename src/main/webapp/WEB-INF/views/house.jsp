<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House 상세 조회</title>
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
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdgUFP7WNqnjlmJ0OS__3Nf9Et7aOoxnI&callback=initMap&libraries=&v=weekly"></script>
<script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
let map;
var nlat;
var nlng;
<c:if test="${infos ne null}">
	nlat = "${infos.lat}";
	nlng = "${infos.lng}";
</c:if>
console.log(nlat);
console.log(nlng);
console.log(ndong);


function initMap() {
		map = new google.maps.Map(document.getElementById("map"), {
			center : {
				lat : Number(nlat),
				lng : Number(nlng)
			},  
			zoom : 17
		})
}
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
	<%@ include file="viewers/header.jsp"%>
	<div class="breadcrumb-container">
		<div class="container-fluid">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home pr-2"></i> <a
					class="link-dark" href="${root}/">Home</a></li>
				<li class="breadcrumb-item active">매물 상세 조회</li>
			</ol>
		</div>
	</div>

	<div class="container-fluid p-3 my-3text-white"
		style="background-color: #707070;">
		<div class="container p-3 my-3">
			<div class="row justify-content-center"
				style="background-color: #F9F9F9; height: 500px;">
				<div class="row" style="margin-top: 20px;">
					<h2 class="title">매물 상세</h2>
				</div>
				<div class="light-gray-bg border-clear" style="margin-top: 70px;">
					<div>
						<c:if test="${details ne null}">
							<div class="media margin-clear">
								<div class="media-body">
									<h4>${details.aptName}</h4>
									<h6 class="media-heading" id="deal">거래금액
										:${details.dealAmount}만원</h6>
									<h6 class="media-heading" id="deal">면적: ${details.area}</h6>
									<p class="small margin-clear">
										<i class="fa fa-calendar pr-10"></i>${details.dealYear}
										(${details.dealMonth}) (${details.dealDay})
									</p>
								</div>
							</div>
							<hr>
							<div class="container justify-content-right"
								style="margin-top: 50px;">

								<div id="map"
									style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;"></div>
							</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!--하단-->
	<%@ include file="viewers/footer.jsp"%>
	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/js/popup.min.js"></script>
	<script src="${root}/js/slick.min.js"></script>
	<script src="${root}/js/tem.js"></script>
	<script src="${root}/js/custom.js"></script>

</body>
</html>