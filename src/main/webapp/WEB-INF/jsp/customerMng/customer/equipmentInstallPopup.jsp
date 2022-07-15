<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header_popup.jsp" %>
<script src="/resources/js/customerMng/customer/equipmentInstallPopup.js" type="text/babel"></script>
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
                            <col width="30%">
                            <col width="*%">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_RECEIVE_SERVER"><%--ReceiveGUARD 서버--%></th>
                            <td>
                                <select name="rguardServerIdx" class="wp90">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <c:forEach var="serverInfo" items="${rguardServerList}">
                                        <option value="${serverInfo.idx}">${serverInfo.name} (${serverInfo.ip})</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_SPAM_GUARD_SERVER"><%--SpamGUARD 서버--%></th>
                            <td>
                                <select name="spamServerIdx" class="wp90">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <c:forEach var="serverInfo" items="${spamServerList}">
                                        <option value="${serverInfo.idx}">${serverInfo.name} (${serverInfo.ip})</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_SEND_SERVER"><%--SendGUARD 서버--%></th>
                            <td>
                                <select name="sguardServerIdx" class="wp90" onchange="checkMailServer(this)">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <c:forEach var="serverInfo" items="${sendServerList}">
                                        <option value="${serverInfo.idx}">
                                            ${serverInfo.name} (${serverInfo.assignmentIp})
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_SECU_MAIL_SERVER"><%--SecuMail 서버--%></th>
                            <td>
                                <select name="mailServerIdx" class="wp90" disabled>
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <c:forEach var="serverInfo" items="${mailServerList}">
                                        <option value="${serverInfo.idx}">
                                                ${serverInfo.name} (${serverInfo.assignmentIp})
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <%-- LINE :: Secu E Cloud 서비스 종류가 N(신규 P-Service)인 경우 표시 --%>
                        <c:if test="${customer.secuEcloudGubun == 'N'}">
                            <tr>
                                <th class="trn" data-trn-key="TR_CLOUD_EML_GEN_SERVER"><%--EML 생성기 서버--%></th>
                                <td>
                                    <select name="emlGeneratorServerIdx" class="wp90">
                                        <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                        <c:forEach var="emlGeneratorServer" items="${emlGeneratorServerList}">
                                            <option value="${emlGeneratorServer.idx}">
                                                    ${emlGeneratorServer.name} (${emlGeneratorServer.ip})
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                    <input type="hidden" name="idx" value="${customer.idx}">
                    <input type="hidden" name="company_name" value="${customer.name}">
                    <input type="hidden" name="service_type" value="${fn:replace(customer.secuEcloudGubun, 'N', 'P')}">
                    <c:if test="${customer.secuEcloudGubun eq 'N'}">
                        <input type="hidden" name="iservice_quantity" value="${customer.applyAccountCount * 10}">
                    </c:if>
                    <c:if test="${customer.secuEcloudGubun ne 'N'}">
                        <input type="hidden" name="iservice_quantity" value="${customer.secuEcloudGubun eq 'I' ? 30 + (customer.addAccountCount ne null && customer.addAccountCount ne '' ? (customer.addAccountCount * 2) : 0) : (customer.applyAccountCount * 6)}">
                    </c:if>
                    <input type="hidden" name="iservice_expand" value="${(customer.addStorage ne null && customer.addStorage ne '' ? customer.addStorage : 0)}">
                    <input type="hidden" name="account_limit" value="${customer.secuEcloudGubun eq 'P' or customer.secuEcloudGubun eq 'N' ? customer.applyAccountCount : '0'}">
                    <input type="hidden" name="freead_yn" value="false">
                    <input type="hidden" name="bigfile_qt" value="${customer.secuEcloudGubun eq 'I' ? '10' : (customer.applyAccountCount * 2)}">
                    <input type="hidden" name="archive_use" value="false">
                    <%--<input type="hidden" name="company_quantity" value="0">--%>
                    <input type="hidden" name="user_id" value="${customer.adminId}">
                    <input type="hidden" name="user_pass" value="${customer.adminPwd}">
                    <input type="hidden" name="backup_mail" value="${customer.adminSubEmail}">
                    <input type="hidden" name="user_name" value="${customer.adminName}">
                    <c:forEach var="domain" items="${domainList}">
                        <input type="hidden" name="domain_name" value="${domain.domain}">
                    </c:forEach>

                    <c:forEach var="onedrive" items="${onedriveAccount}" varStatus="status">
                        <input type="hidden" name="oneDriveList[${status.index}].tenentId" value="${onedrive.tenantId}">
                        <input type="hidden" name="oneDriveList[${status.index}].clientId" value="${onedrive.clientId}">
                        <input type="hidden" name="oneDriveList[${status.index}].userid" value="${onedrive.account}">
                        <input type="hidden" name="oneDriveList[${status.index}].driveid" value="${onedrive.onedriveId}">
                        <input type="hidden" name="oneDriveList[${status.index}].secret" value="${onedrive.secretId}">
                    </c:forEach>
                    <input type="hidden" name="message_yn" value="${customer.messageUseYn}">
                    <input type="hidden" name="notice_yn" value="${customer.noticeUseYn}">
                    <input type="hidden" name="finance_yn" value="${customer.financeUseYn}">
                    <input type="hidden" name="guard_mail_box" value="${customer.guardMailBoxUseYn}">

                    <c:if test="${customer.secuEcloudGubun == 'N' and onedriveAccount != null}">
                        <input type="hidden" name="one_drive" value="1">
                    </c:if>
                    <c:if test="${customer.secuEcloudGubun != 'N' || onedriveAccount == null}">
                        <input type="hidden" name="one_drive" value="0">
                    </c:if>
                    <input type="hidden" name="groupware_yn" value="${customer.groupwareUseYn}">

                    <input type="hidden" name="group_name" value="${customer.name}">
                    <input type="hidden" name="mail_server_port" value="25">
                    <input type="hidden" name="mem_name" value="${sessionScope.accountInfo.name}">
                    <input type="hidden" name="reg_id" value="${sessionScope.accountInfo.name}">
                    <input type="hidden" name="company_idx" value="${customer.idx}">

                    <input type="hidden" name="pop3_yn" value="${customer.secuEcloudGubun eq 'I' ? (customer.pop3UseYn ? 1 : 0) : 1}">
                    <input type="hidden" name="workmail_use" value="${customer.workmailUse ? 1 : 0}">
                    <input type="hidden" name="use_schedule" value="${customer.useSchedule ? 1 : 0}">
                    <input type="hidden" name="organization_yn" value="${customer.organizationYn ? 1 : 0}">
                </form>


                <p class="clear a_center mt10" style="overflow:hidden;">
                    <span class="a_center">
                        <input type="button" class="btn-large btn-add" onclick="equipmentInstallAjax()" value="설치 시작">
                        <input type="button" class="btn-large" onclick="self.close();" value="취소">

                        <input type="button" class="btn-large fc-blue" onclick="openStorageCheckPopup()" value="용량 확인">
                    </span>
                </p>
            </div><!--contentBox-->
        </div><!--container_list-->
    </div>
</div><!--article-->
</div><!--section-->
</div><!--wrapper-->
</body>
</html>
