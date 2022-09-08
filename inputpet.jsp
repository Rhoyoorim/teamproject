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

<title>펫키지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
<script type="text/javascript">
$(document).ready(function(){
	$("input[name='gender']:radio").change(function(){
		var gender=this.value;
		
		if(gender=="dog"){
			$('#pdog').show();
			$('#pcat').hide();
		}else if(gender=="cat"){
			$('#pdog').hide();
			$('#pcat').show();
		}
	});
});
</script>
</head>
<body>
	
	<ryo:header/>
	
	<ryo:menu type="petinput"/>

	<div class="section-grey">
			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<div class="col mb-5">
						<div class="card h-100 w-75" style="margin:auto;">
							<!-- Product image-->
							<img class="card-img-top" src="images/강아지1.PNG" alt="..." style="width:100%; height:70%;"/>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">강아지</h5>
									<input type="radio" name="gender" id="dog" value="dog" checked>
									<!-- Product price-->
								</div>
							</div>
							<!-- Product actions-->
						</div>
					</div>
					<div class="col mb-5">
						<div class="card h-100 w-75" style="margin:auto;">
							<!-- Product image-->
							<img class="card-img-top" src="images/고양이2.PNG" alt="..." style="width:100%; height:70%;"/>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">고양이</h5>
									<input type="radio" name="gender" id="cat" value="cat">
									<!-- Product reviews-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
	</div>
	<div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<!-- section 있던 자리 -->
			<form method="post" name='petspecies' action="insertP.do?">
				<div class="form-group"></div>
				
				<div class="form-group">
					<label class="text-black" for="pname">반려동물의 이름을 알려주세요!</label> <input
						type="text" class="form-control" id="pname" name="pname"
						placeholder="예) 까미, 쿠키, 바둑이" required="required">
				</div>
				<div class="form-group">
					<label class="text-black" for="pvarity">반려종을 선택해주세요!</label> 
				<span id="pdog">
					<select class="form-control" name="pvarity" >
						<option>세상에 하나뿐인 믹스</option>
						<option>고든 세터</option>
						<option>골든 두들</option>
						<option>골든 리트리버</option>
						<option>그레이 하운드</option>
						<option>그레이트 데인</option>
						<option>그레이트 스위스 마운틴 도그</option>
						<option>그레이트 피레니즈</option>
						<option>그레이하운드</option>
						<option>그로넨달</option>
						<option>그리스 셰퍼드</option>
						<option>그리스 헤어하운드</option>
						<option>그린란드견</option>
						<option>글렌 오브 이말 테리어</option>
						<option>기슈견</option>
						<option>까나리오</option>
						<option>꼬동 드 툴레아</option>
						<option>나폴리탄 마스티프</option>
						<option>노르보텐 스피츠</option>
						<option>노르웨이안 룬트훈트</option>
						<option>노르웨이안 버훈트</option>
						<option>노르웨이안 엘크 하운드</option>
						<option>노포크 테리어</option>
						<option>닥스훈트</option>
						<option>달마시안</option>
						<option>대니시 스웨디시 팜독</option>
						<option>더치 셰퍼드</option>
						<option>도베르만</option>
						<option>라이카</option>
						<option>러셀 테리어</option>
						<option>레온베르거</option>
						<option>마스티프</option>
						<option>말티즈</option>
						<option>미니어처 불 테리어</option>
						<option>미니어처 슈나우저</option>
						<option>보더 콜리</option>
						<option>보더 테리어</option>
						<option>복서</option>
						<option>불 테리어</option>
						<option>불개</option>
						<option>불도그</option>
						<option>비글</option>
						<option>비숑 프리제</option>
						<option>사모예드</option>
						<option>삽살개</option>
						<option>슈나우저</option>
						<option>세인트 버나드</option>
						<option>스피츠</option>
						<option>스핑크스</option>
						<option>오브차카</option>
						<option>웰시코기</option>
						<option>저먼 스피츠</option>
						<option>진돗개</option>
						<option>비숑숑 계란탁</option>
					</select>
				</span>
				<span id="pcat" style="display:none">
					<select class="form-control" name="pvarity" >
						<option>세상에 하나뿐인 믹스</option>
						<option>네벨룽</option>
						<option>노르웨이 숲고양이</option>
						<option>데본렉스</option>
						<option>돈스코이</option>
						<option>라가머핀</option>
						<option>라이코이</option>
						<option>라팜</option>
						<option>랙돌</option>
						<option>러시안 블루</option>
						<option>맹크스</option>
						<option>먼치킨</option>
						<option>먼치킨 롱헤어</option>
						<option>미뉴엣</option>
						<option>민스킨</option>
						<option>발리니즈</option>
						<option>뱅갈</option>
						<option>버만</option>
						<option>브라질리안 쇼트헤어</option>
						<option>사바나</option>
						<option>샴</option>
						<option>세렝게티</option>
						<option>소말리</option>
						<option>스노우 슈</option>
						<option>스코티시 스트레이트</option>
						<option>스코티시 폴드</option>
						<option>스코티시 폴드 롱헤어</option>
						<option>스핑크스</option>
						<option>싸이프러스 아프로디테</option>
						<option>아메리칸 쇼트헤어</option>
						<option>아메리칸 와이어헤어</option>
						<option>아비시니안</option>
						<option>엑조틱 쇼트헤어</option>
						<option>오리엔탈 고양이</option>
						<option>오시캣</option>
						<option>유러피안 숏헤어</option>
						<option>자바니즈</option>
						<option>코리안 쇼트헤어</option>
						<option>쿠리리안 밥테일</option>
						<option>터키시 앙고라</option>
						<option>페르시안</option>
						<option>하이랜더</option>
						<option>하바나 브라운</option>
						<option>히말라얀</option>
					</select>
				</span>

				</div>
				<div class="row">
					<div class="col-6">
						<div class="form-group">
							<label class="text-black" for="pbirth">반려동물의 탄생일과</label>
							<input type="text" class="form-control" id="pbirth" name="pbirth" required pattern="^[0-9]{4}$"
							title ="반려동물의 탄생월일을 입력하세요.(ex)1225, 0505)">
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label class="text-black" for="page">나이를 선택해주세요!</label> <select
								class="form-control" id="page" name="page" required="required"
								title="선택하세요">
								<optgroup label="나이를 선택헤주세요!"></optgroup>
								<option>0세</option>
								<option>1세</option>
								<option>2세</option>
								<option>3세</option>
								<option>4세</option>
								<option>5세</option>
								<option>6세</option>
								<option>7세이상</option>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div data-v-9102220a="" class="my-pet-contents-input-wrapper">
						<span data-v-9102220a="" class="my-pet-contents-input-text">
							몸무게를 선택해주세요! <span data-v-9102220a="" class="my-pet-required"></span><br>
						</span><select data-v-9102220a="" name="pweight"class="form-control" required="required">
							<option data-v-9102220a="" value="0">0kg 이상 ~ 1kg 미만</option>
							<option data-v-9102220a="" value="1">1kg 이상 ~ 2kg 미만</option>
							<option data-v-9102220a="" value="2">2kg 이상 ~ 3kg 미만</option>
							<option data-v-9102220a="" value="3">3kg 이상 ~ 4kg 미만</option>
							<option data-v-9102220a="" value="4">4kg 이상 ~ 5kg 미만</option>
							<option data-v-9102220a="" value="5">5kg 이상 ~ 7kg 미만</option>
							<option data-v-9102220a="" value="7">7kg 이상 ~ 9kg 미만</option>
							<option data-v-9102220a="" value="9">9kg 이상 ~ 11kg 미만</option>
							<option data-v-9102220a="" value="11">11kg 이상 ~ 14kg 미만</option>
							<option data-v-9102220a="" value="14">14kg 이상 ~ 17kg 미만</option>
							<option data-v-9102220a="" value="17">17kg 이상 ~ 20kg 미만</option>
							<option data-v-9102220a="" value="20">20kg 이상 ~ 24kg 미만</option>
							<option data-v-9102220a="" value="24">24kg 이상 ~ 28kg 미만</option>
							<option data-v-9102220a="" value="28">28kg 이상 ~ 32kg 미만</option>
							<option data-v-9102220a="" value="32">32kg 이상 ~ 37kg 미만</option>
							<option data-v-9102220a="" value="37">37kg 이상 ~ 42kg 미만</option>
							<option data-v-9102220a="" value="42">42kg 이상 ~ 47kg 미만</option>
							<option data-v-9102220a="" value="47">47kg 이상 ~ 52kg 미만</option>
							<option data-v-9102220a="" value="52">52kg 이상</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-outline-black btn-block">입력완료</button>
				</div>
			</form>

		</div>

	</div>



<ryo:footer/>


</body>
</html>
