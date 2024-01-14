<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<c:url var="resPath" value="/resources" />
			<c:url var="context" value="/" />
			<!-- 
 * @author 엄다빈
 * @editDate 23.12.19 ~ 23.12.19
 * @author 이승준
 * 구조, 클래스명, css 통일 24.01.01 ~ 24.01.01 
 -->
			<!DOCTYPE html>
			<html lang="ko">

			<head>
				<meta charset="UTF-8">
				<title>결재 문서 관리</title>
				<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
				<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
				<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
				<link href="${resPath}/css/reset.css" rel="stylesheet">
				<link href="${resPath}/css/layout.css" rel="stylesheet">
				<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
			</head>

			<body onLoad="javaScript:searchType('${param.search}', '${param.searchValue}')" id="admin-approval-total">
				<%@ include file="/WEB-INF/views/header/adminHeader.jsp" %>
					<main>
						<div class="main-container">
							<%@ include file="/WEB-INF/views/aside/adminAside.jsp" %>
								<div class="main-box">
									<div class="content-box floating">
										<h2 class="lgmg">결재 문서 관리</h2>
										<form id="searchForm" action="${context}admin/approvals/search" method="get">
											<div class="search-box">
												<select id="search" name="search" onChange="javaScript:searchApproval()">
													<option value="title">문서 제목</option>
													<option value="userName">기안자</option>
													<option value="deptName">부서</option>
													<option value="date">기안일</option>
													<option value="checkDate">완료일</option>
													<option value="approvalNo">문서번호</option>
												</select>
												<input type="text" id="searchValue" name="searchValue" class="searchValue form-control"
													placeholder="검색 키워드를 입력하세요" required>
												<button type="button" class="btn btn-primary"
													onClick="javaScript:searchValueIsNaN()">검색</button>
												<a href="${context}admin/approvals" class="btn btn-simple">초기화</a>
											</div>
												<span id="searchError" class="searchError">숫자를
													입력해주세요.</span>
										</form>
										<table class="fixed">
											<thead>
												<tr>
													<th class="small-th">결재상태</th>
													<th class="small-th">문서번호</th>
													<th class="small-th">기안자</th>
													<th class="large-th">문서 제목</th>
													<th class="small-th">부서</th>
													<th class="medium-th">기안일</th>
													<th class="medium-th">완료일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="approval" items="${approvals}">
													<tr>
														<td>
															<span>
																<c:set var="status" value="${approval.status}" />
																<c:choose>
																	<c:when test="${status == 1}">신청</c:when>
																	<c:when test="${status == 2}">진행중</c:when>
																	<c:when test="${status == 3}">반려</c:when>
																	<c:when test="${status == 4}">완료</c:when>
																</c:choose>
															</span>
														</td>
														<td><span>${approval.approvalNo}</span></td>
														<td><span>${approval.name}</span></td>
														<td><a
																href="${context}admin/approvals/${approval.approvalNo}"><span>${approval.title}</span></a>
														</td>
														<td><span>${approval.deptName}</span></td>
														<td><span>${approval.date}</span></td>
														<td>
															<span>
																<c:if test="${approval.checkDate != '9999-01-01'}">
																	${approval.checkDate}
																</c:if>
															</span>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<c:set var="action" value="${context}admin/approvals" />
										<c:choose>
											<c:when test="${param.search != null and param.search != ''}">
												<c:set var="action" value="${context}admin/approvals/search" />
											</c:when>
										</c:choose>
										<form:form id="pagingForm" modelAttribute="pageMaker" action="${action}" method="get">
											<input type="hidden" name="search" value="${param.search}">
											<input type="hidden" name="searchValue" value="${param.searchValue}">
											<form:hidden path="pageNum" />
											<form:hidden path="amount" />
											<nav aria-label="Page navigation">
												<ul class="pagination mt-5 justify-content-center">
													<c:if test="${pageMaker.prev}">
														<li class="page-item">
															<a class="page-link" href="${pageMaker.startPage - 1}" aria-label="Previous">
																<span aria-hidden="true">&laquo;</span>
															</a>
														</li>
													</c:if>
													<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
														<li class="page-item ${pageMaker.paging.pageNum == num ? 'active' : ''}"><a
																class="page-link" href="${num}">${num}</a></li>
													</c:forEach>
													<c:if test="${pageMaker.next}">0
														<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}"
																aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
													</c:if>
												</ul>
											</nav>
										</form:form>
									</div>
								</div>
						</div>
					</main>
					<%@ include file="/WEB-INF/views/footer/adminFooter.jsp" %>
						<script src="${resPath}/js/approval.js" type="text/javascript"></script>
						<script src="${resPath}/js/pagination.js" type="text/javascript"></script>
			</body>

			</html>