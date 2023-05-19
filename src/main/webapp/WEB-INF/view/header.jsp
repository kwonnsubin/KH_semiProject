<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="container-lg mb-5 mt-6">
		<nav class="navbar">
    		<a class="navbar-brand me-auto p-2" href="#">
     			 <img src="<%=request.getContextPath()%>/resources/img/쓰레기백과사전.png" alt="Bootstrap" width="200" height="30" onclick="location.href='<%=request.getContextPath()%>/recycle'">
    		</a>
			<div class="d-flex justify-content-end">
				<c:choose>
					<c:when test="${empty lgnss}">
						<button type="button" class="btn login me-2">로그인</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn logout me-2">로그아웃</button>
					</c:otherwise>
				</c:choose>
						<button type="button" class="btn board me-2">커뮤니티</button>
					 <form class="d-flex" role="search">
						<div class="search d-flex">
							<div>
								<input class="form-control me-2" type="text" id="recycle_name" placeholder="예)우산,형광등,프링글스통" 
									   onkeyup="search(this)">
							</div>
						</div>
					</form>
			</div>
		</nav>
		<div class="d-flex justify-content-end row">
			<div class="list-group col-3">
				<div id="reclcye_List">
				</div>
				<div id="img">
				</div>
			</div>
		</div>
</div>
</header>
</html>
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
		
 		function search(t) {
			$.ajax({
				  url: "<%=request.getContextPath()%>/recycleSearch"
				, type: "post"
				, data: {recycle_name: $(t).val()}
				, success: function(data){
					var htmlContent = "";
					data.forEach((recycleList) => {
						recycleName ="<a href='<%=request.getContextPath()%>/recycleDetail?recycleCode="+recycleList.recycle_code+"'class='list-group-item list-group-item-action' class='1'>"+recycleList.recycle_name+"</a>";
						img = "<img src='<%=request.getContextPath()%>/resources/img/" + recycleList.img + "' style='width:100px; height:100px;'>";
					})
					$("#reclcye_List").html(recycleName);
					$("#img").html(img);
				}
				,   error: function(data) {
						alert("실패");
					}
			});
		}
	</script>