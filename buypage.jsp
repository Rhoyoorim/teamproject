<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		$("input[name=address_sel]").click(function() {
            if($("#sel1").is(':checked')){
                $(".address_sel1").removeClass('d-none');
                $(".address_sel2").addClass('d-none');
            }
            if($("#sel2").is(':checked')){
                $(".address_sel2").removeClass('d-none');
                $(".address_sel1").addClass('d-none');
            }
        });
	});
</script>
</head>
<body>
<tag:header/>

		<div class="container my-2 p-2 ">
			<div class="row">
				<div class="col-sm p-0">
					<table
						class="table align-middle text-center table-hover table-bordered">
						<colgroup>
							<col class=col-2>
							<col class=col-4>
							<col class=col-6>
						</colgroup>
						<thead>
							<tr>
								<th colspan="2">주문자 정보</th>
								<th>주문자 정보 안내</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<tr>
								<td class="align-middle"><span>아이디</span></td>
								<td><strong>${member.mid}</strong></td>
								<td class="align-middle"><span>회원님 주소와 주문자 주소가 틀릴 경우
										회원 정보를 수정해 주세요</span>.</td>
							</tr>
							<tr>
								<td class="align-middle"><span>이름</span></td>
								<td><strong>${member.mname}</strong></td>
								<td class="align-middle">Yahoo.com , Msn.com등 해외메일은 국내메일로
									수정부탁드립니다.</td>
							</tr>
							<tr>
								<td class="align-middle"><span>이메일주소</span></td>
								<td><strong>${member.memail}</strong></td>
								<td class="align-middle">해외메일로 메일 수/발신이 되지않아, 입금/주문/배송정보를
									받지 못하실 수 있습니다</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container-sm my-2 p-2">
			<div class="row">
				<div class="col-sm-6 m-0 p-0 mh-80">
					<form action="commit.do" id="cummit" method="post">
						<table class="table table-hover table-bordered  align-middle">
							<colgroup>
								<col class="col-3">
								<col class="col-9">
							</colgroup>
							<thead>
								<tr>
									<th colspan="2">배송지 정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>배송지 선택</td>
                                <td><input type="radio" name="address_sel" id="sel1"
                                    autocomplete="off" value="true"> <label for="sel1">기존 배송지</label> <input
                                    type="radio" name="address_sel" id="sel2" autocomplete="off" value="false">
                                    <label for="sel2">신규 배송지</label></td>
								</tr>
								<tr>
									<td>이 름</td>
									<td class="d-none address_sel1">${aname}</td>
									<td class="address_sel2"><input type="text" name="aname"
										min="2" required></td>
								</tr>
								<tr class="address_sel2">
									<td class="align-middle">우편번호</td>
									<td class="address_sel2"><input type="text"
										name="checkAddress" id="sample6_postcode">&nbsp;<input
										type="button" onclick="sample6_execDaumPostcode()"
										value="우편번호 찾기"></td>
								</tr>
								<tr>
									<td>주 소</td>
									<td class="d-none address_sel1">${address}</td>
									<td class="address_sel2"><input type="text"
										id="sample6_address" name="address1" class="w-100"></td>
								</tr>
								<tr class="address_sel2">
									<td>상세 주소</td>
									<td><input type="text" id="sample6_detailAddress"
										class="w-100" name="address2"></td>
								</tr>
								<tr>
									<td>휴대폰 번호</td>
									<td class="d-none address_sel1">${aphone}</td>
									<td class="address_sel2"><input type="tel"
										id="sample6_detailAddress" name="phone" value="${phone}"></td>
								</tr>
							</tbody>
						</table>
						<input type="hidden" id="send_price" name="total_price">
					</form>
				</div>
				<div class="col-sm-6 m-0 mb-2 p-0  " style="height: 360px">
					<div class="mh-100 overflow-auto">

						<table
							class="table align-middle text-center table-hover table-bordered">
							<colgroup>
								<col class="col-9">
								<col class="col-3">
							</colgroup>
							<thead>
								<tr>
									<td class="align-middle">배송지역</td>
									<td class="align-middle">추가 배송비</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><div>제주 제주시 우도면, 제주 제주시 추자면</div></td>
									<td rowspan="5" class="align-middle">2,500원</td>
								</tr>
								<tr>
									<td><div>울릉군 북면, 울릉읍, 여수시 경호동,울릉군 서면</div></td>
								</tr>
								<tr>
									<td><div>전남 완도군 금일읍</div></td>
								</tr>
								<tr>
									<td><div>전남 여수시 남면, 전남 여수시 묘도동 , 전남 여수시 삼산면 , 전남 여수시
											화정면 개도리 , 전남 여수시 화정면 낭도리 , 전남 여수시 화정면 상화리 , 전남 여수시 화정면 여자리 ,
											전남 여수시 화정면 월호리 , 전남 여수시 화정면 적금리 , 전남 여수시 화정면 제도리 , 전남 여수시 화정면
											조발리 , 전남 여수시 화정면 하화리 ,전남 신안군 암태면,인천 강화군 교동면 , 인천 강화군 삼산면 , 인천
											강화군 서도면 , 전남 고흥군 도양읍 시산리 , 전남 고흥군 도양읍 봉암리 상화도 , 전남 고흥군 도양읍
											봉암리 허화도, 전남 고흥군 도양읍 득량리 , 전북 군산시 옥도면 , 전북 부안군 위도면 , 충남 보령시
											오천면 고대도리 , 충남 보령시 오천면 녹도 , 충남 보령시 오천면 삽시도리 , 충남 보령시 오천면 효자도2리
											소도 , 충남 보령시 오천면 효자도2리 육도 , 충남 보령시 오천면 효자도2리 월도 , 충남 보령시 오천면
											외연도리 , 충남 보령시 오천면 장고도리 , 충남 보령시 오천면 효자도2리 추도 , 충남 보령시 오천면 호도
											, 충남 보령시 오천면 효자도2리 허육도 , 충남 보령시 오천면 효자도리 , 전남 완도군 노화읍 , 전남
											완도군 보길면, 전남 완도군 소안면, 전남 완도군 청산면, 전남 완도군 군외면 당인리, 전남 완도군 군외면
											불목리 , 전남 완도군 군외면 영풍리 , 전남 완도군 군외면 황진리 , 전남 완도군 생일면 , 충남 태안군
											근흥면</div></td>
								</tr>
								<tr>
									<td><div>제주, 경남 사천시 신수동, 경남 사천시 마도동, 경남 거제시 장목면 시방리,
											경남 거제시 둔덕면 화도리 , 충남 당진군 석문면 난지도리, 부산 강서구 눌차동, 부산 강서구 대항동, 부산
											강서구 동선동, 부산 강서구 성북동, 부산 강서구 천성동, 전남 보성군 벌교읍, 전남 영광군 낙월면, 경남
											통영시 산양읍 추도리, 경남 통영시 산양읍 연곡리, 경남 통영시 산양읍 곤리, 경남 통영시 산양읍 저림리,
											경남 통영시 용남면 어의리, 경남 통영시 용남면 지도리,충남 보령시 오천면 원산도리,제주시,제주특별자치도</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="container-sm my-2 p-2 ">
			<div class="col-sm">
				<table
					class="table align-middle table-striped text-center table-hover">
					<colgroup>
						<col class="col-1">
						<col class="col-5">
						<col class="col-2">
						<col class="col-2">
						<col class="col-2">
					</colgroup>
					<thead>
						<tr>
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
		</div>
		<div class="container-sm p-2 my-2">
			<div class="row">
				<div class="col-sm-6 col-md border fs-4">
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><span>상품 가격</span> <strong
							class="price_sum"><c:set var="total" value="0" /> <c:forEach
									var="result" items="${data}" varStatus="status">
									<c:set var="total"
										value="${total+result.iprice.replaceAll('[^0-9]','')}" />
								</c:forEach> <c:out value="${total}" /></strong>&nbsp;원</li>
						<li class="list-group-item"><img alt=""
							src="images/icon/order_price_plus.png" class="img-fluid"> <span>배송비</span>
							<strong class="dely">2500</strong>&nbsp;원</li>
						<li class="list-group-item"><img alt=""
							src="images/icon/order_price_total.png" class="img-fluid">
							<span>결재 금액</span> <strong class="total_price"> <c:out
									value="${total+2500}" /></strong>&nbsp;원</li>
					</ul>
				</div>
				<div class="col-sm-6 col-md border fs-6">
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
			<div class="text-right">
            <div class="col p-2">
                <button class="btn btn-outline-black  btn-sm"
                    onclick="location.href='main.do'">결제 취소</button>
                <button type="submit" class="btn btn-outline-black  btn-sm"
                    id="payment" onclick="payment()">결제 하기</button>
            </div>
        </div>
		</div>
	<tag:footer/>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function payment(){
        $('#send_price').attr('value',$('.total_price').text());
        $("#cummit").submit();
    }
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수
							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}
							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
							} 
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
	
</body>
</html>