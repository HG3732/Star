<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/common/header.css" rel="stylesheet">
    
<script>
$(loadedHandler)
function loadedHandler() {
	$(".logout").on("click", logoutHandler)
	
	function logoutHandler() {
		alert("안녕히가십시오");
		
		var frmlogout = document.getElementById("frm-logout");
		frmlogout.action = "${pageContext.request.contextPath}/logout";
		frmlogout.submit();
	}
}

</script>
</head>
<body>
    <header>
	    <div class="wrap-header">
	    	<div class="top-bar">
	    		<c:choose>
		    		<c:when test="${empty ssslogin}">
		                <div><a href="http://localhost:8080/star/login">로그인</a></div>
		                <div><a href="#">회원가입</a></div>
	                </c:when>
	                <c:otherwise>
		                <div><a href="#" class="logout">로그아웃</a></div>
		                <div><a href="#">마이페이지</a></div>
	                </c:otherwise>
	            </c:choose>
            </div>
	        <div class="logo"><a href="http://localhost:8080/star/home">김서박</a></div>
	        <div class="nav">
	            <div><a href="http://localhost:8080/star/edu/list" class="edu">교육 신청</a></div>
	            <div><a href="#" class="board">게시판</a></div>
	        </div>
	        <div class="bottom-info">
                <div class="recent-edu">
                    가장 최근 올라온 교육행사 한개 제목 표시하는 곳
                </div>
                <div class="wether-box">
                    오늘의 날씨 간단 표시
                </div>
            </div>
	    </div>
    </header>
</body>
</html>