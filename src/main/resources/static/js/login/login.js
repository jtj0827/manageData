let errorCount = 0;

const login = function() {
    const id = document.querySelector("[name=id]");
    const password = document.querySelector("[name=password]");
    if (!blankCheck(id.value)) {
        alert("아이디를 입력 해주세요.");
        id.focus();
        return false;
    }
    if (!password.value) {
        alert("비밀번호를 입력해주세요.");
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
                location.href = "/servermng/list";
            } else if (json[AJAX_RESULT_TEXT] == AJAX_RESULT_NODATA) {
                alert("아이디 또는 비밀번호가 틀렸습니다.");
            } else if (json[AJAX_RESULT_TEXT] == AJAX_RESULT_ILLEGAL_PERMIT) {
                alert("접근이 불가능한 IP 입니다.\n관리자에게 문의하세요.");
            } else{
                alert("로그인 중 일시적인 오류가 발생하였습니다.\n잠시 후 다시 시도해 주세요.");                  /*로그인 중 일시적인 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요*/
            }
         })
        .catch(function(err){
            alert("로그인 중 알 수 없는 오류가 발생하였습니다.\n관리자에게 문의하세요.");
        })
}

