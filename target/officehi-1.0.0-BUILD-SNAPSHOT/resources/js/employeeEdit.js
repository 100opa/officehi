/**
 * @author 박재용
 * @editDate 23.12.24 ~23.12.25
 */

$(".editButton").click(function() {
	
	var id = $(this).attr("id");

	$('#employeeInfo').attr('action', '/officehi/admin/employees/' + id).submit();

});
