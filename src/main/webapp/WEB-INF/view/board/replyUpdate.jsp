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
	<form action="<%=request.getContextPath()%>/replyUpdate" method="post">
	<input type="hidden" name="reply_no" value="<%=request.getParameter("reply_no")%>">
		<div>
			내용<input type="text" name="reply_content">
		</div>
	<c:if test="${empty lgnss}">
		비밀번호<input type="password" name="reply_pwd">
	</c:if>
		<button type="button">돌아가기</button>
		<button type="submit">완료</button>
	</form>
</body>
</html>