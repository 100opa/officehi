<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="context" value="/" />
<c:url var="resPath" value="/resources" />
<!--
 * @author 박재용
 * @editDate 23.12.21 ~ 23.12.23
 * @author 이승준
 * 구조, 클래스명, css 통일 24.01.01 ~ 24.01.01 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<script type="text/javascript" src="${resPath}/js/searchOption.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="admin-notice-total">
	<%@ include file="/WEB-INF/views/header/adminHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/adminAside.jsp" %>
			<div class="main-box">
				<div class="content-box floating">
					<h2 class="lgmg">공지사항 관리</h2>
					<form action="${context}admin/notices/search" method="get">
						<div class="search-box" id="noticeSearch" >
							<select name="search">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="noticeNo">공지 번호</option>
							</select>
							<input name="searchValue" class="searchValue" type="text" placeholder="검색 키워드를 입력하세요" aria-label="관리자 공지 검색">
							<button class="btn btn-primary" type="submit">검색</button>
							<a href="${context}admin/notices" class="btn btn-simple">초기화</a>
						</div>
					</form>

					<!-- 등록버튼 -->
					<div>
						<button class="btn btn-primary add-form-btn" type="button" onclick="location.href='${context}admin/notices/add'">공지사항 등록</button>
					</div>

					<!-- 리스트 -->
					<form:form action="${context}admin/notices/" method="delete" id="noticeTable">
					<table class="fixed">
						<thead>
							<tr>
								<th scope="col" class="small-th">공지 번호</th>
								<th scope="col" class="large-th">제목</th>
								<th scope="col">등록일</th>
								<th scope="col" class="edit-delete-th">수정/삭제</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach var="notice" items="${notices}">
								<tr>
									<td><a href="${context}admin/notices/${notice.noticeNo}"><span>${notice.noticeNo}</span></a></td>
									<td><a href="${context}admin/notices/${notice.noticeNo}"><span>${notice.title}</span></a></td>
									<td><a href="${context}admin/notices/${notice.noticeNo}"><span>${notice.date}</span></a></td>
									<td>
										<div class="edit-btn-box">
											<button type="button" class="edit-btn" onclick="location.href='${context}admin/notices/${notice.noticeNo}'">
												<img alt="수정버튼" src="<c:url value='/resources/img/edit.svg' />">
											</button>
											<button type="submit" class="delete-btn" id="${notice.noticeNo}">
												<img alt="삭제버튼" src="<c:url value='/resources/img/delete.svg'/>">
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</form:form>

					<!-- 페이지네이션 -->
					<form:form id="pagingForm" modelAttribute="pageMaker" action="${action}" method="get">
						<input type="hidden" name="search" value="${param.search}">
						<input type="hidden" name="searchValue" value="${param.searchValue}">
						<form:hidden path="pageNum"/>
						<form:hidden path="amount"/>
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
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
	<%@ include file="/WEB-INF/views/footer/adminFooter.jsp"%>
	<script src="${resPath}/js/pagination.js" type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/adminNotices.js' />"></script>
</body>
</html>