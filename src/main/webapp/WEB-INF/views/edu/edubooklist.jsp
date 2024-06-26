<%@page import="education.model.dto.EduBookDto"%>
<%@page import="java.util.List"%>
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
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
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
        .wrap-main .content > a {
            float: left;
            width: 50%;
            box-sizing: border-box;
            cursor: pointer;
            text-align: center;
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










        .wrap-main .edu-book-list{
            height: fit-content;
        }
        .wrap-main #calendar{
            margin: 20px auto;
        }
        .wrap-main #calendar a{
            cursor: pointer;
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
        <div>

        </div>
        <div class="content">
            <a href="http://localhost:8080/star/edu/list"><h3>교육 목록</h3></a>
            <a href="http://localhost:8080/star/edu/book/list"><h3>교육 예약 현황</h3></a>
            <div class="home-menu">
                <a href="#"><img src="https://www.jejusi.go.kr/images/star/icon/home_icon01.png"></a>
                <div> &nbsp; | 행사 및 교육 | 행사 및 교육신청</div>
            </div>
            <hr>
            <div class="edu-book-list">
                <div id="calendar" style="width: 900px; height: 740px;"></div>
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
            $("label.edu-list").on("click", eduListClkHandler);
            $("label.edu-book-list").on("click", eduBookListClkHandler);
        }
        function eduListClkHandler(){
            $("div.edu.list").show();
            $("div.edu.book-list").hide();
        }
        function eduBookListClkHandler(){
            $("div.edu.list").hide();
            $("div.edu.book-list").show();
        }




        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
                headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next'
                },
                selectable: true,
                selectMirror: true,
                navLinks: false,
                editable: false,
                dayMaxEvents: false,
                events: [
                	<%
                		List<EduBookDto> eduBookList = (List<EduBookDto>)request.getAttribute("eduBook");
                		for(EduBookDto dto : eduBookList){
                	%>
                	{
                		color: 'transparent'
                		, title: '<%=dto.getEduPartSchool()%>'
                		, start: '2024-04-10'
                	},
                	<%
            			}
                	%>
                ]
            });
            calendar.render();
        });
    




    </script>
</body>
</html>