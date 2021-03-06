<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<footer class="dark-bg">
	<div class="container inner">
		<div class="row">

			<div class="col-md-3 col-sm-6 inner ">
				<a href="/farmstory/home.action"><img id="footerLogo" class=""
					src="http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/farmstory-logo-white.png" alt=""></a>
				<p>팜스토리는 당신의 식물을 보다 쉽게 키울 수 있도록 도와주는 서비스입니다.</p>
				<a href="/farmstory/cover_detail.action" class="txt-btn">자세히 확인하기</a>
			</div>
			<!-- /.col -->
			
			<div id="footer-newsletter" class="col-md-3 col-sm-6 inner">
				<h4>팜스토리의 소식을 듣고 싶나요?</h4>
				<p>새로운 소식을 언제든지 받고 싶다면 당신의 이메일을 알려주세요. <br>우리는 언제든지 환영합니다.</p>
				<form id="newsletter" class="form-inline newsletter">
					<input id="subEmail" name="subEmail" type="email" class="form-control" placeholder="이메일 주소를 알려주세요" required>
					<input id="subType" name="subType" type="hidden" value="newsletter-footer">
					<button id="emailSubBtn" class="btn btn-default btn-submit">구독 신청</button>
				</form>
			</div>
			<!-- /.col -->
			
			<div class="col-md-3 col-sm-6 inner">
				<h4>팜스토리를 만날려면</h4>
				<p>우리는 여기서 일해요.</p>
				<ul class="contacts">
					<li><i class="icon-location contact"></i>서울시 구로구 시흥대로 163길 33 3층</li>
					<li><i class="icon-mobile contact"></i>(02) 456 7890</li>
					<li><a href="#"><i class="icon-mail-1 contact"></i>
							info@farmstory.com</a></li>
				</ul>
				<!-- /.contacts -->
			</div>
			<!-- /.col -->
			
			<div class="col-md-3 col-sm-6 inner social-network">
				<h4>Social</h4>
				<ul class="social">
					<li><a href="#"><i class="icon-s-facebook"></i></a></li>
					<li><a href="#"><i class="icon-s-gplus"></i></a></li>
					<li><a href="#"><i class="icon-s-twitter"></i></a></li>
					<li><a href="#"><i class="icon-s-pinterest"></i></a></li>
					<li><a href="#"><i class="icon-s-behance"></i></a></li>
					<li><a href="#"><i class="icon-s-dribbble"></i></a></li>
				</ul><!-- /.social -->
			<p>Web Standards Certification <a href="http://validator.kldp.org/check?uri=referer"
			      onclick="this.href=this.href.replace(/referer$/,encodeURIComponent(document.URL))"><img id="html5Check"
			      src="//validator.kldp.org/w3cimgs/validate/html5-blue.png" alt="Valid HTML 5"></a>
			<a href="http://jigsaw.w3.org/css-validator/check/referer">
					<img id="cssCheck" src="//jigsaw.w3.org/css-validator/images/vcss-blue"
						alt="올바른 CSS입니다!" /></a>
			</p>
			</div><!-- /.social-network -->	
		</div>
		<!-- /.row -->
	</div>
	<!-- .container -->

	<div class="footer-bottom">
		<div class="container inner">
			<p class="pull-left">Copyright&copy; 2018. All Rights Reserved by Team Femme Fatale.</p>
			
			<ul class="footer-menu pull-right">
				<li><a href="/farmstory/home.action">Home</a></li>
				<li><a href="/farmstory/cover_detail.action">Introduce</a></li>
				<li><a href="/farmstory/diary_list.action">My Diary</a></li>
				<li><a href="/farmstory/plant_list.action">Plant</a></li>
				<li><a href="/farmstory/board/notice_list.action">Notice</a></li>
			</ul>
			<!-- .footer-menu -->
		</div>
		<!-- .container -->
			
			
			
	</div>
	<!-- .footer-bottom -->
</footer>