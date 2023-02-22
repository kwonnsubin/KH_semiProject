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
<jsp:include page="/WEB-INF/view/board/boardHeader.jsp"/>
<div class="container">
	<div class="">
		<form action="<%=request.getContextPath()%>/boardDelete" method="post">
			<input type="hidden" name="board_no" value="<%=request.getParameter("board_no")%>">
			
			<c:if test="${empty lgnss}">
				<div class="row  justify-content-center">
					<div class="col-2">	
						<label for="comment_pw">비밀번호</label>
					</div>
					<div class="col-6 mb-4">
						<input type="password" name="pwd" placeholder="비밀번호..." class="form-control">
					</div>
				</div>
			</c:if>
			<div class="row justify-content-center">
				<div class="col-5">
					<button class="btn btn-outline-dark" type="submit" name="pwd">삭제</button>
					<a class="btn btn-outline-dark me-2" onclick="location.href='<%=request.getContextPath()%>/boardDetail?board_no=<%=request.getParameter("board_no")%>'">본문보기</a>
				</div>
				<div class="col-3 d-grid gap-2 d-md-flex justify-content-md-end">
					<a class="btn btn-outline-dark me-2" onclick="location.href='<%=request.getContextPath()%>/board'">목록보기</a>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>