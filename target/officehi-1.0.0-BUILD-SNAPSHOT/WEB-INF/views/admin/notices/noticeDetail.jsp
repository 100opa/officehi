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
<title>공지사항 상세</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="admin-notice">
	<%@ include file="/WEB-INF/views/header/adminHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/adminAside.jsp" %>
			<div class="main-box">
				<div class="content-box floating">
					<h2>공지사항 상세</h2>
					<form:form action="${context}admin/notices/${notice.noticeNo}" modelAttribute="notice" method="post">
						<div class="form-row">
							<div class="label-input-box">
								<label for="noticeNo">공지 번호</label>
								<form:input path="noticeNo" id="noticeNo" readonly="true"/>
							</div>
							<div class="label-input-box">
								<label for="date">등록일</label>
								<form:input path="date" id="date" readonly="true"/>
							</div>
						</div>
						<div class="label-input-box mb">
							<label for="title">제목</label>
							<form:input path="title" id="noticeName"/>
						</div>
						<label for="noticeContent" class="form-label mb-3">내용</label>
						<form:textarea path="content" id="noticeContent" rows="3"/>
						<div class="btn-area">
							<button class="btn btn-primary" id="arrival" type="submit">수정 하기</button>
							<button class="btn btn-simple" id="leave" onclick="history.go(-1)" type="button">뒤로 가기</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/adminFooter.jsp"%>
</body>
</html>