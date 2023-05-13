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
	
	  <div class="mb-3 row">
   		<label for="inputPassword" class="col-sm-2 col-form-label">제목</label>
    	<div class="col-sm-10">
      	<input type="text" class="form-control" id="inputPassword" name="title">
    	</div>
  	</div>
	
		<div class="row">
			<div class="col">
				<label class="align-middle">분류</label>			
			</div>
			<div class="col-10 mb-3">
				<select name="category" class="form-select">
				  <option value="0">분류 선택</option>
				  <option selected value="1">질문</option>
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
			   		<label for="inputPassword" class="align-middle">작성자</label>		 
				 </div>
		    	<div class="col-4">
		      		<input type="text"id="inputPassword" name="writer" class="form-control">
		      	</div>
		      	<div class="col-2 text-center">
		      		<label for="inputPassword" class="align-middle ">비밀번호</label>	      	
		      	</div>
		    	<div class="col-4">
		      		<input type="text"id="inputPassword" name="pwd" class="form-control">
	    		</div>
			</div>
		</c:if>
		
		
		<div class="mb-3">
  			<label for="exampleFormControlTextarea1" class="form-label "></label>
  			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content" style="height: 500px;"></textarea>
		</div>
		
		<div class="row">
			<div class="col">
				<button type="button" class="btn btn-outline-dark">돌아가기</button>		
			</div>
			<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
				<button type="submit" class="btn btn-outline-dark">완료</button>		
			</div>		
		</div>
	</form>
</div>

</body>
</html>