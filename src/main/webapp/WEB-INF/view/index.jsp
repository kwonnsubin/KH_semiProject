<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
      body{ background-color: #fbfbfb;}
      /* 본문 내 이미지 요소의 'position' 속성을 'relative'로 지정 */
      img.relative { 
        position: relative;
        left: 300px;
        top: 50px;
      }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp"/>
	<div class="container">
			<img src="https://blisgo.com/wp-content/uploads/elementor/thumbs/banana-peel-3404376_1920-removebg-preview-ovvksuoht0ihjiirj8glio0trdfh66wv1i65zm2gz2.png" class="mx-auto d-block mb-3" alt="..." width="150" height="90">
		<h2 class="text-center mb-4">최근 업데이트된 쓰레기</h2>
		<div class="text-center mt-5">
			<img src="<%=request.getContextPath()%>/resources/img/김치.jpeg" class="me-4" alt="김치" style="width:230px; heigth:200px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/recycleDetail?recycleCode=1'">
			<img src="<%=request.getContextPath()%>/resources/img/여행용가방.jpeg" class="me-4" alt="캐리어" style="width:230px; heigth:200px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/recycleDetail?recycleCode=2'">
			<img src="<%=request.getContextPath()%>/resources/img/전구.jpeg" class="me-4" alt="전구" style="width:230px; heigth:200px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/recycleDetail?recycleCode=3'">	
			<img src="<%=request.getContextPath()%>/resources/img/가위.jpeg" class="me-4" alt="가위" style="width:230px; heigth:200px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/recycleDetail?recycleCode=5'">
			<img src="<%=request.getContextPath()%>/resources/img/컵.jpeg" class="me-4" alt="컵" style="width:230px; heigth:200px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/recycleDetail?recycleCode=6'">
		</div>
	</div>

<script type="text/javascript">
		$(".btn.login").on("click", handlerClickBtnLogin);
		$(".btn.logout").on("click", handlerClickBtnLogout);
		$(".btn.board").on("click", handlerClickBtnCommunity);
		$(".btn.mypage").on("click", handlerClickBtnMypage);
		
		
		function handlerClickBtnLogin() {
			console.log("btnLogin 눌림");
			location.href="<%=request.getContextPath()%>/login";
		}
		
		function handlerClickBtnLogout() {
			console.log("btnLogout 눌림");
			location.href="<%=request.getContextPath()%>/logout";
		}
		
		function handlerClickBtnCommunity() {
			console.log("btnCommunity 눌림");
			location.href="<%=request.getContextPath()%>/board";
		}
		
		function handlerClickBtnMypage() {
			console.log("btnMypage 눌림");
			location.href="<%=request.getContextPath()%>/mypage";
		}
		
		function detail() {
			location.href="<%=request.getContextPath()%>/recycleDetail";
		}
		
		function handlerClickBtnLogin() {
			console.log("btnLogin 눌림");
			location.href="<%=request.getContextPath()%>/login";
		}
		
		
</script>
</body>
</html>