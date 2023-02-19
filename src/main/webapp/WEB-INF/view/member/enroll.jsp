<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<form action="<%=request.getContextPath()%>/enroll" method="post">
	E-mail주소<input type="text" name="email">
	<br>
	비밀번호<input type="password" name="pwd">
	<br>
	비밀번호 확인<input type="password" name="pwdcheck">
	<br>
	닉네임<input type="text" name="nickname">
	<button type="submit">회원가입</button>
</form>
</body>
</html>