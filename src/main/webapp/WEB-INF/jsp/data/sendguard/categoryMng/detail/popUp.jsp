<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../../include/header_popup.jsp" %>

<script type="text/babel" src="/resources/js/data/categoryMng.js"></script>

<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
    <p class="pop_title">
        ${categoryPersonInfoList.idx > 0 ? '유형 수정' : '유형 등록'}
    </p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
        </div>
    </div>
    <div class="l-content ml15 mr15">
        <div class="b-tableWrap">
            <div>
                <form id="saveForm">
                    <c:if test="${categoryPersonInfoList.idx > 0}">
                    <input type="hidden" name="idx" value="${categoryPersonInfoList.idx}">
                    </c:if>
                    <input type="hidden" name="categoryIdx" value="${categoryIdx}">
                <table class="b-listTable b-listTable--border">
                    <caption class="oppscreen">IP 정보</caption>
                    <colgroup>
                        <col width="25%">
                        <col width="75%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="a_center">내용</th>
                        <td><input type="text" class="w300" maxlength="255" name="contents" id="contents" value="${categoryPersonInfoList.contents}" autocomplete="off"></td>
                    </tr>
                    <tr>
                        <th class="a_center">설명</th>
                        <td><input type="text" class="w300" maxlength="255" name="explanation" id="explanation" value="${categoryPersonInfoList.explanation}" autocomplete="off"></td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </div>
        <div class="mt15 a_center">
            <input type="button" value=" ${categoryPersonInfoList.idx > 0 ? '수정' : '등록'}" class="btn-large btn-add trn" style="margin-right: 5px;" onclick="detailSaveBtn()">
            <input type="button" value="취소" class="btn-large trn" data-trn-value="TR_COMMON_CANCEL" onclick="window.close()">
        </div>
    </div>
</body>
</html>