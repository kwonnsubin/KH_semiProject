<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="container-lg mb-5 mt-6">
		<nav class="navbar">
    		<a class="navbar-brand me-auto p-2" href="#">
     			 <img src="https://image.jtbcplus.kr/data/contents/jam_photo/202003/16/77520654-2478-4712-ab4b-69e00d187dbb.jpg" alt="Bootstrap" width="300" height="50" onclick="location.href='<%=request.getContextPath()%>/recycle'">
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
						<button type="button" class="btn mypage me-2">마이페이지</button>	
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
					<!-- <form action="<%=request.getContextPath()%>/recycleDetail" method="post" id="recycleDetail">
					
						</form>
					-->	
				</div>
			</div>
		</div>
</div>
</header>
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
</html>