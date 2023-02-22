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
<script>
		function search(t) {
			$.ajax({
				  url: "<%=request.getContextPath()%>/recycleSearch"
				, type: "post"
				, data: {recycle_name: $(t).val()}
				, success: function(data){
					console.log(data)
					var htmlContent = "";
					data.forEach((recycleList) => {
						//recycleName = "<button type='submit' class='list-group-item list-group-item-action' class='1'>"+recycleList.recycle_name+"</button>";
						//recycleCode ="<input type='hidden' name='recycleCode' value="+recycleList.recycle_code+">"
						recycleName ="<a href='<%=request.getContextPath()%>/recycleDetail?recycleCode="+recycleList.recycle_code+"'class='list-group-item list-group-item-action' class='1'>"+recycleList.recycle_name+"</a>";
						
					})
					$("#reclcye_List").html(recycleName);
					//$("#recycleDetail").append(recycleName);
					//$("#recycleDetail").append(recycleCode);
				}
				,   error: function(data) {
						alert("실페");
					}
			});
		}
		
		function handlerClickBtnLogin() {
			console.log("btnLogin 눌림");
			location.href="<%=request.getContextPath()%>/login";
		}
		
				
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp"/>
	<div class="container">
		<h1 class="text-center mb-4">쓰레기 백과사전</h1>
			<div class="input-group row justify-content-center" style="height: 120px;">
				<div class="input-group mb-2 w-25 p-3 h-75" >
					<input class="form-control" type="text" id="recycle_name" placeholder="예)우산,형광등,프링글스통"
						   onkeyup="search(this)">
					<div id="recycleList"></div>
					<button class="btn btn-outline-secondary" onclick="search(this)" type="button">검색</button>
				</div>
			</div>
			<img src="https://blisgo.com/wp-content/uploads/elementor/thumbs/banana-peel-3404376_1920-removebg-preview-ovvksuoht0ihjiirj8glio0trdfh66wv1i65zm2gz2.png" class="mx-auto d-block mb-3" alt="..." width="150" height="90">
		<h2 class="text-center mb-4">최근 업데이트된 쓰레기</h2>
		<div class="text-center mt-5">
			<img src="https://blisgo.com/wp-content/uploads/2022/05/%EA%B9%80%EC%B9%98.jpg" class="me-4" alt="김치" style="width:230px; heigth:200px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/recycleDetail?recycleCode=1'">
			<img src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EC%97%AC%ED%96%89%EC%9A%A9-%EA%B0%80%EB%B0%A9-oxbyym1gkzje14ceohyxn5ks1i5cmp9p3luhug4ni8.jpg" class="me-4" alt="캐리어" style="width:230px; heigth:200px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/recycleDetail?recycleCode=2'">
			<img src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EC%A0%84%EA%B5%AC-owzsp5i8wddwmtzfylsv6ji6sj8jc9ul8fmck1iww0.jpg" class="me-4" alt="우산" style="width:230px; heigth:200px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/recycleDetail?recycleCode=3'">	
			<img src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EA%B0%80%EC%9C%84-oyeb5p40dpeupf2x00jnasigdktv5fjxrug1rslc00.jpg" class="me-4" alt="가위" style="width:230px; heigth:200px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/recycleDetail?recycleCode=5'">
			<img src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EC%BB%B5-oxam46gt9mdkikkdownhle0hgr8lv1ewc68ygddhq8.jpg" class="me-4" alt="컵" style="width:230px; heigth:200px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/recycleDetail?recycleCode=6'">
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
		
		
		
		
</script>
</body>
</html>