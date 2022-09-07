<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="type"%>
<%@ attribute name="mid"%>

<c:choose>
	<c:when test="${type=='id'}">
	<form method="post" name='findid' id='findid' action="findPw.do">
		<div class="form-group">
			<label class="text-black" for="mnick">가입했을 때의 닉네임을 입력하세요.</label> 
			<input type="text" class="form-control"
			id="mnick" name="mnick" class="check" placeholder="닉네임" required pattern="^[가-힣]{2,5}$"
			title="가입했을 때의 닉네임을 입력하세요.">
		</div>
		<div class="form-group"> 
			<input type="submit" class="btn btn-outline-black btn-block" value="확인">
		</div>
		<br>
	</form>
	</c:when>
	<c:when test="${type=='password'}">
	<form method="post" name='findpw' id='findpw' action="findPw.do">
		<div class="form-group">
			<label class="text-black" for="mid">비밀번호를 찾을 아이디를 입력해주세요.</label>
			<input type="text" class="form-control"
			id="mid" name="mid" class="check" placeholder="아이디" required pattern="^[a-z0-9_-]{5,20}$"
			title="가입했을 때의 아이디를 입력하세요."> 
		</div>
		<div class="form-group">
			<label class="text-black" for="phone">휴대폰 본인 인증을 해주세요.</label>
			<input type="text" class="form-control"
			id="phone" name="phone" class="check" placeholder="휴대폰 번호" required pattern="^01([0|1|6|7|8|9])([0-9]{4})([0-9]{4})$"
			title="휴대폰 번호를 입력하세요."> 
		</div>
		<div class="form-group">
			<a href="findpw.do?"><input type="button" id="check" class="btn btn-outline-black btn-block" value="휴대폰 인증"></a>
		</div>
		<br><br>
		<div class="form-group">
			<input type="text" id="check">
		</div>
		<div class="form-group">
			<input type="submit" class="btn btn-outline-black btn-block"value="확인">
		</div>
		<br>
	</form>
	</c:when>
	<c:when test="${type=='idfindresult'}">
		<div class="container pt-5">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center pt-5">
						<c:if test="${mid!=null}">
						<p class="lead mb-5">닉네임에 맞는 id를 성공적으로 찾았습니다.</p>
						<p class="lead mb-5">회원의 아이디는 ${mid}입니다.</p>
						<p class="mb-5"><a href="login.jsp" class="btn btn-sm btn-outline-black">로그인하러 가기</a></p>
						</c:if>
						<c:if test="${mid==null}">
						<p class="lead mb-5">닉네임에 맞는 id가 존재하지 않습니다...</p>
						<p class="lead mb-5">회원가입을 진행해 주세요.</p>
						<p class="mb-5"><a href="login.jsp" class="btn btn-sm btn-outline-black">로그인</a></p>
						<p class="mb-5"><a href="personagree.jsp" class="btn btn-sm btn-outline-black">회원가입</a></p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</c:when>
</c:choose>