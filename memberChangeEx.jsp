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
	transform:translate(-50%, -50%);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 100%;
	height:100vh;
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
	
	<ryo:header/>


	<ryo:menu type="memberchange" />

	<div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">

			<form method="post" name='updateM' id='updateM'
				action="updateM.do">
				<div class="form-group">
					<label class="text-black" for="mid">아이디*</label> <input type="text"
						class="form-control" id="mid" name="mid" value="${mid}" readonly>

				</div>
				<div class="form-group">
					<label class="text-black" for="mpw">비밀번호*</label> <input
						type="password" class="form-control" id="mpw" name="mpw"
						value="${mpw}" placeholder="pw" required
						pattern="^[a-z0-9_-*]{8,20}$" value="${mpw}"
						title="8~20자의 영문 소문자, 숫자, 특수기호(_),(-),(*)만 사용 가능"
						onchange="pwcheck()">
				</div>
				<div class="form-group">
					<label class="text-black" for="pwcheck">비밀번호 확인*</label> <input
						type="password" class="form-control" id="pwch" class="check"
						placeholder="pw 확인" required="required" title="비밀번호 확인을 해주세요!"
						onchange="pwcheck()" value="${mpw}"> 

				</div>
				<div class="form-group">
					<label class="text-black" for="mname">이름*</label> <input
						type="text" class="form-control" id="mname" name="mname"
						class="check" placeholder="이름" value="${mname}" required="required"
						title="이름을 입력하세요."> <span id="namecheck"></span>
				</div>
				<div class="form-group">
					<label class="text-black" for="mnick">닉네임*</label> <input
						type="text" class="form-control" id="mnick" name="mnick"
						class="check" placeholder="닉네임" required="required"
						title="닉네임을 입력하세요." value="${mnick}"> <span id="nickcheck"></span>
				</div>
				<div class="form-group">
					<label class="text-black" for="tel">전화번호*</label> <input type="tel"
						class="form-control" id="phone" name="phone" class="check"
						placeholder="휴대전화" required="required" onchange="phonecheck()" value="${phone}">
					<span id="phonecheck" ></span>
				</div>
				<div class="row">
                <!-- 값을 받아올 수 있게 다시 시도 한번 해볼 것 -->
                    <div class="col-6">
                        <!-- 연결 후에 이메일 값 받아오는지 확인할 것/ 아래 js에 있음 | 못받아오는 것으로 확인 나눈 값을 가져오지 못함 확인 바람 -->
                        <div class="form-group">
                            <label class="text-black" for="memail">이메일 id</label> <input
                                type="text" class="form-control" id="memailid" name="memailid"
                                value="${memail}" class="check" placeholder="이메일"
                                required="required" onchange="emailidcheck()"> <span
                                id="emailidcheck"></span>
                        </div>
                    </div>
                    <div class="col-6">
                        <!-- 연결 후에 이메일 값 받아오는지 확인할 것/ 아래 js에 있음 | 못받아오는 것으로 확인 나눈 값을 가져오지 못함 확인 바람 -->
                        <div class="form-group">
                            <label class="text-black" for="address">선택</label> <select
                                class="form-control" id="memailAd" name="memailAd">
                                <option value="naver.com" name="naver.com">@naver.com</option>
                                <option value="google.com" name="google.com">@google.com</option>
                            </select>
                        </div>
                    </div>
                </div>
				<div class="form-group">
					<label class="text-black" for="birthdate">생년월일*</label> <input
						type="text" class="form-control" id="mbirth" name="mbirth"
						value="${mbirth}" class="check" required="required" readonly>
				</div>
				<br>
				<div class="form-group">
					<button type="submit" class="btn btn-outline-black btn-block"
						id="submit">회원정보 변경</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-outline-black btn-block"
						id="deleteM" data-toggle="modal" data-target="#myModal">회원 탈퇴</button>
				</div>
			</form>
				<!-- Modal -->
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
											<button type="button" class="btn btn-default"
												data-dismiss="modal">취소</button>
										</td>
										<td style="text-align: right; padding-right: 10px;">
											<a href="deleteM.do?"><button type="button" class="btn btn-default"
												>예</button></a>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>


	</div>



	<script type="text/javascript">
	$(document).ready(function(){
        var memail = ${memail}.val().split('@');
        var memailid= memail[0].val();
        document.getElementById('memailid').innerHTML= memailid;
        var memailad =memail[1].val(); 
        document.getElementByID('memailAd').value=memailad;
    });
		var nowUtc = Date.now(); // 오늘 날짜
		var timeoff = new Date().getTimezoneOffset() * 60000; // 초 단위로 끊음
		var today = new Date(nowUtc - timeoff).toISOString().split("T")[0];
		document.getElementById('mbirth').setAttribute("max", today);
		// 오늘 이후의 날짜 선택 불가능하게 만드는 작업
		document.getElementById('mbirth').value = new Date().toISOString()
				.substring(0, 10);
		// 오늘 날짜가 기본 세팅

		/* $(function(){
			var check = 0;
			var idCheck=
		}); */
		
		// 회원 삭제 모달창 
		

		// 이메일 분할 작업 == 작동을 안하는 것으로 확인
		var memail = ${memail}.val().split('@');
		var memailid= memail[0].val();
		var memailad =memail[1].val(); 

		// 비밀번호 유효성 검사
		function pwcheck() {
			var p1 = $("#mpw").val();
			var p2 = $("#pwch").val();
			var ppattern = /^[a-z0-9_-]{5,20}$/;
			
			if (p1.length <= 7) {
				document.getElementById('pwcheck').innerHTML = "8자 이상의 비밀번호를 입력하세요";
				document.getElementById('pwcheck').style.color = 'red';
			}else if(!ppattern.test(p1)){
				document.getElementById('pwcheck').innerHTML = "8~20자의 영문 소문자, 숫자, 특수기호(_),(-),(*)만 사용 가능합니다.";
				document.getElementById('pwcheck').style.color = 'red';
			}
			else if (p2.length == 0) {
				document.getElementById('pwcheck').innerHTML = "사용가능한 비밀번호입니다. 비밀번호 확인을 진행하세요.";
				document.getElementById('pwcheck').style.color = 'blue';
			} else if (p1 != p2) {
				document.getElementById('pw2check').innerHTML = "비밀번호가 일치하지 않습니다.";
				document.getElementById('pw2check').style.color = 'red';
			} else {
				document.getElementById('pwcheck').innerHTML = "비밀번호 확인 완료";
				document.getElementById('pwcheck').style.color = 'blue';
				document.getElementById('pw2check').innerHTML = "비밀번호가 일치합니다.";
				document.getElementById('pw2check').style.color = 'blue';
			}
		}
		
		// 이름 유효성검사
		function namecheck(){
			var name = $("#mname").val();
			var namePattern=/^[가-힣]{2,5}$/;
			if(name.length <= 1){
				document.getElementById('namecheck').innerHTML = "이름을 입력해주세요.";
				document.getElementById('namecheck').style.color = 'red';
			}else if(!namePattern.test(name)){
				document.getElementById('namecheck').innerHTML = "한글형식의 이름을 입력해주세요";
				document.getElementById('namecheck').style.color = 'red';
			}else{
				document.getElementById('namecheck').innerHTML = "사용 가능한 이름입니다."
				document.getElementById('namecheck').style.color = 'blue';
			}	
		}
		
		// 닉네임 유효성검사
		function nickcheck(){
			var nick = $("#mnick").val();
			var nickPattern=/^[가-힣]{2,5}$/;
			if(nick.length <= 1){
				document.getElementById('nickcheck').innerHTML = "닉네임을 입력해주세요.";
				document.getElementById('nickcheck').style.color = 'red';
			}else if(!nickPattern.test(nick)){
				document.getElementById('nickcheck').innerHTML = "한글형식의 닉네임을 입력해주세요";
				document.getElementById('nickcheck').style.color = 'red';
			}else{
				$.ajax({
					type: 'GET', // get or post
					url : '${pageContext.request.contextPath}/check.do?mnick='+mnick, // controller 작업할 차례 => servlet 사용
					data : {mnick:mnick},// {이름:값} // json 사용
					success : function(result){ // check에서 가져온 값 result 작성
						// result는 String 파일
						// js - 1 : 모든 데이터가 객체
						// js - 2 : 동적타이핑(즉각적으로 자동 형변환)
						console.log("로그2 ["+result+"]");
						if(result==1){
							$("#nickcheck").text("사용가능한 닉네임입니다!")// 사용가능
							$("#nickcheck").css("color","blue");
						}
						else{
							$("#nickcheck").text("이미 사용중인 닉네임입니다...")// 사용중이라 사용 불가
							$("#nickcheck").css("color","red");
						}
					},
					error : function(request, status, error){ // 순서 
						console.log("상태코드 : " + request.status);
						console.log("메세지 : " + request.responseText);
						console.log("에러 설명 : " + error); // 이 것은 디버깅 할 때 필요, 잘 안쓰이기도 함
					}
				});
				/* document.getElementById('nickcheck').innerHTML = "사용가능합니다";
				document.getElementById('nickcheck').style.color = 'blue';
				document.getElementById('submit').disabled=false; */
			}
		} 
		
		// 핸드폰 유효성검사
		function phonecheck(){
			var phone = $("#phone").val();
			var phonepattern=/^01([0|1|6|7|8|9])([0-9]{4})([0-9]{4})$/;
			if(phone.length <=10){
				document.getElementById('phonecheck').innerHTML = "핸드폰 번호를 제대로 입력하세요.";
				document.getElementById('phonecheck').style.color = 'red';
			}else if(!phonepattern.test(phone)){
				document.getElementById('phonecheck').innerHTML = "01######### 형식으로 입력해주세요.";
				document.getElementById('phonecheck').style.color = 'red';
			}else{
				document.getElementById('phonecheck').innerHTML = "입력 완료";
				document.getElementById('phonecheck').style.color = 'blue';
			}
			
		}
		
		// 이메일 유효성 검사
		function emailidcheck(){
			var id = $("#memailid").val();
			var idpattern=/[a-z0-9_-]{5,20}$/
			if(id.length <=4){
				document.getElementById('emailidcheck').innerHTML = "5자 이상 이메일아이디 입력하세요.";
				document.getElementById('emailidcheck').style.color = 'red';
			}else if(!idpattern.test(id)){
				document.getElementById('emailidcheck').innerHTML = "영소문자,숫자,특수기호(_),(-)사용 가능";
				document.getElementById('emailidcheck').style.color = 'red';
			}else{
				document.getElementById('emailidcheck').innerHTML = "입력 완료";
				document.getElementById('emailidcheck').style.color = 'blue';
			}
		}
		
		
	</script>

	<ryo:footer/>


</body>
</html>
