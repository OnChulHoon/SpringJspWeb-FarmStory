

/*===================================================================================*/
/*	Header JS/JQUERY SCRIPTS
/*===================================================================================*/

/*===== Navigation Bar : Start =====*/

$("a#logo-farmstory-web").on("click", function() {
	location.href="/farmstory/home.action";
});

$("a#logo-farmstory-mobile").on("click", function() {
	location.href="/farmstory/home.action";
});

$("a#introduce").on("click", function() {
	location.href="/farmstory/cover_detail.action";
});

$("a#plant_write").on("click", function() {
	location.href="/farmstory/plant_write.action";
});

$("a#plant_list").on("click", function() {
	location.href="/farmstory/plant_list.action";
});

$("a#plant_regist").on("click", function() {
	location.href="/farmstory/plant_regist.action";
});

$("a#my_flowerpot_list").on("click", function() {
	location.href="/farmstory/my_flowerpot_list.action";
});

$("a#diary_book_list").on("click", function() {
	location.href="/farmstory/diary_book_list.action";
});

$("a#notice_list").on("click", function() {
	location.href="/farmstory/board/notice_list.action";
});

$("a#interrupt_list").on("click", function() {
	location.href="/farmstory/board/interrupt_list.action";
});

$("a#smart-pot-shop").on("click", function() {
	location.href="/farmstory/coming_soon.action?msg=shop";
});

$("a#shop-basket").on("click", function() {
	location.href="/farmstory/coming_soon.action?msg=basket";
});

$("a#mobile-app").on("click", function() {
	location.href="/farmstory/coming_soon.action?msg=mobile";
});

/*===== Navigation Bar : End =====*/