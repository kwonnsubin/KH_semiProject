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
<div class="container-lg mb-5 mt-6 w-75">
	<!-- 게시판 상세글 -->
	<div>
		<c:forEach var="boardList" items="${boardList }">
			<div>
				<h3>${boardList.title }</h3>
			</div>
			<div class="row border">
				<div class="d-inline col border">
					<div class="d-inline">분류</div>
					<div class="d-inline">${boardList.category }</div>
				</div>
				<div class="d-inline col border">
					<div class="d-inline">작성자</div>
					<div class="d-inline">${boardList.writer }</div>
				</div>
				<div class="d-inline col border">
					<div class="d-inline">작성일</div>
					<div class="d-inline">${boardList.regdate }</div>
				</div>
			</div>
			<div class="row border w-auto" style="width:1000px; height:500px;">
				<p class="col">${boardList.content }</p>
			</div>
	</div>
	<!-- 댓글 리스트 시작 -->
	<div>
		<c:forEach var="replyList" items="${replyList }">
			<div class="border" >
				<div class="d-inline border row" style="padding: 0;">
					<div class="d-inline col" style="padding: 0;">
						${replyList.reply_writer }
					</div>
					<div class="d-inline col" style="padding: 0;">
						${replyList.reply_regdate }					
					</div>
				</div>
				<div class="row">
					<p style="padding: 0;">${replyList.reply_content }<span>
				</div>
			</div>
		<!-- 댓글 수정 삭제 -->
				<div class="h-stack gap-3 ">
					<button class=" d-inline btn btn-outline-primary " onclick="location.href='<%=request.getContextPath()%>/replyUpdate?reply_no=${replyList.reply_no }'">수정</button>			
					<form action="<%=request.getContextPath()%>/replyDelete" method="post " class="d-inline">
						<button class="d-inline btn btn-outline-primary delete " type="submit">삭제</button>
							<div class="d-inline">
							<c:if test="${empty lgnss}">
								<label class="d-inline" for="boardPw">비밀번호</label>
								<input class="d-inline form-control w-25"  type="password" name="reply_pwd" id=boardPw" >
							</c:if>
								<input class="d-inline" type="hidden" name="reply_no" value="${replyList.reply_no }">						
							</div>
					</form>
				</div>
		</c:forEach>
		<!-- 댓글 작성 -->
		<form action="<%=request.getContextPath()%>/boardDetail" method="post">
			<input type="hidden" name="board_no" value="<%=request.getParameter("board_no")%>">
			<div class="row">
				<div class="col">
					<textarea class="form-control w-auto" name="reply_content" placeholder="댓글달기..."></textarea>			
				</div>
			</div>
			<c:if test="${empty lgnss}">
			<div class="row">
					<div class="col-2">
						<label for="comment_writer">작성자</label>
					</div>
					<div class="col-8">
						<input type="text" name="writer" placeholder="작성자" id="comment_writer">				
					</div>
					<div class="col d-md-flex justify-content-md-end">
						<button class="d-inline btn btn-outline-primary " type="submit">입력</button>			
					</div>
			</div>
			<div class="row">
					<div class="col-2">	
						<label for="comment_pw">비밀번호</label>
					</div>	
					<div class="col-6">
						<input type="password" name="pwd" placeholder="비밀번호" id="comment_pw">					
					</div>			
			</div>
			</c:if>
		</form>
	</div>

	<!-- 게시글 하단-->
	<button class="btn btn-outline-primary">목록보기</button>
	<button class="btn btn-outline-primary update">수정</button>
	<button class="btn btn-outline-primary delete">삭제</button>
	
	
		<script>
			$(".btn.update").on("click", handlerClickBtnUpdate);
			function handlerClickBtnUpdate() {
				console.log("btnUpdate 눌림");
				location.href="<%=request.getContextPath()%>/boardUpdate?board_no=${boardList.board_no }";
			}
			
			$(".btn.delete").on("click", handlerClickBtnDelete);
			function handlerClickBtnDelete() {
				console.log("btnDelete 눌림");
				location.href="<%=request.getContextPath()%>/boardDelete?board_no=${boardList.board_no }";
			}
		</script>
	</c:forEach>
</div>
</body>
</html>