/**
 * @author 박재용
 * @editDate 23.12.24 ~23.12.25
 * (jQuery)
 */

$(document).ready(function() {
	var pagingForm = $("#pagingForm");
	
	$(".page-item a").on("click", function(e) {
	    e.preventDefault();
	    var pageNum = $(this).attr("href");
	    pagingForm.find("input[name='pageNum']").val(pageNum); // 페이지 번호를 form의 input에 할당
	    pagingForm.submit();
	});
});
