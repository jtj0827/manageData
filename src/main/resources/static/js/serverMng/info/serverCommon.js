/**
 * FUNCTION :: 상세페이지 이동 공통 함수
 * @param idx
 */
const moveServerView = (idx) => {
    sessionStorage.setItem("temp_uri", location.href);
    location.href = `view?serverIdx=${idx}`;
}