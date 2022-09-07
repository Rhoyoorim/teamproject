<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
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

<ryo:header/>
    
  <ryo:menu type="login"/>

	<div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<!-- login div -->
			<form action="login.do" method="post">
				<img class="card-img-top"
					src="https://thumb.ac-illust.com/d5/d525bd9faa60f194f3c1f3fe94af5106_t.jpeg"
					alt="..." />
				<!-- Product name-->
				<div class="form-group">
					<input type="text" placeholder="ID 입력" class="form-control "
						required pattern="^[a-z0-9_-]{5,20}$" title="5글자 이상의 아이디 입력을 해주세요.">
				</div>
				<div class="form-group">
					<input type="password" placeholder="Password 입력"
						class="form-control " required pattern="^[a-z0-9_-]{8,20}$" title="8글자 이상의 비밀번호 입력을 해주세요.">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-outline-black btn-block"
						value="로그인">로그인</button>
				</div>
				<div class="form-group">
					<ul class="list-unstyled social-icons light"
						style="text-align: left;">
						<!-- 네이버로 로그인 -->
						<li style="margin-left:10%;margin-right:45%;">
							<a><span id="naver_id_login"></span></a>
						</li>
						<!-- 카카오로 로그인 -->
						<li ><a><span><img alt="" src="images/kakao_login_medium.png" 
						onclick="kakaoLogin();" style="cursor:pointer;" 
						title="카카오아이디로 로그인"></span></a></li>
					</ul>
				</div>
				<!-- naver join -->
				<!-- 
				<div class="form-group">
					<div id="naver_id_login"></div>
				</div>
				-->
				<div class="form-group">
					<div
						style="float: left; width: 100%; padding: 10px; text-align: center; color: gray;">
						<a style="color: inherit;">아이디 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;
						| &nbsp;&nbsp;&nbsp;&nbsp;<a  style="color: inherit;">비밀번호
							찾기</a>&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;<a
							href="personagree.jsp" style="color: inherit;">회원가입</a>
					</div>

				</div>
			</form>
		</div>
	</div>

	<ryo:footer/>


	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("ttYXUNYbTNUS6_ohMuD_",
				"http://localhost:8088/webproject/index.html");
		var state = naver_id_login.getUniqState();
		// 버튼 크기 조절
		naver_id_login.setButton("green", 2, 40);
		naver_id_login.setDomain("http://localhost:8088/webproject/index.html");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('c8845131bb04e9708cb2010ec266fb63'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response)
						},
						fail : function(error) {
							console.log(error)
						},
					})
				},
				fail : function(error) {
					console.log(error)
				},
			})
		}
		//카카오로그아웃  
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}
	</script>



</body>
</html>