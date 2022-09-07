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

	
	<ryo:menu type="inputitem"/>

	<div class="container pt-6 pb-6 mb-6 border-bottom">
		<div class="row justify-content-center">

			<form method="post" name='inputItem' id='inputItem' action="insertI.do">
				<div class="form-group">
				<label class="text-black" for="iimg">제품 이미지</label> <br>
					<img alt="미리보기" id="photo" width="300px;" height="300px;"><br>
					<input type="file" onchange="loadFile(this);" id="iimg" name="iimg">
				</div>
				<div class="form-group">
					<label class="text-black" for="iname">제품 이름</label>
					<input type="text" class="form-control" id="iname" name="iname"
					required pattern="^[a-zA-Z0-9가-힣]{5,30}$"  title="5글자 이상의 영문자,숫자,한글 가능">
				</div>
				<div class="form-group">
					<label class="text-black" for="iprice">가격</label>
					<input type="text" class="form-control" id="iprice" name="iprice"
					required pattern="^[0-9]{3,8}$" style="width:100%;" title="숫자(가격)만 입력하세요.">
				</div>
				<div class="form-group">
					<label class="text-black" for="icategory">카테고리</label>
					
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-outline-black btn-block"value="확인">
				</div>
				<br>
			</form>
		</div>

	</div>



<script type="text/javascript">
	function loadFile(input){
		//console.log('로그1');
		if(input.files && input.files[0]){ // 파일을 여러 개 들어올 것을 예상해서
			//console.log('로그2');
			var fr=new FileReader();
			fr.onload=function(event){
				//console.log=('로그3');
				document.getElementById('photo').src = event.target.result;
			};
			fr.readAsDataURL(input.files[0]);
		}
		else{
			// 필수 속성이니까 공백값을 주는 것이 기본
			//console.log('로그4');
			document.getElementById('photo').src="";
		}
	}
</script>
<ryo:footer/>


</body>
</html>
