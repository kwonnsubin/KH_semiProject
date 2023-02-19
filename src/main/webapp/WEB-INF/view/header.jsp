<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</style>
</head>
<header>
	<div class="container-lg">
		<div class="d-flex justify-content-end">
			<c:choose>
				<c:when test="${empty lgnss}">
					<button type="button" class="btn login">로그인</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn logout">로그아웃</button>
				</c:otherwise>
			</c:choose>
					<button type="button" class="btn board">커뮤니티</button>
					<button type="button" class="btn mypage">마이페이지</button>	
				<div class="form-group row justify-content-center">
					<div class="search">
						<input class="form-control fs-6" type="text" id="recycle_name" placeholder="예)우산,형광등,프링글스통" 
							   onkeyup="search(this)">
						<div id="recycleList"></div>
						<h1 id="selected"></h1>
					</div>
				</div>	
		</div>
	</div>
</header>
</html>