<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="pf" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="referrer" content="no-referrer" />
<meta name="viewport"
	content="widtd=device-widtd, initial-scale=1, shrink-to-fit=no">
<meta name="autdor" content="Untree.co">
<link rel="shortcut icon" href="1234.png">

<meta name="description" content="" />
<meta name="keywords" content="free template, bootstrap, bootstrap4" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Single+Day&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital@0;1&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.tdeme.default.min.css">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="fonts/featder/style.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/style.css">

<title>펫키지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

</head>
<body>
	<!--헤더-->
	<pf:header />

	<div class="container pt-5 pb-2 mb-2 border-bottom ">
		<div class="row text-center">
			<h1 class="hero-heading">구매 목록</h1>
		</div>
	</div>
	<c:if test="${datas==null}">
		<div class="container pt-5 pb-2 mb-2">
			<div style="text-align: center;">
				<h3>아직 구매를 한번도 하지 않으셨군요!</h3>
				<h3 class="mb-5">그렇다면 첫 구매를 하러 가볼까요?</h3>
				<p class="mb-5">
					<a href="main.do" class="btn btn-sm btn-outline-black">주문하러 가기</a>
				</p>
				<!-- a태그에 뭐라고 써야할지 몰라서 일단 shop.do라고 적었어요
			아마 전체물건목록페이지나 메인페이지로 갈 수 있게 하면 될 거같은데
			성환님 판단에 맡길게요!  -->
			</div>
		</div>
	</c:if>


	<c:if test="${datas!=null}">
		<div class="container my-2 p-2">
			<div class="col mx-auto">
				<table class="table align-middle text-center table-hover">
					<thead>
						<tr>
							<td>상품사진</td>
							<td>상품명</td>
							<td>상품 금액</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${datas}">
							<tr>
								<td class="align-middle"><a href="detail.do?iid=${i.iid}"><img
										alt="이미지" src="${i.iimg}" width="50px" height="50px"></a></td>
								<td class="align-middle">${i.iname}</td>
								<td class="align-middle">${i.iprice}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div style="text-align: center;">
					<c:if test="${startNum!=1}">
						<a href="orderlist.do?pageNum=${startNum-1}">Prev</a>
					</c:if>
					<c:forEach var="i" begin="${startNum}" end="${endNum}">
						<a href='orderlist.do?pageNum=${i}'>${i}</a>
					</c:forEach>
					<c:if test="${endNum!=pcnt}">
						<a href="orderlist.do?pageNum=${endNum+1}">Next</a>
					</c:if>
				</div>
			</div>
		</div>
	</c:if>

	<!-- 푸터부분 -->
	<pf:footer />
</body>
</html>