<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
	<c:forEach var="recycleList" items="${data }">
		<img alt="" src="${recycleList.img}" class="rounded float-start" style="width:500px; height:500px;">
		<div class="mb-5">
			<h1 >${recycleList.recycle_name}</h1>
		</div>
		<div class="mb-3">
			<b class="">${recycleList.recycle_tag}</b>
		</div>
		<div class="mb-3">
			<div>재활용: ${recycleList.recycle_check}</div>
		</div>
		<div class="mb-5">
			<div>분류: ${recycleList.cf_name}</div>
		</div>
		<div class="mb-3">
			<b class="fs-5">버리는방법</b>
		</div>
		<div class="mb-5">
			<div>${recycleList.title}</div>
		</div>
		<div class="mb-3">
			<b class="fs-5">알아두면 좋은 점</b>
		</div>
		<div class="mb-3">
			<div>${recycleList.content}</div>
		</div>
	</c:forEach>
</div>
</body>
</html>