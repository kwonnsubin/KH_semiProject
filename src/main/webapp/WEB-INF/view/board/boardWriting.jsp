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
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/board/boardHeader.jsp"/>
<div class="container">
	<form action="<%=request.getContextPath()%>/boardWriting" method="post">
	

	
		<div>
			<span>제목</span>
			<input type="text" name="title">
		</div>
		<div>
			<span>분류</span>
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
				<span>작성자</span>
				<input type="text" name="writer">
				<span>비밀번호</span>
				<input type="password" name="pwd">
		</c:if>
		<div>
			내용<input type="text" name="content">
		</div>
		<button type="button">돌아가기</button>
		<button type="submit">완료</button>
	</form>
</div>

</body>
</html>