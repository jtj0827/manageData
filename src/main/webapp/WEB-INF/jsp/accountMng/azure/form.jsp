<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/lang/accountMng/accountMng_lang.js"></script>
<script src="/resources/js/accountMng/azure/form.js" type="text/babel"></script>
<section class="l-content-area">
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_ACCOUNT_MNG_TITLE"><%--계정 관리--%></h1>
    <div class="l-maxwrap">
        <div>
            <section>
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_ACCOUNT_MNG_DATA"><%--계정 정보--%></h1>
                </div>

                <div class="b-tableWrap mt20 ofx-h">
                    <form id="saveForm">
                        <c:if test="${account.idx > 0}">
                            <input type="hidden" name="idx" value="${account.idx}">
                        </c:if>
                        <table class="b-listTable b-listTable--border">
                            <caption class="offscreen trn" data-trn-key="TR_ACCOUNT_MNG_DATA"><%--계정 정보--%></caption>
                            <colgroup>
                                <col width="20%">
                                <col width="30%">
                                <col width="20%">
                                <col width="30%">
                            </colgroup>
                            <tr class="table-head">
                                <th colspan="4" class="a_left form-maintitle strong trn" data-trn-key="TR_COMMON_BASIC_DATA"><%--기본 정보--%></th>
                            </tr>
                            <tr>
                                <th class="trn" data-trn-key="TR_ACCOUNT_MNG_AZURE_ACCOUNT_TYPE"><%--계정 구분--%></th>
                                <td>
                                    <select name="accountType" class="default-input w155">
                                        <option value="E" ${account.accountType == "E" ? "selected" : ""}>Exchange</option>
                                        <option value="O" ${account.accountType == "O" ? "selected" : ""}>Onedrive</option>
                                    </select>
                                </td>
                                <th class="trn" data-trn-key="TR_COMMON_ACCOUNT"><%--계정--%></th>
                                <td>
                                    <input type="text" name="account" class="default-input w155" value="${account.account}">
                                </td>
                            </tr>

                            <tr>
                                <th>ClientId</th>
                                <td>
                                    <input type="text" name="clientId" class="default-input w155" value="${account.clientId}">
                                </td>

                                <th>TenentId</th>
                                <td>
                                    <input type="text" name="tenantId" class="default-input w155" value="${account.tenantId}">
                                </td>
                            </tr>
                            <tr>
                                <th>SecretKey</th>
                                <td>
                                    <input type="text" name="secretId" class="default-input w155" value="${account.secretId}">
                                </td>
                                <th class="exchangeArea trn" data-trn-key="TR_ACCOUNT_MNG_AZURE_TOKEN_STRING"><%--토큰 요청 문자열--%></th>
                                <td class="exchangeArea">
                                    <input type="text" name="tokenString" class="default-input w155" value="${account.tokenString}">
                                </td>
                                <th class="onedriveArea">DriveId</th>
                                <td class="onedriveArea">
                                    <input type="text" name="onedriveId" class="default-input w155" value="${account.onedriveId}">
                                </td>
                            </tr>
                            <tr class="border-b">
                                <th class="exchangeArea trn" data-trn-key="TR_ACCOUNT_MNG_AZURE_OBJECT_ID"><%--개체 ID--%></th>
                                <td class="exchangeArea">
                                    <input type="text" name="objectId" class="default-input w155" value="${account.objectId}">
                                </td>
                                <th class="trn" data-trn-key="TR_COMMON_CAPACITY"><%--용량--%></th>
                                <td colspan="3" id="accountTypeCol">
                                    <input type="text" class="default-input w155 onlynumber autocomma" name="storage" value="${account.accountType == 'E' ? account.exchangeStorage : account.onedriveStorage}"> GB
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </section>
        </div>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="${account.idx > 0 ? 'TR_COMMON_MODIFIED':'TR_COMMON_REGISTRATION'}" value="<%--수정 or 등록--%>" onclick="save()">
            <c:choose>

                <c:when test="${account.idx > 0}">
                    <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_CANCEL" value="<%--취소--%>" onclick="location.href='view?idx=${account.idx}'">
                </c:when>
                <c:otherwise>
                    <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_CANCEL" value="<%--취소--%>" onclick="moveList();">
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>