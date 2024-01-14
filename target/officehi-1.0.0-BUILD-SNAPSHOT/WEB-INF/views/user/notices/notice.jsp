<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="context" value="/" />
<c:url var="resPath" value="/resources" />
<!--  
 * @author 정유진
 * @editDate 23.12.19 ~ 23.12.20 
 * @author 이승준
 * 구조, 클래스명, css 통일 23.01.01 ~ 24.01.01 
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 조회</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="user-notice">
	<%@ include file="/WEB-INF/views/header/userHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/userAside.jsp" %>
			<div class="main-box">
				<div class="content-box floating">
					<h2>공지사항 조회</h2>
					<div class="label-input-box">
						<label for="subject">제목</label>
						<input type=text name=subject id="subject" value="${notice.title}" readonly="readonly">
					</div>
					<div class="label-input-box">
						<label for="id">등록일</label>
						<input type="text" id="id" value="${notice.date}" readonly="readonly">
					</div>
					<label class="notice-content">내용</label>
					<textarea id="exampleFormControlTextarea1" rows="3" readonly="readonly" >${notice.content}</textarea>
					<div class="btn-area">
						<button type="button" class="btn btn-simple " onClick="history.back()">뒤로 가기</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/userFooter.jsp"%>
</body>
</html>