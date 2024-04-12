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
<script>
$(loadedHandler)

	function loadedHandler() {
			$(".checkpw").on("click", sendPwdHandler);
			$(".change").on("click", changeInfoHandler);
	}	
	
	function sendPwdHandler() {
		$.ajax({
			url:"${pageContext.request.contextPath}/mypage"			
			, method : "post"
			, data : $(".pwd").serialize()
			, success : function(result){
				if(result != null){
					alert("비밀번호가 일치합니다. 변경하실 정보를 입력해주세요")
					$(".checkpw").prop('disabled', true);
					$(".changeable").prop('disabled', false);
					$(".change").prop('disabled', false);
				} else {
					alert("비밀번호가 맞지 않습니다");
					$("[name=pwd]").val("");
				}
			}
			, error : function(request, status, error) {
				alert("code:"  + request.status + "\n" + "message : "
						+ request.responseText + "\n"
						+"error : " + error);
				}
			})
	}
	
	function changeInfoHandler(){
			$.ajax({
				url:"${pageContext.request.contextPath}/changeinfo"
				, method : "post"
				, data : $("#change-info").serialize()
				, success : function(changeResult){
					if(changeResult > 0){
						alert("개인정보 변경을 성공하였습니다. 다시 로그인해주세요.");
						$(".checkpw").prop('disabled', false);
						$(".changeable").prop('disabled', true);
						$(".change").prop('disabled', true);
						window.close();
					} else {
						alert("서버 오류로 개인정보 변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
					}
				}
				, error : function(request, status, error) {
					alert("code:"  + request.status + "\n" + "message : "
							+ request.responseText + "\n"
							+"error : " + error);
				}
			})
		}
</script>    
</head>
<body>
    <div class="wrap-mypage">
        <form id="change-info">
            <table>
                <tr>
                    <td>
                        이름        
                    </td>
                    <td>
                        <input type="text" name="name" class="name" value="${ssslogin.mem_name}" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        아이디        
                    </td>
                    <td>
                        <input type="text" name="id" class="changeable id" value="${ssslogin.mem_id}" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        비밀번호      
                    </td>
                    <td>
                        <input type="password" name="pwd" class="changeable pwd">
                    </td>
                </tr>
                <tr>
                    <td>
                        E-mail    
                    </td>
                    <td>
                        <input type="text" name="email" class="changeable email" value="${ssslogin.mem_email}" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        주소    
                    </td>
                    <td>
                        <input type="text" name="address" class="changeable address" value="${ssslogin.mem_address}" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        회원 등급       
                    </td>
                    <td>
                        <input type="text" name="member_admin" class="member_admin" value="${ssslogin.mem_admin}" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" name="checkpw" class="checkpw">정보 수정</button>
                    </td>
                    <td>
                        <button type="button" name="change-Info" class="change" disabled>정보 수정</button>
                    </td>
                </tr>
       		</table>
       </form>
    </div>
</body>
</html>