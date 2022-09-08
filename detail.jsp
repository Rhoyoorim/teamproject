<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pf" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<!-- /*
* Template Name: Style
* Template Author: Untree.co
* Tempalte URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
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

<title>펫키지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<style type="text/css">
#star a {
	text-decoration: none;
	color: gray;
	
}

#star a.on {
	color: red;
}

li {
	list-style: none;
}
}
</style>
</head>
<body>
	<script type="text/javascript">
function cartadd(){
	
	alert('장바구니에 정상적으로 담겼습니다!');
}
</script>
	<!--헤더-->
	<pf:header />


	<!-- 찐바디 -->
	<br>
	<div class="container">
		<!-- 카테고리는 크롤링에 물어봐야해서 일단 패스 -->
		<!-- ${i.icategory}> <a href="puppyFeed.html">${i.icategory}</a>> ${i.icategory}> <a
				href="detail.do">${i.iname}</a> -->

		<c:set var="o" value="${datas.itemVO}" />
		<div class="row align-items-center justify-content-around">
			<div class="col-lg-5 mt-5">
				<div>
					<div class="main-slider owl-single dots-absolute owl-carousel img">
						<img src="${o.iimg}" alt="Image" class="img-fluid">
					</div>
				</div>
			</div>
			<!-- 여기가 주문하는 곳 -->
			<div class="col-lg-4 text-center">
				<div>
					<div class="col-lg-12">
						<h1 class="hero-heading"
							style="text-align: center; margin: 3em; font-size: 25px;">${o.iname}</h1>
						<form action="cart.do?iid=${o.iid}" method="post">
							<p class="sub-text">
							<div class="pid__price">
								<div class="pid__price__box">
									<div class="pid__price__wrap">
										<div class="pid__price__apply">
											<span>${o.iprice}</span>
										</div>
									</div>
								</div>
								<c:if test="${mid!=null}">
									<div class="form-group">
										<div class="btn btn-primary1">
											<input type="submit" class="btn btn-primary1 btn-md1"
												onclick="cartadd()" value="장바구니에 담기">
										</div>
									</div>
								</c:if>

								<c:if test="${mid==null}">
									<div class="form-group">
										<div class="btn btn-primary1">
											<input type="button" class="btn btn-primary1 btn-md1"
												id="btn-modal" value="장바구니에 담기">
										</div>
									</div>
									<div>
										<div id="container"></div>
										<div id="modal" class="modal-overlay">
											<div class="modal-window">
												<div class="close-area" id="closeBtn">X</div>
												<div class="content">
													로그인이 필요합니다. 로그인하시겠습니까?<br></br>
													<button class="btn btn-primary1 btn-md1"
														onclick="signup.do">회원가입</button>
													<button class="btn btn-primary1 btn-md1" onclick="login.do">로그인</button>
												</div>
											</div>
										</div>
									</div>
									<script type="text/javascript">
										const modal = document.getElementById("modal")
										const btnModal = document.getElementById("btn-modal")
										btnModal.addEventListener("click", e => { //모달창 열기
											modal.style.display = "flex"})
										const closeBtn = modal.querySelector(".close-area")
										closeBtn.addEventListener("click", e => { //모달창 닫기 
											modal.style.display = "none"
											})
									</script>
								</c:if>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br></br>

	<div class="container pb-5 mb-5 border-bottom">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="h6 mb-3 text-black">배송설명</h1>
			</div>
			<div class="col-lg-12">
				<div class="custom-accordion" id="accordion_1">
					<div class="accordion-item">
						<h2 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">상세보기</button>
						</h2>
						<div id="collapseTwo" class="collapse"
							aria-labelledby="headingTwo" data-parent="#accordion_1">
							<div class="accordion-body">
								<img
									src="https://petbox.godohosting.com/files/petbox_images/pp_com_info.jpg"
									alt="Free Website Template by Untree.co" class="img-fluid">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div class="container pb-5 mb-5 border-bottom">
		<div class="row">
			<div class="pt-5">
				<h3 class="mb-5">상품평</h3>
				<ul class="comment-list">
					<c:forEach var="i" items="${datas.rList}">
						<li class="comment">
							<div class="comment-body">
							${i.writer}
							<img alt="${i.rimg}" src="${i.rimg}" height="100" width="100" style="border-radius:15px">
								<c:if test="${i.star==1.0}">
									<div class="form-group">
										<P id="starR" style="white-space:nowrap">
											<!-- 부모 -->
											<a href="#" value="1" style="color: red">★</a>
											<!-- 자식들-->
											<a href="#" value="2">★</a> <a href="#" value="3">★</a> <a
												href="#" value="4">★</a> <a href="#" value="5">★</a>
										<p>
									</div>
								</c:if>
								<c:if test="${i.star==2.0}">
									<div class="form-group">
										<P id="starR" style="white-space:nowrap">
											<!-- 부모 -->
											<a href="#" value="1" style="color: red">★</a>
											<!-- 자식들-->
											<a href="#" value="2" style="color: red">★</a> <a href="#" value="3">★</a> <a
												href="#" value="4">★</a> <a href="#" value="5">★</a>
										<p>
									</div>									
								</c:if>
								<c:if test="${i.star==3.0}">
									<div class="form-group">
										<P id="starR" style="white-space:nowrap">
											<!-- 부모 -->
											<a href="#" value="1" style="color: red">★</a>
											<!-- 자식들-->
											<a href="#" value="2" style="color: red">★</a> <a href="#" value="3" style="color: red">★</a> <a
												href="#" value="4">★</a> <a href="#" value="5">★</a>
										<p>
									</div>
								</c:if>
								<c:if test="${i.star==4.0}">
									<div class="form-group">
										<P id="starR" style="white-space:nowrap">
											<!-- 부모 -->
											<a href="#" value="1" style="color: red">★</a>
											<!-- 자식들-->
											<a href="#" value="2" style="color: red">★</a> <a href="#" value="3" style="color: red">★</a> <a
												href="#" value="4" style="color: red">★</a> <a href="#" value="5">★</a>
										<p>
									</div>
								</c:if>
								<c:if test="${i.star==5.0}">
									<div class="form-group">
										<P id="starR" style="white-space:nowrap">
											<!-- 부모 -->
											<a href="#" value="1" style="color: red">★</a>
											<!-- 자식들-->
											<a href="#" value="2" style="color: red">★</a> <a href="#" value="3" style="color: red">★</a> <a
												href="#" value="4" style="color: red">★</a> <a href="#" value="5" style="color: red">★</a>
										<p>
									</div>
								</c:if>

								
								<p>${i.content}</p>
								<br>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

			<br> <br>

			<c:if test="${mid!=null}">
				<div class="col-lg-12">
					<h3 class="mb-5-1">후기쓰기</h3>
				</div>
				<div class="col-lg-7">
					<form action="insertR.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="iid" value="${o.iid}">
						<input type="hidden" name="star" id="starInput" value="">
						<div class="form-group">
							<label for="starfloat">별점 남기기 *</label> 
							<P id="star">
								<!-- 부모 -->
								<a  value="1">★</a>
								<!-- 자식들-->
								<a  value="2">★</a> <a  value="3">★</a> <a
									 value="4">★</a> <a  value="5">★</a>
							<p>
						</div>
						<div class="form-group">
							<input type="file" name="fileName">
						</div>
						<div class="form-group">
							<label for="message">내용 *</label>
							<textarea name="content" id="message" name="content" cols="30"
								rows="5" class="form-control" required="required"></textarea>
						</div>

						<div class="form-group">
							<input type="submit" disabled='disabled' value="등록하기"
								id="sendButton" class="btn btn-primary1 btn-md1">
						</div>
					</form>
				</div>
			</c:if>
		</div>
	</div>
	<!-- 푸터부분 -->
	<pf:footer />

	<script>
	$('#star a').click(function(){
		var cnt;
		 $(this).parent().children("a").removeClass("on");    
		 $(this).addClass("on").prevAll("a").addClass("on");
		 cnt=$('#star>.on').length;
		 $('#starInput').attr('value',cnt);
		 console.log('cnt: '+cnt);
		 console.log('인풋값: '+$('#starInput').val());
		if("value" != null){
			 $(':input[type="submit"]').prop('disabled', false);
		}
	});
	</script>

</body>
</html>
