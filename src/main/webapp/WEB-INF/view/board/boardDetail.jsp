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
<h1>커뮤니티 글 상세</h1>
<!-- 게시판 상세글 -->
<c:forEach var="boardList" items="${boardList }">
<div>
	${boardList.title }
</div>
	${boardList.category }
	${boardList.writer }
	${boardList.regdate }
<div>
	${boardList.content }
</div>
<br>
<!-- 댓글 보기 -->
<c:forEach var="replyList" items="${replyList }">
	<div>
		${replyList.reply_writer }
		${replyList.reply_regdate }	
	</div>
	<div>
		${replyList.reply_content }
	</div>
<!-- 댓글 수정 삭제 -->
<button type="button" onclick="location.href='<%=request.getContextPath()%>/replyUpdate?reply_no=${replyList.reply_no }'">수정</button>

<form action="<%=request.getContextPath()%>/replyDelete" method="post">
	<button type="submit">삭제</button>
	<c:if test="${empty lgnss}">
		비밀번호<input type="password" name="reply_pwd">
	</c:if>
		<input type="hidden" name="reply_no" value="${replyList.reply_no }">
</form>
</c:forEach>

<!-- 댓글 작성 -->
<form action="<%=request.getContextPath()%>/boardDetail" method="post">
	<input type="hidden" name="board_no" value="<%=request.getParameter("board_no")%>">
		댓글 작성 <input type="text" name="reply_content">
	<c:if test="${empty lgnss}">
		작성자 <input type="text" name="writer">
		비밀번호 <input type="password" name="pwd">
	</c:if>
		<button type="submit">입력</button>
</form>


<hr>
<!-- 게시글 수정 삭제 -->
<button type="button" class="btn update">수정</button>
<button type="button" class="btn delete">삭제</button>


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
</body>
</html>