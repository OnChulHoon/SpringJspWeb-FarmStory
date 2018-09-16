/**
 * =================================
 * Custom JavaScript : Coming Soon 
 * =================================
 */

/*========== Count Setting : Start ==========*/
    
//Shop
$('#simply-countdown-losange-shop').simplyCountdown({
    year: 2018,
    month: 11,
    day: 10,
    enableUtc: false
});

//Mobile
$('#simply-countdown-losange-mobile').simplyCountdown({
    year: 2018,
    month: 12,
    day: 31,
    enableUtc: false
});
/*
    //Example
    var d = new Date(new Date().getTime() + 800 * 120 * 120 * 2000);

    // default example
    simplyCountdown('.simply-countdown-one', {
        year: d.getFullYear(),
        month: d.getMonth() + 1,
        day: d.getDate()
    });
*/

/*========== Count Setting : End ==========*/

/*========== Email Setting : Start ==========*/

$(".bg-focus").focus(function() {
	$(this).removeAttr("placeholder");
});

$(".bg-focus").focusout(function() {
	$(this).attr("placeholder", "소식 받을 이메일 주소를 알려주세요.");
});

/*========== Email Setting : End ==========*/