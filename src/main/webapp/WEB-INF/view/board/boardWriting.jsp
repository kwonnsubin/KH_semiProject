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
<h1>글쓰기</h1>

<form action="<%=request.getContextPath()%>/boardWriting" method="post">
	<div>
		제목<input type="text" name="title">
	</div>
	<div>
	분류
		<select name="category">
		  <option selected value="0">분류 선택</option>
		  <option value="1">질문</option>
		  <option value="2">팁/정보</option>
		  <option value="3">의견/제안</option>
		  <option value="4">뉴스</option>
		  <option value="5">기타</option>
		</select>
	</div>
	<c:if test="${empty lgnss}">
		작성자<input type="text" name="writer">
		비밀번호<input type="password" name="pwd">
	</c:if>
	<div>
		내용<input type="text" name="content">
	</div>
	<button type="button">돌아가기</button>
	<button type="submit">완료</button>
</form>

</body>
</html>