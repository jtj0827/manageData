let errorCount = 0;

window.onload = function () {
    // 쿠키에 있는 값 확인
    var centercontrolLanguage = getCookie("centercontrolLanguage");
    // 값이 없으면 클라이언트 언어 정보를 쿠키에 담아줌.
    if (centercontrolLanguage == "") {
        setCookie("centercontrolLanguage", "vn", 365);
        centercontrolLanguage = "vn";
    }
    //언어 쿠키값 설정
    if (centercontrolLanguage != "") {
        $("#user_language").val(centercontrolLanguage).attr("selected", "selected");
        var lang = $("#user_language").val();
        if (lang == undefined || lang == "") {
        } else {
            _t.lang(lang);
            setCookie("centercontrolLanguage", centercontrolLanguage, 365);
        }
    }
}

const login = function() {
    const id = document.querySelector("[name=id]");
    const password = document.querySelector("[name=password]");
    if (!blankCheck(id.value)) {
        alert(_t.get("TR_LOGIN_IDEMPTY"));  /*아이디를 입력 해주세요.*/
        id.focus();
        return false;
    }
    if (!password.value) {
        alert(_t.get("TR_LOGIN_PWEMPTY"));  /*비밀번호를 입력해주세요.*/
        password.focus();
        return false;
    }

    var formData = new FormData(document.getElementById("login_form"));
    fetch("/login/request", { method:"POST",  body: formData })
        .then(function (res) {
                return res.json();
        })
        .then(function(json){
            if (json[AJAX_RESULT_TEXT] == AJAX_RESULT_SUCCESS) {
                location.href = "/customerService/board/notice/list";
            } else if (json[AJAX_RESULT_TEXT] == AJAX_RESULT_NODATA) {
                alert(_t.get("TR_LOGIN_ERR_WRONG_DATA"));       /*아이디 또는 비밀번호가 틀렸습니다.*/
            } else if (json[AJAX_RESULT_TEXT] == AJAX_RESULT_ILLEGAL_PERMIT) {
                alert(_t.get("TR_LOGIN_NO_PERMIT"));            /*접근이 불가능한 IP 입니다.\n관리자에게 문의하세요.*/
            } else{
                alert(_t.get("TR_LOGIN_ERR"));                  /*로그인 중 일시적인 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요*/
            }
         })
        .catch(function(err){
            if (errorCount < 3) {
                errorCount++; login();
            } else {
                errorCount = 0;
                alert(_t.get("TR_LOGIN_UNKNOWN_ERR"));          /*로그인 중 알 수 없는 오류가 발생하였습니다.관리자에게 문의하세요.*/
            }
        })
}

