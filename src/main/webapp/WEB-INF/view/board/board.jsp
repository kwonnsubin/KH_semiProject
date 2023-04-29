<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kh.board.model.vo.BoardVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div class="container-sm">
	<button type="button" class="btn writing btn-outline-secondary btn-sm">글쓰기</button>
	<table class="table table-hover table-group-divider mt-3 mb-3">
		<thead class="table-light text-center">
		<tr>
			<th class="text-center">분류</th>
			<th>제목</th>
			<th class="text-center">작성자</th>
			<th class="text-center">작성일</th>
		</tr>
		</thead>
		<c:forEach var="data" items="${requestScope.paging.page }">
		<tbody>
			<tr>
				<td class="text-center">${data.category }</td>
				<td><a style="text-decoration: none;" href="<%=request.getContextPath()%>/boardDetail?board_no=${data.board_no}">${data.title }</a></td>
				<td class="text-center">${data.writer }</td>
				<td class="text-center"><fmt:formatDate value="${data.regdate }" pattern="yyyy.MM.dd"/></td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
	<!-- 페이지 번호 {s} -->
	<nav aria-label="...">
		<ul class="pagination justify-content-center">
			<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
			<c:choose>
				<c:when test="${requestScope.paging.prevPage eq -1 }">
					<li class="page-item disabled"><a class="page-link">prev</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${board }?p=${requestScope.paging.prevPage }">prev</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="pNum" items="${requestScope.paging.pageList }">
				<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${board }?p=${pNum }">${pNum }</a></li>
			</c:forEach>
			<c:choose>
				<c:when test="${requestScope.paging.nextPage eq -1 }">
					<li class="page-item disabled"><a class="page-link">next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${board }?p=${requestScope.paging.nextPage }">next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<!-- 페이지 번호 {e} -->
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