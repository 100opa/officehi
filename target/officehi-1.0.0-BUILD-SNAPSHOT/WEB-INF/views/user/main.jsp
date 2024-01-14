<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/" />
<!--  
* @author 이승준
* @editDate 23.12.20 ~ 23.12.21
* 구조, 클래스명, css 통일 23.12.31 ~ 24.01.01 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오피스하이 - 메인</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<script type="text/javascript" src="${resPath}/js/time.js"></script>
<script type="text/javascript" src="${resPath}/js/workMessage.js"></script>
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="main" onload="getTime()">
	<%@ include file="/WEB-INF/views/header/userHeader.jsp" %>
	<main>
		<div class="main-container">
			<div class="aside-box">
				<div class="aside floating">
					<div class="profile-box">
						<div class="profile-image-box">
							<c:choose>
								<c:when test="${empty profile.fileName}">
									<img src="${resPath}/img/profile-default.svg" alt="프로필 기본 이미지">
								</c:when>
								<c:otherwise>
									<%-- <img src="<c:url value='${resPath}/${profile.fileName}'/>" alt="프로필 이미지"> --%>
									<img src="${resPath}/storage/profile/${profile.fileName}" alt="프로필 이미지">
								</c:otherwise>
							</c:choose>
						</div>
						<span>${user.deptName}</span>
						<p><span>${user.name}</span> <span>${user.position}</span></p>
					</div>
					</div>
					<div class="aside floating quick-menu-bar">
					<div class="quick-menu">
						<a href="${context}mypage">
							<img class="quick-menu-icon" src="${resPath}/img/mypage.svg" alt="마이페이지">
							<span>마이페이지</span>
						</a>
					</div>
					<div class="quick-menu">
						<a href="${context}approvals">
							<img class="quick-menu-icon" src="${resPath}/img/approval.svg" alt="전자 결재">
							<span>전자 결재</span>
						</a>
					</div>
					<div class="quick-menu mt">
						<a href="${context}works">
							<img class="quick-menu-icon" src="${resPath}/img/work.svg" alt="근태 관리">
							<span>근태 관리</span>
						</a>
					</div>
					<div class="quick-menu mt">
						<a href="${context}notices">
							<img class="quick-menu-icon" src="${resPath}/img/notice.svg" alt="공지사항">
							<span>공지사항</span>
						</a>
					</div>
				</div>
			</div>
			<div class="main-box">
				<div class="notice-wrapper">
					<a href="${context}notices" class="notice-box floating">공지사항</a>
					<a href="${context}notices/${notice.noticeNo}" class="notice-title floating">
						<span class="ellipsis">
							${notice.title}&nbsp;&nbsp;-&nbsp;&nbsp;${notice.content}
						</span>
					</a>
				</div>
				<div class="content-box-wrapper">
					<div class="content-box wrapping-2 floating">
						<h3>결재 현황</h3>
						<table class="fixed">
							<tbody>
								<c:if test="${empty approvals}">
									<tr style="text-align: center; font-size:18px;">
										<td>결재 문서가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="approval" items="${approvals}">
									<tr>
										<td><span>${approval.name}</span></td>
										<td><a href="${context}approvals/${approval.approvalNo}"><span>${approval.title}</span></a></td>
										<td><span>${approval.date}</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="link-box approvals">
							<a href="${context}approvals">
								<span>결재 문서 더보기</span>
							</a>
						</div>
					</div>
					<div class="content-box wrapping-2 floating">
						<h3>근태 관리</h3>
						<div class="time-box">
							<span id="currentTime"></span>
						</div>
						<div class="work-btn-box">
							<form id="arrivalForm" class="arrival btn-form" action="${context}main/arrival" method="post">
								<input type="hidden" name="userNo" value="${loginUser}" />
								<button id="arrivalBtn" class="start-btn" type="submit">출근</button>
							</form>
							<form class="leave btn-form" action="${context}main/leave" method="post">
								<input type="hidden" name="userNo" value="${loginUser}" />
								<button id="leaveBtn" class="end-btn" type="submit">퇴근</button>
							</form>
							<input type="hidden" id="resultMessage" value="${resultMessage}" />
						</div>
						<div class="link-box works">
							<a href="${context}works/list">
								<span>근무시간 확인</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/userFooter.jsp" %>
</body>
</html>