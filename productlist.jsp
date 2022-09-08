<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pf" tagdir="/WEB-INF/tags"%>
<!-- /*
* Template Name: Style
* Template Author: Untree.co
* Tempalte URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="referrer" content="no-referrer" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
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

</head>
<body>

	<!--헤더-->
	<pf:header />

	<!-- 찐바디 -->
	<div class="section">
		<div class="container">
			<div class="row mb-4 align-items-center">
				<div class="col-6">
					<h2 class="line-top" style="font-weight: bold">
						<span style="color: #FF4081">${icategory}</span>
					</h2>
				</div>

			</div>
			<div class="row mb-5">

				<c:forEach var="i" items="${ITEM}">
					<div class="col-md-6 mb-5 mb-lg-5 col-lg-4">
						<div class="blog_entry">
							<a href="detail.do?iid=${i.iid}"> <img src="${i.iimg}"
								alt="Free Website Template by Untree.co" class="img-fluid">
							</a>
							<div class="p-4 bg-white">
								<h3 style="text-align: center;">${i.iname}</h3>
								<h3 style="text-align: center;">${i.iprice}</h3>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			<c:if test="${flag!=1}">
				<c:if test="${iid!=null}">
				<div class="form-group">
					<button
						onclick="location.href='productlist.do?iid=${iid}&more=${more+12}'"
						class="btn btn-outline-black btn-block">더보기</button>
				</div>
				</c:if>
				<c:if test="${search!=null}">
				<div class="form-group">
					<button
						onclick="location.href='search.do?search=${search}&more=${more+12}'"
						class="btn btn-outline-black btn-block">더보기</button>
				</div>
				</c:if>
			</c:if>
		</div>
	</div>

	<!-- 푸터부분 -->
	<pf:footer />
</body>
</html>