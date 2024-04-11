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
    <style>
        .wrap-main
        , .wrap-footer{
            margin: 10px auto;
            width: 1100px;
            height: fit-content;
        }
        .wrap-main ul{
            text-align: center;
        }
        .wrap-main li{
            list-style-type: none;
            display: inline-block;
        }
        .wrap-main li > a{
            text-decoration: none;
        }
        .wrap-main .content{
            overflow: hidden;
        }
        .wrap-main .content > a{
            text-align: center;
		    display: inline-block;
		    float: left;
		    width: 50%;
        }
        .wrap-main .home-menu{
            display: flex;
            float: right;
            align-items: center;
            margin: 10px 0;
        }
        .wrap-main hr{
            clear: both;
        }










        .wrap-main .home-menu img{
            width: 1em;
			height: 1em;
            background-color: white;
        }
        .wrap-main .edu-list{
            clear: both;
        }
        .wrap-main .edu-list-search{
            background-color: silver;
            padding: 5px 0;
            text-align: center;
            margin-top: 15px;
        }
        .wrap-main .edu-list-search a{
        	color: black;
        	cursor: pointer;
        	position: absolute;
		    right: 10px;
		    top: 8.38px;
        }
        .wrap-main .edu-list-search>div{
            display: inline-block;
        }
        .wrap-main .edu-list-detail table{
        	margin: 20px 10px;
        }
        .wrap-main .edu-list-search>div{
            display: flex;
            justify-content: center;
            position: relative;
        }
        .wrap-main .edu-list-search input[type=text]{
            width: 200px;
        }
        .wrap-main #edu-name{
        	color: black;
        }
        .wrap-main .edu-list-search input[type=image]{
            height: 100%;
        }
        .wrap-main .btn.eduIns{
            cursor: pointer;
            color: black;
        }
        .wrap-main div.edu-list-detail{
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            column-gap: 10px;
            row-gap: 10px;
        }
        .wrap-main .edu-list-detail > div{
            width: 29%;
            height: auto;
            border: 1px solid white;
    		margin: 10px 20px;
    		box-sizing: border-box;
        }
        .wrap-main .edu-paging{
        	line-height: 3em;
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
                        <input type="text" name="edu-name" id="edu-name" placeholder="제목 키워드를 입력해주세요">
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
				                            <table style="line-height: 4em;">
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
				                                        <td><div>${edu.eduPeriod }</div></td>
				                                    </tr>
				                                    <tr>
				                                        <td>신청기간</td>
				                                        <td><div>${edu.eduBookPeriod }</div></td>
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
                		<li><a href="${pageContext.request.contextPath }/edu/list?page=${map.startPageNum-1}"> &lt; </a></li>
                	</c:if>
                	<c:forEach begin="${map.startPageNum }" end="${map.endPageNum }" var="page">
                		<c:if test="${map.currentPageNum == page }">
                			<li><strong>${page }</strong></li>
                		</c:if>
                		<c:if test="${map.currentPageNum != page }">
                			<li><a href="${pageContext.request.contextPath }/edu/list?page=${page}">${page }</a></li>
                		</c:if>
                	</c:forEach>
                	<c:if test="${map.endPageNum < map.totalPageCount }">
                		<li><a href="${pageContext.request.contextPath }/edu/list?page=${map.endPageNum + 1 }"> &gt; </a>
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
/* $(loadedHandler);
function loadedHandler(){
	$(".btn.eduIns").on("click", searchSubjectHandler);
}
function searchSubjectHandler(){
	$.ajax({
		url : "${pageContext.request.contextPath}/edu/list"
		, method : get
		, data : $(".edu-name").serialize()
		, success : function(result){
			if(result == 1){
				location.href="${pageContext.request.contextPath}/edu/list?edu-name=${eduSubject}";
			}
		}
		, error : function(request, status, error){
			alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n"
					+ "error : " + error);
	});
} */
</script>
</body>
</html>