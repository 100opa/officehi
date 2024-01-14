<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="context" value="/" />
<c:url var="resPath" value="/resources" />
<!--  
 * @author 정유진
 * @editDate 23.12.20 ~ 23.12.21
 * @author 박재용
 * 파일수정기능, 수정 Message 추가 23.12.29 ~23.12.31
 * @author 이승준
 * 구조, 클래스명, css 통일 23.12.31 ~ 24.01.01 
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="user-mypage">
	<%@ include file="/WEB-INF/views/header/userHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/userAside.jsp"%>
			<div class="main-box">
				<div class="content-box floating">
					<h2>마이 페이지</h2>
					<div class="hr"></div>
					<form:form action="${context}myPage" id="employeeInfo" method="post" enctype="multipart/form-data" cssClass="mt-3 small bold text-bold">
						<div class="form-row">
							<div class="label-input-box">
								<label for="user_no">사번</label>
								<input type="text" name="user_no" id="user_no" value="${loginUser.userNo}" readonly>
							</div>
							<div class="label-input-box">
								<label for="name">이름</label>
								<input type=text name=name id="name" value="${mypageuser.name}" readonly>
							</div>
						</div>
						<div class="form-row">
							<div class="label-input-box">
								<label for="phone">휴대폰 번호</label>
								<input type=text name=phone id="phone" value="${mypageuser.phone}" readonly>
							</div>
							<div class="label-input-box">
								<label for="birth_date">생년월일</label>
								<input type=text name=birth_date id="birth_date" value="${mypageuser.birthDate}" readonly>
							</div>
						</div>
						<div class="form-row">
							<div class="label-input-box">
								<label for="to_date">입사일</label>
								<input type=text name=to_date id="to_date" value="${mypageuser.toDate}" readonly>
							</div>
							<div class="label-input-box">
								<label for="from_date">퇴사일</label>
								<input type=text name=from_date id="from_date" value="${mypageuser.fromDate}" readonly>
							</div>
						</div>
						<div class="form-row">
							<div class="label-input-box">
								<label for="dept_name">부서명</label>
								<input type=text name=dept_name id="dept_name" value="${mypageuser.deptName}" readonly>
							</div>
							<div class="label-input-box">
								<label for="position">직급</label>
								<input type=text name=position id="position" value="${mypageuser.position}" readonly>
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
							<button type="submit" class="btn btn-primary" onclick="alert('사원정보 수정이 완료되었습니다.');">수정</button>
							<button type="button" class="btn btn-simple" onclick="history.go(-1); return false;">취소</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/footer/userFooter.jsp"%>
	<script type="text/javascript" src="${resPath}/js/fileUpload.js"></script>
</body>
</html>