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

<title>마이페이지 | 펫키지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>
<body>
	<ryo:header />


	<ryo:menu type="mypage" />

	<div class="container pt-3 pb-3 mb-3 border-bottom">
		<div class="row justify-content-center">
			<form>
				<!-- 
		<h3 style="text-align:center"><label class="text-black" >
			노유림님 마이페이지<br>
		</label></h3> -->
				<!--  표로 진행할까 생각 중 -->
				<!-- 만약 mid가 없으면 회원가입 폼, 있으면 변경 폼 => tags로 구현 -->
				<!-- if mid==null : 회원가입 창 -->
				<!-- else mid==값 존재 : 회원정보 변경 및 탈퇴 창 -->
				<!-- 이름 누르면 변경할지 버튼 누르면 변경할지 고민할 것 -->
				<div style="border: 5px solid pink; border-radius: 12px;">
					<table style="width: 450px; height: 500px; border-color: #FEF2F6;">
						<tr style="background-color: #FEF2F6; border: none;">
							<td colspan="2" align="left" style="border: none;"><h5
									style="padding-left: 10px;">회원 정보</h5></td>
						</tr>
						<!-- 여백 -->
						<tr style="border: none;">
							<td colspan="2" style="border: none;"></td>
						</tr>
						<!-- 여백 -->
						<tr style="border: none;">
							<td rowspan="2" align="center" style="border: none;">
								<h5 style="text-align: center">${mnick}</h5>
								<h6 style="text-align: center">(${mname})</h6>
							</td>
							<td style="border: none;">
								<h5 style="text-align: right; padding-right: 10px;">
									<a href="memberchange.do"> <img
										src="images/pictogram/user-16.png" alt="Image">&nbsp;회원정보
										수정 >
									</a>
								</h5>
							</td>
						</tr>
						<tr style="border: none;">
							<td style="border: none;">
								<h5 style="text-align: right; padding-right: 10px;">
									<a data-toggle="modal" data-target="#myModal" style="cursor:pointer">회원탈퇴 ></a>
								</h5>
							</td>
						</tr>
						<!-- 여백 -->
						<tr style="border: none;">
							<td colspan="2" style="border: none;"></td>
						</tr>
						<!-- 여백 -->
						<tr style="background-color: #FEF2F6; border: none;">
							<td style="border: none;">
								<h5 style="text-align: left; padding-left: 10px;">회원의 반려동물
								</h5>
							</td>
							<td style="border: none;">
								<h5 style="text-align: right; padding-right: 10px;">
									<a href="inputpet.jsp">반려동물 추가 > </a>
								</h5>
							</td>
						</tr>
						<!-- 여백 -->
						<tr style="border: none;">
							<td colspan="2" style="border: none;"></td>
						</tr>
						<!-- 여백 -->
						<!-- 펫 리스트 반복 -->
						<c:forEach var="p" items="${datas}">
							<tr style="border: none;">
								<td style="border: none;">
									<h5 style="padding-left: 10px;">1.
										${p.pname}(${p.pvarity})(${p.page})</h5>
								</td>
								<td
									style="text-align: right; padding-right: 10px; border: none;">
									<h5>
										<a href="petchange.do?pid=${p.pid}">정보 수정 > </a>
									</h5>
								</td>
							</tr>
						</c:forEach>
						<!-- 펫 리스트 반복 -->
						<!-- 여백 -->
						<tr style="border: none;">
							<td colspan="2" style="border: none;"></td>
						</tr>			
						<!-- 여백 -->
						<tr style="border: none;">
							<td colspan="2" style="border: none;"></td>
						</tr>
						<!-- 여백 -->
						<!-- 장바구니 -->
						<tr style="background-color: #FEF2F6; border: none;">
							<td align="center" style="border: none;">
								<h5>
									<a href="cart.jsp"><img
										src="images/pictogram/shopping-cart-16.png" alt="Image">&nbsp;장바구니</a>
								</h5>
							</td>
							<td align="center" style="border: none;">
								<h5>
									<a href="orderlist.do">구매내역</a>
								</h5>
							</td>
						</tr>
						<!-- 구매내역 -->
					</table>
				</div>


			</form>
			<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

		<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">회원 탈퇴</h4>
					<button type="button" class="close" data-dismiss="modal">x</button>
				</div>
				<div class="modal-body">
					<p style="text-align:center; font-size:20px;">정말로 계정을 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<table>
						<tr>
							<td style="text-align: left; padding-left: 10px;">
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							</td>
							<td style="text-align: right; padding-right: 10px;">
								<a href="deleteM.do?mid='${mid}'">
									<button type="button" class="btn btn-default">예</button>
								</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

		</div>
	</div>



	<ryo:footer />


</body>
</html>
