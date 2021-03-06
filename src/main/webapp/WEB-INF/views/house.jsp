<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House ์์ธ ์กฐํ</title>
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


<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>





<script type="text/javascript">
	var iconstate = 0;

	var hmarker = [];
	var smarker = [];
	var mmarker = [];
	var cmarker = [];

	function station() {
		iconstate = 1;
		var ps = new kakao.maps.services.Places(map);
		ps.categorySearch('SW8', placesSearchCB, {
			useMapBounds : true
		});
	}
	function hospital() {
		iconstate = 2;
		var ps = new kakao.maps.services.Places(map);
		ps.categorySearch('HP8', placesSearchCB, {
			useMapBounds : true
		});
	}
	function mart() {
		iconstate = 3;
		var ps = new kakao.maps.services.Places(map);
		ps.categorySearch('MT1', placesSearchCB, {
			useMapBounds : true
		});
	}
	function corona() {
		infowindow.close();
		for (var i = 0; i < hmarker.length; i++) {
			hmarker[i].setMap(null);
		}
		for (var i = 0; i < mmarker.length; i++) {
			mmarker[i].setMap(null);
		}
		for (var i = 0; i < smarker.length; i++) {
			smarker[i].setMap(null);
		}
		var geocoder = new kakao.maps.services.Geocoder();

		var data = [];
		<c:if test="${hospital ne null}">
		<c:forEach var="hos" items="${hospital}" varStatus="vs">
		geocoder
				.addressSearch(
						"${hos.address}",
						function(result, status) {

							// ์?์์?์ผ๋ก ๊ฒ์์ด ์๋ฃ๋์ผ๋ฉด 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// ๊ฒฐ๊ณผ๊ฐ์ผ๋ก ๋ฐ์ ์์น๋ฅผ ๋ง์ปค๋ก ํ์ํฉ๋๋ค
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});
								
								cmarker.push(marker);
								var infowindow = new kakao.maps.InfoWindow({
							        content: '<div style="width:150px;text-align:center;padding:6px 0;">'
										+ "${hos.dName}" + '</div>' // ์ธํฌ์๋์ฐ์ ํ์ํ? ๋ด์ฉ
							    });
								 kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
								 kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

								// ์ธํฌ์๋์ฐ๋ก ์ฅ์์ ๋ํ ์ค๋ช์ ํ์ํฉ๋๋ค


								// ์ง๋์ ์ค์ฌ์ ๊ฒฐ๊ณผ๊ฐ์ผ๋ก ๋ฐ์ ์์น๋ก ์ด๋์ํต๋๋ค
								//map.setCenter(coords);
							}
						})
		</c:forEach>
		</c:if>

	}

	// ํค์๋ ๊ฒ์ ์๋ฃ ์ ํธ์ถ๋๋ ์ฝ๋ฐฑํจ์ ์๋๋ค
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {
			for (var i = 0; i < data.length; i++) {
				displayMarker(data[i]);
			}
		}
	}

	// ์ง๋์ ๋ง์ปค๋ฅผ ํ์ํ๋ ํจ์์๋๋ค
	function displayMarker(place) {
		infowindow.close();
		// ๋ง์ปค๋ฅผ ์์ฑํ๊ณ? ์ง๋์ ํ์ํฉ๋๋ค
		if (iconstate == 1) {
			for (var i = 0; i < hmarker.length; i++) {
				hmarker[i].setMap(null);
			}
			for (var i = 0; i < mmarker.length; i++) {
				mmarker[i].setMap(null);
			}
			for (var i = 0; i < cmarker.length; i++) {
				cmarker[i].setMap(null);
			}
			var imageSrc = "${root}/img/station.png";
			let imageSize = new kakao.maps.Size(25, 25);
			let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(place.y, place.x),
				image : markerImage
			});
			// ๋ง์ปค์ ํด๋ฆญ์ด๋ฒคํธ๋ฅผ ๋ฑ๋กํฉ๋๋ค
			kakao.maps.event.addListener(marker, 'click', function() {
				// ๋ง์ปค๋ฅผ ํด๋ฆญํ๋ฉด ์ฅ์๋ช์ด ์ธํฌ์๋์ฐ์ ํ์ถ๋ฉ๋๋ค
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
			
			
			marker.setMap(map);
			smarker.push(marker);
		} else if (iconstate == 2) {
			for (var i = 0; i < smarker.length; i++) {
				smarker[i].setMap(null);
			}
			for (var i = 0; i < mmarker.length; i++) {
				mmarker[i].setMap(null);
			}
			for (var i = 0; i < cmarker.length; i++) {
				cmarker[i].setMap(null);
			}
			var imageSrc = "${root}/img/drug.png";
			let imageSize = new kakao.maps.Size(25, 25);
			let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(place.y, place.x),
				image : markerImage
			});

			// ๋ง์ปค์ ํด๋ฆญ์ด๋ฒคํธ๋ฅผ ๋ฑ๋กํฉ๋๋ค
			kakao.maps.event.addListener(marker, 'click', function() {
				// ๋ง์ปค๋ฅผ ํด๋ฆญํ๋ฉด ์ฅ์๋ช์ด ์ธํฌ์๋์ฐ์ ํ์ถ๋ฉ๋๋ค
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
			marker.setMap(map);
			hmarker.push(marker);
		} else if (iconstate = 3) {
			for (var i = 0; i < smarker.length; i++) {
				smarker[i].setMap(null);
			}
			for (var i = 0; i < hmarker.length; i++) {
				hmarker[i].setMap(null);
			}
			for (var i = 0; i < cmarker.length; i++) {
				cmarker[i].setMap(null);
			}
			var imageSrc = "${root}/img/mart.png";
			let imageSize = new kakao.maps.Size(25, 25);
			let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(place.y, place.x),
				image : markerImage
			});

			// ๋ง์ปค์ ํด๋ฆญ์ด๋ฒคํธ๋ฅผ ๋ฑ๋กํฉ๋๋ค
			kakao.maps.event.addListener(marker, 'click', function() {
				// ๋ง์ปค๋ฅผ ํด๋ฆญํ๋ฉด ์ฅ์๋ช์ด ์ธํฌ์๋์ฐ์ ํ์ถ๋ฉ๋๋ค
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
			marker.setMap(map);
			mmarker.push(marker);
		}
	}
	
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// ์ธํฌ์๋์ฐ๋ฅผ ๋ซ๋ ํด๋ก์?๋ฅผ ๋ง๋๋ ํจ์์๋๋ค 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
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
				<li class="breadcrumb-item active">๋งค๋ฌผ ์์ธ ์กฐํ</li>
			</ol>
		</div>
	</div>

	<div class="container-fluid p-3 my-3text-white"
		style="background-color: #707070;">
		<div class="container p-3 my-3">

			<div class="bg" style="background-color: #F9F9F9; height: 500px; margin-bottom: 30px;">
				<h2 class="title2" style="margin-top: 10px; margin-left: 10px;">๋งค๋ฌผ
					์์ธ</h2>
					<hr>

				<div class="light-gray-bg border-clear" style="margin-top: 20px;">
						<div>
							<c:if test="${details ne null}">
								<div class="media margin-clear ml-5">
									<div class="media-body ml-5">
										<h4>${details.aptName}</h4>
										<h6 class="media-heading" id="deal">๊ฑฐ๋๊ธ์ก
											:${details.dealAmount}๋ง์</h6>
										<h6 class="media-heading" id="deal">๋ฉด์?: ${details.area}</h6>
										<p class="small margin-clear">
											<i class="fa fa-calendar pr-10"></i>${details.dealYear}
											(${details.dealMonth}) (${details.dealDay})
										</p>
									</div>
								</div>
								<hr>
							</c:if>
							<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-4">
								<div id="map"
								 style="width: 400px; 
								 height: 200px; 
								 margin-left: auto; 
								 margin-right: auto;">
							</div>
							<div>
									<button type="button" class="btn btn-warning marginTop"
										onclick="javascript:station();">์งํ์ฒ?</button>
									<button type="button" class="btn btn-warning marginTop"
										onclick="javascript:corona();">์ฝ๋ก๋์ง๋ฃ์</button>
									<button type="button" class="btn btn-warning marginTop"
										onclick="javascript:hospital();">๋ณ์</button>
									<button type="button" class="btn btn-warning marginTop"
										onclick="javascript:mart();">๋งํธ</button>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-5">
							<canvas id="myChart"></canvas>
							</div>
							<div class="col-md-1"></div>
							<div class="container"
								style="margin-top: 50px;">

								
								
							</div>
						</div>
						
						<div class="form-group lg-6">

							

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id="frm" method="post" action=""></form>
	<!--ํ๋จ-->
	<%@ include file="viewers/footer.jsp"%>
	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/js/popup.min.js"></script>
	<script src="${root}/js/slick.min.js"></script>
	<script src="${root}/js/tem.js"></script>
	<script src="${root}/js/custom.js"></script>






	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25135de355b0c11f7e6e55d88edc8003&libraries=services"></script>
	<script>
		
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		var nlat;
		var nlng;
		var tmp;

		<c:if test="${infos ne null}">
		nlat = "${infos.lat}";
		nlng = "${infos.lng}";
		tmp = {
			tile : "${infos.aptName}",
			latlng : new kakao.maps.LatLng(Number(nlat), Number(nlng))
		};
		</c:if>
		console.log(nlat);
		console.log(nlng);

		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		var mapContainer = document.getElementById('map');
		var mapOption = {
			center : new kakao.maps.LatLng(Number(nlat), Number(nlng)),
			level : 7
		// ์ง๋์ ํ๋ ๋?๋ฒจ
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);

		let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		let imageSize = new kakao.maps.Size(24, 35);
		let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

		var marker = new kakao.maps.Marker({
			map : map,
			position : tmp.latlng,
			title : tmp.title,
			image : markerImage
		});

		
		// ์ฃผ์๋ก ์ขํ๋ฅผ ๊ฒ์ํฉ๋๋ค
	</script>

	<script>
		
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		var avgamount;
		var amount;
		avgamount = "${amount}";
		amount = "${details.dealAmount}";
		console.log(avgamount);
		var deamount = amount.replace(",", "");

		var data = [];
		data.push(avgamount);
		data.push(deamount);

		var ctx = document.getElementById('myChart');
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ '๋ ํ๊ท? ๊ฐ๊ฒฉ', '์?ํ ๋งค๋ฌผ ๊ฐ๊ฒฉ' ],
				datasets : [ {
					label : '๊ฐ๊ฒฉ',
					data : data,
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

</body>
</html>