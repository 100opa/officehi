<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/" />
<!-- 
 * @author 엄다빈
 * @editDate 23.12.15 ~ 23.12.18
 * @editDate 23.12.27 페이지네이션 구현
 * @author 이승준
 * 구조, 클래스명, css 통일 23.01.01 ~ 24.01.01 
 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>결재 현황 조회</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="user-approval-list">
	<%@ include file="/WEB-INF/views/header/userHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/userAside.jsp" %>
			<div class="main-box">
				<div class="content-box floating">
					<h2>결재 현황 조회</h2>
					<div class="filter-btn-box">
						<a href="${context}approvals" class="btn btn-primary  ">전체 보기</a>
						<a href="${context}approvals/search?search=my" class="btn btn-simple">기안문 보기</a>
						<a href="${context}approvals/search?search=other" class="btn btn-simple">참조문 보기</a>
					</div>
					<table class="fixed">
						<thead>
							<tr>
								<th class="small-th">결재상태</th>
								<th class="small-th">기안자</th>
								<th class="large-th">문서 제목</th>
								<th class="small-th">부서</th>
								<th>기안일</th>
								<th>완료일</th>
								<th class="edit-delete-th">수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<form:form modelAttribute="approval" method="delete">
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
										<td><span>${approval.name}</span></td>
										<td><a href="${context}approvals/${approval.approvalNo}"><span>${approval.title}</span></a></td>
										<td><span>${approval.deptName}</span></td>
										<td><span>${approval.date}</span></td>
										<td>
											<span>
											<c:if test="${approval.checkDate != '9999-01-01'}">
												${approval.checkDate}
											</c:if>
											</span>
										</td>
										<td>
										<c:if test="${approval.status == 1 && loginUser.userNo == approval.userNo}">
												<div class="edit-btn-box">
													<button type="button" class="edit-btn" onclick="location.href='${context}approvals/${approval.approvalNo}'">
														<img alt="수정버튼" src="<c:url value='/resources/img/edit.svg' />">
													</button>
													<button onClick="javascript:deleteApproval(${context}, ${approval.approvalNo})" class="delete-btn" type="button">
														<img src="<c:url value='/resources/img/delete.svg'/>" alt="삭제버튼">
													</button>
												</div>
										</c:if>
										</td>
									</tr>
								</c:forEach>
							</form:form>
						</tbody>
					</table>
					<c:set var="action" value="${context}approvals" />
					<c:choose>
						<c:when test="${param.search == 'my' or param.search == 'other'}">
							<c:set var="action" value="${context}approvals/search" />
						</c:when>
					</c:choose>
					<form:form id="pagingForm" modelAttribute="pageMaker" action="${action}" method="get">
						<input type="hidden" name="search" value="${param.search}">
						<form:hidden path="pageNum" />
						<form:hidden path="amount" />
						<nav aria-label="Page navigation">
							<ul class="pagination mt-5 justify-content-center">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
								</c:if>
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<li class="page-item ${pageMaker.paging.pageNum == num ? 'active' : ''}"><a class="page-link" href="${num}">${num}</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
							</ul>
						</nav>
					</form:form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/userFooter.jsp"%>
	<script src="${resPath}/js/approval.js" type="text/javascript" ></script>
	<script src="${resPath}/js/pagination.js" type="text/javascript" ></script>
</body>
</html>