<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header_popup.jsp" %>
<script type="text/babel" src="/resources/js/adminMng/auth/form.js"></script>
<script src="/resources/js/lang/adminMng/adminMng_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
    <p class="pop_title trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_TITLE3"><%--관리자 권한 관리--%></p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
        </div>
    </div>
    <div class="l-content ml15 mr15">
        <div class="b-tableWrap">
            <div>
                <form id="saveForm">
                    <input type="hidden" name="accountIdx" value="${account.idx}">
                    <table class="b-listTable b-listTable--border">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="trn" data-trn-key="TR_COMMON_NAME"><%--이름--%></th>
                                <td>
                                    ${account.name}
                                </td>
                                <th>ID</th>
                                <td>
                                    ${account.id}
                                </td>
                            </tr>
                            <tr>
                                <th class="a_center trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_ONE_DEPTH_MENU"><%--1뎁스 메뉴--%></th>
                                <td colspan="3">
                                    <c:forEach items="${oneDepthMenuList}" var="onedepthMenu">
                                        <label class="dis-ib mt10 mb10  w100">
                                            <input type="checkbox" name="menuCodeList" value="${onedepthMenu.code}" ${onedepthMenu.authYn ? "checked" : ""}>
                                            <span>${onedepthMenu.name}</span>
                                        </label>
                                    </c:forEach>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <div class="mt15 a_center">
            <input type="button" value="<%--등록--%>" class="btn-large btn-add trn" data-trn-value="TR_COMMON_REGISTRATION" style="margin-right: 5px;" onclick="save()">
            <input type="button" value="<%--취소--%>" class="btn-large trn" data-trn-value="TR_COMMON_CANCEL" onclick="window.close()">
        </div>
    </div>
</body>
</html>