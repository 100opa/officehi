/**
* @author 박재용
* @editDate 23.12.18 ~ 23.12.19
*
* @author 이승준
* 오류 수정 & 범용화 23.12.24 ~ 23.12.26
*/

document.addEventListener("DOMContentLoaded", function () {
    // select 요소 가져오기
    var selectElement = document.querySelector('select[name="searchType"]');
    
    // 입력 필드 가져오기
    var inputElement = document.querySelector('input.searchInput');
    
    // select 요소에 change 이벤트 리스너 추가
    selectElement.addEventListener('change', function () {
        var selectedOption = selectElement.value; // 선택된 옵션 값 가져오기
        inputElement.setAttribute('name', selectedOption);
    });
});