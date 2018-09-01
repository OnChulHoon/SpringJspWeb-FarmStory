<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	/* =================== Plant Write&Update : Start  ====================================================== */
		
		// 사진 파일 업로드 폼을 추가하는 스크립트이다.
		$("#add").on("click", function(e) {
			e.preventDefault();
			e.stopPropagation();
			fn_fileAdd();
		});
		
		// 추가된 사진 파일 업로드 폼을 삭제하는 스크립트이다.
		$("a[name='deleteInput']").on("click", function(e) {
			e.preventDefault();
			fn_fileDelete($(this));
		});
		
		// 사진 파일 업로드 폼을 추가하는 함수이다.
		function fn_fileAdd() {
			/* var str = "<input type='file' name='file_"+(g_count++)+"'/><a href='#this' name='delete' class='btn'>삭제하기</a></p>"; */
			var str = $("<div class='col-sm-12'><input type='file' class='form-control' name='plantImg'><a href='#this' name='deleteInput' class='btn pull-right writeMeunBtn'>삭제</a></div>");
			$("#fileDiv").append(str);

			$("a[name='deleteInput']").on("click", function(e) {
				e.preventDefault();
				fn_fileDelete($(this));
			});
		}
		
		// 추가된 사진 파일 업로드 폼을 삭제하는 함수이다.
		function fn_fileDelete(obj) {
			obj.parent().remove();
		}
		
		// 숫자키만 입력받게 하는 스크립트이다.
		$("input.inputNumberKey").keypress(function (event){
			if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) {
				event.preventDefault();
			} 
		});
		
		// 입력받은 식물 정보를 브라우저에서 DB로 보내는 스크립트이다.
		$("#writePlantInfoBtn").on("click", function(event) {
			event.preventDefault();
			$("form#plantInfoForm").submit();
		});
		
		$("a#backBtn").on("click", function(event) {
			history.back();
		});

	/* =================== Plant Write&Update : End  ====================================================== */
	
	/* =================== Plant Modify&Delete : Start  ====================================================== */
		<c:if test="${updateComplete eq 'modifyOk'}">
			$("#modifyOk").modal("show");
		</c:if>
		$("#deleteInfoBtn").on("click", function(event) {
			event.preventDefault();
			location.href="/farmstory/plant_delete.action?plaNo=${ plant.plaNo }";
		});
	
		$("#modifyInfoBtn").on("click", function(event) {
			event.preventDefault();
			location.href="/farmstory/plant_update.action?plaNo=${ plant.plaNo }";
		});
		
		$("a#modifyBtn").on("click", function(event) {
			event.preventDefault();
			$("form#modifyPlantInfoForm").submit();
		});
	
		var select = $("select[name=plaType]");
		var group = select.attr("data-select");
		select.find("option").each(function(idx, option) {
			if ($(this).text() == group) {
				$(this).attr("selected", "selected");
			}
		});
		
		$("#modifyThumnail").on("click", function(event) {
			event.preventDefault();
			alert("목록페이지 사진은 아래에서 파일을 선택하여 변경해주세요.");
		});
		
		$("a.oldImgDelete").on("click", function(event) {
			event.preventDefault();
			var index = $(this).data("index");
			var oldImgFileName = $("#oldImgFileName" + index).val();
			var oldImgIdx = $("#oldImgIdx" + index).val();
			var plaNo = $("#plantInfoNumber").val();
			
			if (confirm("사진을 삭제하시겠습니까?")) {
			 	$.ajax({
					"url" : "/farmstory/plant_delete_old_img.action",
					"method" : "GET",
					"data" : { "oldImgFileName" : oldImgFileName,
							   "oldImgIdx" : oldImgIdx,
							   "plaNo" : plaNo},
					"success" : function(data, status, xhr) {
						//$("div#oldImageFiles").load("/farmstory/plant_refresh_old_img.action?plaNo=" + plaNo);
						location.href = "/farmstory/plant_update.action?plaNo=" + plaNo;
						//alert("[" + index + "]" + "번 사진이 삭제되었습니다.");
						
					},
					"error" : function (xhr, status, err) {
						alert("오류 발생!!");
					}
				});
			}
		});
		
		// 사진 파일 업로드 폼을 추가하는 스크립트이다.
		$("#modifyAndAddImg").on("click", function(e) {
			e.preventDefault();
			e.stopPropagation();
			fn_fileAddAndModify();
		});
		
		// 사진 파일 업로드 폼을 추가하는 함수이다.
		function fn_fileAddAndModify() {
			var str = $("<h4>목록페이지 사진 수정</h4><div class='row'><div class='col-sm-12'><h6>목록페이지 사진 선택</h6><input type='file' name='thumnailImg' class='form-control'></div></div><br><h4>상세페이지 사진 추가 등록</h4><h6>상세페이지 사진 선택</h6><div id='fileDiv' class='row'><div class='col-sm-12'><input type='file' name='plantImg' class='form-control'><br></div></div></div>");
			$("#fileAddAndModifyDiv").append(str);
		}
		
		$("#").on("click", function(e) {
			e.preventDefault();
			$("#modifyAndAddForm").remove();
		});
	
	/* =================== Plant Modify&Delete : End  ====================================================== */
</script>
