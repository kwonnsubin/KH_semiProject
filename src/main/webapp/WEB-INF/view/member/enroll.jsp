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
		<h3 class="mb-3">회원가입</h3>
		<div style="width:80%;">
			<form action="<%=request.getContextPath()%>/enroll" method="post" id="enrollForm">
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">E-mail주소</label>
					<input type="text" name="email" id="exampleFormControlInput1" class="form-control" required>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput2" class="form-label">비밀번호</label>
					<input type="password" name="pwd" id="exampleFormControlInput2" class="form-control" required>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput3" class="form-label">비밀번호 확인</label>
					<input type="password" name="pwdcheck" id="exampleFormControlInput3" class="form-control" required>
					<span id="pwdcheckError" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput3" class="form-label">닉네임</label>
					<input type="text" name="nickname" class="form-control" required>
				</div>
				<button type="submit" id="exampleFormControlInput4" class="btn btn-primary">회원가입</button>
			</form>
		</div>
	</div>
</body>
<script>
$("#enrollForm").submit(function() {
    var pw = $("input[name=pwd]").val();
    var pwdcheck = $("input[name=pwdcheck]").val();
    
    if(pw != pwdcheck) {
        $("#pwdcheckError").show();
        return false;
    } else {
        alert("회원가입이 완료되었습니다.");
        return true;
    }
});
</script>
</html>