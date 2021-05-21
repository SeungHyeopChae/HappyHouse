<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
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
<link href="${root}/css/animations.css" rel="stylesheet">
<link href="${root}/css/typography-default.css" rel="stylesheet">
<link href="${root}/css/bt.css" rel="stylesheet">
<link href="${root}/css/light.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    $("#city").change(function(){
        var act="searchgugun";
            $.ajax({
                url : '${root }/main', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
                mathod : 'post',
                data : {
                     "act": act, "si": $('#city').val() 
                },
                datatype:"json",
                success : function(data){ //DB접근 후 가져온 데이터
                    var list='';
                    $("#gu").empty();
                    $.each(data, function(index,item){
                    	console.log(data);
                        list='';
                        list+= "<option value=" +item.gugun+" >"+item.gugun+"</option>";
                        $("#gu").append(list);
                    });
                }
            })
        })
    
    $("#gu").change(function(){
        var act="searchdong";
            $.ajax({
                url : '${root }/main', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
                mathod : 'post',
                data : {
                     "act": act, "gu": $('#gu').val() 
                },
                datatype:"json",
                success : function(data){ //DB접근 후 가져온 데이터
                    var list='';
                    $("#dong").empty();
                    $.each(data, function(index,item){
                        list='';
                        list+= "<option value=" +item.dong+" >"+item.dong+"</option>";
                        $("#dong").append(list);
                    });
                }
            })
        })
})
</script>
<script>
$(document).ready(function() {
	$("#regiarea").click(function() {
			$("#frm").attr("action", "${root}/main?act=likearea").submit();
	});
});

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
	<%@ include file="../viewers/header.jsp" %>
	<div class="breadcrumb-container">
		<div class="container-fluid">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home pr-2"></i> <a
					class="link-dark" href="${root}/">Home</a></li>
				<li class="breadcrumb-item active">관심지역 설정</li>
			</ol>
		</div>
	</div>

	<div class="container-fluid p-3 my-3text-white"
		style="background-color: #707070;">
		<div class="container p-3 my-3">
			<div class="row justify-content-center"
				style="background-color: #F9F9F9; height: 500px;">
				<div class="row" style="margin-top: 20px;">
					<h2 class="title">관심지역 설정</h2>
				</div>
				<div class="light-gray-bg border-clear" style="margin-top: 70px;">
					<form class="form-inline" id="frm" action="" method="post">
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
				 <div>
                       <button type="button" class="btn btn-warning marginTop">닫기 ✔</button>
                       <button type="button" id="regiarea" class="btn btn-warning marginTop">등록 ✔</button>
                 </div>
				
			</form>
				</div>
			</div>
		</div>
	</div>


	<!--하단-->
	<%@include file="../viewers/footer.jsp" %>

	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/js/popup.min.js"></script>
	<script src="${root}/js/slick.min.js"></script>
	<script src="${root}/js/tem.js"></script>
	<script src="${root}/js/custom.js"></script>
</body>

</body>
</html>