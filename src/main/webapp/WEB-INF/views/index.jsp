<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${cookie.save_id.value ne null}">
	<c:set var="saveid" value="${cookie.save_id.value}" />
	<c:set var="idck" value=" checked=\"checked\"" />
</c:if>
<!DOCTYPE html>
<html>
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
<link href="${root}/css/typography-default.css" rel="stylesheet">
<link href="${root}/css/bt.css" rel="stylesheet">
<link href="${root}/css/light.css" rel="stylesheet">
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
		document.getElementById("frm").action = "${root}/house/search?pg=1&key=dong&word="+$("#dong").val();
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
<script>
    $(function(){
        $("#city").change(function(){
                $.ajax({
                    url : "${root}/address/gugun", //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
                    type : "POST",
                    data : {"si" : $('#city').val()},
                    success : function(data){ //DB접근 후 가져온 데이터
                        var list='';
                        $("#gu").empty();
                        $("#dong").empty();
                        var delist='';
                        delist+="<option value="+"all"+">"+"시/도/군"+"</option>";
                        $("#gu").append(delist);
                        delist='';
                        delist+="<option value="+"all"+">"+"동"+"</option>";
                        $("#dong").append(delist);
                        for(var i = 0; i<data.length;i++){
                        	console.log(data[i].gugun);
                        	list='';
                        	list+="<option value=" +data[i].gugun+" >"+data[i].gugun+"</option>";
                            $("#gu").append(list);
                        }
                    }
                })
            })
        
        $("#gu").change(function(){
                $.ajax({
                    url : "${root}/address/dong", //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
                    type : "POST",
                    data : {"gu": $('#gu').val()},
                    success : function(data){ //DB접근 후 가져온 데이터
                        var list='';
                        $("#dong").empty();
                        var delist='';
                        delist+="<option value="+"all"+">"+"동"+"</option>";
                        $("#dong").append(delist);
                        for(var i = 0; i<data.length;i++){
                        	list='';
                        	list+="<option value=" +data[i].dong+" >"+data[i].dong+"</option>";
                            $("#dong").append(list);
                        }
                    }
                })
            })
    })
    </script>
   

<!-- 
<style>
.banner {
	background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)),
		url(${root}/img/house2.jpeg);
	background-position: 70% 50%;
	background-size: cover;
	height: 350px;
}
</style> -->
</head>
<body>

	<%@include file="viewers/header.jsp" %>
			<!-- header-second end -->

		<!--HAPPY HOUSE 행복한 우리집-->
<!-- 		<div class="banner dark-translucent-bg">
			<div class="container-fluid">
				<div class="justify-content-center">
					<h1 class=""
						style="text-align: center; color: white; margin-top: 50px;">HAPPY
						HOUSE</h1>
					<hr>
					<p style="text-align: center; color: white;">행복한 우리집</p>
				</div>
			</div>
		</div> -->


		<!--도/광역시 시구군 동 부분-->
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
				<button type="button" class="btn btn-primary" id=dongSearch onclick="javascript:search();">검색</button>
			</form>
			
		</div>

		<!--지도 부분-->
		<div class="container justify-content-center"
			style="margin-top: 50px;">
			
				<div id="map" style="width:100%;height:350px;"></div>
		</div>



	<!--지도 밑에 부분 -->
	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="col-md-4">
				<img src="${root}/img/sideAD.jpg">
			</div>
			<div class="col-md-4">
				<h4>주택 관련 기사</h4>
				<hr>
				<ul style="list-style: none; padding-left: 0px; font-size: 15px;">
					<li style="margin-bottom: 5px;">[인사] 신동아 건설</li>
					<li style="margin-bottom: 5px;">12.16 대책 후 '매수.매도자 모두 일단 관망세'</li>
					<li style="margin-bottom: 5px;">구미시, 낙동강 변 국가3산단에 민간공원 조성</li>
					<li style="margin-bottom: 5px;">'은행'과 '보험사'의 주택담보대출 조건, 어떻게
						다를까?</li>
				</ul>
				<hr>
			</div>
			<div class="col-md-4">
				<h4>오늘의 뉴스</h4>
				<hr>
				<ul style="padding-left: 0px; font-size: 12px;">
					<li style="margin-bottom: 5px;"><a class="text text-primary">KB국민은행,
							‘디지털헌금바구니’ 출시</a></li>
					<li style="margin-bottom: 5px;"><a class="text text-primary">존슨콘트롤즈,
							OpenBlue 공개 “135년 쌓아온 빌딩 전문성과 최첨단 기술 결합”</a></li>
					<li style="margin-bottom: 5px;"><a class="text text-primary">산업통상자원부,
							업종별 비대면·온라인 수출 기반 본격 가동</a></li>
					<li style="margin-bottom: 5px;"><a class="text text-primary">
							장상인 대표, 제6회 INAK사회공헌대상 프레스클럽부문 ‘시민봉사대상’ 수상?</a></li>
					<li style="margin-bottom: 5px;"><a class="text text-primary">삼성전자,
							한샘과 공동사업 강화 위한 업무협약 체결</a></li>
					<li><a href="${root}/bd">임시 뷰</a></li>
				</ul>
				<hr>
			</div>
		</div>
	</div>




	<%@ include file="viewers/footer.jsp" %>
	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/js/popup.min.js"></script>
	<script src="${root}/js/slick.min.js"></script>
	<script src="${root}/js/tem.js"></script>
	<script src="${root}/js/custom.js"></script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25135de355b0c11f7e6e55d88edc8003"></script>
	<script>
		var mapContainer = document.getElementById('map');
		var mapOption = { 
        		center: new kakao.maps.LatLng(36.107238, 128.415105),
        		level: 4 // 지도의 확대 레벨
    	};

		var map = new kakao.maps.Map(mapContainer, mapOption); 
	</script>
	
	
</body>
</html>