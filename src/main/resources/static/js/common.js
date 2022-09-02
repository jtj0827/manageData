const AJAX_RESULT_TEXT = "httpCode"
const AJAX_RESULT_SUCCESS = '200';
const AJAX_RESULT_NO_CONTENT = "204";
const AJAX_RESULT_ILLEGAL_STATE = '401';
const AJAX_RESULT_DUPLICATE = '300';
const AJAX_RESULT_NODATA = '400';
const AJAX_RESULT_FAIL = '500';
const AJAX_RESULT_ALREADY = '600';
const AJAX_RESULT_OVERFLOW = "999";
const AJAX_RESULT_ILLEGAL_PERMIT = "406";
/**
 * Created by kw on 2017-03-16.
 */

const regexp = /^[0-9]*$/	// 숫자 정규식
const regNotNum = /[^0-9]/g;
const regDomain = /^([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*/i;
const regPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}$/;
const reqKo = /^[ㄱ-ㅎ가-힣()&]*$;/;
const reqNameBlank = /^[가-힣a-zA-Z-()&\s]*$/;
const reqName = /^[가-힣a-zA-Z-()&]+$/;
const regIp = /^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/;

const regAgencyName = /^[가-힣a-zA-Z-&()0-9]+$/;
const regId = /^[A-za-z0-9]{5,12}/;

const mailTester = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,5}$/i;
const pwdPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
const floatPattern = /^([0-9]*)[\.]?([0-9])?$/;
const reqSubDomain = /^[a-zA-Z0-9]*$/;

const upperCasePattern = /(?=.*[A-Z])/;

const regUrl = /(http(s)?:\/\/)([a-z0-9\w]+\.*)+[a-z0-9]{2,4}/gi;
const regVersion = /^(?:(\d+)\.)?(?:(\d+)\.)?(\*|\d+)$/;
const floatingIpCheck = /^([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])((\.[0-9]|\.[1-9][0-9]|\.1[0-9]{2}|\.2[0-4][0-9]|\.25[0-5]|\.$){0,3})?$/;

window.onload = new function () {
    // LINE :: 숫자만 입력 가능한 항목 문자 입력시 replace 처리
    const onlynumberInput = document.querySelectorAll(".onlynumber");
    for (let i = 0; i < onlynumberInput.length; i++) {
        onlynumberInput[i].addEventListener("keyup", () => {
            onlynumberInput[i].value = onlynumberInput[i].value.replace(regNotNum, '');
        });
    }

    // LINE :: 숫자 항목 Input 입력 시 천단위 콤마 처리
    const autoCommaInput = document.querySelectorAll(".autoComma");
    for (let i = 0; i < autoCommaInput.length; i++) {
        autoCommaInput[i].addEventListener("keyup", () => {
            autoCommaInput[i].value = numberWithCommas(autoCommaInput[i].value);
        });
    }

    // LINE :: 페이지 최초 로딩 시 숫자 항목 Input 천단위 콤마 처리
    for (let i = 0; i < autoCommaInput.length; i++) {
        autoCommaInput[i].value = numberWithCommas(autoCommaInput[i].value);
    }
}

/**
 * FUNCTION :: 검색 공통 함수
 */
const search = () => {
    const searchForm = document.getElementById("searchForm");
    const targetInputs = document.querySelectorAll("#searchForm input[type=text]");

    // LINE :: input[type=text] 공백 제거
    for (var i = 0; i < targetInputs.length; i++) {
        // LINE :: blankUse 클래스를 가지고 있는 요소는 제외
        if (!targetInputs[i].classList.contains("blankUse")) {
            targetInputs[i].value = targetInputs[i].value.trim();
        }
    }
    searchForm.submit();
}

/**
 * FUNCTION :: 페이지 이동 공통 함수
 * @param pageNo
 */
const goPage = (pageNo) => {
    const pageForm = document.getElementById("pageForm");
    document.querySelector("#pageForm [name=pageNo]").value = pageNo;
    pageForm.submit();
}
/**
 * FUNCTION :: 페이지 정렬기준 변경
 * @param pageNo
 */
const sortByChange = (sortBy) => {
    const pageForm = document.getElementById("pageForm");
    const sort = document.querySelector("#pageForm [name=sortBy]");
    if(sort.value == sortBy){
        sort.value="";
    }else{
        document.querySelector("#pageForm [name=sortBy]").value = sortBy;
    }
    document.querySelector("#pageForm [name=pageNo]").value = 1;
    pageForm.submit();
}

/**
 * FUNCTION :: 페이지 사이즈 변경 공통 함수
 */
const setPageSize = () => {
    const pageForm = document.getElementById("pageForm");
    let pageSize = document.getElementById("pageSizeSelect").value;
    document.querySelector("#pageForm [name=pageSize]").value = pageSize;
    document.querySelector("#pageForm [name=pageNo]").value = 1;
    pageForm.submit();
}

const moveView = (idx, columnName) => {
    sessionStorage.setItem("temp_uri", location.href);
    location.href = `view?${columnName}=${idx}`;
}

/**
 * FUNCTION :: 목록페이지 이동 공통 함수
 */
const moveList = () => {
    if (sessionStorage.getItem("temp_uri") != undefined) {
        const tempUri = sessionStorage.getItem("temp_uri")
        const indexOfSlash =  tempUri.lastIndexOf('/');
        sessionStorage.removeItem("temp_uri");
        // LINE :: 같은 Path 내에서 이동 했을 시
        if (location.href.startsWith(tempUri.substr(0,indexOfSlash))) {
            location.href = tempUri;
        // LINE :: 다른 Path로 이동 했을 시
        } else {
            location.href = 'list'
        }
    } else {
        location.href = "list";
    }
}



/**
 * FUNCTION :: 날짜 형식 변환
 * @param dateValue
 * @param gubun full - 년도 4자리, simple - 년도 2자리
 */
const getDate = (dateValue, gubun) => {
    var date = new Date(dateValue);

    var year = date.getFullYear();

    if (gubun === 'simple') {
        year = year.substr(2);
    }

    var month = (date.getMonth() + 1);
    month = month >= 10 ? month : '0' + month;

    var day = date.getDate();
    day = day >= 10 ? day : '0' + day;

    return year + '-' + month + '-' + day;
}

/**
 * FUNCTION :: 전체 체크박스 체크 여부
 */
function allCheck() {
    var checkIdx = document.getElementsByClassName('checkIdx');  // LINE :: 개별 체크박스
    var isAllChk = document.getElementById('allChk');             // LINE :: 전체 체크박스
    // LINE :: 전체 체크박스 체크 여부에 따라 개별 체크박스 체크 여부 제어
    for (var i = 0; i < checkIdx.length; i++) {
        checkIdx.item(i).checked = isAllChk.checked;
    }
}

/**
 * FUNCTION :: 개별 체크박스 체크로 전체 체크박스 제어
 */
function singleCheck() {
    var checkIdx = document.getElementsByClassName('checkIdx'); // LINE :: 개별 체크박스
    var allChk = document.getElementById('allChk');              // LINE :: 전체 체크박스
    var isAllChk = true;    // LINE :: 전체 체크박스 체크 여부
    // LINE :: 개별 체크박스 체크 여부 확인하여 1개라도 미체크시 전체 체크박스 체크 해제
    for (var i = 0; i < checkIdx.length; i++) {
        if (!checkIdx.item(i).checked) {
            isAllChk = false;
            break;
        }
    }
    allChk.checked = isAllChk;
}

const ipCheck = (ipAddr) => {
    var ipTester = /^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/[\w\\.\-]+)?/;
    if (ipTester.test(ipAddr) && ipAddr.indexOf("0.") != 0) {
        return true;
    }
}

const phoneCheck = (phoneNumber) => {
    var phoneTester = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
    if (phoneTester.test(phoneNumber)) {
        return true;
    } else {
        return false;
    }
}

const emailCheck = (email) => {
    var mailTester = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,5}$/i;
    if (mailTester.test(email)) {
        return true;
    } else {
        return false;
    }
}

const domainCheck = (domain) => {
    var domainTester = /^([0-9a-zA-Z\-]*\*?)*\.*[a-zA-Z]{0,10}(\:[0-9]+)*(\/\S*)*/;
    if (domainTester.test(domain)) {
        return true;
    } else {
        return false;
    }
}

const blankCheck = (val) => {
    if (val.trim() != null && val.trim() != "") {
        return true;
    } else {
        return false;
    }
}

const addComma = (val) => {
    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

const fileCheck = (val) => {
    let fileType = val.value.substring(val.value.lastIndexOf('\.') + 1, val.value.length).toLowerCase();
    const extArr = ['png', 'gif', 'jpg', 'jpeg', 'bmp', 'jfif', 'pdf'];
    return extArr.indexOf(fileType) > -1;
}

const fileStorageCheck = (fileVal) => {
    const fileSize = fileVal.files[0].size;
    var maxSize = 10 * 1024 * 1024;
    return fileSize < maxSize;
}

/**
 * FUNCTION :: 주소검색 팝업
 */
const openAddrPopup = (gubun) => {
    new daum.Postcode({
        oncomplete: function (data) {
            if (!data.jibunAddress) {
                data.jibunAddress = data.autoJibunAddress;
            }
            switch (gubun) {
                case "partner" :
                    document.querySelector("[name=\"partner.zipcode\"]").value = data.zonecode; // LINE :: 우편번호
                    document.querySelector("[name=\"partner.addr\"]").value = `${data.roadAddress} ${data.buildingName ? '(' + data.buildingName + ')' : ''}`; // LINE :: 주소
                    document.querySelector("[name=\"partner.addrDetail\"]").value = ""; // LINE :: 상세주소
                    document.querySelector("[name=\"partner.addrDetail\"]").focus();
                    break;
                case "calc" :
                    document.querySelector("[name=\"calc.workplaceZipcode\"]").value = data.zonecode; // LINE :: 우편번호
                    document.querySelector("[name=\"calc.workplaceAddr\"]").value = `${data.roadAddress} ${data.buildingName ? '(' + data.buildingName + ')' : ''}`; // LINE :: 주소
                    document.querySelector("[name=\"calc.workplaceAddrDetail\"]").value = ""; // LINE :: 상세주소
                    document.querySelector("[name=\"calc.workplaceAddrDetail\"]").focus();
                    break;
                case "customer" :
                    document.querySelector("[name=\"zipcode\"]").value = data.zonecode; // LINE :: 우편번호
                    document.querySelector("[name=\"addr\"]").value = `${data.roadAddress} ${data.buildingName ? '(' + data.buildingName + ')' : ''}`; // LINE :: 주소
                    document.querySelector("[name=\"addrDetail\"]").value = ""; // LINE :: 상세주소
                    document.querySelector("[name=\"addrDetail\"]").focus();
                    break;
            }
        }
    }).open();
}

/**
 * FUNCTION :: 함수 실행 전 프로그래스 띄우는 공통 함수
 * @param fnc
 * @returns {Promise<void>}
 */

/*const showProgress = async (fnc) => {
    document.getElementById("page_loading_progressbar").setAttribute("style", "visibility: visible"); // Line : 프로그레스바 노출
    await fnc();
    document.getElementById("page_loading_progressbar").setAttribute("style", "visibility: hidden"); // Line : 프로그레스바 비노출
}*/

/**
 * FUNCTION :: datepicker 적용
 * @param className
 * @param range
 */
function setCalendar(className, range) {
    var datePickerOptions = {
        showOn: "both",
        buttonImage: "/resources/images/icon/calendar.png",
        buttonImageOnly: true,
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        dateFormat: "yy-mm-dd",
        showMonthAfterYear: true,
        yearSuffix: '년',
        changeYear: true,
        changeMonth: true,
        /*maxDate: 0*/
        yearRange: '1900:c+' + range
    }
    if (className == "serviceChangeHopeDate") {
        datePickerOptions["minDate"] = "2020-08-01";
        datePickerOptions["beforeShowDay"] = $.datepicker.noWeekends;
    }
    $(`.${className}`).datepicker(datePickerOptions);
}

/**
 * FUNCTION :: datepicker 적용
 * @param className
 * @param range
 */
function setLogDateCalendar(className, range) {
    var datePickerOptions = {
        showOn: "both",
        buttonImage: "/resources/images/icon/calendar.png",
        buttonImageOnly: true,
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        dateFormat: "yy-mm-dd ",
        showMonthAfterYear: true,
        yearSuffix: '년',
        changeYear: true,
        changeMonth: true,
        maxDate: new Date(),
        yearRange: '1900:c+' + range
    }
    if (className == "serviceChangeHopeDate") {
        datePickerOptions["minDate"] = "2020-08-01";
        datePickerOptions["beforeShowDay"] = $.datepicker.noWeekends;
    }
    $(`.${className}`).datepicker(datePickerOptions);
}

/**
 * FUNCTION :: datepicker 삭제
 * @param className
 */
const removeCalendar = (className) =>{
    $(`.${className}`).datepicker("destroy");
}

/**
 * FUNCTION :: 사업자 등록번호 형식 체크
 * @param value
 * @returns {boolean}
 */
const checkBusinessNumber = (bisNo) => {
    // 넘어온 값의 정수만 추츨하여 문자열의 배열로 만들고 10자리 숫자인지 확인합니다.
    bisNo = (bisNo + '').match(/\d{1}/g);
    if (!bisNo || bisNo.length != 10) {
        return false;
    }

    // 합 / 체크키
    var sum = 0, key = [1, 3, 7, 1, 3, 7, 1, 3, 5];

    // 0 ~ 8 까지 9개의 숫자를 체크키와 곱하여 합에더합니다.
    for (var i = 0; i < 9; i++) {
        sum += (key[i] * Number(bisNo[i]));
    }

    // 각 8번배열의 값을 곱한 후 10으로 나누고 내림하여 기존 합에 더합니다.
    // 다시 10의 나머지를 구한후 그 값을 10에서 빼면 이것이 검증번호 이며 기존 검증번호와 비교하면됩니다.
    return (10 - ((sum + Math.floor(key[8] * Number(bisNo[8]) / 10)) % 10)) == Number(bisNo[9]);
}

/**
 * 자릿수 콤마
 *
 * @param str
 * @returns {string}
 */
function numberWithCommas(str) {
    return str.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/**
 * 파일 사이즈 규격 표시
 *
 * @param bytes
 * @returns {*}
 */
const formatSizeUnits = (bytes) => {
    if (bytes >= 1073741824) {
        bytes = (bytes / 1073741824).toFixed(2) + ' GB';
    }
    else if (bytes >= 1048576) {
        bytes = (bytes / 1048576).toFixed(2) + ' MB';
    }
    else if (bytes >= 1024) {
        bytes = (bytes / 1024).toFixed(2) + ' KB';
    }
    else if (bytes > 1) {
        bytes = bytes + ' bytes';
    }
    else if (bytes == 1) {
        bytes = bytes + ' byte';
    }
    else {
        bytes = '0 byte';
    }
    return bytes;
}