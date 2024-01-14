/**
 * @author 박재용
 * @editDate 23.12.28 ~23.12.29
 */

 function updateFileName(inputId, fileNameId) {

    var input = document.getElementById(inputId);
    var fileNameInput = document.getElementById(fileNameId); 

	// input.files는 파일 입력 요소에서 선택된 파일의 목록
    if (input.files.length > 0) { 
        fileNameInput.value = input.files[0].name; 
    } else {
        fileNameInput.value = "-"; // 파일을 선택하지 않은 경우 -
    }
}