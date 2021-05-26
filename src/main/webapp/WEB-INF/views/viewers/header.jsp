<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Happy House</title>
<meta name="description"
	content="The Project a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="author">
<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="${root}/fontawesome/css/all.css" rel="stylesheet">
<link href="${root}/css/style.css" rel="stylesheet">
<link href="${root}/css/popup.css" rel="stylesheet">
<link href="${root}/css/animations.css" rel="stylesheet">
<link href="${root}/css/typography-default.css" rel="stylesheet">
<link href="${root}/css/bt.css" rel="stylesheet">
<link href="${root}/css/light.css" rel="stylesheet">
<script type="text/javascript">
	

	function login() {
		if (document.getElementById("userid").value == "") {
			alert("아이디 입력!!!");
			return;
		} else if (document.getElementById("userpwd").value == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			
			document.getElementById("loginform").action = "${root}/member/login";
			document.getElementById("loginform").submit();
		}
	}

	function moveJoin() {
		alert("회원가입")
		document.location.href = "${root}/member/regist";
	}
	function search() {
		document.getElementById("frm").action = "${root}/house/search?dong="+ document.getElementById("dong").value+"&pg=1";
		document.getElementById("frm").submit();
	}
	function searchlike() {
		document.location.href = "${root}/main?act=listlike" ;
	}
	
	function deleteMember() {
		alert("탈퇴하시겠습니까?");
		document.location.href = "${root}/member/delete" ;
	}
</script>
<style>
.inputType {
	border-radius: 10px;
	margin-left: 10px;
	border-width: thin;
	width: 400px;
}

.marginTop {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="scrollToTop circle">
		<i class="fa fa-angle-up"></i>
	</div>
	<div class="page-wrapper">

		<!-- header-top end -->



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
							<a href="${root}/index "><h3>happyhouse</h3></a>
							
							<div class="header-top-first clearfix"></div>
							<!-- header-top-first end -->
						</div>
						<div class="col-9 col-sm-6 col-lg-3">

							<!-- header-top-second start -->
							<!-- ================ -->
							<div id="header-top-second" class="clearfix">

								<!-- header top dropdowns start -->
								<!-- ================ -->
								<div class="header-top-dropdown text-right" style="padding-bottom: 5px;">


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
														<button type="submit" id="loginbtn" class="btn btn-gray btn-sm mr-6"
															onclick="javascript:login();">로 그 인</button>
														<button class="btn btn-default btn-sm" onclick = "location.href='${root }/member/forget'"> 비밀번호 찾기 </button>
															
														<div class="form-group form-check" align="right">
															<label class="form-check-label"> <input
																class="form-check-input" type="checkbox" id="idsave"
																name="idsave" value="saveok" ${idck}> 아이디저장
															</label>
														</div>
<%-- 
														<ul class='pagination'>
															<!--
														<li>
														<a href="#" class="btn btn-default btn-sm">아이디
																찾기</a></li>
														-->
															<li><a href="${root}/member/forget"
																class="btn btn-default btn-sm">비밀번호 찾기</a></li>
														</ul> --%>

													</form>
												</li>
											</ul>
										</div>
									</c:if>

									<c:if test="${userinfo ne null}">
										<%@ include file="../member/confirm.jsp"%>

									</c:if>




								</div>
								<!--  header top dropdowns end -->
							</div>
							<!-- header-top-second end -->
						</div>
					</div>
				</div>
			</div>
		</div>
			<!-- header-top end -->

			<!-- header start -->
			<!-- classes:  -->
			<!-- "fixed": enables fixed navigation mode (sticky menu) e.g. class="header fixed clearfix" -->
			<!-- "fixed-desktop": enables fixed navigation only for desktop devices e.g. class="header fixed fixed-desktop clearfix" -->
			<!-- "fixed-all": enables fixed navigation only for all devices desktop and mobile e.g. class="header fixed fixed-desktop clearfix" -->
			<!-- "dark": dark version of header e.g. class="header dark clearfix" -->
			<!-- "centered": mandatory class for the centered logo layout -->
			<!-- ================ -->
			<header class="header fixed fixed-desktop clearfix">
				<div class="container">
					<div class="row">
						<div class="col-md-auto hidden-md-down">
							<!-- header-first start -->
							<!-- ================ -->
							<div class="header-first clearfix">

								<!-- logo -->
								<div id="logo" class="logo">
									<a href="${root}/index"><img id="logo_img"
										src="http://edu.ssafy.com/asset/images/header-logo.jpg"
										width='80' alt="The SSAFY"></a>
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

										<!-- header dropdown buttons -->
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
														<a href="${root }/news/list" class="nav-link"
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
														<a href="${root }/news/list" class="nav-link"
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
														<a href="${root}/likearea/regist" class="nav-link"
														id="second-dropdown" aria-haspopup="true"
														aria-expanded="false">관심지역 설정</a>
													</li>
													<li class="nav-item dropdown mega-menu mega-menu--wide">
														<!-- <a href="foodBestList.do?id=n" class="nav-link dropdown-toggle" id="second-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영양 정보</a> -->
														<a class="nav-link"
														id="second-dropdown" aria-haspopup="true"
														aria-expanded="false" onclick="javascript:searchlike();">관심지역 둘러보기</a>
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
</html>