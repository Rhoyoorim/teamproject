<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
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

<script type="text/javascript">
	$(document).ready(function() {
		$("#agree").click(function() {
			if ($("#agree").is(":checked"))
				$("input[name=check]").prop("checked", true);
			else
				$("input[name=check]").prop("checked", false);
		});

		$("input[name=check]").click(function() {
			var total = $("input[name=check]").length;
			var checked = $("input[name=check]:checked").length;

			if (total != checked)
				$("#agree").prop("checked", false);
			else
				$("#agree").prop("checked", true);
		});
		
		$("input[name=icnt]").change(function() {
			var tr = $(this).parent().parent();
			var td = tr.children();
			var cnt = td.eq(2).children().val();
			var regex = /[^0-9]/g;
			var price = td.eq(3).text().replace(regex, "");
			td.eq(4).text(price * cnt + "원");
			var num = 0;
			$(".price").each(function(i) {
				num += 1 * $('.price').eq(i).text().replace(regex,'')*1;
				$(".price_sum").text(num);
				if ($(".price_sum").text() >= 30000) {
					$(".dely").text(0);
				} else {
					$(".dely").text(2500);
				}
				$(".total_price").text(num + 1 * $(".dely").text());
			});
		});
		
		$("#del_btn").click(function() {
            var check = $("input[name=check]:checked");
            var arr = new Array();
            check.each(function(i) {
                arr.push($(check).eq(i).val());
            });
            var form = document.createElement("form");
            var input = document.createElement("input");
            form.setAttribute("charset", "UTF-8");
            form.setAttribute("method", "Post"); //Post 방식
            form.setAttribute("action", "deleteC.do"); //요청 보낼 주소
            input.setAttribute("type", "hidden");
             input.setAttribute("name", "index");
             input.setAttribute("value", arr.join("/"));    // /로 전송됨 ex a/b/c
             form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
        });
	});
</script>

</head>
<body>
<tag:header/>
	<div class="col-sm-8 mx-auto">
		<div class="container pt-5 pb-2 mb-2 border-bottom ">
			<div class="row text-center">
				<h1 class="hero-heading">장 바 구 니</h1>
			</div>
		</div>

		<div class="container-sm my-2 p-2">
			<div class="col mx-auto">
				<table class="table align-middle table-striped text-center table-hover">
				<colgroup>
                        <col class="col-1">
                        <col class="col-5">
                        <col class="col-2">
                        <col class="col-2">
                        <col class="col-2">
                    </colgroup>
					<thead>
						<tr>
							<td><input type="checkbox" id="agree"></td>
							<td>상품/옵션정보</td>
							<td>수량</td>
							<td>상품 금액</td>
							<td>합계 금액</td>
							<td>배송비</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${data}">
							<tr>
								<td class="align-middle"><input type="checkbox"
									class="check" value="${data.indexOf(i)}" name="check"></td>
								<td class="align-middle"><img alt="이미지" src="${i.iimg}"
									width=150px height=150px> ${i.iname}</td>
								<td class="align-middle"><input type="number" min="1"
									max="1" value="1" name="icnt" readonly></td>
								<td class="align-middle">${i.iprice}</td>
								<td class="align-middle price">${i.iprice}</td>
								<td class="align-middle">국내 2500원</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
			<div class="row">
				<div class="col">
					<button class="btn btn-outline-black  btn-sm" id="del_btn">선택 상품 삭제</button>
				</div>
			</div>
		</div>
		<div class="container p-2 my-2">
			<div class="row">
				<div class="col-sm-6 border fs-4">
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><span>상품 가격</span> <strong
							class="price_sum"><c:set var="total" value="0" /> <c:forEach var="result" items="${data}" varStatus="status">
									<c:set var="total" value="${total+result.iprice.replaceAll('[^0-9]','')}" />
								</c:forEach> <c:out value="${total}" /></strong>&nbsp;원</li>
						<li class="list-group-item"><img alt=""
							src="images/icon/order_price_plus.png" class="img-fluid"> <span>배송비</span>
							<strong class="dely">2500</strong>&nbsp;원</li>
						<li class="list-group-item"><img alt="" src="images/icon/order_price_total.png" class="img-fluid">
							<span>결재 금액</span> <strong class="total_price"><c:out value="${total+2500}" /></strong>&nbsp;원</li>
						<li class="list-group-item"><a href="buy.do"
							class="btn btn-outline-black  btn-sm">구매하기</a> <a href="main.do"
							class="btn btn-outline-black  btn-sm">쇼핑 더하기</a></li>
					</ul>
				</div>
				<div class="col-sm-6 border fs-6 align-middle">
					<ul class="list-group list-group-flush">
						<li class="list-group-item fs-4">배송주문시 유의 사항</li>
						<li class="list-group-item">총 주문금액이 30,000원 미만일 경우 2,500원의
							배송비가 부가됩니다.</li>
						<li class="list-group-item">총 주문금액이 30,000원 이상일 경우 무료배송으로
							출고됩니다.</li>
						<li class="list-group-item">배송지가 2군데 이상일 경우는 각각 별도의 주문을 넣어주셔야
							합니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<tag:footer/>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/jquery-migrate-3.0.0.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/imagesloaded.pkgd.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jarallax.min.js"></script>
	<script src="js/jarallax-element.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>

	<script src="js/jquery.lettering.js"></script>


	<script src="js/TweenMax.min.js"></script>
	<script src="js/ScrollMagic.min.js"></script>
	<script src="js/scrollmagic.animation.gsap.min.js"></script>
	<script src="js/debug.addIndicators.min.js"></script>


	<script src="js/custom.js"></script>


</body>
</html>
