<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board View</title>
<script src="https:/code.jquery.com/jquery-3.7.1.js"></script>
    <link href="${pageContext.request.contextPath}/resource/css/board_reset.css"rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/board_core.css"rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/board_view.css"rel="stylesheet">
</head>

<body>
	<div class="wrap-header">
		<header> </header>
	</div>
	<div class="wrap-main">
		<div class="container">
			<div class="flexnav">
				<a href="${pageContext.request.contextPath}/community" class="flex community">게시판</a>
                <a href="${pageContext.request.contextPath}/faq" class="flex faq">FAQ</a>
			</div>
			<div class="location">
				<div class="location notice">
					<span>게시판</span>
				</div>
				<div class="location community">
					<span>커뮤니티 > </span>
				</div>
				<div class="location main">
					<span>메인이미지 > </span>
				</div>
			</div>
			<div class="subject">
				<div>게시판</div>
			</div>
			<div class="contents">
				<div class="board-view">
					<div class="view-header">
						<div class="title">
							<strong>제목 내용..</strong>
						</div>
						<div class="info">
							<dl>
								<dt>작성자</dt>
								<dd>memId</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>YYYY-MM-DD</dd>
							</dl>
							<dl>
								<dt>조회수</dt>
								<dd>123</dd>
							</dl>
						</div>
						<div class="file">
							<dl>
								<dt>첨부파일</dt>
								<dd>
									<ul>
										<li>파일명..... <a href="#">다운로드</a>
										</li>
									</ul>
								</dd>
							</dl>
						</div>
					</div>
					<div class="view-content">
						<div class="memo">글 내용 Lorem ipsum dolor sit amet
							consectetur adipisicing elit. Voluptatem sapiente voluptates a
							explicabo doloribus fuga dolore odio fugiat fugit dolor nulla
							officiis cupiditate neque impedit accusantium reiciendis,
							eligendi eius rem.</div>
					</div>
					<div class="view-btn">
						<button type="button" class="lsit-btn"
							onclick="location.href='/semi/views/board_community.html'">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<footer> </footer>
	</div>
</body>

</html>