<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
 * @author 박재용
 * @editDate 23.12.22 ~ 23.12.22
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 경고</title>
</head>
<body>
<c:url value="접근할 수 없는 페이지입니다." var="msg" />
<c:url value="/main" var="mainUrl" />
<script>
	var msg = "<c:out value='${msg}'/>";
	var url = "<c:out value='${mainUrl}'/>";
	alert(msg);
	location.href = url;
</script>
</body>
</html>