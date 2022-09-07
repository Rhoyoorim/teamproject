<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="type"%>

<c:choose>
	<c:when test="${type=='sign'}">
		<div class="container pt-5">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center pt-5">

						<p class="lead mb-5">회원가입이 완료되었습니다.</p>
						<p class="lead mb-5">메인화면 혹은 로그인 화면으로 이동하세요.</p>
						<p class="mb-5"><a href="main.do" class="btn btn-sm btn-outline-black">메인화면</a></p>
						<p class="mb-5"><a href="login.jsp" class="btn btn-sm btn-outline-black">로그인</a></p>
						
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${type=='pet'}">
		<div class="container pt-5">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center pt-5">
						<p class="lead mb-5">마이펫 등록을 완료했습니다!</p>
						<p class="lead mb-5">메인화면 혹은 마이페이지로 이동하세요.</p>
						<p class="mb-5"><a href="main.do" class="btn btn-sm btn-outline-black">메인화면</a></p>
						<p class="mb-5"><a href="mypage.jsp" class="btn btn-sm btn-outline-black">마이페이지</a></p>
						
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${type=='deleteMember'}">
		<div class="container pt-5">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center pt-5">

						<p class="lead mb-5">회원탈퇴가 완료되었습니다.</p>
						<p class="lead mb-5">메인화면 혹은 로그인 화면으로 이동하세요.</p>
						<p class="mb-5"><a href="main.do" class="btn btn-sm btn-outline-black">메인화면</a>
						&nbsp;&nbsp;<a href="login.jsp" class="btn btn-sm btn-outline-black">로그인</a></p>
						<br>
					</div>
				</div>
			</div>
		</div>>
	</c:when>
	<c:when test="${type=='deletePet'}">
		<div class="container pt-5">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center pt-5">
						<p class="lead mb-5">마이펫 정보를 삭제했습니다!</p>
						<p class="lead mb-5">메인화면 혹은 마이페이지로 이동하세요.</p>
						<p class="mb-5"><a href="main.do" class="btn btn-sm btn-outline-black">메인화면</a></p>
						<p class="mb-5"><a href="mypage.jsp" class="btn btn-sm btn-outline-black">마이페이지</a></p>
						
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${type=='updateMember'}">
		<div class="container pt-5">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center pt-5">
						<p class="lead mb-5">회원의 정보를 변경했습니다!</p>
						<p class="lead mb-5">메인화면 혹은 마이페이지로 이동하세요.</p>
						<p class="mb-5"><a href="main.do" class="btn btn-sm btn-outline-black">메인화면</a></p>
						<p class="mb-5"><a href="mypage.jsp" class="btn btn-sm btn-outline-black">마이페이지</a></p>
						
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${type=='updatePet'}">
		<div class="container pt-5">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center pt-5">
						<p class="lead mb-5">마이펫 정보를 변경했습니다!</p>
						<p class="lead mb-5">메인화면 혹은 마이페이지로 이동하세요.</p>
						<p class="mb-5"><a href="main.do" class="btn btn-sm btn-outline-black">메인화면</a></p>
						<p class="mb-5"><a href="mypage.jsp" class="btn btn-sm btn-outline-black">마이페이지</a></p>
						
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${type=='orderc'}">
		<div class="container pt-5">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center pt-5">
						<span class="display-3 thankyou-icon" style="color: #FF4081;">
							<svg width="1em" height="1em" viewBox="0 0 16 16"
								class="bi bi-cart-check mb-5" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
             						 <path fill-rule="evenodd"
									d="M11.354 5.646a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708 0z" />
              						<path fill-rule="evenodd"
									d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
           					 </svg>
						</span>
						<p class="lead mb-5">주문이 완료되었습니다. 감사합니다!</p>
						<p class="mb-5"><a href="orderlist.do" class="btn btn-sm btn-outline-black">주문목록으로 가기</a></p>
					</div>
				</div>
			</div>
		</div>
	</c:when>

</c:choose>