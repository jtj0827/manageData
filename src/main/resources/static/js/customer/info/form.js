const alertTxt = document.querySelector("[name=\"idx\"]") != undefined ? "수정" : "등록";

/**
 * FUNCTION :: Email 도메인 변경
 * @param obj
 */
const changeEmailSelect = (obj) => {
    const value = obj.value;
    const targetId = obj.dataset.target;

    // LINE :: 선택된 값이 공백 (직접입력)인 경우
    if (!value) {
        document.getElementById(targetId).removeAttribute("readonly");
        document.getElementById(targetId).value = "";
    } else {    // LINE :: 선택된 값이 공백 (직접입력)이 아닌 경우
        document.getElementById(targetId).setAttribute("readonly", "true");
        document.getElementById(targetId).value = value;
    }
}

/**
 * FUNCTION :: 담당부서 선택
 * @param obj
 * @param targetId
 */
const selectDepartmentChargeCode = (obj, targetId) => {
    const target = document.querySelector('#'+targetId);
    let optionHtml = '<option value="">선택</option>';
    if(obj.value == ""){
        // LINE :: 담당부서 값이 없을경우 담당자명 옵션을 비워주고 리턴
        target.innerHTML = optionHtml;
        return;
    }

    fetch("/customer-info/contact-info?code="+obj.value, { method : "GET"})
        .then(res => res.json())
        .then(json => {
            let httpCode = json[AJAX_RESULT_TEXT];
            const contactData = json['contactList'];
            if (httpCode == AJAX_RESULT_SUCCESS) {
                for(let contact of contactData){
                    optionHtml += `<option value="${contact.idx}">${contact.name}</option>`;
                }
                target.innerHTML = optionHtml;
            } else {
                alert('서버와의 통신중 오류가 발생하였습니다.\n관리자에게 문의해주세요.');
            }
        })
        .catch(err => {
            alert('서버와의 통신중 오류가 발생하였습니다.\n관리자에게 문의해주세요.');
        });
}

/**
 * FUNCTION :: 등록/수정 요청 (유효성검사 진행)
 * @returns {boolean}
 */
const saveConfirm = () => {
    if (!blankCheckRequiredValue()) { return false; }
    if (!confirm(`${alertTxt} 하시겠습니까?`)) { return false; }
    save();
}

/**
 * FUNCTION :: 필수값 유효성 검사
 * @returns {boolean}
 */
const blankCheckRequiredValue = () => {
    const customerName = document.querySelector('[name=customerName]');
    const inflowPathCode = document.querySelector('[name=inflowPathCode]');
    const phoneNum = document.querySelector('[name=phoneNum]');
    const phoneNum1 = document.querySelector('#phoneNum1');
    const phoneNum2 = document.querySelector('#phoneNum2');
    const phoneNum3 = document.querySelector('#phoneNum3');
    const email = document.querySelector('[name=email]');
    const email1 = document.querySelector('#email1');
    const email2 = document.querySelector('#email2');

    if(!blankCheck(customerName.value)){
        alert("고객명을 입력해주세요.");
        customerName.focus();
        return false;
    }

    if(!blankCheck(inflowPathCode.value)){
        alert("유입경로를 입력해주세요.");
        inflowPathCode.focus();
        return false;
    }


    if(!blankCheck(phoneNum1.value) || !blankCheck(phoneNum2.value) || !blankCheck(phoneNum3.value)){
        alert("고객 핸드폰번호를 입력해주세요.");
        phoneNum2.focus();
        return false;
    } else {
        const phoneNumber = [phoneNum1.value, phoneNum2.value, phoneNum3.value].join("-");
        if(!phoneCheck(phoneNumber)){
            alert("고객 핸드폰번호 형식을 확인해주세요.");
            phoneNum2.focus();
            return false;
        }
        phoneNum.value = phoneNumber;
    }

    if (!blankCheck(email1.value) || !blankCheck(email2.value)) {
        alert("고객 이메일을 입력해주세요.");
        email1.focus();
        return false;
    } else {
        const tempEmail = [email1.value, email2.value].join("@");
        if(!emailCheck(tempEmail)){
            alert("고객 이메일 형식을 확인해주세요.");
            email1.focus();
            return false;
        } else if (upperCasePattern.test(tempEmail)){
            alert("고객 이메일은 대문자 입력이 불가능합니다.")
            email1.focus();
            return false;
        }
        email.value = tempEmail;
    }

    return true;

}

/**
 * FUCNTION :: 고객정보 등록
 */
const save = () => {
    const autoCommaInput = document.querySelectorAll(".autoComma");
    for (let i = 0; i < autoCommaInput.length; i++) {
        autoCommaInput[i].value = autoCommaInput[i].value.replace(/,/gi, "");
    }

    let httpCode = AJAX_RESULT_FAIL;
    let idx = 0;
    const formData = new FormData( document.getElementById("saveForm") );

    fetch("/customer-info", { method : "POST",  body : formData })
        .then(res => res.json())
        .then(json => {
            httpCode = json[AJAX_RESULT_TEXT];

            if (httpCode == AJAX_RESULT_SUCCESS) {
                idx = json["idx"];

                alert(`${alertTxt} 되었습니다.`);
                location.href = `view?idx=${idx}`;
            } else {
                alert(`${alertTxt} 처리 중 오류가 발생하여 ${alertTxt}되지 않았습니다.\n관리자에게 문의해주세요.`);
            }
        })
        .catch(err => {
            alert(`서버상의 오류로 ${alertTxt}되지 않았습니다.\n관리자에게 문의해주세요.`);
        });
}