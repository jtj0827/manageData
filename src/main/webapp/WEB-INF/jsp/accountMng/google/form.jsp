<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/accountMng/google/form.js" type="text/babel"></script>
<script src="/resources/js/lang/accountMng/accountMng_lang.js"></script>
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
                                <th>ID</th>
                                <td>
                                    <input type="text" name="accountId" class="default-input w155" value="${account.accountId}">
                                </td>
                                <th class="trn" data-trn-key="TR_COMMON_NAME"><%--이름--%></th>
                                <td>
                                    <input type="text" name="name" class="default-input w155" value="${account.name}">
                                </td>
                            </tr>

                            <tr>
                                <th class="trn" data-trn-key="TR_ACCOUNT_MNG_GOOGLE_GMAIL_ADDR"><%--Gmail 주소--%></th>
                                <td>
                                    <c:set var="gmail" value="${fn:split(account.gmailAddr, '@')}"/>
                                    <input type="hidden" name="gmailAddr">
                                    <input type="text" id="gmailAddr1" class="default-input mr5" value="${gmail[0]}" style="width:130px;" maxlength="50">@
                                    <input type="text" id="gmailAddr2" class="default-input" value="gmail.com" style="width:130px;" readonly>
                                </td>
                                <th>API Key</th>
                                <td>
                                    <input type="text" name="apiKey" class="default-input w155" value="${account.apiKey}">
                                </td>
                            </tr>
                            <tr>
                                <th class="trn" data-trn-key="TR_COMMON_IS_USE"><%--사용여부--%></th>
                                <td colspan="3">
                                    <label class="dis_ib w80">
                                        <input type="radio" name="useYn" value="true" checked> <span class="trn" data-trn-key="TR_COMMON_USEYN_TRUE"><%--사용--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="useYn" value="false" ${account != null && !account.useYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_USEYN_FALSE"><%--사용안함--%></span>
                                    </label>
                                </td>

                            </tr>
                        </table>
                    </form>
                </div>
            </section>
        </div>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="${account.idx > 0 ? 'TR_COMMON_MODIFIED':'TR_COMMON_REGISTRATION'}" value="<%--등록 or 수정--%>" onclick="save()">
            <c:choose>
                <c:when test="${account.idx > 0}">
                    <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_CANCEL" value="<%--취소--%>" onclick="location.href='view?idx=${account.idx}'">
                </c:when>
                <c:otherwise>
                    <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_CANCEL" value="<%--취소--%>" onclick="moveList();">
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>