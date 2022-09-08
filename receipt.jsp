<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ryo" tagdir="/WEB-INF/tags"%>
<!-- /*
* Template Name: Style
* Template Author: Untree.co
* Tempalte URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="free template, bootstrap, bootstrap4" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Single+Day&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital@0;1&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="fonts/feather/style.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/style.css">

<title>펫키지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- memberchange만의 특수 style설정 -->
<style type="text/css">
.modal {
	position: fixed;
	top: 50%;
	left: 50%;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	transform: translate(-50%, -50%);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 100%;
	height: 100vh;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}
</style>
</head>
<body>
	<ryo:header />


	<ryo:menu type="receipt" />

	<div class="container pt-3 pb-3 mb-3 border-bottom">
		<div class="row justify-content-center">
			<form>
				<table border="2"
					style="width: 450px; height: 500px; border-color: black;">
					<tr style="background-color: white;">
						<td colspan="2" align="center"><h5 style="padding-left: 10px;">영수증</h5></td>
					</tr>
					<tr>
						<td align="center" >
							<h5 style="text-align: center">제품 이름</h5>
						</td>
						<td>
							<h5 style="text-align: center;">제품 가격</h5>
						</td>
					</tr>
					<!-- 여백 -->
					<tr>
						<td colspan="2"></td>
					</tr>
					
					<tr>
						<td align="center">
							<h5 style="text-align: center">${i.iname}</h5>
						</td>
						<td style="text-align:right;">
							<h5 style="text-align: right; padding-right: 10px;">
								${i.iprice}원</h5>
						</td>
					</tr>
			
					<!-- 여백 -->
					<tr>
						<td colspan="2"></td>
					</tr>
					<!-- 여백 -->
					<!-- 펫 리스트 반복 -->
					<tr>
						<td>
							<h5 style="text-align: center; padding-left: 10px;">총 합계</h5>
						</td>
						<td>
							<h5 style="text-align: right; padding-right: 10px;">price</h5>
						</td>
					</tr>
				</table>
			</form>
			<!-- <div>
			<a><input type="button" class="btn btn-outline-black btn-block" value="메인으로 가기"></a>
			</div> -->

		</div>
	</div>



	<ryo:footer />


</body>
</html>
