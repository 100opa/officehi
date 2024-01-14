<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="context" value="/" />
<c:url var="resPath" value="/resources" />
<!--  
 * @author 정유진
 * @editDate 23.12.19 ~ 23.12.20
 * 페이지네이션
 * @editDate 23.12.26 ~ 23.12.28
 * css 수정
 * @editDate 23.12.28 ~ 23.12.28
 * @author 이승준
 * 구조, 클래스명, css 통일 23.12.31 ~ 24.01.01 
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="user-notice-list">
	<%@ include file="/WEB-INF/views/header/userHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/userAside.jsp"%>
			<div class="main-box">
				<div class="content-box floating">
					<h2>공지사항 조회</h2>
					<form action="${context}notices/search" method="get">
						<div class="search-box" >
							<select id="search" name="search">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
							<input name="searchValue" class="searchValue" type="text" placeholder="검색 키워드를 입력하세요" aria-label="공지사항 검색">
							<button class="btn btn-primary" type="submit">검색</button>
						</div>
					</form>
					<table class="fixed">
						<thead>
							<tr>
								<th>제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach var="notice" items="${notices}">
								<tr>
									<td><a href="${context}notices/${notice.noticeNo}"><span>${notice.title}</span></a></td>
									<td><a href="${context}notices/${notice.noticeNo}"><span>${notice.date}</span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:set var="action" value="${context}notices" />
					<c:choose>
						<c:when test="${param.search != null and param.search != ''}">
							<c:set var="action" value="${context}notices/search" />
						</c:when>
					</c:choose>
					<form:form id="pagingForm" modelAttribute="pageMaker" action="${context}notices" method="get">
						<form:hidden path="pageNum" />
						<form:hidden path="amount" />
						<div class="pagination d-flex justify-content-center mt-5">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="page-item"><a class="page-link" href="${pageMaker.startPage -1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="page-item ${pageMaker.paging.pageNum == num ? 'active' : ''}"><a class="page-link" href="${num}">${num}</a></li>
									</c:forEach>
									<c:if test="${pageMaker.next}">
										<li class="page-item"><a class="page-link" href="${pageMaker.endPage +1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/userFooter.jsp"%>
	<script type="text/javascript" src="<c:url value='/resources/js/pagination.js' />"></script>
</body>
</html>