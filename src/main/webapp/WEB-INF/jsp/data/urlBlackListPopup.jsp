<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header_popup.jsp" %>

<script src="/resources/js/data/listPopup.js" type="text/babel"></script>

<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
    <p class="pop_title">URL 블랙 리스트 관리 등록</p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
        </div>
    </div>
    <div class="ml15 mr15">
        <div class="b-tableWrap">
            <div>
                <form id="saveForm">
                    <c:if test="${urlBlackList.idx > 0}">
                    <input type="hidden" name="idx" value="${urlBlackList.idx}">
                    </c:if>
                <table class="b-listTable b-listTable--border">
                    <caption class="oppscreen">IP 정보</caption>
                    <colgroup>
                        <col width="25%">
                        <col width="75%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="a_center">URL</th>
                        <td><input type="text" class="wp80" maxlength="100" name="url" id="contents" value="${urlBlackList.url}"></td>
                    </tr>
                    <tr>
                        <th class="a_center">설명</th>
                        <td><input type="text" class="wp80" maxlength="100" name="explanation" id="explanation" value="${urlBlackList.explanation}"></td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </div>
        <div class="mt15 a_center">
            <input type="button" value="등록" class="btn-large btn-add trn" style="margin-right: 5px;" onclick="save()">
            <input type="button" value="취소" class="btn-large trn" data-trn-value="TR_COMMON_CANCEL" onclick="window.close()">
        </div>
    </div>
</body>
</html>