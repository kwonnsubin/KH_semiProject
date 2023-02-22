<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/board/boardHeader.jsp"/>
<div class="container">
	<form action="<%=request.getContextPath()%>/boardUpdate" method="post">
		<input type="hidden" name="board_no" value="<%=request.getParameter("board_no")%>">
	
		<div class="mb-3 row">
		    <label for="inputPassword" class="col-sm-2 col-form-label">제목</label>
		    <div class="col-sm-10">
				<input type="text" name="title" class="form-control">
			</div>
		</div>
		<div class="row">
			<div class="col">
				<label class="align-middle">분류</label>			
			</div>
			<div class="col-10 mb-3">
				<select name="category" class="form-select">
				  <option selected value="0">분류 선택</option>
				  <option value="1">질문</option>
				  <option value="2">팁/정보</option>
				  <option value="3">의견/제안</option>
				  <option value="4">뉴스</option>
				  <option value="5">기타</option>
				</select>
			</div>
		</div>
		<c:if test="${empty lgnss}">
			<div class="mb-3 row">
				<div class="col-2">
					<label for="inputPassword" class="align-middle ">비밀번호</label>	 
				</div>
				<div class="col-4">
		      		<input type="password" name="pwd" class="form-control">
	    		</div>
			</div>
		</c:if>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label "></label>
			<textarea class="form-control" name="content" rows="3" style="height: 500px;"></textarea>
		</div>
		<button type="button" class="btn btn-outline-dark">돌아가기</button>
		<button type="submit" class="btn btn-outline-dark">수정</button>
	</form>
</div>
</body>
</html>