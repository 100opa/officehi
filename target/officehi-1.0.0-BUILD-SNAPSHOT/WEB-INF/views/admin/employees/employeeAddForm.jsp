<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="context" value="/" />
<c:url var="resPath" value="/resources" />
<!--
 * @author 박재용
 * @editDate 23.12.20 ~ 23.12.22
 * 파일 업로드기능 추가 23.12.26 ~ 23.12.27
 * @author 이승준
 * 구조, 클래스명, css 통일 24.01.01 ~ 24.01.01 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 등록</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="admin-employee-addForm">
	<%@ include file="/WEB-INF/views/header/adminHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/adminAside.jsp"%>
			<div class="main-box">
				<div class="content-box floating">
					<h2>사원 정보 등록</h2>
					<div class="hr"></div>
					<form:form action="${context}admin/employees/add" method="post" modelAttribute="employeeDTO" enctype="multipart/form-data">
						<div class="form-row">
							<div class="label-input-box">
								<label for="userNo">사번</label>
								<form:input path="userNo" id="userNo" value="${lastUserNo}" readonly="true" />
							</div>
							<div class="label-input-box">
								<label for="name">이름</label>
								<form:input path="name" id="name" placeholder="이름" />
								<form:errors path="name" cssClass="error" />
							</div>
						</div>
						<div class="form-row">
							<div class="label-input-box">
								<label for="phone">휴대폰 번호</label>
								<form:input path="phone" id="phone" placeholder="휴대폰 번호(-)" maxlength="13"/>
								<form:errors path="phone" cssClass="error" />
							</div>
							<div class="label-input-box">
								<label for="birthDate">생년월일</label>
								<form:input path="birthDate" id="birthDate" placeholder="연도-월-일"/>
								<form:errors path="birthDate" cssClass="error" />
							</div>
						</div>
						<div class="form-row">
							<div class="label-input-box">
								<label for="toDate">입사일</label>
								<form:input path="toDate" id="toDate" type="date" />
								<form:errors path="toDate" cssClass="error" />
							</div>
							<div class="label-input-box">
								<label for="fromDate">퇴사일</label>
								<form:input path="fromDate" cssClass="form-control" id="fromDate" disabled="true" placeholder="-"/>
								<form:errors path="fromDate" cssClass="error" />
							</div>
						</div>
						<div class="form-row">
							<div class="label-input-box">
								<label for="deptName">부서명</label>
								<select id="deptName" name="deptName">
									<option selected>인사</option>
									<option>회계</option>
									<option>마케팅</option>
									<option>CS</option>
									<option>개발</option>
								</select>
							</div>
							<div class="label-input-box">
								<label for="position">직급</label>
								<select id="position" name="position">
									<option selected>사원</option>
									<option>주임</option>
									<option>대리</option>
									<option>팀장</option>
									<option>대표</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="label-input-box">
								<label for="profile">프로필이미지</label>
								<div class="file-field profile-field">
									<input type="text" id="profileFileName" name="profileFileName" class="ellipsis" value="${profileFile.originalFileName}">
									<input type="file" id="profile" name="profile" style="display: none;" onchange="updateFileName('profile', 'profileFileName')">
									<button type="button" class="btn" onclick="document.getElementById('profile').click()">파일 추가</button>
								</div>
							</div>
							<div class="label-input-box">
								<label for="stamp">인감이미지</label>
								<div class="file-field stamp-filed">
									<input type="text" id="stampFileName" name="stampFileName" class="ellipsis" value="${stampFile.originalFileName}"> 
									<input type="file" id="stamp" name="stamp" style="display: none;" onchange="updateFileName('stamp', 'stampFileName')">
									<button type="button" class="btn" onclick="document.getElementById('stamp').click()">파일 추가</button>
								</div>
							</div>
						</div>
						<div class="btn-area">
							<button class="btn btn-primary" id="add" type="submit">등록</button>
							<button class="btn btn-simple" id="cancel" onclick="history.go(-1)" type="button">취소</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/adminFooter.jsp"%>
	<script type="text/javascript" src="${resPath}/js/fileUpload.js"></script>
</body>
</html>