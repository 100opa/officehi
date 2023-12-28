<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="context" value="/" />
<c:url var="resPath" value="/resources" />
<!--
 * @author 박재용
 * @editDate 23.12.21 ~ 23.12.23
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<script type="text/javascript" src="${resPath}/js/searchOption.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="${resPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<style type="text/css">
.aside ul span {
	color: #222;
}

.aside ul span.selected {
	font-weight: 800;
	color: #345de3;
}

.table-group-divider tr td a {
	color: #222;
}

.pagination nav ul li a {
	color: #222;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/adminHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/adminAside.jsp" %>
			<div class="main-box">
				<div class="content-box floating">
					<h2 class="lgmg">공지사항 관리</h2>
					<form action="${context}admin/notices/search" role="search" method="post">
						<div class="row g-2 align-items-center mb-3" id="noticeSearch" >
							<div class="col-3">
								<select class="form-select" name="searchType" aria-label="search Default select example">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="noticeNo">공지 번호</option>
								</select>
							</div>
							<div class="col-5">
								<input name="title" class="searchInput form-control col-auto" type="text" placeholder="검색 키워드를 입력하세요" aria-label="관리자 공지 검색">
							</div>
							<div class="col-auto">
								<button class="btn btn-dark" type="submit">검색</button>
							</div>
						</div>
					</form>

					<!-- 등록버튼 -->
					<div>
						<button class="btn btn-dark" type="button" onclick="location.href='${context}admin/notices/add'">공지사항 등록</button>
					</div>

					<!-- 리스트 -->
					<form:form action="${context}admin/notices/${item.id}" method="delete" id="noticeTable">
					<table class="table mt-3">
						<thead>
							<tr>
								<th scope="col">공지 번호</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
								<th scope="col" class="editDeleteTh">수정/삭제</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach var="notice" items="${notices}">
								<tr>
									<td><a href="${context}admin/notices/${notice.noticeNo}">${notice.noticeNo}</a></td>
									<td><a href="${context}admin/notices/${notice.noticeNo}">${notice.title}</a></td>
									<td><a href="${context}admin/notices/${notice.noticeNo}">${notice.date}</a></td>
									<td>
										<div class="edit-btn-box">
											<button type="button" class="edit-btn" onclick="location.href='${context}admin/notices/${notice.noticeNo}'">
												<img alt="수정버튼" src="<c:url value='/resources/img/edit.svg' />">
											</button>
											<button type="button" class="delete-btn" id="${notice.noticeNo}">
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
					<div class="pagination d-flex justify-content-center mt-2">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/adminFooter.jsp"%>
	<script type="text/javascript" src="<c:url value='/resources/js/adminNotices.js' />"></script>
</body>
</html>