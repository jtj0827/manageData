<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>

<script src="/resources/js/cloud/customerMng/userStateForm.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title trn" data-trn-key="TR_CLOUD_TITLE2"><%--사용자 현황--%></p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
                <%--<hr class="subLine">--%>
                <form id="saveForm">
                    <input type="hidden" name="company_idx" value="${user.company_idx}">
                    <input type="hidden" name="user_idx" value="${user.user_idx}">
                    <table class="pop_tbl_t2">
                        <colgroup>
                            <col width="20%">
                            <col width="*%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NAME"><%--이름--%></th>
                            <td>
                                <input type="text" name="user_name" class="default-input" value="${user.user_name}">
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_USER_ID"><%--아이디--%></th>
                            <td>${user.user_id}</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_USER_AUTH"><%--사용권한--%></th>
                            <td>${user.user_glade == "C" ? "기업" : "일반"}</td>
                            <th class="trn" data-trn-key="TR_CLOUD_USER_LANGUAGE"><%--사용언어--%></th>
                            <td>${user.user_language}</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_PHONE_NUMBER"><%--핸드폰 번호--%></th>
                            <td>${user.user_hp}</td>
                            <th class="trn" data-trn-key="TR_CLOUD_SUB_MAIL"><%--보조메일--%></th>
                            <td>
                                <input type="text" class="wp100" name="backup_mail" value="${user.backup_mail}">
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_USE_SMTP"><%--SMTP 사용--%></th>
                            <td
                                    <c:if test="${customer.secuEcloudGubun eq 'I' && !customer.pop3UseYn}">colspan="3"</c:if>>
                                <label class="mr10 dis_ib w80">
                                    <input type="radio" class="trn" data-trn-key="TR_CLOUD_USE_SMTP_0" name="smtp_block" value="false" checked> <span><%--허용--%></span>
                                </label>
                                <label>
                                    <input type="radio" name="smtp_block" value="true" class="trn" data-trn-key="TR_CLOUD_USE_SMTP_1" ${user.smtp_block ? "checked" : ""}> <span><%--차단--%></span>
                                </label>
                            </td>
                            <th
                                    <c:if test="${customer.secuEcloudGubun eq 'I' && !customer.pop3UseYn}">class="dis-n"</c:if>>
                                <span class="trn" data-trn-key="TR_CLOUD_POP3_USE"><%--POP3 사용--%></span>
                            </th>
                            <td
                                    <c:if test="${customer.secuEcloudGubun eq 'I' && !customer.pop3UseYn}">class="dis-n"</c:if>>
                                <label class="mr10 dis_ib w80">
                                    <input type="radio" name="pop3_use" value="false" checked> <span class="trn" data-trn-key="TR_COMMON_USEYN_FALSE"><%--사용안함--%></span>
                                </label>
                                <label>
                                    <input type="radio" name="pop3_use" value="true" ${user.pop3_use ? "checked" : ""}>
                                    <span class="trn" data-trn-key="TR_COMMON_USEYN_TRUE"><%--사용--%></span>
                                </label>
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="blankValue">
                </form>

                <p class="clear" style="overflow:hidden;">
                    <span class="fr">
                        <input type="button" class="type09 trn" data-trn-value="TR_COMMON_MODIFIED" onclick="save()" value=""><%--수정--%>
                        <input type="button" class="type07 trn" data-trn-value="TR_COMMON_CANCEL" onclick="self.close();" value=""><%--취소--%>
                    </span>
                </p>
            </div><!--contentBox-->
        </div><!--container_list-->
    </div>
</div>
<!--article-->
</div><!--section-->
</div><!--wrapper-->
</body>
</html>