<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/home/join.css" rel="stylesheet">    
<script>
    $(loadedHandler)
    
    function loadedHandler() {
        $("#checkAll").on("click", checkAllHandler);
        $(".check").on("click", checkHandler);
        $(".submit1").on("click", stepForward1Handler);
        $(".id").on("keyup", idAlertHandler);
        $(".pw").on("keyup", pwAlertHandler);
        $(".pw").on("keyup", confpwAlertHandler);
        $(".confpw").on("keyup", confpwAlertHandler);
        $(".step2input").on("focusout", checkStep2);
        $(".submit2").on("click", stepForward2Handler);
        $(".submit3").on("click", stepEndHandler);
    }
    
    //전체 체크시 하위 체크박스 체크 + 버튼 활성화
    function checkAllHandler(){
        if((this.checked)){
            $(this).parent().next().find("input[type=checkbox]").prop('checked', true);
            $(".submit1").prop('disabled', false);
        } else {
            $(this).parent().next().find("input[type=checkbox]").prop('checked', false);
            $(".submit1").prop('disabled', true);
        }
    }
    
    //개별 체크박스 모두 체크시 전체체크박스 체크 + 버튼활성화
    function checkHandler(){
        var checknum = document.querySelectorAll('input.check:checked');
        if(checknum.length == 2){
            $("#checkAll").prop('checked', true);
            $(".submit1").prop('disabled', false);
        } else {
            $("#checkAll").prop('checked', false);
            $(".submit1").prop('disabled', true);
        }
    }
    
    //step1에서 약관 동의 후 버튼 클릭 시 다음스텝으로 넘어가기
    function stepForward1Handler() {
        $(".wrap-step1").css("display", "none");
        $("li.step1").css("border-color", "#ccc")
        $("li.step2").css("border-color", "#503396")
        $(".wrap-step2").css("display", "block");
    }
    
    //ID란이 비어있거나 조건이 맞으면 경고 삭제, 아니면 표시
    var idRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,15}$/;
    function idAlertHandler() {
        if(idRegExp.test($(".id").val())){
            $(".id-alert").css("display", "none");
        } else {
            $(".id-alert").css("display", "block");
        }
    }

     //PW란이 비어있거나 조건이 맞으면 경고 삭제, 아니면 표시
     var pwRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{12,20}$/;
    function pwAlertHandler() {
        if(pwRegExp.test($(".pw").val())){
            $(".pw-alert").css("display", "none");
        } else {
            $(".pw-alert").css("display", "block");
        }
    }
    
    //비밀번호와 비밀번호 확인이 일치하는지 확인하는 함수
    function confpwAlertHandler() {
        if($(".pw").val().trim() == $(".confpw").val().trim()){
            $(".alert2").css("display", "none");
        } else {
            $(".alert2").css("display", "block");    			
        }
    }
    
    //step2의 모든 항목을 조건에 맞게 입력해야 회원가입 버튼 활성화
    function checkStep2() {
        if(($(".name").val().trim().length != 0) &&	
            ($(".id").val().trim().length > 3) &&		
            ($(".pw").val().trim().length > 7) &&		
            ($(".confpw").val().trim().length > 7) &&		
            ($(".mail").val().trim().length != 0) &&
            ($(".address").val().trim().length != 0) &&
            ($(".alert").css("display") == 'none') &&
            ($(".alert2").css("display") == 'none')){
                $(".submit2").prop('disabled', false);
            } else {
                $(".submit2").prop('disabled', true);	
        }
        
    }
    
    //step2에서 step3로 넘어가는 함수
    function stepForward2Handler() {
        $(".wrap-step2").css("display", "none");
        $("li.step2").css("border-color", "#ccc")
        $("li.step3").css("border-color", "#503396")
        $(".wrap-step3").css("display", "block");	
    }
    
    function stepEndHandler(){
        window.close();
    }
</script>
</head>
<body>
    <div class="wrap-signUp">
        <header>
            <div class="top">
                <a href="http://localhost:8080/star/home" target="_blank"></a>
            </div>
        </header>
        <main>
            <div class="step">
                <ul class="stepbar">
                    <li class="step1" >STEP1. 약관동의</li>
                    <li class="step2" >STEP2. 정보입력</li>
                    <li class="step3" >STEP3. 가입완료</li>
                </ul>
            </div>
            <div class="mainbox">
                <div class="wrap-step1">
                    <h1>약관동의 및 정보활용 동의</h1>
                    <p>김서박 사이트 이용을 위한 약관에 동의해주세요.</p>
                    <form>
                        <div class="check checkAll">
                            <input type="checkbox" name="checkAll" id="checkAll"><label for="checkAll"><h2>필수항목 전체동의</h2></label>
                        </div>
                        <div class="terms">
                            <div class="check serviceterm">
                                <input type="checkbox" name="check1" class="check" id="check1"><label for="check1"><h2>서비스 이용 약관 동의</h2></label>
                            </div>
                            <div class="servicelaw">
                                <textarea rows="5" readonly>

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet diam in ligula placerat auctor. Cras vitae cursus est. Proin tincidunt id tortor sit amet ullamcorper. Fusce viverra, lectus sed auctor blandit, metus enim aliquet est, vel laoreet neque enim ut diam. Etiam in odio at ligula molestie tincidunt. Ut at efficitur sapien, et mattis quam. Sed dignissim eleifend justo, quis hendrerit ligula pulvinar vel. Aenean scelerisque sagittis odio ut vulputate.
                                </textarea>
                            </div>
                            <div class="check infoterm">
                                <input type="checkbox" name="check2" class="check" id="check2"><label for="check2"><h2>개인정보 수집 및 이용 동의</h2></label>
                            </div>
                            <textarea rows="5" readonly>
                                    
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet diam in ligula placerat auctor. Cras vitae cursus est. Proin tincidunt id tortor sit amet ullamcorper. Fusce viverra, lectus sed auctor blandit, metus enim aliquet est, vel laoreet neque enim ut diam. Etiam in odio at ligula molestie tincidunt. Ut at efficitur sapien, et mattis quam. Sed dignissim eleifend justo, quis hendrerit ligula pulvinar vel. Aenean scelerisque sagittis odio ut vulputate.
                            </textarea>
                        </div>
                        <div class="subbutton">
                            <button type="button" class="submit1" disabled>확 인</button>
                        </div>
                    </form>

                </div>
                <div class="wrap-step2">
                    <p>&nbsp;회원정보를 입력해주세요.</p>
                    <div class="wrap-form">
                        <form>
                            <table>
                                <colgroup>
                                    <col style="width: 130px">
                                    <col>
                                </colgroup>
                                <tr>
                                    <th>
                                        이름
                                    </th>
                                    <td>
                                        <input type="text" name="name" class="name step2input" placeholder="실명을 입력해주세요">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        아이디
                                    </th>
                                    <td>
                                        <input type="text" name="id" class="id step2input" placeholder="영문, 숫자 조합(4~15자)"><button type="button" class="idcheck" disabled>중복 확인</button>
                                        <div class="alert id-alert">영문, 숫자 조합(4~15자)로 입력해주세요.</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        비밀번호
                                    </th>
                                    <td>
                                        <input type="password" name="pw" class="pw step2input" placeholder="영문, 숫자 조합(12~20자)" autocomplete="off">
                                        <div class="alert pw-alert">영문, 숫자 조합(12~20자)로 입력해주세요.</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        비밀번호 확인
                                    </th>
                                    <td>
                                        <input type="password" name="confpw" class="confpw step2input" autocomplete="off">
                                        <div class="alert2">비밀번호가 일치하지 않습니다.</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        이메일 주소
                                    </th>
                                    <td>
                                        <input type="text" name="mail" class="mail step2input" placeholder="이메일주소를 입력해 주세요">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        주소
                                    </th>
                                    <td>
                                        <input type="text" name="address" class="address step2input" placeholder="주소를 입력해 주세요">
                                    </td>
                                </tr>
                            </table>
                            <div class="subbutton">
                                <button type="button" class="submit2" disabled>회원가입</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="wrap-step3">
                    <i class="icon">

                    </i>
                    <div>
                        회원님의 김서박 가입을 환영합니다.
                    </div>
                    <div>
                        이제부터 김서박에서 제공하는 다양한 기능을 이용하실 수 있습니다.
                    </div>
                    <div class="subbutton">
                        <button type="button" class="submit3">홈으로 이동</button>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>