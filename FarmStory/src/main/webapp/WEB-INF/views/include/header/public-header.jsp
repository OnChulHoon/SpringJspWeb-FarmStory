<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<header>
	<div class="navbar">
		<div id="navbar-header" class="navbar-header">
			<div class="container">

				<!-- ============================================================= LOGO MOBILE ============================================================= -->

				<a  id="logo-farmstory-mobile" class="navbar-brand" href="#"><img id="logoM"
					src="http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/farmstory-logo.gif" class=""
					alt="logo-farmstory-mobile"></a>

				<!-- ============================================================= LOGO MOBILE : END ============================================================= -->

				<a class="navbar-toggle btn responsive-menu pull-right"
					data-toggle="collapse" data-target=".navbar-collapse"><i
					class='icon-menu-1'></i></a>

				<c:if test="${not empty loginuser }">
					<ul class="pull-right">
						<li><a id="welcome" class="responsive-menu pull-right"> <i
								class="icon-user-1"></i>&nbsp;${loginuser.memName}&nbsp;님
								환영합니다!&nbsp;&nbsp;&nbsp;
						</a></li>
					</ul>
				</c:if>
			</div>
			<!-- /.container -->
		</div>
		<!-- /.navbar-header -->

		<div class="yamm ">
			<div class="navbar-collapse collapse">
				<div class="container">
					<!-- ============================================================= LOGO ============================================================= -->

					<a  id="logo-farmstory-web" class="navbar-brand" href="#"><img id="logo"
						src="http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/farmstory-logo.gif" 
						alt="logo-farmstory-web"></a>

					<!-- ============================================================= LOGO : END ============================================================= -->

					<!-- ============================================================= MAIN NAVIGATION ============================================================= -->

					<ul class="nav navbar-nav">

						<li class="dropdown"><a id="introduce" href="#" class="dropdown-toggle"
							data-toggle="dropdown" >서비스 소개</a></li>
						<!-- /.dropdown -->
						
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">식물</a>

							<ul class="dropdown-menu">

								<c:if test="${not empty loginuser and loginuser.memType eq 'ADMIN'}">
									<li><a id="plant_write" href="#">식물 정보 등록 [관리자]</a></li>
								</c:if>

								<li><a id="plant_list" href="#">식물 정보</a></li>

							</ul> <!-- /.dropdown-menu --></li>
						<!-- /.dropdown -->

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">스마트 화분</a>

							<ul class="dropdown-menu">
								<li><a id="plant_regist" href="#">나의 화분 등록</a></li>
								<li><a id="my_flowerpot_list" href="#">나의 화분</a></li>
							</ul> <!-- /.dropdown-menu --></li>
						<!-- /.dropdown -->
						
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">다이어리</a>
							
							<ul class="dropdown-menu">
								<li><a id="diary_book_list" href="#">나의 다이어리</a></li>
							</ul> <!-- /.dropdown-menu --></li>
						<!-- /.dropdown -->


						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">고객센터</a>
						
						<ul class="dropdown-menu">
								<li><a id="notice_list" href="#">공지사항</a></li>
								<li><a id="interrupt_list" href="#">문의함</a></li>
							</ul> <!-- /.dropdown-menu --></li>
						<!-- /.dropdown -->
						
						<li class="dropdown"><a id="smart-pot-shop" href="#" class="dropdown-toggle"
							data-toggle="dropdown">Shop&nbsp;
							<img class="icon-img" alt="icon-shop" src="http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/header/icon-flowerpot.png"></a>
						</li>
						<li class="dropdown pull-right searchbox"><a id="shop-basket" href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="icon-basket"></i></a>
						</li>
						
						<li class="dropdown pull-right searchbox"><a id="mobile-app" href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="icon-mobile"></i><img class="icon-img" alt="icon-android" src="http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/header/icon-android.png">
							<img class="icon-img" alt="icon-apple" src="http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/header/icon-apple.png"></a>
						</li>	

						<c:if test="${not empty loginuser }">
							<li class="dropdown pull-right searchbox"><a href="#"
								data-toggle="modal" data-target="#logout">Logout&nbsp;<i
									class="icon-logout-1"></i></a></li>
						</c:if>

						<c:if test="${ empty loginuser }">
							<li class="dropdown pull-right searchbox"><a href="#"
								data-toggle="modal" data-target="#register">Sign Up&nbsp;
								<i class="icon-user-add"></i></a></li>

							<li class="dropdown pull-right searchbox"><a href="#"
								data-toggle="modal" data-target="#login">Login&nbsp;<i
									class="icon-login-1"></i></a></li>
						</c:if>
					</ul>
					<!-- /.nav -->

					<!-- ============================================================= MAIN NAVIGATION : END ============================================================= -->
				</div>
				<!-- /.container -->
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.yamm -->
	</div>
	<!-- /.navbar -->
	
	<!-- Account - Register Modal : START -->
	<jsp:include page="/WEB-INF/views/include/account/modal-register.jsp" />
	<!-- Account - Register Modal : END -->

	<!-- Account - Login Modal : START -->
	<jsp:include page="/WEB-INF/views/include/account/modal-login.jsp" />
	<!-- Account - Login Modal : END -->

	<!-- Account - Logout Modal : START -->
	<jsp:include page="/WEB-INF/views/include/account/modal-logout.jsp" />
	<!-- Account - Logout Modal : END -->
</header>
