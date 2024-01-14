<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="context" value="/" />
<c:url var="resPath" value="/resources" />
<!--
 * @author 박재용
 * @editDate 23.12.20 ~ 23.12.22
 * 페이지네이션 기능 추가 23.12.23 ~ 23.12.25
 * @author 이승준
 * 구조, 클래스명, css 통일 24.01.01 ~ 24.01.01 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 관리</title>
<script type="text/javascript" src="${resPath}/js/searchOption.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="admin-employee-total">
	<%@ include file="/WEB-INF/views/header/adminHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="../../aside/adminAside.jsp" %>
			<div class="main-box">
				<div class="content-box floating">
					<h2 class="lgmg">사원 정보 관리</h2>
					<form action="${context}admin/employees/search" role="search" method="get">
						<div class="search-box" id="employeeSearch">
							<select id="searchType" name="searchType">
								<option value="name">사원명</option>
								<option value="userNo">사번</option>
								<option value="deptName">부서명</option>	
							</select>
							<input name="name" class="searchInput" type="text" placeholder="검색 키워드를 입력하세요" aria-label="관리자 사원정보 검색">
							<button class="btn btn-primary" type="submit">검색</button>
							<a href="${context}admin/employees" class="btn btn-simple">초기화</a>
						</div>
					</form>

					<!-- 등록버튼 -->
					<div>
						<button class="btn btn-primary add-form-btn" type="button" onclick="location.href='${context}admin/employees/add'">신규 사원 등록</button>
					</div>

					<!-- 리스트 -->
					<form:form action="${context}admin/employees/${employee.userNo}/retired" method="post" id="userTable">
						<table class="fixed">
							<thead>
								<tr>
									<th scope="col">사번</th>
									<th scope="col">사원명</th>
									<th scope="col">부서명</th>
									<th scope="col">직책</th>
									<th scope="col">입사일</th>
									<th scope="col" class="edit-delete-th">수정/퇴사</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="employee" items="${employees}">
									<tr>
										<c:choose>
											<c:when test="${employee.fromDate eq '9999-01-01'}">
												<td><a href="${context}admin/employees/${employee.userNo}"><span>${employee.userNo}</span></a></td>
												<td><a href="${context}admin/employees/${employee.userNo}"><span>${employee.name}</span></a></td>
											</c:when>
											<c:otherwise>
												<td><a href="${context}admin/employees/${employee.userNo}" class="retired"><span>${employee.userNo}</span></a></td>
												<td><a href="${context}admin/employees/${employee.userNo}" class="retired"><span>${employee.name}</span></a></td>
											</c:otherwise>
										</c:choose>
										<td><a href="${context}admin/employees/${employee.userNo}"><span>${employee.deptName}</span></a></td>
										<td><a href="${context}admin/employees/${employee.userNo}"><span>${employee.position}</span></a></td>
										<td><a href="${context}admin/employees/${employee.userNo}"><span>${employee.toDate}</span></a></td>
										<td>
											<div class="edit-btn-box">
												<button type="button" class="edit-btn" onclick="location.href='${context}admin/employees/${employee.userNo}'">
													<img alt="수정버튼" src="<c:url value='/resources/img/edit.svg' />">
												</button>
												<button type="button" class="delete-btn retiredIcon" id="${employee.userNo}" name="${employee.name}">
													<img alt="삭제버튼" src="<c:url value='/resources/img/retire.svg'/>">
												</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form:form>
					<!-- 페이지네이션 -->
					<c:set var="action" value="${context}admin/employees" />
					<c:choose>
						<c:when test="${param.searchType != '' and param.searchType != null}">
							<c:set var="action" value="${context}admin/employees/search" />
						</c:when>
					</c:choose>
					<form:form id="pagingForm" action="${action}" method="get" modelAttribute="pageMaker">
						<input type="hidden" name="searchType" value="${param.searchType}" />
						<input type="hidden" name="name" value="${param.name}" />
						<input type="hidden" name="userNo" value="${param.userNo}" />
						<input type="hidden" name="deptName" value="${param.deptName}" />
						<form:hidden path="pageNum" />
						<form:hidden path="amount" />
						<div class="pagination">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="page-item">
											<a class="page-link" href="${pageMaker.startPage - 1}" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="page-item ${pageMaker.paging.pageNum==num ? 'active' : ''}">
											<a class="page-link" href="${num}">${num}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next}">
										<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span></a>
										</li>
									</c:if>
								</ul>
							</nav>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/adminFooter.jsp"%>
	<script type="text/javascript" src="<c:url value='/resources/js/employee.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/pagination.js' />"></script>
</body>
</html>