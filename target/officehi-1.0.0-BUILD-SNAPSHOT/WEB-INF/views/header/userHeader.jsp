<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!--  
* @author 이승준
* @editDate 23.12.15 ~ 23.12.17
-->
<header>
	<div class="header-container">
		<div class="header-left">
			<h1 class="logo-box">
				<a href="${context}main"> <img src="${resPath}/img/OfficeHi-logo.svg" alt="오피스하이 로고">
				</a>
			</h1>
			<ul class="header-menu">
				<li><a href="${context}notices">공지사항</a></li>
				<li><a href="${context}approvals">전자 결재</a></li>
				<li><a href="${context}works">근태 관리</a></li>
				<li><a href="${context}mypage">마이페이지</a></li>
			</ul>
		</div>
		<div class="header-right">
			<a href="${context}logout"><span>로그아웃</span></a>
		</div>
	</div>
</header>