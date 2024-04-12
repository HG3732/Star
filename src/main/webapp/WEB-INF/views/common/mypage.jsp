<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/common/mypage.css" rel="stylesheet">
</head>
<body>
    <div class="wrap-mypage">
        <form>
            <table>
                <tr>
                    <td>
                        이름        
                    </td>
                    <td>
                        <input type="text" name="name" class="changeable name" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        아이디        
                    </td>
                    <td>
                        <input type="text" name="id" class="id" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        비밀번호      
                    </td>
                    <td>
                        <input type="text" name="pwd" class="pwd" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        E-mail    
                    </td>
                    <td>
                        <input type="text" name="email" class="changeable email" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        회원 등급       
                    </td>
                    <td>
                        <input type="text" name="member_admin" class="member_admin" disabled>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="button" name="changInfo">정보 수정</button>
                    </td>
                </tr>
            </form>
        </table>
    </div>
</body>
</html>