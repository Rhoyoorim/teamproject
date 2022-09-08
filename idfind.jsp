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
</head>
<body>

	<ryo:header />


	<ryo:menu type="idfind" />

	<div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<form method="post" name='findid' id='findid' action="findid.do">
				<div class="form-group">
					<label class="text-black" for="mnick">가입했을 때의 닉네임을 입력하세요.</label> <input
						type="text" class="form-control" id="mnick" name="mnick"
						class="check" placeholder="닉네임" required pattern="^[가-힣]{2,5}$"
						title="가입했을 때의 닉네임을 입력하세요.">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-outline-black btn-block"
						 value="확인">
				</div>
				<br>
			</form>
		</div>
	</div>


	<ryo:footer />
<script>
	function check(){
		let res="${check}";
		if(res=="1"){
			alert('해당 닉네임의 회원은 존재하지 않습니다.');
		}
	}
	check();
</script>

</body>
</html>