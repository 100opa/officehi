<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!--  
* @author 이승준
* @editDate 23.12.27 ~ 23.12.27
-->
<header>
	<div class="header-container">
		<div class="header-left">
			<h1 class="logo-box">
				<a href="${context}admin/employees"> <img src="${resPath}/img/OfficeHi-logo.svg" alt="오피스하이 로고">
				</a>
			</h1>
			<ul class="header-menu">
				<li><a href="${context}admin/employees">사원 관리</a></li>
				<li><a href="${context}admin/approvals">전자 결재</a></li>
				<li><a href="${context}admin/notices">공지사항</a></li>
			</ul>
		</div>
		<div class="header-right">
			<a href="${context}logout"><span>로그아웃</span></a>
		</div>
	</div>
</header>