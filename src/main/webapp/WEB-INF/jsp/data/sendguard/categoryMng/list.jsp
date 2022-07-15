<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp"%>
<script type="text/babel" src="/resources/js/data/common/dataCommon.js"></script>
<script type="text/babel" src="/resources/js/data/categoryMng.js"></script>

<script>
    let categoryEvenCnt = 0;
    let selectEventCnt = 0;

    document.addEventListener("DOMContentLoaded", function () {
        const button = document.getElementById("searchCategory");
        button.addEventListener("change", categoryChangeEvent);

        categoryChangeEvent();
    });

    const categoryChangeEvent = () => {
        const selectCategoryBox = document.getElementById("searchCategory");
        const selectCategoryIdx = selectCategoryBox.options[selectCategoryBox.selectedIndex].value;
        const htmlChange = document.getElementById("listView");

        if (selectCategoryIdx != "") {
            let formData = document.createElement("form");

            formData.innerHTML += `<input type="hidden" name="topIdx" value=` + selectCategoryIdx + `>`;

            if(categoryEvenCnt == 0){
                formData.innerHTML += `<input type="hidden" name="searchText" value='${param.searchText}'>`

                if("${param.pageSize}".length > 0){
                    formData.innerHTML += `<input type="hidden" name="pageSize" value='${param.pageSize}'>`
                    formData.innerHTML += `<input type="hidden" name="pageNo" value='${param.pageNo}'>`
                }

                document.getElementById("categoryEvenCnt").value=1;
                categoryEvenCnt = 1;
            }else{
                document.getElementById("selectEventCnt").value=1;
                selectEventCnt = 1;
            }
            const reloadForm = new FormData(formData);

            fetch("/data/categoryMngAjax/listData",  { method : "POST",  body : reloadForm})
                .then(function (response) {
                    return response.text();
                })
                .then(function (html) {
                    htmlChange.innerHTML = html;

                    const categoryChangeAry = document.getElementsByName("searchCategory");

                    for (var i = 0; i < categoryChangeAry.length; i++) {
                        categoryChangeAry[i].value = selectCategoryIdx;
                    }

                    const categoryBtn = document.getElementById("categoryBtn");
                    categoryBtn.value = "카테고리 수정";
                })
                .catch(function (error) {
                    alert('카테고리를 불러오는 중 오류가 발생했습니다.\n관리자에게 문의해주세요.');
                });
         }else{
            if(selectEventCnt == 0){
                document.getElementById("selectEventCnt").value=1;
                selectEventCnt = 1;
            }
            htmlChange.innerHTML = "";

            const categoryBtn = document.getElementById("categoryBtn");
            categoryBtn.value = "카테고리 등록";
        }
    }
</script>

<section class="l-content-area">
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">카테고리 관리</h1>

    <div class="l-maxwrap">

        <input type="hidden" id="categoryEvenCnt" value="0">
        <input type="hidden" id="selectEventCnt" value="0">

        <%-- 카테고리 목록 style INLINE 작업--%>
        <div class="b-listSearchForm" style="background-color: #FFFFFF; border: none;">
            <div class="b-listSearchForm__inner">
                <div class="b-form-group">
                    <div class="b-form-group__item">
                        <label>카테고리 목록</label>
                        <div class="inline-group">
                            <select id ="searchCategory" class="default-input w150">
                                <option value="">카테고리 선택</option>
                                <c:forEach items="${categoryManagerTopData}" var="data" varStatus="status">
                                    <option value="${data.idx}" ${param.searchCategory eq data.idx ? 'selected' : ''}>${data.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                    <div class="b-form-group__item">
                        <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                        <div class="inline-group">
                            <%--등록--%>
                            <input type="button" class="btn-base btn-search w100" id="categoryBtn" value="카테고리 등록" onclick="categoryManagerPopUp()">
                        </div>
                        <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                    </div>
                </div>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <br/>
        <%-- ajaxPage에서 데이터를 가져온 다음 설정--%>
        <div id="listView">
        </div>

    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>