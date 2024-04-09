<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/common/header.css" rel="stylesheet">
</head>
<body>
    <header>
	    <div class="wrap-header">
	    	<div class="top-bar">
                <div><a href="http://localhost:8080/star/login">로그인</a></div>
                <div><a href="#">회원가입</a></div>
                <div><a href="#">로그아웃</a></div>
                <div><a href="#">마이페이지</a></div>
            </div>
	        <div class="logo"><a href="http://localhost:8080/star/home">김서박</a></div>
	        <div class="nav">
	            <div><a href="#" class="edu">교육 신청</a></div>
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