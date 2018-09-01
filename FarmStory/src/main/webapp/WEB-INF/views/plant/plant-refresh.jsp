<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="owl-popular-posts" class="owl-carousel owl-item-gap-sm">
<c:forEach var="oldImages" items="${ oldImages }" varStatus="status">
	<div class="item">
		<figure>
			<figcaption class="text-overlay">
				<c:choose>
					<c:when test="${ oldImages.imgIdx eq '1'}">
						<div class="info">
							<h4>목록페이지 사진</h4>
							<p>
								<a id="modifyThumnail" href="#" class="btn"
									data-index="${ status.index }">수정하기</a>
							</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="info">
							<h4>상세페이지 사진</h4>
							<p>
								<a href="#" class="btn oldImgDelete"
									data-index="${ status.index }">삭제하기</a>
							</p>
						</div>
					</c:otherwise>
				</c:choose>
				<!-- /.info -->
			</figcaption>
			<img
				src="/farmstory/resources/upload-image/plant-info/${ oldImages.pliImg }"
				alt="">
		</figure>
	</div>
	<!-- /.item -->
	<input id="oldImgFileName${ status.index }" type="hidden"
		name="oldImgFileName" value="${ oldImages.pliImg }">
	<input id="oldImgIdx${ status.index }" type="hidden" name="oldImgIdx"
		value="${ oldImages.imgIdx }">
</c:forEach>
</div>
