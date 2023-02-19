<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link href="/WEB-INF/view/style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
		function search() {
			$.aja
				  url: "<%=request.getContextPath()%>/recycleSearch"
				, type: "post"
				, dataType: "json"
				, data: {recycle_name: $("input[type=text]").val() }
				, success: function(data){	
					$.each(data.recycleList, function(index, recycleList) { 
						var items = [];
						items.push("<h1>" + recycleList.recycle_name + "</h1>");
						
						$("input[type=text]").next().html(items.recycle_name);
						/* html:items.recycle_name.appendTo($("input[type=text]")); */		
					});
				}
				,   error: function( request, status, error ){
				    alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
				}					
			});	
		}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp"/>
	<div class="container position-absolute top-50 start-50 translate-middle">
	<h1 class="text-center mb-4">쓰레기 백과사전</h1>
		<div class="form-group row justify-content-center mb-3">
			<div class="col-5">
				<input class="form-control" type="text" id="recycle_name" placeholder="예)우산,형광등,프링글스통" 
					   onkeyup="search(this)">
				<div id="recycleList"></div>
				<h1 id="selected"></h1>
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