<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

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

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});
								
								cmarker.push(marker);
								var infowindow = new kakao.maps.InfoWindow({
							        content: '<div style="width:150px;text-align:center;padding:6px 0;">'
										+ "${hos.dName}" + '</div>' // 인포윈도우에 표시할 내용
							    });
								 kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
								 kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

								// 인포윈도우로 장소에 대한 설명을 표시합니다


								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								//map.setCenter(coords);
							}
						})
		</c:forEach>
		</c:if>

	}

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {
			for (var i = 0; i < data.length; i++) {
				displayMarker(data[i]);
			}
		}
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
		infowindow.close();
		// 마커를 생성하고 지도에 표시합니다
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
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
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

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
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

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
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

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
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
				<li class="breadcrumb-item active">매물 상세 조회</li>
			</ol>
		</div>
	</div>

	<div class="container-fluid p-3 my-3text-white"
		style="background-color: #707070;">
		<div class="container p-3 my-3">

			<div class="bg" style="background-color: #F9F9F9; height: 500px; margin-bottom: 30px;">
				<h2 class="title2" style="margin-top: 10px; margin-left: 10px;">매물
					상세</h2>
					<hr>

				<div class="light-gray-bg border-clear" style="margin-top: 20px;">
						<div>
							<c:if test="${details ne null}">
								<div class="media margin-clear ml-5">
									<div class="media-body ml-5">
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
										onclick="javascript:station();">지하철</button>
									<button type="button" class="btn btn-warning marginTop"
										onclick="javascript:corona();">코로나진료소</button>
									<button type="button" class="btn btn-warning marginTop"
										onclick="javascript:hospital();">병원</button>
									<button type="button" class="btn btn-warning marginTop"
										onclick="javascript:mart();">마트</button>
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
	<!--하단-->
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
		// 지도의 확대 레벨
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

		
		// 주소로 좌표를 검색합니다
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
				labels : [ '동 평균 가격', '선택 매물 가격' ],
				datasets : [ {
					label : '가격',
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