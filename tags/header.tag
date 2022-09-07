<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="site-mobile-menu site-navbar-target">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close">
			<span class="icofont-close js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>

<nav class="site-nav">
	<div class="container">
		<div class="site-navigation">
			<a href="index.html" class="logo float-left m-0"> <span
				class="text-primary"> </span> <img
				src="images/icon/Logo_petckage_XL.png"
				style="width: 15%; height: 15;">
			</a>
			<div class="menu-icons">
				<c:if test="${mid==null}">

					<a href="login.jsp"><img src="images/pictogram/lock-16.png"
						alt="Image">로그인&nbsp;&nbsp;&nbsp;</a>
					<a href="mypage.jsp"><img src="images/pictogram/user-16.png"
						alt="Image">마이페이지&nbsp;&nbsp;&nbsp;</a>
					<a href="login.do"><img
						src="images/pictogram/shopping-cart-16.png" alt="Image">장바구니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

				</c:if>
				<c:if test="${mid!=null}">

					<a href="logout.do"><img src="images/pictogram/unlock-16.png"
						alt="Image">로그아웃&nbsp;&nbsp;&nbsp;</a>
					<a href="mypage.do"><img src="images/pictogram/user-16.png"
						alt="Image">마이페이지&nbsp;&nbsp;&nbsp;</a>
					<a href="cart.do"><img
						src="images/pictogram/shopping-cart-16.png" alt="Image">장바구니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>


				</c:if>

				<ul
					class="js-clone-nav d-none d-lg-inline-noone text-left site-menu">
					<li class="active"><a href="index.html">Home</a></li>
					<li class="has-children"><a href="#">강아지</a>
						<ul class="dropdown">
							<li class="has-children"><a href="puppyFeed.html">사료</a>
								<ul class="dropdown">
									<li><a href="#">건식</a></li>
									<li><a href="#">소프트</a></li>
									<li><a href="#">습식</a></li>
									<li><a href="#">건조</a></li>
									<li><a href="#">분유</a></li>
								</ul></li>
							<li class="has-children"><a href="#">간식</a>
								<ul class="dropdown">
									<li><a href="#">껌</a></li>
									<li><a href="#">사사미</a></li>
									<li><a href="#">저키/트릿</a></li>
									<li><a href="#">비스킷/시리얼</a></li>
									<li><a href="#">소시지</a></li>
									<li><a href="#">캔/파우치</a></li>
									<li><a href="#">건조 간식</a></li>
									<li><a href="#">수제간식</a></li>
									<li><a href="#">파우더</a></li>
									<li><a href="#">음료</a></li>
								</ul></li>
							<li class="has-children"><a href="#">건강관리</a>
								<ul class="dropdown">
									<li><a href="#">종합영양제</a></li>
									<li><a href="#">치아</a></li>
									<li><a href="#">피부/털</a></li>
									<li><a href="#">뼈/관절</a></li>
									<li><a href="#">눈/귀</a></li>
									<li><a href="#">소화기</a></li>
									<li><a href="#">신장/요로</a></li>
									<li><a href="#">심장/심신 안정</a></li>
									<li><a href="#">해충 방지</a></li>
								</ul></li>
							<li class="has-children"><a href="#">위생/배변</a>
								<ul class="dropdown">
									<li><a href="#">배변패드</a></li>
									<li><a href="#">배변판</a></li>
									<li><a href="#">기저귀/팬티</a></li>
									<li><a href="#">탈취/소독</a></li>
									<li><a href="#">물티슈/크리너</a></li>
									<li><a href="#">배변봉투/집게</a></li>
									<li><a href="#">배변 유도제</a></li>
									<li><a href="#">공기 청정</a></li>
								</ul></li>
							<li class="has-children"><a href="#">미용/목욕</a>
								<ul class="dropdown">
									<li><a href="#">샴푸/린스</a></li>
									<li><a href="#">에센스/향수</a></li>
									<li><a href="#">브러쉬/거치대</a></li>
									<li><a href="#">클리퍼</a></li>
									<li><a href="#">미용가위</a></li>
									<li><a href="#">발톱/발</a></li>
									<li><a href="#">관리 타월/가운</a></li>
									<li><a href="#">염색약/그루밍 파우더</a></li>
									<li><a href="#">드라이</a></li>
									<li><a href="#">테이블</a></li>
									<li><a href="#">식기/식탁</a></li>
								</ul></li>
							<li class="has-children"><a href="#">급식기/급수</a>
								<ul class="dropdown">
									<li><a href="#">자동급식기</a></li>
									<li><a href="#">급수기/물병</a></li>
									<li><a href="#">정수기/필터</a></li>
								</ul></li>
							<li class="has-children"><a href="#">하우스/울타리</a>
								<ul class="dropdown">
									<li><a href="#">보관통/사료스푼</a></li>
									<li><a href="#">젖병 필건/디스펜서</a></li>
									<li><a href="#">하우스 방석/매트 계단</a></li>
									<li><a href="#">철장/울타리</a></li>
									<li><a href="#">안전문</a></li>
								</ul></li>
							<li class="has-children"><a href="#">이동장</a>
								<ul class="dropdown">
									<li><a href="#">이동 가방</a></li>
									<li><a href="#">유모차</a></li>
									<li><a href="#">차량용</a></li>
								</ul></li>
							<li class="has-children"><a href="#">의류/악세사리</a>
								<ul class="dropdown">
									<li><a href="#">티셔츠</a></li>
									<li><a href="#">후드티</a></li>
									<li><a href="#">패딩/코트</a></li>
									<li><a href="#">원피스</a></li>
									<li><a href="#">올인원</a></li>
									<li><a href="#">신발/양말</a></li>
									<li><a href="#">스카프/타이/넥</a></li>
									<li><a href="#">모자/헬멧</a></li>
									<li><a href="#">백팩/벨트</a></li>
									<li><a href="#">옷걸이/보관함</a></li>
								</ul></li>
							<li class="has-children"><a href="#">목줄/인식표/리드줄</a>
								<ul class="dropdown">
									<li><a href="#">목줄</a></li>
									<li><a href="#">가슴줄</a></li>
									<li><a href="#">인식표</a></li>
									<li><a href="#">리드줄</a></li>
								</ul></li>
							<li class="has-children"><a href="#">장난감</a>
								<ul class="dropdown">
									<li><a href="#">봉제 장난감</a></li>
									<li><a href="#">치실 장난감</a></li>
									<li><a href="#">고무 장난감</a></li>
									<li><a href="#">공기 청정</a></li>
									<li><a href="#">원반</a></li>
								</ul></li>
							<li class="has-children"><a href="#">훈련</a>
								<ul class="dropdown">
									<li><a href="#">짖음 제어</a></li>
									<li><a href="#">행동 제어</a></li>
									<li><a href="#">서적</a></li>
								</ul></li>
						</ul></li>
					<li class="has-children"><a href="#">냥냥이</a>
						<ul class="dropdown">
							<li class="has-children"><a href="#">사료</a>
								<ul class="dropdown">
									<li><a href="#">건식 사료</a></li>
									<li><a href="#">캔</a></li>
									<li><a href="#">파우치</a></li>
									<li><a href="#">건조생식</a></li>
									<li><a href="#">분유</a></li>
								</ul></li>
							<li class="has-children"><a href="#">간식</a>
								<ul class="dropdown">
									<li><a href="#">캔</a></li>
									<li><a href="#">파우치</a></li>
									<li><a href="#">건조 간식</a></li>
									<li><a href="#">저키/트릿</a></li>
									<li><a href="#">통살/소시지</a></li>
									<li><a href="#">스낵</a></li>
									<li><a href="#">캣닢/그라스</a></li>
									<li><a href="#">음료</a></li>
								</ul></li>
							<li class="has-children"><a href="#">건강관리</a>
								<ul class="dropdown">
									<li><a href="#">헤어볼</a></li>
									<li><a href="#">종합영양제</a></li>
									<li><a href="#">치아</a></li>
									<li><a href="#">피부/털</a></li>
									<li><a href="#">신장/요로</a></li>
									<li><a href="#">심장/심신 안정</a></li>
									<li><a href="#">소화기</a></li>
									<li><a href="#">뼈/관절</a></li>
									<li><a href="#">눈/귀 해충 방지</a></li>
									<li><a href="#">서적</a></li>
								</ul></li>
							<li class="has-children"><a href="#">모래</a>
								<ul class="dropdown">
									<li><a href="#">응고형 모래</a></li>
									<li><a href="#">흡수형 모래</a></li>
									<li><a href="#">모래 탈취제</a></li>
								</ul></li>
							<li class="has-children"><a href="#">위생/배변</a>
								<ul class="dropdown">
									<li><a href="#">하우스형 화장실</a></li>
									<li><a href="#">평판형 화장실</a></li>
									<li><a href="#">모래삽</a></li>
									<li><a href="#">화장실 매트</a></li>
									<li><a href="#">배변패드</a></li>
									<li><a href="#">탈취/소독</a></li>
									<li><a href="#">거름망</a></li>
									<li><a href="#">분변 처리</a></li>
									<li><a href="#">공기 청정</a></li>
								</ul></li>
							<li class="has-children"><a href="#">미용/목욕</a>
								<ul class="dropdown">
									<li><a href="#">샴푸/린스</a></li>
									<li><a href="#">브러쉬</a></li>
									<li><a href="#">발톱/발</a></li>
									<li><a href="#">관리</a></li>
									<li><a href="#">클리퍼/가위</a></li>
									<li><a href="#">물티슈/크리너</a></li>
									<li><a href="#">타월</a></li>
									<li><a href="#">에센스/향수</a></li>
									<li><a href="#">드라이</a></li>
									<li><a href="#">테이블</a></li>
								</ul></li>
							<li class="has-children"><a href="#">급식기/급수기</a>
								<ul class="dropdown">
									<li><a href="#">식기/식탁</a></li>
									<li><a href="#">자동급식기</a></li>
									<li><a href="#">급수기/물병</a></li>
									<li><a href="#">정수기/필터</a></li>
									<li><a href="#">보관 통/사료 스푼</a></li>
									<li><a href="#">식기 매트</a></li>
									<li><a href="#">필건/디스펜서</a></li>
								</ul></li>
							<li class="has-children"><a href="#">스크래쳐/캣타워</a>
								<ul class="dropdown">
									<li><a href="#">스크래쳐</a></li>
									<li><a href="#">캣타워</a></li>
									<li><a href="#">리필/로프</a></li>
								</ul></li>
							<li class="has-children"><a href="#">하우스</a>
								<ul class="dropdown">
									<li><a href="#">동굴형 하우스</a></li>
									<li><a href="#">방석/매트</a></li>
									<li><a href="#">철장/울타리</a></li>
								</ul></li>
							<li class="has-children"><a href="#">이동장</a>
								<ul class="dropdown">
									<li><a href="#">이동 가방</a></li>
									<li><a href="#">유모차</a></li>
									<li><a href="#">차량용</a></li>
								</ul></li>
							<li class="has-children"><a href="#">의류/악세사리</a>
								<ul class="dropdown">
									<li><a href="#">스카프/타이/넥</a></li>
									<li><a href="#">목걸이</a></li>
									<li><a href="#">모자/헬멧</a></li>
								</ul></li>
							<li class="has-children"><a href="#">목줄/가슴줄</a>
								<ul class="dropdown">
									<li><a href="#">목줄</a></li>
									<li><a href="#">가슴줄</a></li>
								</ul></li>
							<li class="has-children"><a href="#">장난감</a>
								<ul class="dropdown">
									<li><a href="#">낚시/막대</a></li>
									<li><a href="#">인형/쿠션</a></li>
									<li><a href="#">공기 청정</a></li>
									<li><a href="#">터널/주머니</a></li>
									<li><a href="#">레이저/자동</a></li>
									<li><a href="#">리필/로프</a></li>
								</ul></li>
						</ul></li>


				</ul>

				<a href="#"
					class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-block"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>

			</div>
		</div>
	</div>
</nav>