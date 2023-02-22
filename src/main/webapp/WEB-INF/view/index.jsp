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
		<div class="form-group row justify-content-center mb-3">
			<div class="col-5" >
				<input class="form-control" type="text" id="recycle_name" placeholder="예)우산,형광등,프링글스통"
					   onkeyup="search(this)">
				<div id="recycleList"></div>
			</div>
			<div class="col-2">
				<button class="btn btn-primary" onclick="search()" type="button">검색</button>
			</div>
		</div>
		<img src="https://blisgo.com/wp-content/uploads/elementor/thumbs/banana-peel-3404376_1920-removebg-preview-ovvksuoht0ihjiirj8glio0trdfh66wv1i65zm2gz2.png" class="mx-auto d-block mb-3" alt="..." width="150" height="90">
	<h2 class="text-center mb-4">최근 업데이트된 쓰레기</h2>
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
</script>
</body>
</html>