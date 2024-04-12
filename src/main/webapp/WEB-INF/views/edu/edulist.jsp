<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KimParkSeo</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/common/header.css" rel="stylesheet">
    <style>
    
    
    body {
    background-color: black;
    background-image: url('${pageContext.request.contextPath}/resource/image/heaven.jpg');
    background-repeat: no-repeat;
    background-size: 100vw 100vh;
}
header div.wrap-header {
    width: 1100px;
    margin: 0 auto;
    font-size: 24px;
}

/* Top-bar 영역 */
.wrap-header > .top-bar {
    font-size: 14px;
    display: flex;
    justify-content: flex-end;
}

.wrap-header > .top-bar div {
    padding: 20px;
}

.wrap-header > .top-bar div > a{
    color: #ccc;
}

/*  로고 영역   */
div.logo{
    width: fit-content;
    margin: 0 auto;
    padding: 30px;
    font-weight: bold;
}
div.logo a{
    font-size: 40px;
}

/*  nav메뉴 영역    */
.wrap-header .nav{
    display: flex;
    justify-content: space-evenly;
    padding: 20px;
}

.wrap-header .nav > div{
    padding-bottom: 8px;
    border-bottom: 2px solid transparent;
}

.wrap-header > nav .a {
    color: white;
}

.wrap-header .a:hover{
    color: white;
    text-decoration: underline;
    text-decoration-color: white;
}

.wrap-header .nav > div:hover{
    border: solid white;
    border-width: 0 0 2px 0;
    transition: all 1s;
}

/* bottom-info 영역 */
.wrap-header > .bottom-info {
    display: flex;
    flex-direction: column;

}

.wrap-header > .bottom-info > div {
    color: white;
    font-size: 20px;
    background-color: rgba(255,255,255, .2);
    padding: 5px;
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        .wrap-main
        , .wrap-footer{
            margin: 10px auto;
            width: 1100px;
            height: fit-content;
        }
        .wrap-main>.content{
            overflow: hidden;
        }
        .wrap-main>.content>a{
            text-align: center;
		    display: inline-block;
		    float: left;
		    width: 50%;
        }
        .wrap-main>.content>.home-menu{
            display: flex;
            float: right;
            align-items: center;
            margin: 10px 0;
        }
        .wrap-main>.content>.home-menu>a>img{
            width: 1em;
			height: 1em;
            background-color: white;
        }
        .wrap-main>.content>hr{
            clear: both;
        }
        .wrap-main>.content>.edu-list{
            clear: both;
        }
        .wrap-main>.content>.edu-list>.edu-list-search{
            background-color: silver;
            padding: 5px 0;
            text-align: center;
            margin-top: 15px;
        }
        .wrap-main>.content>.edu-list>.edu-list-search>div{
            display: flex;
            justify-content: center;
            position: relative;
        }
        .wrap-main>.content>.edu-list>.edu-list-search>div>input[type=text]{
        	color: black;
            width: 200px;
        }
        .wrap-main>.content>.edu-list>.edu-list-search>div>input[type=image]{
            height: 100%;
        }
        .wrap-main>.content>.edu-list>.edu-list-search>div>a>.btn.eduIns{
            cursor: pointer;
            color: black;
        }
        .wrap-main>.content>.edu-list>.edu-list-search>div>a{
        	color: black;
        	cursor: pointer;
        	position: absolute;
		    right: 10px;
		    top: 8.38px;
        }
        .wrap-main>.content>.edu-list>.edu-list-detail{
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            column-gap: 10px;
            row-gap: 10px;
        }
        .wrap-main>.content>.edu-list>.edu-list-detail>div{
            width: 29%;
            height: max-content;
            border: 1px solid white;
    		margin: 10px 20px;
    		box-sizing: border-box;
        }
        .wrap-main>.content>.edu-list>.edu-list-detail>div>a>.edu-content>table{
        	margin: 20px 10px;
        }
        .wrap-main>.content>.edu-list>.edu-list-detail>div>a>.edu-content>table>tbody>tr>td:nth-of-type(2){
        	display: flex;
        }
        .wrap-main>.content>.edu-paging{
        	line-height: 3em;
        }
        .wrap-main>.content>.edu-paging>ul{
            text-align: center;
        }
        .wrap-main>.content>.edu-paging>ul>li{
            list-style-type: none;
            display: inline-block;
        }
        .wrap-main>.content>.edu-paging>li>a{
            text-decoration: none;
        }
        
        
        
        
        
















        .wrap-footer{
            clear: both;
        }

    </style>
</head>

<body>
	<div class="wrap-header">
		<%@include file="/WEB-INF/views/common/header.jsp" %>
	</div>
    <div class="wrap-main">
    	<div class="content">
            <a href="http://localhost:8080/star/edu/list"><h3>교육 목록</h3></a>
            <a href="http://localhost:8080/star/edu/book/list"><h3>교육 예약 현황</h3></a>
            <div class="home-menu">
                <a href="http://localhost:8080/star/home"><img src="https://www.jejusi.go.kr/images/star/icon/home_icon01.png"></a>
                <div> &nbsp; | 행사 및 교육 | 행사 및 교육신청</div>
            </div>
            <hr>
            <div class="edu-list">
                <div class="edu-list-search">
                	<div>
                        <input type="text" name="edu-name" id="edu-name" onkeyup="searchSubjectEnterHandler()" placeholder="제목 키워드를 입력해주세요">
                        <input type="image" src="https://www.jejusi.go.kr/images/star/btn/search-typeA.png" class="btn search-edu">
                        <a href="http://localhost:8080/star/edu/insert"><button type="button" class="btn eduIns">등록</button></a>
                	</div>
                </div>
	            <c:choose>
	            	<c:when test="${empty map.dtolist }">
	            	등록된 교육이 없습니다.
	            	</c:when>
		            <c:otherwise>
			            <div class="edu-list-detail">
			            	<c:forEach items="${map.dtolist }" var="edu" varStatus="vs">
				                    <div>
				                        <a href="${pageContext }/edu/detail?id=${edu.eduId}">
				                        	<div class="edu-content">
					                            <table style="line-height: 4em; padding-right: 10px;">
					                                <colgroup>
					                                    <col style="width: 33%;">
					                                    <col>
					                                </colgroup>
					                                <thead>
						                                <tr>
						                                    <td class="edu-title" colspan="2"><div>${edu.eduSubject }</div></td>
						                                </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td>진행기간</td>
					                                        <td><div>${edu.eduStart }</div>~<div>${edu.eduEnd }</div></td>
					                                    </tr>
					                                    <tr>
					                                        <td>신청기간</td>
					                                        <td><div>${edu.eduBookStart }</div>~<div>${edu.eduBookEnd }</div></td>
					                                    </tr>
					                                    <tr>
					                                        <td>모집대상</td>
					                                        <td><div>${edu.eduParticipant }</div></td>
					                                    </tr>
					                                </tbody>
					                            </table>
				                        	</div> 
				                        </a>
				                    </div>
			            	</c:forEach>
				        </div>
		            </c:otherwise>
	            </c:choose>
        	</div>
            <div class="edu-paging">
                <ul>
                	<c:if test="${map.startPageNum > 1 }">
                		<li><a href="${pageContext.request.contextPath }/edu/list?edu-name=${ssSearch }&page=${page = 1}"> &lt;&lt;&nbsp;&nbsp; </a></li>
                		<li><a href="${pageContext.request.contextPath }/edu/list?edu-name=${ssSearch }&page=${map.startPageNum-1}"> &lt; </a></li>
                	</c:if>
                	<c:forEach begin="${map.startPageNum }" end="${map.endPageNum }" var="page">
                		<c:if test="${map.currentPageNum == page }">
                			<li><strong>${page }</strong></li>
                		</c:if>
                		<c:if test="${map.currentPageNum != page }">
                			<li><a href="${pageContext.request.contextPath }/edu/list?edu-name=${ssSearch }&page=${page}">${page }</a></li>
                		</c:if>
                	</c:forEach>
                	<c:if test="${map.endPageNum < map.totalPageCount }">
                		<li><a href="${pageContext.request.contextPath }/edu/list?edu-name=${ssSearch }&page=${map.endPageNum + 1 }"> &gt; </a>
                		<li><a href="${pageContext.request.contextPath }/edu/list?edu-name=${ssSearch }&page=${page = map.totalPageCount}"> &nbsp;&nbsp;&gt;&gt; </a>
                	</c:if>
                </ul>
            </div>
        </div>
    </div>
    <div class="wrap-footer">
        <footer>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae voluptatum magni sit officia ad id explicabo adipisci distinctio expedita, voluptas laborum minima labore, animi maxime soluta! Deleniti vel nostrum dicta.
        </footer>
    </div>






















<script>
$(loadedHandler);
function loadedHandler(){
	$(".btn.search-edu").on("click", searchSubjectHandler);
}

function searchSubjectHandler(){
	location.href="${pageContext.request.contextPath}/edu/list?edu-name=" + $("#edu-name").val() ;
}
function searchSubjectEnterHandler(){
	if(window.event.keyCode == 13){
		searchSubjectHandler();
	}
}
</script>
</body>
</html>