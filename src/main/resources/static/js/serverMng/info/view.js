const deleteAjax = () => {
    if (!confirm("삭제하시겠습니까?")) { return false; }

    const formData = new FormData( document.getElementById("deleteForm") );
    return fetch("/servermng", { method : "PATCH",  body : formData })
        .then(res => res.json())
        .then(json => {
            const httpCode = json[AJAX_RESULT_TEXT];
            if (httpCode == AJAX_RESULT_SUCCESS) {
                alert(`삭제 되었습니다.`);
                moveList();
            }  else if (httpCode == AJAX_RESULT_DUPLICATE){
                alert('데이터가 존재하지 않습니다.');
            } else {
                alert(`삭제 처리 중 오류가 발생하여 삭제되지 않았습니다.\n관리자에게 문의해주세요.`);
            }
        })
        .catch(err => {
            alert(`삭제 처리 중 오류가 발생하여 삭제되지 않았습니다.\n관리자에게 문의해주세요.`);
        });
}