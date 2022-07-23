const alertTxt = document.querySelector("[name=\"serverIdx\"]") != undefined ? "수정" : "등록";

window.onload = new function() {
    setCalendar("calendar", 10);
}

const saveConfirm = () => {
    if (!confirm(`${alertTxt} 하시겠습니까?`)) { return false; }
    if (!blankCheckRequiredValue()) { return false; }

    // LINE :: 스토리지 정보 저장 처리를 위한 list 처리
    const target = document.querySelector("#common_tempArea");
    const storageListTr = document.querySelectorAll("#storageList tr");

    target.innerHTML = "";
    for(let i = 0; i < storageListTr.length; i++){
        target.innerHTML += `<input type="hidden" name="storageList[${i}].gubun" value="${storageListTr[i].querySelector("[name=gubun]").value}">`;
        target.innerHTML += `<input type="hidden" name="storageList[${i}].capacity" value="${storageListTr[i].querySelector("[name=capacity]").value}">`;
        target.innerHTML += `<input type="hidden" name="storageList[${i}].inch" value="${storageListTr[i].querySelector("[name=inch]").value}">`;
        target.innerHTML += `<input type="hidden" name="storageList[${i}].storageDate" value="${storageListTr[i].querySelector("[name=storageDate]").value}">`;
    }


    //showProgress( save );
    save();
}

/**
 * FUCNTION :: 서버정보 등록
 */
const save = () => {
    let httpCode = AJAX_RESULT_FAIL;
    let idx = 0;
    const formData = new FormData( document.getElementById("saveForm") );

    fetch("/servermng", { method : "POST",  body : formData })
        .then(res => res.json())
        .then(json => {
            httpCode = json[AJAX_RESULT_TEXT];

            if (httpCode == AJAX_RESULT_SUCCESS) {
                idx = json["idx"];

                alert(`${alertTxt} 되었습니다.`);
                location.href = `view?serverIdx=${idx}`;
            }else if(httpCode == AJAX_RESULT_DUPLICATE){
                alert(`등록된 서버명칭 입니다. 다시 확인후 ${alertTxt}하세요.`);

            } else {
                alert(`${alertTxt} 처리 중 오류가 발생하여 ${alertTxt}되지 않았습니다.\n관리자에게 문의해주세요.`);
            }
        })
        .catch(err => {
            alert(`서버상의 오류로 ${alertTxt}되지 않았습니다.\n관리자에게 문의해주세요.`);
        });
}

/**
 * FUNCTION :: 필수값 유효성 검사
 * @returns {boolean}
 */
const blankCheckRequiredValue = () => {
    const name = document.querySelector('[name=name]');
    const receiveingDate = document.querySelector('[name=receivingDate]');
    const cpu = document.querySelector('[name=cpu]');
    const ram = document.querySelector('[name=ram]');
    const hdd = document.querySelector('[name=hdd]');
    const osCode = document.querySelector('[name=osCode]');
    const osId = document.querySelector('[name=osId]');
    const osPwd = document.querySelector('[name=osPwd]');

    if(!blankCheck(name.value)){
        alert("서버명칭을 입력해주세요.");
        name.focus();
        return false;
    }
    if(!blankCheck(receiveingDate.value)){
        alert("입고일을 입력해주세요.");
        receiveingDate.focus();
        return false;
    }
    if(!blankCheck(cpu.value)){
        alert("CPU를 입력해주세요.");
        cpu.focus();
        return false;
    }
    if(!blankCheck(ram.value)){
        alert("RAM을 입력해주세요.");
        ram.focus();
        return false;
    }
    if(!blankCheck(hdd.value)){
        alert("HDD를 입력해주세요.");
        hdd.focus();
        return false;
    }
    if(!blankCheck(osCode.value)){
        alert("OS 종류를 입력해주세요.");
        osCode.focus();
        return false;
    }
    if(!blankCheck(osId.value)){
        alert("운영체제 아이디를 입력해주세요.");
        osCode.focus();
        return false;
    }
    if(!blankCheck(osPwd.value)){
        alert("운영체제 비밀번호를 입력해주세요.");
        osCode.focus();
        return false;
    }

    return true;

}

/**
 * FUNCTION :: 스토리지 행 추가
 */
const addStorageLine = () => {
    const storageCapacity = document.querySelectorAll(`#storageList [name=capacity]`);                     // LINE :: storage 용량
    const storageGubun = document.querySelectorAll(`#storageList [name=gubun] option:checked`);            // LINE :: storage 구분
    const storageInch = document.querySelectorAll(`#storageList [name=inch] option:checked`);              // LINE :: storage 인치
    const storageDate = document.querySelectorAll(`#storageList [name=storageDate]`);                      // LINE :: storage 날짜
    const target = document.getElementById(`storageList`);

    let temp = ``;
    target.innerHTML = temp;
    for(let i = 0; i < storageCapacity.length; i++){
        temp += `<tr>`;
        temp += `    <td class="a_center bd-n">`;
        temp += `        <select name="gubun" class="wp100">`;
        temp += `            <option value="H" ${storageGubun[i].value == 'H' ? 'selected' : ''}>SATA</option>`;
        temp += `            <option value="S" ${storageGubun[i].value == 'S' ? 'selected' : ''}>SSD</option>`;
        temp += `            <option value="A" ${storageGubun[i].value == 'A' ? 'selected' : ''}>SAS</option>`;
        temp += `        </select>`;
        temp += `    </td>`;
        temp += `    <td class="a_center bd-n">`;
        temp += `        <input type="text" name="capacity" class="default-input wp100" value="${storageCapacity[i].value}">`;
        temp += `    </td>`;
        temp += `    <td class="a_center bd-n">`;
        temp += `        <select name="inch" class="wp100">`;
        temp += `            <option value="2.5" ${storageInch[i].value == '2.5' ? 'selected' : ''}>2.5인치</option>`;
        temp += `            <option value="3.5" ${storageInch[i].value == '3.5' ? 'selected' : ''}>3.5인치</option>`;
        temp += `            <option value="0.0" ${storageInch[i].value == '0.0' ? 'selected' : ''}>확인 요망</option>`;
        temp += `        </select>`;
        temp += `    </td>`;
        temp += `    <td class="a_center bd-n">`;
        temp += `        <input type="text" name="storageDate" class="default-input calendar" value="${storageDate[i].value}"readonly>`;
        temp += `    </td>`;
        temp += `    <td class="a_center bd-n">`;
        temp += `        <input type="button" class="mViewBtn_permit dis_b" value="-" style="color:#e74701; width: 30px; margin: 0 auto;" onclick="removeStorage(this)">`;
        temp += `    </td>`;
        temp += `</tr>`;
    }
    temp += `<tr>`;
    temp += `    <td class="a_center bd-n">`;
    temp += `        <select name="gubun" class="wp100">`;
    temp += `            <option value="H">SATA</option>`;
    temp += `            <option value="S">SSD</option>`;
    temp += `            <option value="A">SAS</option>`;
    temp += `        </select>`;
    temp += `    </td>`;
    temp += `    <td class="a_center bd-n">`;
    temp += `        <input type="text" name="capacity" class="default-input wp100">`;
    temp += `    </td>`;
    temp += `    <td class="a_center bd-n">`;
    temp += `        <select name="inch" class="wp100">`;
    temp += `            <option value="2.5">2.5인치</option>`;
    temp += `            <option value="3.5">3.5인치</option>`;
    temp += `            <option value="0.0">확인요망</option>`;
    temp += `        </select>`;
    temp += `    </td>`;
    temp += `    <td class="a_center bd-n">`;
    temp += `        <input type="text" name="storageDate" class="default-input calendar" readonly>`;
    temp += `    </td>`;
    temp += `    <td class="a_center bd-n">`;
    temp += `        <input type="button" class="mViewBtn_permit dis_b" value="-" style="color:#e74701; width: 30px; margin: 0 auto" onclick="removeStorage(this)">`;
    temp += `    </td>`;
    temp += `</tr>`;
    target.innerHTML += temp;

    setCalendar("calendar", 10);
}

/**
 * FUNCTION :: Storage행 삭제
 * @param element
 */
const removeStorage = element => {
    element.parentElement.parentElement.remove();
}