<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .wrap-main .edu-list{
            clear: both;
        }
        .wrap-main .edu-list-search{
            background-color: silver;
            padding: 5px 0;
            text-align: center;
            margin-top: 15px;
        }
        .wrap-main .edu-list-detail form{
            display: inline-block;
        }
        .wrap-main .edu-list-detail table{
        	margin: 20px 10px;
        }
        .wrap-main .edu-list-search form{
            display: flex;
            justify-content: center;
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
        .wrap-main .btn.search-edu{
            background-color: transparent;
            border: 0;
            cursor: pointer;
            height: 1.5em;
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
            <div class="edu-list">
                <div class="edu-list-search">
                    <form>
                        <input type="text" name="edu-name" id="edu-name" placeholder="제목 키워드를 입력해주세요">
                        <input type="image" src="https://www.jejusi.go.kr/images/star/btn/search-typeA.png" class="btn search-edu">
                    </form>
                </div>
                <div class="edu-list-detail">
                    <div>
                        <a href="http://localhost:8080/star/edu/detail">
                        	<div class="edu-content">
	                            <table style="line-height: 4em;">
	                                <colgroup>
	                                    <col style="width: 33%;">
	                                    <col>
	                                </colgroup>
	                                <thead>
	                                <tr>
	                                    <td class="edu-title" colspan="2">챌린지 참가 신청</td>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td>진행기간</td>
	                                        <td>2024.03.16</td>
	                                    </tr>
	                                    <tr>
	                                        <td>신청기간</td>
	                                        <td>2024.03.12 ~ 2024.03.14</td>
	                                    </tr>
	                                    <tr>
	                                        <td>모집대상</td>
	                                        <td>초등 5~6학년</td>
	                                    </tr>
	                                </tbody>
	                            </table>
                        	</div> 
                        </a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/star/edu/detail">
                        	<div class="edu-content">
	                            <table style="line-height: 4em;">
	                                <colgroup>
	                                    <col style="width: 33%;">
	                                    <col>
	                                </colgroup>
	                                <thead>
	                                <tr>
	                                    <td class="edu-title" colspan="2">챌린지 참가 신청</td>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td>진행기간</td>
	                                        <td>2024.03.16</td>
	                                    </tr>
	                                    <tr>
	                                        <td>신청기간</td>
	                                        <td>2024.03.12 ~ 2024.03.14</td>
	                                    </tr>
	                                    <tr>
	                                        <td>모집대상</td>
	                                        <td>초등 5~6학년</td>
	                                    </tr>
	                                </tbody>
	                            </table>
                        	</div> 
                        </a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/star/edu/detail">
                        	<div class="edu-content">
	                            <table style="line-height: 4em;">
	                                <colgroup>
	                                    <col style="width: 33%;">
	                                    <col>
	                                </colgroup>
	                                <thead>
	                                <tr>
	                                    <td class="edu-title" colspan="2">챌린지 참가 신청</td>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td>진행기간</td>
	                                        <td>2024.03.16</td>
	                                    </tr>
	                                    <tr>
	                                        <td>신청기간</td>
	                                        <td>2024.03.12 ~ 2024.03.14</td>
	                                    </tr>
	                                    <tr>
	                                        <td>모집대상</td>
	                                        <td>초등 5~6학년</td>
	                                    </tr>
	                                </tbody>
	                            </table>
                        	</div> 
                        </a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/star/edu/detail">
                        	<div class="edu-content">
	                            <table style="line-height: 4em;">
	                                <colgroup>
	                                    <col style="width: 33%;">
	                                    <col>
	                                </colgroup>
	                                <thead>
	                                <tr>
	                                    <td class="edu-title" colspan="2">챌린지 참가 신청</td>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td>진행기간</td>
	                                        <td>2024.03.16</td>
	                                    </tr>
	                                    <tr>
	                                        <td>신청기간</td>
	                                        <td>2024.03.12 ~ 2024.03.14</td>
	                                    </tr>
	                                    <tr>
	                                        <td>모집대상</td>
	                                        <td>초등 5~6학년</td>
	                                    </tr>
	                                </tbody>
	                            </table>
                        	</div> 
                        </a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/star/edu/detail">
                        	<div class="edu-content">
	                            <table style="line-height: 4em;">
	                                <colgroup>
	                                    <col style="width: 33%;">
	                                    <col>
	                                </colgroup>
	                                <thead>
	                                <tr>
	                                    <td class="edu-title" colspan="2">챌린지 참가 신청</td>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td>진행기간</td>
	                                        <td>2024.03.16</td>
	                                    </tr>
	                                    <tr>
	                                        <td>신청기간</td>
	                                        <td>2024.03.12 ~ 2024.03.14</td>
	                                    </tr>
	                                    <tr>
	                                        <td>모집대상</td>
	                                        <td>초등 5~6학년</td>
	                                    </tr>
	                                </tbody>
	                            </table>
                        	</div> 
                        </a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/star/edu/detail">
                        	<div class="edu-content">
	                            <table style="line-height: 4em;">
	                                <colgroup>
	                                    <col style="width: 33%;">
	                                    <col>
	                                </colgroup>
	                                <thead>
	                                <tr>
	                                    <td class="edu-title" colspan="2">챌린지 참가 신청</td>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td>진행기간</td>
	                                        <td>2024.03.16</td>
	                                    </tr>
	                                    <tr>
	                                        <td>신청기간</td>
	                                        <td>2024.03.12 ~ 2024.03.14</td>
	                                    </tr>
	                                    <tr>
	                                        <td>모집대상</td>
	                                        <td>초등 5~6학년</td>
	                                    </tr>
	                                </tbody>
	                            </table>
                        	</div> 
                        </a>
                    </div>
                </div>
                <div class="edu-paging">
                    <ul>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap-footer">
        <footer>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae voluptatum magni sit officia ad id explicabo adipisci distinctio expedita, voluptas laborum minima labore, animi maxime soluta! Deleniti vel nostrum dicta.
        </footer>
    </div>
</body>
</html>