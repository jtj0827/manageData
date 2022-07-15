<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/accountMng/azure/view.js" type="text/babel"></script>
<script src="/resources/js/lang/accountMng/accountMng_lang.js"></script>
<section class="l-content-area">
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_ACCOUNT_MNG_TITLE"><%--계정 관리--%></h1>
    <div class="l-maxwrap">
        <div>
            <section>
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_ACCOUNT_MNG_TITLE"><%--계정 정보--%></h1>
                </div>

                <div class="b-tableWrap mt20 ofx-h">
                    <form id="deleteForm">
                        <input type="hidden" name="idx" value="${account.idx}">
                    </form>
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_ACCOUNT_MNG_TITLE"><%--계정 정보--%></caption>
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
                            <td colspan="3">${account.accountType == "E" ? "Exchange" : "Onedrive"}</td>
                        </tr>
                        <c:if test="${account.accountType == 'E'}">
                            <tr class="exchangeArea">
                                <th class="trn" data-trn-key="TR_COMMON_ACCOUNT"><%--계정--%></th>
                                <td>${account.account}</td>
                                <th class="trn" data-trn-key="TR_ACCOUNT_MNG_AZURE_OBJECT_ID"><%--개체 ID--%></th>
                                <td>${account.objectId}</td>
                            </tr>
                        </c:if>
                        <tr>
                            <th>ClientId</th>
                            <td>${account.clientId}</td>

                            <th>TenentId</th>
                            <td>${account.tenantId}</td>
                        </tr>
                        <tr>
                            <th>SecretKey</th>
                            <td>${account.secretId}</td>
                            <c:if test="${account.accountType == 'E'}">
                                <th class="exchangeArea trn" data-trn-key="TR_ACCOUNT_MNG_AZURE_TOKEN_STRING"><%--토큰 요청 문자열--%></th>
                                <td colspan="${account.accountType == 'O' ? '1' : '1'}">${account.secretId}</td>
                            </c:if>
                            <c:if test="${account.accountType == 'O'}">
                                <th class="onedriveArea">DriveId</th>
                                <td>${account.onedriveId}</td>
                            </c:if>
                        </tr>
                        <tr class="border-b">
                            <th class="trn" data-trn-key="TR_COMMON_CAPACITY"><%--용량--%></th>
                            <td colspan="3">
                                <fmt:formatNumber value="${account.accountType == 'E' ? account.exchangeStorage : account.onedriveStorage}" pattern="#,###"/> GB
                            </td>
                        </tr>


<%--                        <tr>--%>
<%--                            <th>계정</th>--%>
<%--                            <td>${account.account}</td>--%>
<%--                            <th>계정 구분</th>--%>
<%--                            <td>${account.accountType == "E" ? "Exchange" : "Onedrive"}</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th>ClientId</th>--%>
<%--                            <td>${account.clientId}</td>--%>
<%--                            <th>개체 ID</th>--%>
<%--                            <td>${account.objectId}</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th>TenentId</th>--%>
<%--                            <td>${account.tenantId}</td>--%>
<%--                            <th>SecretKey</th>--%>
<%--                            <td>${account.secretId}</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th>토큰 요청 문자열</th>--%>
<%--                            <td colspan="${account.accountType == 'O' ? '1' : '3'}">${account.secretId}</td>--%>
<%--                            <c:if test="${account.accountType == 'O'}">--%>
<%--                                <th>DriveId</th>--%>
<%--                                <td>${account.onedriveId}</td>--%>
<%--                            </c:if>--%>
<%--                        </tr>--%>
<%--                        <tr class="border-b">--%>
<%--                            <th>용량</th>--%>
<%--                            <td colspan="3">--%>
<%--                                <fmt:formatNumber value="${account.accountType == 'E' ? account.exchangeStorage : account.onedriveStorage}" pattern="#,###"/> GB--%>
<%--                            </td>--%>
<%--                        </tr>--%>
                    </table>
                </div>
            </section>
        </div>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5 trn" data-trn-value="TR_COMMON_DELETE" value="<%--삭제--%>" onclick="deleteAjax(${account.idx})">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-valye="TR_COMMON_MODIFIED" value="<%--수정--%>" onclick="location.href='form?idx=${account.idx}'">
            <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_LIST" value="<%--목록--%>" onclick="moveList()">
        </div>
    </div>
</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>