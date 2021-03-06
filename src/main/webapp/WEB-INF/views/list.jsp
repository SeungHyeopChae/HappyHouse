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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".page-item").click(function() {

			$("#pg").val(($(this).attr("data-pg")));

			$("#pageform").attr("action", "${root}/house/search").submit();
		});

	});
</script>
<script>
	$(
			function() {
				$("#city")
						.change(
								function() {
									$
											.ajax({
												url : "${root}/address/gugun", //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
												type : "POST",
												data : {
													"si" : $('#city').val()
												},
												success : function(data) { //DB접근 후 가져온 데이터
													var list = '';
													$("#gu").empty();
													$("#dong").empty();
													var delist = '';
													delist += "<option value="+"all"+">"
															+ "시/도/군"
															+ "</option>";
													$("#gu").append(delist);
													delist = '';
													delist += "<option value="+"all"+">"
															+ "동" + "</option>";
													$("#dong").append(delist);
													for (var i = 0; i < data.length; i++) {
														console
																.log(data[i].gugun);
														list = '';
														list += "<option value=" +data[i].gugun+" >"
																+ data[i].gugun
																+ "</option>";
														$("#gu").append(list);
													}
												}
											})
								})

				$("#gu")
						.change(
								function() {
									$
											.ajax({
												url : "${root}/address/dong", //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
												type : "POST",
												data : {
													"gu" : $('#gu').val()
												},
												success : function(data) { //DB접근 후 가져온 데이터
													var list = '';
													$("#dong").empty();
													var delist = '';
													delist += "<option value="+"all"+">"
															+ "동" + "</option>";
													$("#dong").append(delist);
													for (var i = 0; i < data.length; i++) {
														list = '';
														list += "<option value=" +data[i].dong+" >"
																+ data[i].dong
																+ "</option>";
														$("#dong").append(list);
													}
												}
											})
								})
			})
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
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

.row2 {
	margin-left: 150px;
}

#houseInfo{
	margin-top:20px;
}
</style>
</head>
<body>

	
	<%@include file="viewers/header.jsp" %>
<form name="pageform" id="pageform" method="post" action="">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="dong">
		<input type="hidden" name="word" id="word" value="${latlng.dong}">

	</form>

	
<div class="text-center d-flex justify-content-center bg-dark">
		<form class="form-inline" id="frm" method="post" action="">
			<div class="form-group md">
				<select class="form-control" name="city" id="city">
					<c:if test="${gugunlist eq null}">
						<option value="all">도/광역시</option>
						<option value="서울특별시">서울시</option>
						<option value="경기도">경기도</option>
						<option value="인천광역시">인천광역시</option>
						<option value="부산광역시">부산광역시</option>
						<option value="대전광역시">대전광역시</option>
						<option value="대구광역시">대구광역시</option>
						<option value="울산광역시">울산광역시</option>
						<option value="세종특별자치시">세종시</option>
						<option value="광주광역시">광주광역시</option>
						<option value="강원도">강원도</option>
						<option value="충청북도">충청북도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="제주특별자치도">제주도</option>
					</c:if>
					<c:if test="${gugunlist ne null}">
						<option value="${selectedsi}">${selectedsi}</option>
					</c:if>

				</select>
			</div>
			<div class="form-group md-1">
				<select class="form-control" name="gugun" id="gu">
					<c:if test="${donglist eq null}">
						<option value="all">시/구/군</option>
						<c:forEach var="guguns" items="${gugunlist}" varStatus="status">
							<option value="${guguns.gugun}">${guguns.gugun}</option>
						</c:forEach>
					</c:if>
					<c:if test="${donglist ne null }">
						<option value="${selectedgu}">${selectedgu}</option>
					</c:if>

				</select>
			</div>
			<div class="form-group md-1">
				<select class="form-control" name="dong" id="dong">
					<option value="all">동</option>
					<c:forEach var="dongs" items="${donglist}" varStatus="status">
						<option value="${dongs.dong}">${dongs.dong}</option>
					</c:forEach>
				</select>

			</div>
			<button type="button" class="btn btn-primary" id=dongSearch
				onclick="javascript:search();">검색</button>
		</form>

	</div>





	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-3">
			<div class="sidebar">

				<div class="block clearfix" id="houseInfo">
					<input type="hidden" name="pg" id="pg" value="1">
					<table>
						<tr>
							<td>
								<h3>거래 정보</h3>
							</td>
							<!-- <td><select class="form-control ml-5" name="spp" id="spp"
								onchange="javascript:countList();">
									<option value="10" selected="selected">5개씩보기</option>
									<option value="20">10개씩보기</option>
									<option value="50">20개씩보기</option>
							</select></td> -->
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

				<div class="map_wrap">
					<div id="map"
						style="width: 100%; height: 180%; position: relative; overflow: hidden;"></div>
					<ul id="category">
						<li id="BK9" data-order="0"><span class="category_bg bank"></span>
							은행</li>
						<li id="MT1" data-order="1"><span class="category_bg mart"></span>
							마트</li>
						<li id="PM9" data-order="2"><span
							class="category_bg pharmacy"></span> 약국</li>
						<li id="OL7" data-order="3"><span class="category_bg oil"></span>
							주유소</li>
						<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
							카페</li>
						<li id="CS2" data-order="5"><span class="category_bg store"></span>
							편의점</li>
					</ul>
				</div>
			</div>
		</div>

	</div>


	<div class="row2">
		<p>${navigation.navigator}</p>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25135de355b0c11f7e6e55d88edc8003&libraries=services"></script>

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

		var placeOverlay = new kakao.maps.CustomOverlay({
			zIndex : 1
		}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		markers = [], // 마커를 담을 배열입니다
		currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		var mapContainer = document.getElementById('map');
		var mapOption = {
			center : new kakao.maps.LatLng(Number(nlat), Number(nlng)),
			level : 5
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		var imageSize = new kakao.maps.Size(24, 35);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

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
						latlng : new kakao.maps.LatLng(Number(data[i].lat),
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

		var ps = new kakao.maps.services.Places(map);
		kakao.maps.event.addListener(map, 'idle', searchPlaces);
		contentNode.className = 'placeinfo_wrap';

		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);

		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();

		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
			if (target.addEventListener) {
				target.addEventListener(type, callback);
			} else {
				target.attachEvent('on' + type, callback);
			}
		}

		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
			if (!currCategory) {
				return;
			}

			// 커스텀 오버레이를 숨깁니다 
			placeOverlay.setMap(null);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			ps.categorySearch(currCategory, placesSearchCB, {
				useMapBounds : true
			});
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
				displayPlaces(data);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

			} else if (status === kakao.maps.services.Status.ERROR) {
				// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

			}
		}

		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
			// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
			var order = document.getElementById(currCategory).getAttribute(
					'data-order');

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var marker = addMarker(new kakao.maps.LatLng(places[i].y,
						places[i].x), order);

				// 마커와 검색결과 항목을 클릭 했을 때
				// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
				(function(marker, place) {
					kakao.maps.event.addListener(marker, 'click', function() {
						displayPlaceInfo(place);
					});
				})(marker, places[i]);
			}
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(11, 28)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo(place) {
			var content = '<div class="placeinfo">'
					+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
					+ place.place_name + '</a>';

			if (place.road_address_name) {
				content += '    <span title="' + place.road_address_name + '">'
						+ place.road_address_name
						+ '</span>'
						+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
						+ place.address_name + ')</span>';
			} else {
				content += '    <span title="' + place.address_name + '">'
						+ place.address_name + '</span>';
			}

			content += '    <span class="tel">' + place.phone + '</span>'
					+ '</div>' + '<div class="after"></div>';

			contentNode.innerHTML = content;
			placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			placeOverlay.setMap(map);
		}


		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
			var category = document.getElementById('category'), children = category.children;

			for (var i = 0; i < children.length; i++) {
				children[i].onclick = onClickCategory;
			}
		}

		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
			var id = this.id, className = this.className;

			placeOverlay.setMap(null);

			if (className === 'on') {
				currCategory = '';
				changeCategoryClass();
				removeMarker();
			} else {
				currCategory = id;
				changeCategoryClass(this);
				searchPlaces();
			}
		}

		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
			var category = document.getElementById('category'), children = category.children, i;

			for (i = 0; i < children.length; i++) {
				children[i].className = '';
			}

			if (el) {
				el.className = 'on';
			}
		}
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