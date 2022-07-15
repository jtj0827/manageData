<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header_popup.jsp" %>
<script src="/resources/js/cloud/egPlatform/equipmentInstallPopup.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title trn" data-trn-key="TR_CLOUD_EQUIPMENT_INSTALL"><%--장비 설치--%></p>
        <div class="con_view">
            <div class="container_pop b-tableWrap" style="width: 680px">
                <%--<hr class="subLine">--%>
                <form id="installForm">
                    <table class="b-listTable b-listTable--border">
                        <colgroup>
                            <col width="25%">
                            <col width="*%">
                        </colgroup>
                        <c:if test="${customer.sendUseYn || customer.spamUseYn}">
                            <tr>
                                <th class="trn" data-trn-key="TR_CLOUD_SPAM_AND_SEND_SERVER"><%--Spam & SendGUARD 서버--%></th>
                                <td>
                                    <select name="sguardServerIdx" class="wp100">
                                        <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                        <c:forEach var="serverInfo" items="${sguardServerList}">
                                            <option value="${serverInfo.idx}">${serverInfo.name} (${serverInfo.ip})</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${customer.rguardUseYn}">
                            <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_RECEIVE_SERVER"><%--ReceiveGUARD 서버--%></th>
                            <td>
                                <select name="rguardServerIdx" class="wp100">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <c:forEach var="serverInfo" items="${rguardServerList}">
                                        <option value="${serverInfo.idx}">${serverInfo.name} (${serverInfo.ip})</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        </c:if>

                    </table>
                    <input type="hidden" name="idx" value="${customer.idx}">
                    <input type="hidden" name="spamUseYn" value="${customer.spamUseYn}">
                    <input type="hidden" name="rguardUseYn" value="${customer.rguardUseYn}">
                    <input type="hidden" name="sendUseYn" value="${customer.sendUseYn}">
                    <input type="hidden" name="serviceUseGubun" value="${customer.serviceUseGubun}">
                    <input type="hidden" name="groupName" value="${customer.name}">
                    <c:forEach var="domain" items="${domainList}">
                        <input type="hidden" name="domainName" value="${domain.domain}">
                    </c:forEach>
                    <c:forEach var="mailServer" items="${mailServerList}">
                        <input type="hidden" name="mailServerIp" value="${mailServer.ip}">
                    </c:forEach>
                    <c:forEach var="unusedId" items="${unusedIdList}">
                        <input type="hidden" name="unusedId" value="${unusedId.id}">
                    </c:forEach>
                    <input type="hidden" name="mailServerPort" value="25">
                    <input type="hidden" name="regId" value="${sessionScope.accountInfo.name}">
                    <input type="hidden" name="loginIp" value="${customer.guardAccessIp}">
                    <input type="hidden" name="adminId" value="${customer.guardAdminId}">
                    <input type="hidden" name="adminPwd" value="${customer.guardAdminPw}">
                    <input type="hidden" name="adminTel" value="010-0000-0000">
                    <input type="hidden" name="adminName" value="${customer.name}">
                    <c:forEach var="userId" items="${unuseIdList}">
                        <input type="hidden" name="unusedId" value="${userId.id}">
                    </c:forEach>

                    <input type="hidden" name="mailBackupUseYn" value="${customer.mailBackupUseYn}">
                    <c:if test="${customer.mailBackupUseYn == true}">
                        <input type="hidden" name="mailBackupType" value="${customer.mailBackupType}">
<%--                        <c:choose>--%>
<%--                            <c:when test="${customer.mailBackupType == 'E'}">--%>
<%--                                <c:forEach items="${exchangeAccountList}" var="account" varStatus="status">--%>
<%--                                    <input type="hidden" name="exchangeAccountList[${status.index}].centercontrol_account_idx" value="${account.idx}">--%>
<%--                                    <input type="hidden" name="exchangeAccountList[${status.index}].account" value="${account.account}">--%>
<%--                                    <input type="hidden" name="exchangeAccountList[${status.index}].client_id" value="${account.clientId}">--%>
<%--                                    <input type="hidden" name="exchangeAccountList[${status.index}].object_id" value="${account.objectId}">--%>
<%--                                    <input type="hidden" name="exchangeAccountList[${status.index}].tenant_id" value="${account.tenantId}">--%>
<%--                                    <input type="hidden" name="exchangeAccountList[${status.index}].secret_id" value="${account.secretId}">--%>
<%--                                    <input type="hidden" name="exchangeAccountList[${status.index}].token_string" value="${account.tokenString}">--%>
<%--                                    <input type="hidden" name="exchangeAccountList[${status.index}].storage" value="${account.exchangeStorage}">--%>
<%--                                    <input type="hidden" name="exchangeAccountList[${status.index}].reg_id" value="${account.regId}">--%>
<%--                                    <c:if test="${account.exchangeSaveYn}">--%>
<%--                                        <input type="hidden" name="exchangePointIdx" value="${account.idx}">--%>
<%--                                    </c:if>--%>
<%--                                </c:forEach>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${customer.mailBackupType == 'S'}">--%>
<%--                                <c:forEach items="${storageServerInfo}" var="server" varStatus="status">--%>
<%--                                    <input type="hidden" name="storageServerList[${status.index}].ip" value="${server.ip}">--%>
<%--                                    <input type="hidden" name="storageServerList[${status.index}].port" value="${server.port}">--%>
<%--                                    <input type="hidden" name="storageServerList[${status.index}].tls_use_yn" value="${server.tlsUseYn}">--%>
<%--                                    <input type="hidden" name="storageServerList[${status.index}].use_status" value="${server.useYn}">--%>
<%--                                </c:forEach>--%>
<%--                            </c:when>--%>
<%--                        </c:choose>--%>
                    </c:if>
                </form>

                <p class="clear mt10" style="overflow:hidden;">
                    <div class="a_center">
                        <input type="button" class="btn-large btn-detail trn" data-trn-value="TR_COMMON_SEARCH_ALL" onclick="equipmentInstallAjax()" value=""><%--설치--%>
                        <input type="button" class="btn-large trn" data-trn-value="TR_COMMON_CANCEL" onclick="self.close();" value=""><%--취소--%>
                    </div>
                </p>
            </div><!--contentBox-->
        </div><!--container_list-->
    </div>
</div><!--article-->
</div><!--section-->
</div><!--wrapper-->
</body>
</html>
