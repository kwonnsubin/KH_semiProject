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
<jsp:include page="/WEB-INF/view/board/boardHeader.jsp"/>
<div class="container">
	<c:forEach var="recycleList" items="${data }">
		<h1>${recycleList.recycle_name}</h1>
		<div>${recycleList.recycle_tag}</div>
		<div>재활용:${recycleList.recycle_check}</div>
		<div>분류:${recycleList.cf_name}</div>
		<div>버리는방법${recycleList.title}</div>
		<div>알아두면 좋은 점${recycleList.content}</div>
		<img alt="" src="${recycleList.img}" class="img-thumbnail">
	</c:forEach>
</div>
</body>
</html>