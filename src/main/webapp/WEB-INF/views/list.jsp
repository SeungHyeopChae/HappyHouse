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
<link href="${root}/fontawesome/css/all.css" rel="stylesheet">
<link href="${root}/css/style.css" rel="stylesheet">
<link href="${root}/css/popup.css" rel="stylesheet">
<link href="${root}/css/typography-default.css" rel="stylesheet">
<link href="${root}/css/bt.css" rel="stylesheet">
<link href="${root}/css/light.css" rel="stylesheet">




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
	<div class="scrollToTop circle">
		<i class="fa fa-angle-u
	p"></i>
	</div>
	<div class="page-wrapper">




		<!-- header-container start -->
		<div class="header-container">
			<!-- header-top start -->
			<!-- classes:  -->
			<!-- "dark": dark version of header top e.g. class="header-top dark" -->
			<!-- "colored": colored version of header top e.g. class="header-top colored" -->
			<!-- ================ -->
			<div class="header-top dark">
				<div class="container">
					<div class="row">
						<div class="col-3 col-sm-6 col-lg-9">
							<!-- header-top-first start -->
							<!-- ================ -->
							<div class="header-top-first clearfix"></div>
							<!-- header-top-first end -->
						</div>
						<div class="col-9 col-sm-6 col-lg-3">

							<!-- header-top-second start -->
							<!-- ================ -->
							<div id="header-top-second" class="clearfix">

								<!-- header top dropdowns start -->
								<!-- ================ -->
								<div class="header-top-dropdown text-right">


									<c:if test="${userinfo eq null}">
										<div class="btn-group">
											<a class="btn btn-default btn-sm"
												onclick="javascript:moveJoin();"> <i
												class="fa fa-user pr-2"></i> Sign Up
											</a>
										</div>
										<div class="btn-group">
											<button id="header-top-drop-2" type="button"
												class="btn dropdown-toggle btn-default btn-sm dropdown-toggle--no-caret"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<i class="fa fa-lock pr-2"></i> Login
											</button>
											<ul
												class="dropdown-menu dropdown-menu-right dropdown-animation"
												aria-labelledby="header-top-drop-2">
												<li>

													<form class="login-form margin-clear" id="loginform"
														action="main" method="post">
														<input type="hidden" name="act" id="act" value="login">
														<div class="form-group has-feedback">
															<label class="control-label">아 이 디</label> <input
																type="text" class="form-control" placeholder=""
																id="userid" name="userid" value="${saveid}"> <i
																class="fa fa-user form-control-feedback"></i>
														</div>
														<div class="form-group has-feedback">
															<label class="control-label">비밀번호</label> <input
																type="password" class="form-control" placeholder=""
																id="userpwd" name="userpwd"> <i
																class="fa fa-lock form-control-feedback"></i>
														</div>
														<button type="submit" class="btn btn-gray btn-sm"
															onclick="javascript:login();">로 그 인</button>
														<div class="form-group form-check" align="right">
															<label class="form-check-label"> <input
																class="form-check-input" type="checkbox" id="idsave"
																name="idsave" value="saveok" ${idck}> 아이디저장
															</label>
														</div>

														<ul class='pagination'>
															<!--
														<li>
														<a href="#" class="btn btn-default btn-sm">아이디
																찾기</a></li>
														-->
															<li><a href="${root}/member/forget"
																class="btn btn-default btn-sm">비밀번호 찾기</a></li>
														</ul>

													</form>
												</li>
											</ul>
										</div>
									</c:if>

									<c:if test="${userinfo ne null}">
										<%@ include file="member/confirm.jsp"%>

									</c:if>



								</div>
								<!--  header top dropdowns end -->
							</div>
							<!-- header-top-second end -->
						</div>
					</div>
				</div>
			</div>
			<!-- header-top end -->

			<header class="header fixed fixed-desktop clearfix">
				<div class="container">
					<div class="row">
						<div class="col-md-auto hidden-md-down">
							<!-- header-first start -->
							<!-- ================ -->
							<div class="header-first clearfix">

								<!-- logo -->
								<div id="logo" class="logo">
									<a href="${root}/"><img id="logo_img"
										src="http://edu.ssafy.com/asset/images/header-logo.jpg"
										width='150' alt="The SSAFY"></a>
								</div>
							</div>
						</div>
						<div class="col-lg-10 ml-auto">

							<!-- header-second start -->
							<!-- ================ -->
							<div class="header-second clearfix">

								<!-- main-navigation start -->
								<!-- classes: -->
								<!-- "onclick": Makes the dropdowns open on click, this the default bootstrap behavior e.g. class="main-navigation onclick" -->
								<!-- "animated": Enables animations on dropdowns opening e.g. class="main-navigation animated" -->
								<!-- ================ -->
								<div
									class="main-navigation main-navigation--mega-menu  animated">
									<nav class="navbar navbar-expand-lg navbar-light p-0">
										<div class="navbar-brand clearfix hidden-lg-up">

											<!-- logo -->
											<div id="logo-mobile" class="logo">
												<a href="${root}/"><img id="logo-img-mobile"
													src="http://edu.ssafy.com/asset/images/header-logo.jpg"
													width='150' alt="The SSAFY"></a>

											</div>

										</div>

										<!-- header  dropdown buttons -->
										<div
											class="header-dropdown-buttons hidden-lg-up p-0 ml-auto mr-3">
											<div class="btn-group">
												<button type="button"
													class="btn dropdown-toggle dropdown-toggle--no-caret"
													id="header-drop-3" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false">
													<i class="fa fa-search"></i>
												</button>
												<ul
													class="dropdown-menu dropdown-menu-right dropdown-animation"
													aria-labelledby="header-drop-3">
													<li>
														<form role="search" class="search-box margin-clear">
															<div class="form-group has-feedback">
																<input type="text" class="form-control"
																	placeholder="Search"> <i
																	class="fa fa-search form-control-feedback"></i>
															</div>
														</form>
													</li>
												</ul>
											</div>
										</div>
										<!-- header dropdown buttons end -->

										<c:if test="${userinfo eq null}">

											<button class="navbar-toggler" type="button"
												data-toggle="collapse" data-target="#navbar-collapse-1"
												aria-controls="navbar-collapse-1" aria-expanded="false"
												aria-label="Toggle navigation">
												<span class="navbar-toggler-icon"></span>
											</button>

											<div class="collapse navbar-collapse" id="navbar-collapse-1">
												<ul class="navbar-nav ml-xl-auto">
													<li class="nav-item dropdown  mega-menu mega-menu--wide">
														<a href="${root}/notice/list?pg=1&key=&word="
														class="nav-link " id="first-dropdown" aria-haspopup="true"
														aria-expanded="false">공지사항</a>
													</li>
													<li class="nav-item dropdown mega-menu mega-menu--wide">
														<!-- <a href="foodBestList.do?id=n" class="nav-link dropdown-toggle" id="second-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영양 정보</a> -->
														<a href="/news.do?arti_id=1" class="nav-link"
														id="second-dropdown" aria-haspopup="true"
														aria-expanded="false">오늘의 뉴스</a>
													</li>
												</ul>
												<!-- main-menu end -->
											</div>
										</c:if>

										<c:if test="${userinfo ne null}">
											<button class="navbar-toggler" type="button"
												data-toggle="collapse" data-target="#navbar-collapse-1"
												aria-controls="navbar-collapse-1" aria-expanded="false"
												aria-label="Toggle navigation">
												<span class="navbar-toggler-icon"></span>
											</button>

											<div class="collapse navbar-collapse" id="navbar-collapse-1">
												<ul class="navbar-nav ml-xl-auto">
													<li class="nav-item dropdown  mega-menu mega-menu--wide">
														<a href="${root}/notice/list?pg=1&key=&word="
														class="nav-link " id="first-dropdown" aria-haspopup="true"
														aria-expanded="false">공지사항</a>
													</li>
													<li class="nav-item dropdown mega-menu mega-menu--wide">
														<!-- <a href="foodBestList.do?id=n" class="nav-link dropdown-toggle" id="second-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영양 정보</a> -->
														<a href="/news.do?arti_id=1" class="nav-link"
														id="second-dropdown" aria-haspopup="true"
														aria-expanded="false">오늘의 뉴스</a>
													</li>
													<li class="nav-item dropdown mega-menu mega-menu--wide">
														<!-- <a href="foodBestList.do?id=n" class="nav-link dropdown-toggle" id="second-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영양 정보</a> -->
														<a href="/news.do?arti_id=1" class="nav-link"
														id="second-dropdown" aria-haspopup="true"
														aria-expanded="false">주변 탐방</a>
													</li>
													<li class="nav-item dropdown mega-menu mega-menu--wide">
														<!-- <a href="foodBestList.do?id=n" class="nav-link dropdown-toggle" id="second-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영양 정보</a> -->
														<a href="${root }/main?act=likeregi" class="nav-link"
														id="second-dropdown" aria-haspopup="true"
														aria-expanded="false">관심지역 설정</a>
													</li>
													<li class="nav-item dropdown mega-menu mega-menu--wide">
														<!-- <a href="foodBestList.do?id=n" class="nav-link dropdown-toggle" id="second-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영양 정보</a> -->
														<a class="nav-link" id="second-dropdown"
														aria-haspopup="true" aria-expanded="false"
														onclick="javascript:searchlike();">관심지역 둘러보기</a>
													</li>
												</ul>
												<!-- main-menu end -->
											</div>
										</c:if>

									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
			<!-- header end -->
		</div>

		<!-- header-second end -->

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

				</aside>
			</section>


			<!--지도 부분-->
			<div class="container justify-content-right"
				style="margin-top: 50px;">

				<div id="map" style="width:100%;height:350px;"></div>
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



		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25135de355b0c11f7e6e55d88edc8003"></script>

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
								latlng: new kakao.maps.LatLng(Number(data[i].lat), Number(data[i].lng))
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
</body>
</html>