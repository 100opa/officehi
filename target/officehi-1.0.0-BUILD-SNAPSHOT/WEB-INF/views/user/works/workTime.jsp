<%@ page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources" />
<!--
 * @author 박재용
 * @editDate 23.12.18 ~ 23.12.20
 * @author 이승준
 * 구조, 클래스명, css 통일 23.01.01 ~ 24.01.01 
-->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>출퇴근 시간 기록</title>
<script type="text/javascript" src="${resPath}/js/time.js"></script>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>

<body onload="getTime()" id="work-time">
	<%@ include file="/WEB-INF/views/header/userHeader.jsp"%>
	<main>
		<div class="main-container">
			<%@ include file="/WEB-INF/views/aside/userAside.jsp"%>
			<div class="main-box">
				<div class="content-box floating">
					<h2>출퇴근 시간 기록</h2>
					<%
					LocalDate now = LocalDate.now();
					int year = now.getYear();
					int monthValue = now.getMonthValue();
					int dayOfMonth = now.getDayOfMonth();
					int dayOfWeekValue = now.getDayOfWeek().getValue();
					%>

					<%!String koDayofWeek = "";%>
					<%
					switch (dayOfWeekValue) {
					case 1:
						koDayofWeek = "월요일";
						break;
					case 2:
						koDayofWeek = "화요일";
						break;
					case 3:
						koDayofWeek = "수요일";
						break;
					case 4:
						koDayofWeek = "목요일";
						break;
					case 5:
						koDayofWeek = "금요일";
						break;
					case 6:
						koDayofWeek = "토요일";
						break;
					case 7:
						koDayofWeek = "일요일";
						break;
					}
					%>
					<p id="date"><%=year%>. <%=monthValue%>. <%=dayOfMonth%>&nbsp;<%=koDayofWeek%></p>
					<p id="currentTime"></p>
					<div class="btn-area">
						<form class="arrival" action="${context}works/arrival" method="post" onsubmit="return arrivalMessage()">
							<input type="hidden" name="userNo" value="${loginUser}" />
							<button class="btn btn-point" type="submit">출근 하기</button>
						</form>
						<form class="leave" action="${context}works/leave" method="post" onsubmit="return leaveMessage()">
							<input type="hidden" name="userNo" value="${loginUser}" />
							<button class="btn btn-primary" type="submit">퇴근 하기</button>
						</form>
					</div>
					<c:if test="${not empty duplicateMessage}">
						<div id="arrivalDupl " style="color: red; margin-top: 15px;">
							<p>${duplicateMessage}</p>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer/userFooter.jsp"%>
	<script type="text/javascript" src="${resPath}/js/workTimeCheck.js"></script>
</body>

</html>