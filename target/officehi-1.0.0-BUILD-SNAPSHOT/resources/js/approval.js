/**
 * @author 엄다빈
 * @editDate 23.12.18 ~ 23.12.19
 * @editDate 23.12.28 검색 기능 보조 searchType, searchValueIsNaN 함수 추가
 */

// 승인, 반려 묻는 코드
function updateApproval(context, approvalNo, status) {
	let isFormUpdate;
	
	if(status == 3) 
		isFormUpdate = confirm("반려하시겠습니까?");
	else if(status == 2)
		isFormUpdate = confirm("진행하시겠습니까?");
	else if(status == 4)
		isFormUpdate = confirm("최종 승인 하시겠습니까?");
		
	if(isFormUpdate) {
		let form = document.getElementById('approval');
		let formInput = document.createElement('input');
		
		form.setAttribute('action', context + 'approvals/status/' + approvalNo);
		formInput.setAttribute('name', 'status');
		formInput.setAttribute('value', status);
		
		form.appendChild(formInput);
		
		form.submit();
		formInput.remove();
	}
}

// 삭제 묻는 코드
function deleteApproval(context, approvalNo) {
	let isFormDelete = confirm("정말 삭제하시겠습니까?");
	
	if(isFormDelete) {
		let form = document.getElementById('approval');
		
		form.setAttribute('action', context + 'approvals/'+ approvalNo);
		approvals
		form.submit();
	}
}

// 관리자 검색 창 type변경
function searchApproval() {
	let searchValue = document.getElementById('searchValue');	
	let search = document.getElementById('search');
	let searchOption = search.options[search.selectedIndex].value;
	let searchError = document.getElementById('searchError');
	
	if(searchOption == 'date' || searchOption == 'checkDate') {
		searchValue.setAttribute('type', 'date');
	} else {
		searchValue.setAttribute('type', 'type');
	}
	
}

// 검색 시에 숫자 및 공백 검증
function searchValueIsNaN() {
	let searchValue = document.getElementById('searchValue');
	let searchOption = search.options[search.selectedIndex].value;
	let form = document.getElementById('searchForm');
	let searchError = document.getElementById('searchError');
	
	if(searchOption == 'approvalNo' && isNaN(searchValue.value)) {
		searchError.style.display = 'inline-block';
		searchError.innerText = '숫자만 입력하세요.';
	} else if(searchValue.value == '') {
		searchError.style.display = 'inline-block';
		searchError.innerText = '검색어를 입력하세요.';
	} else {
		form.submit();
	}
}

// 검색 후 검색 타입 및 검색어 값 가져오기
function searchType(paramSearch, paramSearchValue) {
	let selectedSearch = document.querySelector("option[value=" + paramSearch + "]");
	let searchValue = document.getElementById('searchValue');

	selectedSearch.setAttribute('selected','selected');
	searchValue.value = paramSearchValue;
}
