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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

<ryo:header/>

	
	<ryo:menu type="sign"/>

	<div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">

			<form method="post" name='signup' id='signup' action="signup.do">
				<div class="form-group">
					<label class="text-black" for="mid">아이디*</label> <input type="text"
						class="form-control" id="mid" name="mid" class="check" placeholder="id" required
						pattern="^[a-z0-9_-]{5,20}$"
						title="5~20자의 영문 소문자, 숫자, 특수기호(_),(-)만 사용 가능" onchange="idcheck()">
					<span id="idcheck" ></span>
				</div>
				<div class="form-group">
					<label class="text-black" for="mpw">비밀번호*</label> <input
						type="password" class="form-control" id="mpw" name="mpw" class="check" placeholder="pw"
						 required pattern="^[a-z0-9_-*]{8,20}$"
						title="8~20자의 영문 소문자, 숫자, 특수기호(_),(-),(*)만 사용 가능"
						onchange="pwcheck()">
						<span id="pwcheck"></span>
				</div>
				<div class="form-group">
					<label class="text-black" for="pwcheck">비밀번호 확인*</label> <input
						type="password" class="form-control" id="pwch" class="check" placeholder="pw 확인" 
						required="required" title="비밀번호 확인을 해주세요!" onchange="pwcheck()" required="required">
					<span id="pw2check"></span>

				</div>
				<div class="form-group">
					<label class="text-black" for="mname">이름*</label> <input type="text"
						class="form-control" id="mname" name="mname" class="check" placeholder="이름" required="required"
						title="이름을 입력하세요." onchange="namecheck()">
						<span id="namecheck"></span>
				</div>
				<div class="form-group">
					<label class="text-black" for="mnick">닉네임*</label> <input type="text"
						class="form-control" id="mnick" name="mnick" class="check" placeholder="닉네임" required="required"
						title="닉네임을 입력하세요." onchange="nickcheck()">
						<span id="nickcheck"></span>
				</div>
				<div class="form-group">
					<label class="text-black" for="tel">전화번호*</label> <input type="tel"
						class="form-control" id="phone" name="phone" placeholder="휴대전화" required="required"
						onchange="phonecheck()">
						<span id="phonecheck"></span>
				</div>
				<div class="row">
					<div class="col-6">
						<div class="form-group">
							<label class="text-black" for="memail">이메일 id*</label> <input
								type="text" class="form-control" id="memailid" name="memailid" placeholder="이메일"
								required="required" onchange="emailidcheck()">
								<span id="emailidcheck"></span>
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label class="text-black" for="address">선택*</label> <select
								class="form-control" id="memailAd" name="memailAd" >
								<option>@naver.com</option>
								<option>@google.com</option>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="text-black" for="birthdate">생년월일*</label> <input
						type="date" class="form-control" id="mbirth" name="mbirth" placeholder="선택"
						 title="생년월일을 선택해주세요." required="required">
				</div>
				<br>
				<div class="form-group">
					<button type="submit" class="btn btn-outline-black btn-block" id="submit"
						>회원가입</button>
					<br>
				</div>
			</form>
		</div>

	</div>
 
	<script type="text/javascript">
		var nowUtc = Date.now(); // 오늘 날짜
		var timeoff = new Date().getTimezoneOffset() * 60000; // 초 단위로 끊음
		var today = new Date(nowUtc - timeoff).toISOString().split("T")[0];
		document.getElementById('mbirth').setAttribute("max", today);
		// 오늘 이후의 날짜 선택 불가능하게 만드는 작업
		//document.getElementById('mbirth').value = new Date().toISOString()
				//.substring(0, 10);
		// 오늘 날짜가 기본 세팅
		// 
		document.getElementById('submit').disabled=true;
		function idcheck(){
			document.getElementById('submit').disabled=true;
			var id = $("#mid").val();
			var idpattern=/[a-z0-9_-]{5,20}$/;
			if(id.length <=4){
				document.getElementById('idcheck').innerHTML = "5자 이상의 아이디를 입력하세요.";
				document.getElementById('idcheck').style.color = 'red';
			}else if(!idpattern.test(id)){
				document.getElementById('idcheck').innerHTML = "5~20자의 영문 소문자, 숫자, 특수기호(_),(-)만 사용 가능";
				document.getElementById('idcheck').style.color = 'red';
			}
			else{
				$.ajax({
					url:"CheckServlet?mid="+id,
							success:function(data){
								if(data==1){
									document.getElementById('idcheck').innerHTML = "중복된 아이디입니다.";
									document.getElementById('idcheck').style.color = 'red';
								}else if(data==2){
									document.getElementById('idcheck').innerHTML = "사용 가능한 아이디입니다.";
									document.getElementById('idcheck').style.color = 'blue';
									document.getElementById('submit').disabled=false;
								}
							}
				});
				/* document.getElementById('idcheck').innerHTML = "완료";
				document.getElementById('idcheck').style.color = 'blue';
				console.log(document.getElementById('idcheck').style.color);
				document.getElementById('submit').disabled=false; */
			}	
		}
		
		function pwcheck() {
			document.getElementById('submit').disabled=true;
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
				document.getElementById('submit').disabled=false;
			}
		}
		
		function namecheck(){
			document.getElementById('submit').disabled=true;
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
				document.getElementById('submit').disabled=false;
			}	
		}
		
		function nickcheck(){
			document.getElementById('submit').disabled=true;
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
					url:"CheckServlet?mnick="+nick,
							success:function(data){
								if(data==1){
									document.getElementById('nickcheck').innerHTML = "중복된 닉네임 입니다.";
									document.getElementById('nickcheck').style.color = 'red';
								}else if(data==2){
									document.getElementById('nickcheck').innerHTML = "사용 가능합니다.";
									document.getElementById('nickcheck').style.color = 'blue';
									document.getElementById('submit').disabled=false;
								}
							}
				});
				/* document.getElementById('nickcheck').innerHTML = "사용가능합니다";
				document.getElementById('nickcheck').style.color = 'blue';
				document.getElementById('submit').disabled=false; */
			}
		} 
		
		function phonecheck(){
			document.getElementById('submit').disabled=true;
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
				document.getElementById('submit').disabled=false;
			}
			
		}
		function emailidcheck(){
			var id = $("#memailid").val();
			var idpattern=/[a-z0-9_-]{5,20}$/;
			document.getElementById('submit').disabled=true;
			if(id.length <=4){
				document.getElementById('emailidcheck').innerHTML = "5자 이상 이메일아이디 입력하세요.";
				document.getElementById('emailidcheck').style.color = 'red';
			}else if(!idpattern.test(id)){
				document.getElementById('emailidcheck').innerHTML = "영소문자,숫자,특수기호(_),(-) 20자까지 사용 가능";
				document.getElementById('emailidcheck').style.color = 'red';
				
			}else{
				document.getElementById('emailidcheck').innerHTML = "입력 완료";
				document.getElementById('emailidcheck').style.color = 'blue';
				document.getElementById('submit').disabled=false;
			}
		}
		
		
		/*submit.addEventListener('click', signup);
		 
		function activeEvent(){
			switch(!(id=='blue')){
			case true : submit.disabled=true; break;
			case false : submit.disabled=false; break;
			}
		} */
			
		 /* document.getElementById('idcheck').style.color('blue',function(event){
			 document.getElementById('submit').disabled=!this.value;
		 },false;); */
		 
		
		
			
		
		
			
		/* function signup(){
			alert('회원가입 성공');
			window.location.href="login.jsp";
		} */
	</script> 


<ryo:footer/>


</body>
</html>
