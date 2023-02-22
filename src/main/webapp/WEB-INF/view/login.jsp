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
<jsp:include page="/WEB-INF/view/header.jsp"/>
<style>

	.loginForm {
	padding:60px 60px 40px 40px;
	}
</style>
<body>
<div class="container-lg loginForm" style="width:80%;">
	<div class="mt-10 border loginForm">
		<form action="login" method="post">
				<div class="row justify-content-center mb-3 mt-3">
					<div class="col-2 ">
						<lable class="control-label">이메일</lable>	
					</div>
					<div class="col-4">
						<input class="form-control " type="text" name="email">	
					</div>
				</div>
				<div class="row justify-content-center mb-4">
					<div class="col-2">
						<lable class="control-label">비밀번호</lable>
					</div>
					<div class="col-4">
						<input class="form-control " type="password" name="pwd">
					</div>
				</div>
				<div class="row justify-content-center mb-3">
					<button type="submit" class="btn btn-dark col-6" style="height: 50px;">로그인하기</button>					
				</div>
				<div class="row justify-content-center mb-3">
					<button type="button" class="btn enroll btn-dark col-6" style="height: 50px;">회원가입</button>		
				</div>
		</form>
	</div>
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