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
<div class="container">
	<form action="login" method="post">
		<lable class="col-lg-2 control-label">아이디</lable>
		<input class="form-control w-25" type="text" name="email">	
		<lable class="col-lg-2 control-label">비밀번호</lable>
		<input class="form-control w-25" type="password" name="pwd">
		<button type="submit">로그인하기</button>
		<button type="button" class="btn enroll">회원가입</button>
	</form>
</div>
	<script>
		$(".btn.enroll").on("click", handlerClickBtnEnroll);
		
		function handlerClickBtnEnroll() {
			console.log("btnEnroll 눌림");
			location.href="<%=request.getContextPath()%>/enroll";
		}
	</script>
</body>
</html>