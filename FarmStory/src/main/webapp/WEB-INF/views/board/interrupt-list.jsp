<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<!-- Meta -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Farm Story - Customer Center</title>

<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />

<style type="text/css">
#noticeSection {
	padding-top: 40px;
}

#noticeTitle, #suggestTitle {
	padding-top: 70px;
	padding-bottom: 70px;
}

#noticeForm, #suggestForm {
	padding-top: 20px;
}

#suggestSection {
	padding: 5px 0px 5px 5px;
	margin-top: 5px;
	border-top: 2px solid #efefef;
	font-size: 12px;
}
</style>
</head>

<body>

	<!-- ============================================================= HEADER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />

	<!-- ============================================================= HEADER : END ============================================================= -->


	<!-- ============================================================= MAIN ============================================================= -->

	<main> <!-- ============================================================= SECTION – HERO ============================================================= -->


		<!-- ============================================================= SECTION – HERO : END ============================================================= -->


		<!-- ============================================================= SECTION – MAP ============================================================= -->
 <!-- ============================================================= SECTION – HERO ============================================================= -->
		<div class="건의사항">
			<section class="light-bg img-bg img-bg-softer"
				style="background-image: url(/farmstory/resources/assets/images/art/image-background04.jpg);">
				<div id="suggestTitle" class="container inner">
					<div class="row">
						<div class="col-md-8 center-block text-center">
							<header>
								<h1>건의 사항</h1>
								<p>건의사항이 있나요? 우리는 당신의 의견을 듣고 싶어요!</p>
							</header>
						</div>
						<!-- /.col -->
					</div> 
					<!-- ./row -->
				</div>
			</section>
</div> 
<c:if test="${not empty loginuser}">
		<div id="noticeSection" class="recentActivitySection">
			<div class="container">

				<div class="row">
					<div class="col-xs-12 ">
						<div class="recentActivityContent bg-ash">

							<div class="table-responsive" data-pattern="priority-columns">
								<table class="table listingsTable">
									<tr class="rowItem">
										<td align="center" style="word-break:break-all" ><b>게시자</b></td>
										<td align="center" style="word-break:break-all"><b>제목</b></td>
										<td align="center" style="word-break:break-all"><b>날짜</b></td>
										<c:if
											test="${not empty loginuser and loginuser.memType eq 'ADMIN'}">
											<td align="center"><b>삭제</b></td>
										</c:if>
									</tr>

									<c:forEach var="notice" items="${ notices }">
									<!-- 사용자가 볼 때의 내용 -->
										<c:if
											test="${ notice.memberId eq loginuser.memId and loginuser.memType eq 'USER' }">
											<tr class="rowItem">
												<td style="word-break:break-all" class="dateTd" align="center">${ notice.memberName }</td>

												<td class="packageTd">
													<ul class="list-inline listingsInfo">
														<li>
															<h4 style="word-break:break-all">
																<a id="search-content" data-toggle="collapse"
																	data-target="#contentSearch${ notice.noticeNo }"
																	style="margin-left: 80px; font-size: 17px">${ notice.noticeTitle}</a>
															</h4> <%
 	pageContext.setAttribute("newLineChar", "\n");
 %>
															<h4 id="contentSearch${ notice.noticeNo }"
																class="collapse" style="margin-left: 80px;">${fn:replace( notice.noticeContent, newLineChar, "<br/>")}</h4>
														</li>
													</ul>
												</td>

												<td style="word-break:break-all" class="bookingTd">
													<ul class="list-inline listingsInfo text-left">
														<li><fmt:formatDate value="${ notice.noticeDate }"
																var="noticeDate" pattern="yyyy-MM-dd" />
															<h4 style="margin-left: 230px; font-size: 17px">${noticeDate}</h4>
														</li>
													</ul>
												</td>
												<c:if
													test="${not empty loginuser and loginuser.memType eq 'ADMIN'}">
													<td style="word-break:break-all" class="bookingTd">
														<ul class="list-inline listingsInfo text-left">
															<li>
																<button id="noticeDelete${notice.noticeNo}"
																	style="margin-left: 100px;word-break:break-all"
																	data-noticeNo="${notice.noticeNo}">삭제</button>
															</li>
														</ul>
													</td>
												</c:if>
											</tr>
										</c:if>
										<!-- 관리자가 볼 때의 내용 -->
										<c:if
											test="${ notice.memberType eq 'USER' and loginuser.memType eq 'ADMIN' }">
											<tr class="rowItem">
												<td class="dateTd" align="center">${ notice.memberName }</td>

												<td class="packageTd">
													<ul class="list-inline listingsInfo">
														<li>
															<h4>
																<a id="search-content" data-toggle="collapse"
																	data-target="#contentSearch${ notice.noticeNo }"
																	style="margin-left: 80px; font-size: 17px">${ notice.noticeTitle}</a>
															</h4> <%
 	pageContext.setAttribute("newLineChar", "\n");
 %>
															<h4 id="contentSearch${ notice.noticeNo }"
																class="collapse" style="margin-left: 80px;">${fn:replace( notice.noticeContent, newLineChar, "<br/>")}</h4>
														</li>
													</ul>
												</td>

												<td class="bookingTd">
													<ul class="list-inline listingsInfo text-left">
														<li><fmt:formatDate value="${ notice.noticeDate }"
																var="noticeDate" pattern="yyyy-MM-dd" />
															<h4 style="margin-left: 230px; font-size: 17px">${noticeDate}</h4>
														</li>
													</ul>
												</td>
												<c:if
													test="${not empty loginuser and loginuser.memType eq 'ADMIN'}">
													<td class="bookingTd">
														<ul class="list-inline listingsInfo text-left">
															<li>
																<button id="noticeDelete${notice.noticeNo}"
																	style="margin-left: 100px;"
																	data-noticeNo="${notice.noticeNo}">삭제</button>
															</li>
														</ul>
													</td>
												</c:if>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		</c:if>
<c:if test="${not empty loginuser and loginuser.memType eq 'ADMIN'}">
		<c:forEach var="notice" items="${ notices }">
			<div class="modal fade bookingModal modalBook " id="noticeModal"
				tabindex="-1">
				<div class="modal-dialog" align="center">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">삭제하시겠습니까?</h4>
						</div>
						<div class="modal-dialog-login">
							<a id="processNotice" class="btn buttonCustomPrimary1"
								href="/farmstory/baord/notice_delete.action?noticeNo=${ notice.noticeNo }">게시글
								삭제</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>

			<!-- ============================================================= SECTION – HERO : END ============================================================= -->

			<div class="container inner">
				<div class="row">

					<div class="col-md-8 inner-right inner-bottom-md">

						<!-- ============================================================= SECTION – CONTACT FORM ============================================================= -->
<c:if test="${not empty loginuser and loginuser.memType eq 'USER'}">
						<section id="contact-form">
							<h2>건의사항 작성</h2>
							<form id="suggestForm" class="forms11"
								action="notice_insert.action" method="post">

								<div class="row">
									<div class="col-sm-6">
										<h4>아이디</h4>
										<input type="text" name="memberId"
											value="${ loginuser.memId }" class="form-control"
											readonly="readonly">
											<input type="hidden" name="memberName" value="${ loginuser.memName }">
											<input type="hidden" name="memberType" value="${ loginuser.memType }">
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-6">
										<h4>이메일</h4>
										<input type="email" value="${ loginuser.memEmail }"
											class="form-control" readonly="readonly">
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-6">
										<h4>제목</h4>
										<input type="text" name="noticeTitle" class="form-control"
											placeholder="제목을 적어주세요." required="required">
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-12">
										<h4>내용</h4>
										<textarea name="noticeContent" class="form-control"
											placeholder="내용을 적어주세요"></textarea>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<button type="submit" class="btn btn-default btn-submit111">작성
									내용 보내기</button>

							</form>

							<div id="response"></div>

						</section>
</c:if>
						<!-- ============================================================= SECTION – CONTACT FORM : END ============================================================= -->

					</div>
					<!-- ./col -->

				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
	</main>

	<!-- ============================================================= MAIN : END ============================================================= -->


	<!-- ============================================================= FOOTER ============================================================= -->
	<jsp:include page="/WEB-INF/views/include/footer/public-footer.jsp" />
	<!-- ============================================================= FOOTER : END ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp" />
	<script type="text/javascript">
		$(function() {
			$('button[id^=noticeDelete]').on(
					'click',
					function(event) {
						event.preventDefault();
						var noticeNo = $(this).attr('data-noticeNo')
						$('#noticeModal a#processNotice').attr(
								'href',
								'/farmstory/board/notice_delete.action?noticeNo='
										+ noticeNo);
						$('#noticeModal').modal('show');

					});

		});
	</script>
</body>
</html>