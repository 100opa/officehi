<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="context" value="/" />
<c:url var="resPath" value="/resources" />
<!--
 * @author 박재용
 * @editDate 23.12.20 ~ 23.12.22
 * @author 이승준
 * 구조, 클래스명, css 통일 24.01.01 ~ 24.01.01 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 상세</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="admin-employee-detail">
	<%@ include file="/WEB-INF/views/header/adminHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/adminAside.jsp"%>
			<div class="main-box">
				<div class="content-box floating">
					<h2>사원 정보 상세</h2>
					<div class="hr"></div>
					<form:form action="${context}admin/employees/${employee.userNo}" id="employeeInfo" method="post" enctype="multipart/form-data">
						<div class="form-row">
							<div class="label-input-box">
								<label for="userNo">사번</label>
								<input type="text" id="userNo" name="userNo" value="${employee.userNo}" readonly>
							</div>
							<div class="label-input-box">
								<label for="name">이름</label>
								<input type="text" id="name" name="name" value="${employee.name}">
							</div>
						</div>
						<div class="form-row">
							<div class="label-input-box">
								<label for="phone">휴대폰 번호</label>
								<input type="text" id="phone" name="phone" value="${employee.phone}" maxlength="13">
							</div>
							<div class="label-input-box">
								<label for="birthDate">생년월일</label>
								<input type="text" id="birthDate" name="birthDate" value="${employee.birthDate}">
							</div>
						</div>
						<div class="form-row">
							<div class="label-input-box">
								<label for="toDate">입사일</label>
								<input type="date" id="toDate" name="toDate" value="${employee.toDate}">
							</div>
							<div class="label-input-box">
								<label for="fromDate">퇴사일</label>
								<input type="text" id="fromDate" name="fromDate" value="${employee.fromDate}" disabled>
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
									<option selected>${employee.position}</option>
									<option>사원</option>
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
							<button class="btn btn-primary .editButton" id="${employee.userNo}" type="submit">수정</button>
							<button class="btn btn-simple" id="cancel" onclick="history.go(-1)" type="button">뒤로 가기</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/adminFooter.jsp"%>
	<script type="text/javascript" src="${resPath}/js/employeeEdit.js"></script>
	<script type="text/javascript" src="${resPath}/js/fileUpload.js"></script>
</body>
</html>