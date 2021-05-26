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


<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdgUFP7WNqnjlmJ0OS__3Nf9Et7aOoxnI&callback=initMap&libraries=&v=weekly"></script>
<script>
	let map;
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

	function initMap() {
		map = new google.maps.Map(document.getElementById("map"), {
			center : {
				lat : Number(nlat),
				lng : Number(nlng)
			},
			zoom : 15
		})
		var myIcon = new google.maps.MarkerImage("${root}/img/drug.png", null,
				null, null, new google.maps.Size(50, 50));
		console.log("아작스진입");
		$.ajax({
			url : "${root}/house/list",
			type : "POST",
			data : {
				"dong" : ndong
			},
			success : function(data) {
				for (let i = 0; i < data.length; i++) {
					console.log("반복문진입");
					var tmp = {
						lat : Number(data[i].lat),
						lng : Number(data[i].lng)
					}
					var marker = new google.maps.Marker({
						position : tmp,
						icon : myIcon,
						map : map,
						title : data[i].AptName
					});
				}
			}
		})
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
		url(${root}/img/house2.jpeg);
	background-position: 70% 50%;
	background-size: cover;
	height: 350px;
}
</style>
</head>
<body>
	<%@include file="viewers/header.jsp"%>
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

				<div id="map"
					style="width: 800px; height: 600px; margin-left: auto; margin-right: auto;"></div>
			</div>



		</div>

	</div>
	<div class="row2">
		<div class="col-lg-12">
			<p>${navigation.navigator}</p>
		</div>

	</div>
	<%@include file="viewers/footer.jsp"%>
	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/js/popup.min.js"></script>
	<script src="${root}/js/slick.min.js"></script>
	<script src="${root}/js/tem.js"></script>
	<script src="${root}/js/custom.js"></script>
</body>
</html>