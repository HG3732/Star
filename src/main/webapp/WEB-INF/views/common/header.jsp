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
		$(".logout").on("click", logoutHandler);
		$(".mypage").on("click", mypageHandler);
		$(".close-login").on("click", loginCloseHandler);
		$(".mypage-submit").on("click", modalLoginHandler);
	}
	
	function logoutHandler() {
		alert("안녕히가십시오");
		
		var frmlogout = document.getElementById("logout");
		frmlogout.action = "${pageContext.request.contextPath}/logout";
		frmlogout.method = "post";
		frmlogout.submit();
	}
	
	var count = 0;
	
	function mypageHandler(){
		$(".wrap-modal").css("display", "flex");
		count = 0;
	}
	
	function loginCloseHandler(){
		$(".wrap-modal").css("display", "none");
	}
	
 	function modalLoginHandler(){
		
 		let option = "width=400, height=500, menubar=no, toolbar=no, scrollbars=no, resizable=no";
 		window.open("", "_blank", options);
 		
 		/* $.ajax({
			url:"${pageContext.request.contextPath}/mypagelogin"
			,method : "post"
			,data : $("#mypage-login").serialize()
			,success : function(result){
				console.log(result);
				if(result == 1){
					$("[name=pw]").val("");
					location.href="${pageContext.request.contextPath}/home";	//TODO
				} else {
					if(count < 4){
						count++;
						alert("비밀번호가 맞지 않습니다. [" + count + "]회 오류");
						$("[name=pw]").val("");
					} else {
						alert("오류횟수(3회)를 초과하셨으므로 메인페이지로 돌아갑니다.")
						count = 0;
						location.href="${pageContext.request.contextPath}/home";
					}
					
				}
			}
			, error : function(request, status, error) {
				alert("code:"  + request.status + "\n" + "message : "
						+ request.responseText + "\n"
						+"error : " + error);
				}	
		}) */ 
	}

</script>
</head>
<body>
   <div class="wrap-modal">
        <div class="modal-login">
        	<form id="mypage-login">
	            <div class="top-bar">
	                <span>비밀번호 입력</span>
	                <button type="button" class="close-login" style="color: black;">X</button>
	            </div>
	            <div class="main-login">
	                <input type="password" name="pw" placeholder="비밀번호">
	                <input type="button" name="mypage-submit" class="mypage-submit" value="로그인">
	            </div>
            </form>
        </div>
   	</div>
    <header>
	    <div class="wrap-header">
	    	<div class="top-bar">
	    		<c:choose>
		    		<c:when test="${empty ssslogin}">
		                <div><a href="http://localhost:8080/star/login">로그인</a></div>
		                <div><a href="http://localhost:8080/star/star/join" target="_blank">회원가입</a></div>
	                </c:when>
	                <c:otherwise>
	                	<form id="logout">
		                	<div><a href="#" class="logout">로그아웃</a></div>
		                </form>
		                <div><a href="http://localhost:8080/star/mypage" class="mypage">${ssslogin.mem_name}님의 페이지</a></div>
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