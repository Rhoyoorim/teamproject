<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="type"%>

<c:choose>
	<c:when test="${type=='sign'}">
	    <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>회원가입</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='login'}">
	    <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>로그인</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='personagree'}">
	    <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>약관 동의</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='FAQ'}">
	    <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>FAQ</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='memberchange'}">
	    <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>회원 정보 변경</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='petinput'}">
	    <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>어떤 반려동물을 키우시나요?</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='petchange'}">
	    <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>반려동물 정보 변경</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='mypage'}">
	    <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>마이 펫키지</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='receipt'}">
	    <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>영수증</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='inputitem'}">
	   <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>제 품 추 가</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='idfind'}">
	   <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>아이디 찾기</h2>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='pwfind'}">
	   <div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row justify-content-center">
			<h2>비밀번호 찾기</h2>
		</div>
	</div>
	</c:when>
</c:choose>