<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
* @author 이승준
* @editDate 23.12.15 ~ 23.12.17
-->
<div class="aside-box">
	<ul class="aside floating">
		<li><span>공지사항</span>
			<ul>
				<li><a href="${context}notices" id="notices"><span>공지사항 조회</span></a></li>
			</ul>
		</li>
		<li><span>전자 결재</span>
			<ul>
				<li><a href="${context}approvals" id="approvals"><span>결재 현황 조회</span></a></li>
				<li><a href="${context}approvals/add" id="approvalsadd"><span>결재 문서 작성</span></a></li>
			</ul>
		</li>
		<li><span>근태 관리</span>
			<ul>
				<li><a href="${context}works" id="works"><span>출퇴근 시간 기록</span></a></li>
				<li><a href="${context}works/list" id="workslist"><span>근무 시간 확인</span></a></li>
			</ul>
		</li>
		<li>
			<a href="${context}mypage" id="mypage"><span>마이페이지</span></a>
		</li>
	</ul>
</div>
<script type="text/javascript" src="<c:url value='/resources/js/aside.js' />"></script>