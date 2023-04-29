<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
    .vertical-align {
        display: flex;
        align-items: center;
        font-weight: bold; 
    }
    
	.cell-label {
	    width: 50px; 
	    font-weight: bold; 
	}
	
	.cell-value {
	    width: 120px;
	}
	
	.cell-content {
	    width: 100%;
	    height: 300px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/board/boardHeader.jsp"/>
<div class="container mb-5 mt-6 w-75">
	<!-- 게시판 상세글 -->
	<c:forEach var="boardList" items="${boardList }">
		<div class="mb-44">
		    <table class="table border">
		        <tr>
		            <th colspan="6" style="font-size: 20px;">${boardList.title}</th>
		        </tr>
		        <tr class="bg-light">
		            <td class="cell-label">분류</td>
		            <td class="cell-value">${boardList.category}</td>
		            <td class="cell-label">작성자</td>
		            <td class="cell-value">${boardList.writer}</td>
		            <td class="cell-label">작성일</td>
		            <td class="cell-value"><fmt:formatDate value="${boardList.regdate}" pattern="yyyy.MM.dd"/></td>
		        </tr>
		        <tr>
		            <td colspan="6" class="cell-content">${boardList.content}</td>
		        </tr>
		    </table>
		</div>
		<!-- 댓글 작성 {s} -->
 		<div class="">
			<form action="<%=request.getContextPath()%>/boardDetail" method="post">
				<input type="hidden" name="board_no" value="<%=request.getParameter("board_no")%>">
				<div class="row">
					<div class="col mb-4">
						<textarea class="form-control form-floating mw-100"  name="reply_content" placeholder="댓글달기..." style="width:100%;"></textarea>			
					</div>
				</div>
				<c:if test="${empty lgnss}">
					<div class="row mb-3">
							<div class="col-2 vertical-align">
								<label class="form-label" for="comment_writer">작성자</label>
							</div>
							<div class="col">
								<input class="form-control" type="text" name="writer" placeholder="작성자" id="comment_writer">				
							</div>
					</div>
					<div class="row mb-3">
							<div class="col-2 vertical-align">	
								<label class="form-label" for="comment_pw">비밀번호</label>
							</div>	
							<div class="col">
								<input class="form-control" type="password" name="pwd" placeholder="비밀번호" id="comment_pw">					
							</div>			
					</div>
					<div class="col d-md-flex justify-content-md-end mb-3">
								<button class="d-inline btn btn-outline-primary " type="submit">등록</button>			
					</div>
				</c:if>
				<c:if test="${ !empty lgnss}">
					<div class="row  ">
							<div class="col d-md-flex justify-content-md-end mb-3">
								<button class="d-inline btn btn-outline-primary mb-4" type="submit">등록</button>			
							</div>
					</div>
				</c:if>
			</form>
		</div>
		<!-- 댓글 작성 {e} -->
		<!-- 댓글 리스트 {s} -->
		<table class="table bg-light" style="width: 100%;">
		    <c:forEach var="replyList" items="${replyList}">
		        <tr>
		            <td class="border-bottom-0 border-top" style="#ccc;">
		                <div style="display: flex; align-items: center;"">
		                    <div style="font-weight: bold;" class="me-3">${replyList.reply_writer}</div>
		                    <div style="color: #777;" class="me-3"><fmt:formatDate value="${replyList.reply_regdate}" pattern="yyyy.MM.dd"/></div>
		                	<a class="me-3" style="text-decoration: none;" onclick="location.href='<%=request.getContextPath()%>/replyUpdate?reply_no=${replyList.reply_no}'">수정</a>
		                	<a class="me-3" style="text-decoration: none;" onclick="location.href='<%=request.getContextPath()%>/replyUpdate?reply_no=${replyList.reply_no}'">삭제</a>
		                </div>
		            </td>
<%-- 		            <td style="padding: 10px;">
 		                <form action="<%=request.getContextPath()%>/replyDelete" method="post" class="d-inline">
		                    <input type="hidden" name="board_no" value="<%=request.getParameter("board_no")%>">
		                    <button class="btn btn-outline-primary delete me-2" type="submit" id="btn_delete_reply">삭제</button>
		                    <div class="d-inline">
		                        <c:if test="${empty lgnss}">
		                            <label class="d-inline" for="boardPw">비밀번호</label>
		                            <input class="d-inline form-control w-25" type="password" name="reply_pwd" id="boardPw">
		                        </c:if>
		                        <input class="d-inline" type="hidden" name="reply_no" value="${replyList.reply_no}">
		                    </div>
		                </form>
		            </td> --%>
		        </tr>
		        <tr>
		            <td colspan="2" style="padding: 10px; background-color: #f8f8f8;">${replyList.reply_content}</td>
		        </tr>
		    </c:forEach>
		</table>
		<!-- 댓글 리스트 {e} -->


	<!-- 게시글 하단-->
	<div class="mb-3 mt-4">
		<button class="btn btn-outline-primary me-2" onclick="location.href='<%=request.getContextPath()%>/board'">목록</button>
		<button class="btn btn-outline-primary update me-2">수정</button>
		<button class="btn delete btn-outline-primary  me-2" onclick="location.href='<%=request.getContextPath()%>/boardDelete?board_no=${boardList.board_no }'">삭제</button>
	</div>
	</c:forEach>
</div>
</body>
<script>

// 댓글 수정
<%-- $(".btn.update").on("click", handlerClickBtnUpdate);
function handlerClickBtnUpdate() {
	console.log("btnUpdate 눌림");
	location.href="<%=request.getContextPath()%>/boardUpdate?board_no=${boardList.board_no }";
} --%>

// 댓글 삭제 ajax
$("#btn_delete_reply").on("click", handlerClickBtnDeleteReply);
function handlerClickBtnDeleteReply() {
var reply_no = $("input[name='reply_no']").val(); // $()안에는 따옴표로 감싸야한다.
	
    $.ajax({
        url: '<%=request.getContextPath()%>/admin/qna/selectAnswerCount',
        data: {reply_no: reply_no},
        type: "POST",
        success: function(result) {
            html += result;
            $('#answersCount').text(html);
        },
        error: function() {
            alert("답변수 요청 실패!");
        }
    });	
	
}

</script>
</html>