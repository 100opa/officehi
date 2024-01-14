/**
 * @author 이승준
 * @editDate 23.12.27 ~ 23.12.27
 */
 
document.addEventListener('DOMContentLoaded', function () {
	var currentUrl = window.location.toString();
	currentUrlNoSlash = currentUrl.replace(/\//g, "");
	const urlArray = ["notices", "approvalsadd", "approvals", "workslist", "works", "mypage", "employees"];
	for (const url of urlArray) {
		if (currentUrlNoSlash.includes(url)) {
			var pointElement = document.querySelector('#' + url);
			pointElement.classList.add("active");
			break;
		}
	}
});