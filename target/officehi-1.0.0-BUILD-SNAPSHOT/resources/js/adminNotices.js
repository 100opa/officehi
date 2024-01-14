/**
 * @author 이승준
 * @editDate 23.12.26 ~ 23.12.26
 */
 
 $(".delete-btn").click(function() {
	var id = $(this).attr("id");
	var choice = confirm("공지번호" + id +"번 항목을 정말 삭제하시겠습니까?");
	
	if(choice){
		$('#noticeTable').attr('action', '/officehi/admin/notices/' + id).submit();
	}
});