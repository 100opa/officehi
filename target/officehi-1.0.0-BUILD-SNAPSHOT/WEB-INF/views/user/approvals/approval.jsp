<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/" />
<c:set var="login" value="false" />
<c:if test="${loginUser.userNo == approval.userNo}">
	<c:set var="login" value="true" />
</c:if>
<!-- 
 * @author 엄다빈
 * @editDate 23.12.18 ~ 23.12.19
 * @author 이승준
 * 구조, 클래스명, css 통일 23.01.01 ~ 24.01.01 
 
 
 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>결재 문서 상세</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>" />
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link href="${resPath}/css/reset.css" rel="stylesheet">
<link href="${resPath}/css/layout.css" rel="stylesheet">
<link href="${resPath}/css/layout-sub.css" rel="stylesheet">
</head>
<body id="approval-detail">
	<c:choose>
		<c:when test="${loginUser.admin == 0 }">
			<%@ include file="/WEB-INF/views/header/userHeader.jsp"%>
		</c:when>
		<c:when test="${loginUser.admin == 1 }">
			<%@ include file="/WEB-INF/views/header/adminHeader.jsp" %>
		</c:when>
	</c:choose>
	<main>
		<div class="main-container">
			<c:choose>
				<c:when test="${loginUser.admin == 0 }">
					<%@ include file="/WEB-INF/views/aside/userAside.jsp" %>
				</c:when>
				<c:when test="${loginUser.admin == 1 }">
					<%@ include file="/WEB-INF/views/aside/adminAside.jsp" %>
				</c:when>
			</c:choose>
			<div class="main-box">
				<div class="content-box floating">
					<h2>결재 문서 상세</h2>
					<form:form modelAttribute="approval" action="${context}approvals/${approval.approvalNo}" method="put">
						<div class="form-box">
							<div class="form-row">
								<div class="label-input-box">
									<label for="category">서식</label>
									<form:input path="category" cssClass="form-control" value="${approval.category}" readonly="${login}" />
								</div>
							</div>
							<div class="form-row">
								<div class="label-input-box">	
									<label for="checker">1차 승인자</label>
									<c:choose>
									<c:when test="${login && loginUser.admin == 0 && approval.status == 1}">
										<select id="checker1" name="checker1" class="form-select">
											<option value="${checker1.userNo}" selected>[${checker1.position}] ${checker1.name}</option>
											<c:forEach items="${userList}" var="user">
												<option value="${user.userNo}">[${user.position}] ${user.name}</option>
											</c:forEach>
										</select>
										<input type="hidden" id="confirm" name="confirm" value="0" />
									</c:when>
									<c:when test="${login && loginUser.admin == 0 && approval.status == 2}">
										<input type="text" value="[${checker1.position}] ${checker1.name}" class="form-select" readonly>
										<input type="hidden" id="confirm" name="confirm" value="1" />
									</c:when>
									<c:otherwise>
										<select id="checker1" name="checker1" class="form-select">
											<option value="${checker1.userNo}" selected>[${checker1.position}] ${checker1.name}</option>
										</select>
									</c:otherwise>
								</c:choose>
								</div>
								<div class="label-input-box">	
									<label for="checker">2차 승인자</label>
									<c:choose>
									<c:when test="${checker2 != null}">
										<c:choose>
											<c:when test="${login && loginUser.admin == 0 && approval.status == 1}">
												<select id="checker2" name="checker2" class="form-select">
													<option value="${checker2.userNo}" selected>[${checker2.position}] ${checker2.name}</option>
													<c:forEach items="${userList}" var="user">
														<option value="${user.userNo}">[${user.position}] ${user.name}</option>
													</c:forEach>
													<option value="0">없음</option>
												</select>
												<input type="hidden" id="checkerNo2" name="checkerNo2" value="2" />
											</c:when>
											<c:otherwise>
												<select id="checker2" name="checker2" class="form-select">
													<option value="${checker2.userNo}" selected>[${checker2.position}] ${checker2.name}</option>
												</select>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${checker2 == null}">
										<c:choose>
											<c:when test="${login && loginUser.admin == 0 && approval.status == 1}">
												<select id="checker2" name="checker2" class="form-select">
													<option value="0" selected>없음</option>
													<c:forEach items="${userList}" var="user">
														<option value="${user.userNo}">[${user.position}] ${user.name}</option>
													</c:forEach>
												</select>
											</c:when>
											<c:otherwise>
												<select id="checker2" name="checker2" class="form-select">
													<option value="0">없음</option>
												</select>
											</c:otherwise>
										</c:choose>
									</c:when>
								</c:choose>
								</div>
							</div>
							<div class="label-input-box mb">
									<label class="form-label" for="title">문서 제목</label>
									<form:input path="title" cssClass="form-control" value="${approval.title}" readonly="${!login}" />
							</div>
							<div class="form-row">
								<div class="label-input-box">
									<label for="date">기안일</label>
									<input type="date" id="date" name="date" value="${approval.date}" class="form-control" readonly />
								</div>
								<c:if test="${approval.checkDate != '9999-01-01'}">
									<div class="label-input-box">	
										<label for="checkDate">완료일</label>
										<input type="date" id="checkDate" name="checkDate" value="${approval.checkDate}" class="form-control" readonly />
									</div>
								</c:if>
							</div>
							<label class="form-label" for="content">내용</label>
							<form:textarea path="content" cssClass="form-control w-100" style="height: 400px; resize: none;" readonly="${!login}" />
							<div class="btn-area">
								<c:choose>
								<c:when test="${login && loginUser.admin == 0 && approval.status == 1}">
									<button type="submit" class="btn btn-primary">수정</button>
								</c:when>
								<c:when test="${!login && loginUser.admin == 0 && approval.status == 1}">
									<c:if test="${loginUser.userNo == checker1.userNo && checker2 != null}"> <!-- 결재자 1번이고 결재자 2번이 있다면  -->
										<a class="btn btn-primary" onClick="javascript:updateApproval(${context}, ${approval.approvalNo}, 2)">진행</a>
									</c:if>
									<c:if test="${loginUser.userNo == checker1.userNo && checker2 == null}"> <!-- 결재자 1번이고 결재자 2번이 없다면  -->
										<a class="btn btn-primary" onClick="javascript:updateApproval(${context}, ${approval.approvalNo}, 4)">최종승인</a>
									</c:if>
									<a class="btn btn-primary" onClick="javascript:updateApproval(${context}, ${approval.approvalNo}, 3)">반려</a>
								</c:when>
								<c:when test="${!login && loginUser.admin == 0 && approval.status == 2}">
									<c:if test="${loginUser.userNo == checker2.userNo}">
										<a class="btn btn-primary" onClick="javascript:updateApproval(${context}, ${approval.approvalNo}, 4)">최종승인</a>
										<a class="btn btn-primary" onClick="javascript:updateApproval(${context}, ${approval.approvalNo}, 3)">반려</a>
									</c:if>
								</c:when>
							</c:choose>
								<a class="btn btn-simple" onClick="history.back()">뒤로 가기</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</main>
	<c:choose>
		<c:when test="${loginUser.admin == 0 }">
			<%@ include file="/WEB-INF/views/footer/userFooter.jsp"%>
		</c:when>
		<c:when test="${loginUser.admin == 1 }">
			<%@ include file="/WEB-INF/views/footer/adminFooter.jsp"%>
		</c:when>
	</c:choose>
	<script src="${resPath}/js/approval.js" type="text/javascript"></script>
</body>
</html>