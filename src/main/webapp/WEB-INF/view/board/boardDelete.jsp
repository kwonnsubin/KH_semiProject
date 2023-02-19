<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
삭제
<form action="<%=request.getContextPath()%>/boardDelete" method="post">
	<input type="hidden" name="board_no" value="<%=request.getParameter("board_no")%>">
	<c:if test="${empty lgnss}">
		비밀번호<input type="password" name="pwd">
	</c:if>
	<button type="submit" name="pwd">삭제</button>
</form>
</body>
</html>