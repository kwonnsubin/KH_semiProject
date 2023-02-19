<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kh.board.model.vo.BoardVo"%>
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
<h1>커뮤니티</h1>
<i class="fas fa-thumbs-up fa-5x"></i>
<i class="fa-solid fa-magnifying-glass"></i>
<div class="container-sm">
	<button type="button" class="btn writing btn-outline-secondary btn-sm">글쓰기</button>
	<table class="table table-hover">
		<thead>
		<tr>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		</thead>
		<c:forEach var="boardList" items="${boardList }">
			<tr>
				<td>${boardList.category }</td>
				<td><a href="<%=request.getContextPath()%>/boardDetail?board_no=${boardList.board_no}">${boardList.title }</a></td>
				<td>${boardList.writer }</td>
				<td>${boardList.regdate }</td>
			</tr>
		</c:forEach>
	</table>
	<nav class="text-center">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
</div>
	<script>
		$(".btn.writing").on("click", handlerClickBtnWriting);
		
		function handlerClickBtnWriting() {
			console.log("btnWriting 눌림");
			location.href="<%=request.getContextPath()%>/boardWriting";
		}
	</script>
</body>
</html>