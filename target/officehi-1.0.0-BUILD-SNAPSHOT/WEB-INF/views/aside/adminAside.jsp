<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
* @author 이승준
* @editDate 23.12.15 ~ 23.12.17
-->
<div class="aside-box">
	<ul class="aside floating">
		<li><span>사원 관리</span>
			<ul>
				<li><a href="${context}admin/employees" id="employees"><span>사원 정보 관리</span></a></li>
			</ul>
		</li>
		<li><span>전자 결재</span>
			<ul>
				<li><a href="${context}admin/approvals" id="approvals"><span>결재 문서 관리</span></a></li>
			</ul>
		</li>
		<li><span>공지사항</span>
			<ul>
				<li><a href="${context}admin/notices" id="notices"><span>공지사항 관리</span></a></li>
			</ul>
		</li>
	</ul>
</div>
<script type="text/javascript" src="<c:url value='/resources/js/aside.js' />"></script>