<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/" />
<!-- 
 * @author 엄다빈
 * @editDate 23.12.15 ~ 23.12.18
 * @author 이승준
 * 구조, 클래스명, css 통일 23.01.01 ~ 24.01.01 
 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>결재 문서 작성</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="user-approval-addForm">
	<%@ include file="/WEB-INF/views/header/userHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/userAside.jsp" %>
			<div class="main-box">
				<div class="content-box floating">
					<h2>결재 문서 작성</h2>
					<form:form modelAttribute="approval" action="${context}approvals/add" method="post">
						<div class="form-row">
							<div class="label-input-box">
								<label for="category">서식</label>
								<form:select path="category" id="category" required="true">
									<option>휴가신청서</option>
									<option>대금 결재</option>
								</form:select>
							</div>
						</div>
						<div class="form-row">
							<div class="label-input-box">	
								<label for="checker">1차 승인자</label>
								<select id="checker1" name="checker1" class="form-select">
									<c:forEach items="${userList}" var="user">
										<option value="${user.userNo}">[${user.position}] ${user.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="label-input-box">	
								<label for="checker">2차 승인자</label>
								<select id="checker2" name="checker2" class="form-select">
									<option value="0">없음</option>
									<c:forEach items="${userList}" var="user">
										<option value="${user.userNo}">[${user.position}] ${user.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="label-input-box mb">
							<label for="title">문서 제목</label>
							<form:input path="title" id="title" placeholder="년-월-일 서식명 사원명" required="true" />
						</div>
						<label class="form-label" for="content">내용</label>
						<form:textarea path="content" id="content" class="form-control w-100" required="true" />
						<div class="btn-area">
							<form:button class="btn btn-primary" type="submit">결재요청</form:button>
							<form:button class="btn btn-simple" onClick="history.back()">취소</form:button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/userFooter.jsp"%>
</body>
</html>