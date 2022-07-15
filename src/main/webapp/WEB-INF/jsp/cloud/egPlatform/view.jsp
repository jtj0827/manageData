<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/cloud/egPlatform/view.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<section class="l-content-area">
    <c:set var="now"><fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/></c:set>
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CLOUD_TITLE3"><%--고객사 관리--%></h1>
    <input type="hidden" id="idx" value="${customer.idx}">
    <div class="l-maxwrap">
        <div>
            <section class="mt30 ${!customer.equipmentInstallYn ? 'dis-n' : ''}">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_EQUIPMENT_INSTALL_INFO"><%--장비 설치 정보--%></h1>
                </div>
                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_CLOUD_EQUIPMENT_INSTALL_INFO"><%--장비 설치 정보--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_SPAM_SERVER"><%--Spam GUARD 서버--%></th>
                            <td>
                                <c:choose>
                                    <c:when test="${customer.spamUseYn && customer.equipmentInstallYn}">${spamServer.name} (${spamServer.ip})</c:when>
                                    <c:otherwise>
                                        -
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_RECEIVE_SERVER"><%--Receive GUARD 서버--%></th>
                            <td>
                                <c:choose>
                                    <c:when test="${customer.rguardUseYn && customer.equipmentInstallYn}">${rguardServer.name} (${rguardServer.ip})</c:when>
                                    <c:otherwise>
                                        -
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_SEND_SERVER"><%--Send GUARD 서버--%></th>
                            <td>
                                <c:choose>
                                    <c:when test="${customer.sendUseYn && customer.equipmentInstallYn}">${sguardServer.name} (${sguardServer.ip})</c:when>
                                    <c:otherwise>
                                        -
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CUSTOMER_INFO"><%--고객사 정보--%></h1>
                </div>

                <div class="b-tableWrap mt20 ofx-h">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_CUSTOMER_INFO"><%--고객사 정보--%></caption>
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
                            <th class="trn" data-trn-key="TR_CLOUD_INSTALL_GUBUN"><%--설치 구분--%></th>
                            <td colspan="3">
                                <c:if test="${customer == null or customer.serviceUseGubun == 'U'}">
                                    <span class="trn" data-trn-key="TR_CLOUD_PRACTICAL_USE"><%--실사용--%></span>
                                </c:if>
                                <c:if test="${customer.serviceUseGubun != 'U'}">
                                    BMT
                                </c:if>
                            </td>
                        </tr>
<%--                            <c:if test="${!customer.equipmentInstallYn}">--%>
                            <tr>
                                <th class="trn" data-trn-key="TR_CLOUD_SECU_EQUIP_GUBUN"><%--보안장비 종류--%></th>
                                <td colspan="3">

                                    <c:if test="${customer.spamUseYn}">
                                        <span>SpamGUARD</span>
                                    </c:if>

                                    <c:if test="${customer.rguardUseYn}">
                                        <span class='${customer.spamUseYn ? "ml30" : ""}'>ReceiveGUARD</span>
                                    </c:if>

                                    <c:if test="${customer.sendUseYn}">
                                        <span class='${customer.spamUseYn || customer.rguardUseYn ? "ml30" : ""}'>SendGUARD</span>
                                    </c:if>

                                </td>
                            </tr>
<%--                        </c:if>--%>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_COMPANY_NAME"><%--기업명--%></th>
                            <td>
                                ${customer.name}
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_COMPANY_BUSINESS_YN"><%--기업형태--%></th>
                            <td>
                                <c:if test="${customer.businessYn}">
                                    <span class="trn" data-trn-key="TR_CORPORATE_BODY"><%--법인--%></span>
                                </c:if>
                                <c:if test="${!customer.businessYn}">
                                    <span class="trn" data-trn-key="TR_INDIVIDUAL"><%--개인--%></span>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_REP_NAME"><%--대표자 이름--%></th>
                            <td>
                                ${customer.repName}
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_REP_PHONE_NUMBER"><%--대표자 핸드폰번호--%></th>
                            <td>
                                ${customer.repPhone}
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_REP_TEL_NUMBER"><%--대표 전화번호--%></th>
                            <td>
                                ${customer.tel}
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_REP_FAX_NUMBER"><%--팩스번호--%></th>
                            <td>
                                ${customer.fax}
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_REP_EMAIL"><%--대표 이메일--%></th>
                            <td colspan="3">
                                ${customer.email}
                            </td>
                        </tr>
                        <tr class="${customer.serviceUseGubun eq 'B' ? "dis_n" : ""}">
                            <th class="trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL"><%--세금 계산서 발행 이메일--%></th>
                            <td colspan="3">
                                ${customer.vatBillEmail}
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_BUSINESS_NUMBER"><%--사업자등록번호--%></th>
                            <td>
                                ${customer.businessNumber}
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_EMPLOY_COUNT"><%--총 임직원수--%></th>
                            <td>
                                ${customer.employCount}
                            </td>
                        </tr>
                        <tr class="${customer.businessYn? 'dis_n' : ''}">
                            <th class="trn" data-trn-key="TR_BIRTH_DATE"><%--생년월일--%></th>
                            <td class="individualArea" colspan="3">
                                ${customer.birthDate}
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_BUSINESS_TYPE"><%--업종--%></th>
                            <td colspan="3">
                                <span>
                                    ${businessCode1}
                                </span>
                                -<span>
                                ${businessCode2}
                            </span>
                                -<span>
                                ${businessCode3}
                            </span>
                            </td>
                        </tr>

                        <tr>
                            <th class="trn" data-trn-key="TR_ADDR"><%--주소--%></th>
                            <td colspan="3">
                                <span class="dis_b">(${customer.zipcode})</span>
                                <span class="dis_b">${customer.addr}</span>
                                <span class="dis_b">${customer.addrDetail}</span>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_APPLY_FORM_FILE"><%--사업자등록증--%></th>
                            <td colspan="3">
                                <c:choose>
                                    <c:when test="${applyFormFile.idx > 0}">
                                        <a href="/file/download/${applyFormFile.idx}">${applyFormFile.name}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="trn" data-trn-key="TR_NO_FILE_MSG"><%--등록된 파일이 없습니다.--%></span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <%-- LINE :: 온라인 신청 데이터인 경우 메모란 비노출 --%>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_MEMO"><%--메모--%></th>
                            <td colspan="3" style="white-space: pre-wrap;">${customer.memo}</td>
                        </tr>
                        <tr class="table-head">
                            <th colspan="4" class="a_left strong">
                                <span class="form-maintitle trn" data-trn-key="TR_CLOUD_ADMIN_INFO"><%--담당자 정보--%></span>
                            </th>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_ADMIN_INFO_NAME"><%--담당자 정보 (이름/직책)--%></th>
                            <td>
                                ${customer.adminName} &nbsp;/&nbsp; ${customer.adminPosition}
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_PHONE_NUMBER"><%--핸드폰 번호--%></th>
                            <td>
                                ${customer.adminPhone}
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_ADMIN_SUB_EMAIL"><%--보조 이메일--%></th>
                            <td colspan="3">
                                ${customer.adminSubEmail}
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_APPLY_INFO"><%--신청 정보--%></h1>
                </div>

                <div class="b-tableWrap over-x__n mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_CLOUD_APPLY_INFO"><%--신청 정보--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>신청일자</th>
                            <td ${customer.serviceUseGubun eq 'B' ? 'colspan="3"' : ''}>
                                ${customer.applyDate}
                            </td>
                            <th class="${customer.serviceUseGubun eq 'B' ? "dis_n" : ""} trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL"><%--세금 계산서 발행일--%></th>
                            <td class="${customer.serviceUseGubun eq 'B' ? "dis_n" : ""}">
                                ${customer.formatedVatBillDate}
                            </td>
<%--                            <th>서비스 적용 희망 날짜</th>--%>
<%--                            <td>--%>
<%--                                ${customer.formatedServiceChangeHopeDate}--%>
<%--                            </td>--%>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_CONTRACT_PERIOD"><%--계약 기간--%></th>
                            <td>
                                <c:if test="${customer.contractPeriodYn}">
                                    <span class="trn" data-trn-key="TR_YES"><%--있음--%></span>
                                </c:if>
                                <c:if test="${!customer.contractPeriodYn}">
                                    <span class="trn" data-trn-key="TR_NONE"><%--없음--%></span>
                                </c:if>
                            </td>
                            <th class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY"><%--납부 방식--%></th>
                            <td class="red-txt">
                                <c:if test="${customer.paymentWay != 'Y'}">
                                    <span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_M"><%--월납--%></span>
                                </c:if>
                                <c:if test="${customer.paymentWay == 'Y'}">
                                    <span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_Y"><%--연납--%></span>
                                </c:if>
                            </td>
                        </tr>

                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_SERVICE_START_DATE"><%--서비스 적용일--%></th>
                            <td>
                                ${customer.formatedServiceChangeHopeDate}
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_SERVICE_END_DATE"><%--서비스 종료일--%></th>
                            <td>
                                ${customer.serviceEndDate != null ? customer.formatedServiceEndDate : "-" }
                            </td>
                        </tr>

                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_TOTAL_ACCOUNT_COUNT"><%--총 계정 수--%></th>
                            <td colspan="3">
                                <span class="dis_ib w50">${customer.applyAccountCount}<span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span></span>
                                <span class="fc-blue">(
                                    <c:if test="${customer.fullUseYn}">
                                        <span class="trn" data-trn-key="TR_ALL_USE"><%--전체 사용--%></span>
                                    </c:if>
                                    <c:if test="${!customer.fullUseYn}">
                                        <span class="trn" data-trn-key="TR_PART_USE"><%--일부 사용--%></span>
                                    </c:if>
                                )</span>
                            </td>
                        </tr>
                        <%-- LINE :: 일부 사용인 경우에만 노출 --%>
                        <c:if test="${!customer.fullUseYn}">
                            <tr>
                                <th class="trn" data-trn-key="TR_CLOUD_UNUSE_ACCOUNT_COUNT"><%--미사용 계정 수--%></th>
                                <td colspan="3">
                                    <span class="dis_ib w50">${unUsedAccountCount}<span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span></span>
                                    <a href="javaScript:;" class="dis_ib fc-blue" onclick="location.href='/file/download/${unusedIdFile.idx}'"><i class="ico-file-down"></i>${unusedIdFile.name}</a>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_APPLY_DOMAIN"><%--신청 도메인--%></th>
                            <td colspan="3">
                                <span class="dis_b">
                                    @&nbsp;${customer.applyMainDomain}
                                </span>
                                <c:forEach var="subDomain" items="${domainList}">
                                    <span class="dis_b">
                                        @&nbsp;${subDomain.domain}
                                    </span>
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th rowspan="2" class="trn" data-trn-key="TR_CLOUD_NAME_SERVER_IN_USE"><%--사용 네임서버--%></th>
                            <td colspan="3">
                                <c:if test="${customer.nameServerUseYn}">
                                    <span class="trn" data-trn-key="TR_CLOUD_KIWONTECH_NAME_SERVER"><%--기원테크 네임서버--%></span>
                                </c:if>
                                <c:if test="${!customer.nameServerUseYn}">
                                    <span class="trn" data-trn-key="TR_CLOUD_SEPARATE_NAME_SERVER"><%--별도 네임서버--%></span>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <c:if test="${customer.recordFileEmptyYn}"><span class="trn" data-trn-key="TR_CLOUD_RECORD_FILE_IS_EMPTY"><%--레코드 정보 없음--%></span></c:if>
                                <c:if test="${!customer.recordFileEmptyYn}">
                                    <br><a href="/file/download/${dnsRecordFile.idx}">${dnsRecordFile.name}</a>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="">Mail Server IP</th>
                            <td colspan="3" id="mailServerIpList">
                                <c:forEach var="mailServerIp" items="${mailServerIpList}">
                                    <span class="dis_b">${mailServerIp.ip}</span>
                                </c:forEach>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <section class="mt30">
                            <div class="b-title">
                                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_SECU_EQUIP_ACCESS_INFO"><%--보안장비 접속정보--%></h1>
                            </div>
                            <div class="b-tableWrap mt20">
                                <table class="b-listTable b-listTable--border">
                                    <caption class="offscreen trn" data-trn-key="TR_CLOUD_SECU_EQUIP_ACCESS_INFO"><%--보안장비 접속정보--%></caption>
                                    <colgroup>
                                        <col width="20%">
                                        <col width="30%">
                                        <col width="20%">
                                        <col width="30%">
                                    </colgroup>
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_GROUP_ACCESS_IP"><%--그룹관리자 IP--%></th>
                                        <td colspan="3">
                                            ${customer.guardAccessIp}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_ADMIN_ACCOUNT_ID"><%--관리자 계정 ID--%></th>
                                        <td>
                                            ${customer.guardAdminId}
                                        </td>
                                        <th class="trn" data-trn-key="TR_CLOUD_ADMIN_ACCOUNT_PW"><%--관리자 계정 임시 비밀번호--%></th>
                                        <td>
                                            ${customer.guardAdminPw}
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </section>

                        <section class="mt30">
                            <div class="b-title">
                                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_MAIL_BACKUP"><%--메일 백업--%></h1>
                            </div>
                            <div class="b-tableWrap mt20">
                                <table class="b-listTable b-listTable--border">
                                    <caption class="offscreen trn" data-trn-key="TR_CLOUD_MAIL_BACKUP"><%--메일 백업--%></caption>
                                    <colgroup>
                                        <col width="20%">
                                        <col width="30%">
                                        <col width="20%">
                                        <col width="30%">
                                    </colgroup>
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_MAIL_BACKUP_SERVICE_USE_YN"><%--메일 백업 서비스 사용여부--%></th>
                                        <td colspan="3">
                                            <c:if test="${customer.mailBackupUseYn}">
                                                <span class="trn" data-trn-key="TR_USE"><%--사용--%></span>
                                            </c:if>
                                            <c:if test="${!customer.mailBackupUseYn}">
                                                <span class="trn" data-trn-key="TR_UNUSE"><%--미사용--%></span>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <c:if test="${customer.mailBackupUseYn}">
                                        <tr>
                                            <th rowspan="2" class="trn" data-trn-key="TR_CLOUD_MAIL_BACKUP_SETTING"><%--메일 백업 설정--%></th>
                                            <td colspan="3">
                                                <c:if test="${customer.mailBackupType == 'E'}">
                                                    Exchange
                                                </c:if>
                                                <c:if test="${customer.mailBackupType != 'E'}">
                                                    <span class="trn" data-trn-key="TR_CLOUD_MAIL_BACKUP_OTHER_STORAGE_SERVER"><%--별도 Storage 서버--%></span>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <div class="conView_multyBox mb10 fs13" style="width: 750px;">
                                                    <ul>
                                                        <c:if test="${customer.mailBackupType == 'E'}">
                                                            <c:set var="accountSize" value="${fn:length(exchangeAccountList)}" />
                                                            <c:forEach items="${exchangeAccountList}" var="account" varStatus="status">
                                                                <li class="o_h">
                                                                    <span class="dis_ib w25">${accountSize - status.index}</span>
                                                                    <span class="w270 dis_ib ml10">${account.account}</span>
                                                                    <span class="dis_ib w150 ml10">
                                                                        <c:if test="${customer.exchangeSaveYn}">
                                                                            <span class="trn" data-trn-key="TR_USE"><%--사용--%></span>
                                                                        </c:if>
                                                                        <c:if test="${!customer.exchangeSaveYn}">
                                                                            <span class="trn" data-trn-key="TR_UNUSE"><%--미사용--%></span>
                                                                        </c:if>
                                                                    </span>
                                                                </li>
                                                            </c:forEach>
                                                        </c:if>
                                                        <c:if test="${customer.mailBackupType == 'S'}">
                                                            <c:set var="storageServerSize" value="${fn:length(storageServerInfo)}" />
                                                            <c:forEach items="${storageServerInfo}" var="storageServer" varStatus="status">
                                                                <li class="o_h">
                                                                    <span class="dis_ib w25">${storageServerSize - status.index}</span>
                                                                    <span class="w250 mr10 dis_ib a-center">${storageServer.ip}</span>
                                                                    :
                                                                    <span class="w100 ml10 dis_ib">${storageServer.port}</span>
                                                                    <span class="dis_ib w100">
                                                                        <c:if test="${customer.tlsUseYn}">
                                                                            <span class="trn" data-trn-key="TR_CLOUD_TLS_USE"><%--TLS 사용--%></span>
                                                                        </c:if>
                                                                        <c:if test="${!customer.tlsUseYn}">
                                                                            <span class="trn" data-trn-key="TR_CLOUD_TLS_UNUSE"><%--TLS 미사용--%></span>
                                                                        </c:if>
                                                                    </span>
                                                                    <span class="dis_ib w100">
                                                                        <c:if test="${customer.useYn}">
                                                                            <span class="trn" data-trn-key="TR_USE"><%--사용--%></span>
                                                                        </c:if>
                                                                        <c:if test="${!customer.useYn}">
                                                                            <span class="trn" data-trn-key="TR_UNUSE"><%--미사용--%></span>
                                                                        </c:if>
                                                                    </span>
                                                                </li>
                                                            </c:forEach>
                                                        </c:if>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:if>

                                </table>
                            </div>
                        </section>
                        <section class="mt30">
                            <div class="b-title">
                                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_RELATED_PARTNER_INFO"><%--관련 파트너사 정보--%></h1>
                            </div>
                            <div class="b-list">
                                <div class="b-tableWrap mt20">
                                    <table class="b-listTable">
                                        <caption class="offscreen trn" data-trn-key="TR_CLOUD_RELATED_PARTNER_INFO"><%--관련 파트너사 정보--%></caption>
                                        <colgroup>
                                            <col width="10%">
                                            <col width="30%">
                                            <col width="10%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="25%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th class="a-center trn" data-trn-key="TR_CLOUD_SALES_YN"><%--영업 여부--%></th>
                                            <th class="a-center trn" data-trn-key="TR_CLOUD_PARTNER_NAME"><%--파트너사 명--%></th>
                                            <th class="a-center">STEP</th>
                                            <th class="a-center trn" data-trn-key="TR_CLOUD_COST_PER_ACCOUNT"><%--계정당 마진금액--%></th>
                                            <th class="a-center trn" data-trn-key="TR_CLOUD_MARGIN_RATE"><%--마진율--%></th>
                                            <th class="a-center trn" data-trn-key="TR_CLOUD_PARTNER_MARGIN_PRICE"><%--마진 금액--%></th>
                                        </tr>
                                        </thead>
                                        <tbody id="partnerInfoArea">
                                        <c:if test="${customer != null}">
                                            <c:if test="${empty partnerMarginInfo}">
                                                <tr>
                                                    <td class="a-center trn" data-trn-key="TR_CLOUD_NO_PARTNER_MARGIN_INFO" colspan="6">
                                                        <%--파트너사 마진금액관련 데이터가 존재하지않습니다.--%>
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:if test="${not empty partnerMarginInfo}">
                                                <c:forEach items="${partnerMarginInfo}" var="marginInfo">
                                                    <tr>
                                                        <td class="a-center">
                                                            <c:if test="${marginInfo.salesYn}">
                                                                <img src="/resources/images/icon/check_ico.png">
                                                            </c:if>
                                                        </td>
                                                        <td class="a-center">${marginInfo.name}</td>
                                                        <td class="a-center">
                                                            <c:choose>
                                                                <c:when test="${marginInfo.step == 'Z'}">
                                                                    ZeroStep
                                                                </c:when>
                                                                <c:when test="${marginInfo.step == 'O'}">
                                                                    OneStep
                                                                </c:when>
                                                                <c:otherwise>
                                                                    BelowStep
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="a-center">
                                                            <fmt:formatNumber value="${marginInfo.costPerAccount}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                                        </td>
                                                        <td class="a-center">
                                                            ${marginInfo.marginRate} %
                                                        </td>
                                                        <td class="a-center">
                                                            <fmt:formatNumber value="${marginInfo.marginPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>
                        <c:if test="${customer.serviceUseGubun == 'U'}">
                            <section class="mt30">
                                <div class="b-title">
                                    <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_PAYMENT_DETAIL_INFO"><%--결제 상세 정보--%></h1>
                                </div>
                                <div class="b-tableWrap mt20 over-x__n">
                                    <table class="b-listTable b-listTable--border">
                                        <caption class="offscreen trn" data-trn-key="TR_CLOUD_PAYMENT_DETAIL_INFO"><%--결제 상세 정보--%></caption>
                                        <colgroup>
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                            <c:if test="${customer.paymentWay == 'Y'}">
                                                <col width="20%">
                                            </c:if>
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th class="a-center trn" data-trn-key="TR_COMMON_CONTENTS"><%--내용--%></th>
                                            <th class="a-center trn" data-trn-key="TR_CLOUD_MARGIN_RATE"><%--마진율--%></th>
                                            <th class="a-center trn" data-trn-key="TR_CLOUD_COST_PER_ACCOUNT"><%--계정당 마진 금액--%></th>
                                            <th class="a-center trn" data-trn-key="TR_CLOUD_ADDITIONAL_PRICE_MONTHLY"><%--월 부가서비스 이용 금액--%></th>
                                            <th class="a-center trn" data-trn-key="TR_CLOUD_PRICE_MONTHLY"><%--월 금액--%></th>
                                            <c:if test="${customer.paymentWay == 'Y'}">
                                                <th class="a-center"><span class="paymentYearArea" id="formatServiceUsePeriod"><fmt:parseNumber value="${customer.serviceUsePeriod/12}" integerOnly="true"/></span><span class="trn" data-trn-key="TR_CLOUD_PRICE_ANNUAL"><%--년 금액--%></span></th>
                                            </c:if>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th class="trn" data-trn-key="TR_CLOUD_CONSUMER_TOTAL_PRICE"><%--소비자 총 금액--%></th>
                                            <td> - </td>
                                            <td>
                                                <fmt:formatNumber value="${customer.costPerAccount}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${customerPartnerCalc.additionalPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${customerPartnerCalc.consumerPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td class="paymentYearArea ${customer.paymentWay == 'M' ? 'dis_n' : ''}">
                                                <span id="consumerPriceYearlyArea"><fmt:formatNumber value="${customerPartnerCalc.consumerPrice * customer.serviceUsePeriod}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="trn" data-trn-key="TR_CLOUD_PARTNER_MARGIN_TOTAL_PRICE"><%--파트너사 총 마진금액--%></th>
                                            <td>
                                                ${customerPartnerCalc.marginRate} %
                                            </td>
                                            <td>
                                                <span id="partnerCostPerAccountArea">
                                                    <fmt:formatNumber value="${(customerPartnerCalc.marginPrice - customerPartnerCalc.partnerAdditionalPrice) / customer.applyAccountCount}" pattern="#,###"/>
                                                </span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${customerPartnerCalc.partnerAdditionalPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td>
                                                <span id="partnerPaymentMonthArea"><fmt:formatNumber value="${(customerPartnerCalc.consumerPrice - customerPartnerCalc.supplyPrice)}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td class="paymentYearArea ${customer.paymentWay == 'M' ? 'dis_n' : ''}">
                                                <span id="partnerMarginPriceYearlyArea"><fmt:formatNumber value="${(customerPartnerCalc.consumerPrice - customerPartnerCalc.supplyPrice) * customer.serviceUsePeriod}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="trn" data-trn-key="TR_CLOUD_KIWONTECH_MARGIN_TOTAL_PRICE"><%--기원테크 총 마진금액--%></th>
                                            <td class="red-txt">
                                                <span id="supplyMarginRateArea"><fmt:formatNumber value="${100 - customerPartnerCalc.marginRate}" pattern="#,###"/></span> %
                                            </td>
                                            <td class="red-txt">
                                                <span id="supplyCostPerAccountArea">
                                                    <fmt:formatNumber value="${(customerPartnerCalc.supplyPrice - (customerPartnerCalc.additionalPrice - customerPartnerCalc.partnerAdditionalPrice)) / customer.applyAccountCount}" pattern="#,###"/>
                                                </span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td class="red-txt">
                                                <fmt:formatNumber value="${customerPartnerCalc.additionalPrice - customerPartnerCalc.partnerAdditionalPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td class="red-txt">
                                                <fmt:formatNumber value="${customerPartnerCalc.supplyPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td class="red-txt paymentYearArea ${customer.paymentWay == 'M' ? 'dis_n' : ''}">
                                                <span id="supplyPaymentYearlyArea"><fmt:formatNumber value="${customerPartnerCalc.supplyPrice * customer.serviceUsePeriod}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                        </tr>
                                        </tbody>

                                    </table>
                                </div>
                            </section>
                        </c:if>

                        <section class="mt30">
                            <div class="b-title">
                                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_PARTNER_INFO"><%--파트너사 정보--%></h1>
                            </div>
                            <div class="b-tableWrap mt20">
                                <table class="b-listTable b-listTable--border">
                                    <caption class="offscreen trn" data-trn-key="TR_CLOUD_PARTNER_INFO"><%--파트너사 정보--%></caption>
                                    <colgroup>
                                        <col width="20%">
                                        <col width="30%">
                                        <col width="20%">
                                        <col width="30%">
                                    </colgroup>
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_PARTNER_NAME"><%--파트너사명--%></th>
                                        <td>
                                            <span>${partnerInfo.name}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_ADMIN_NAME"><%--담당자명--%></th>
                                        <td>
                                            ${applyPartnerInfo.adminName}
                                        </td>
                                        <th class="trn" data-trn-key="TR_CLOUD_ADMIN_PHONE_NUM"><%--담당자 핸드폰 번호--%></th>
                                        <td>
                                            ${applyPartnerInfo.adminPhone}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_ADMIN_EMAIL"><%--담당자 이메일--%></th>
                                        <td colspan="3">
                                            ${applyPartnerInfo.adminEmail}
                                        </td>
                                    </tr>
                                    <tr class="${customer.serviceUseGubun == 'U' ? "" : "dis_n"}">
                                        <th class="trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL"><%--세금 계산서 발행 이메일--%></th>
                                        <td colspan="3">
                                            ${applyPartnerInfo.adminVatBillEmail}
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </section>
                        <section class="mt30">
                            <div class="b-title mb10">
                                <h1 class="b-title__title trn" data-trn-key="TR_COMMON_COMMENT"><%--코멘트--%></h1>
                                <input type="button" class="btn-baseRound ml10" value="등록" onclick="commentPopup();">
                            </div>

                            <div class="b-tableWrap">
                                <table class="b-listTable">
                                    <caption class="offscreen trn" data-trn-key="TR_COMMON_COMMENT"><%--코멘트--%></caption>
                                    <colgroup>
                                        <col width="5%">
                                        <col width="55%">
                                        <col width="20%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th class="strong trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                                        <th class="strong trn" data-trn-key="TR_COMMON_CONTENTS"><%--내용--%></th>
                                        <th class="strong trn" data-trn-key="TR_COMMON_REGDATE"><%--등록일--%></th>
                                        <th class="strong trn" data-trn-key="TR_COMMON_REGISTRANT"><%--등록자--%></th>
                                    </tr>
                                    </thead>
                                    <tbody id="commentList">

                                    </tbody>
                                </table>
                            </div>
                            <form id="commentPageForm">
                                <input type="hidden" id="pageNo" name="pageNo" value="1">
                                <input type="hidden" id="customerIdx" name="customerIdx" value="${customer.idx}">
                            </form>
                            <div id="pagingArea"></div>
                        </section>
                    </div>
                </div>
            </section>
        </div>

        <section class="mt30 ${customer.contractPeriodYn == false ? "dis_n" : ""}">
            <div class="b-title mb10">
                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_CONTRACT_EXTENSION_STATUS"><%--계약 연장현황--%></h1>
                <input type="button" class="btn-baseRound ml10 trn" data-trn-value="TR_COMMON_REGISTRATION" value="등록" onclick="renewalPopup()">
            </div>

            <div class="b-tableWrap">

                <table class="b-listTable">
                    <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="*%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                        <th class="trn" data-trn-key="TR_CLOUD_CONTRACT_PERIOD"><%--계약기간--%></th>
                        <th class="trn" data-trn-key="TR_CLOUD_ADD_PRICE"><%--추가금액--%></th>
                        <th class="trn" data-trn-key="TR_COMMON_REGISTRANT"><%--등록자--%></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${fn:length(renewalData) <= 0}">
                        <tr>
                            <td colspan="4" class="nodata trn" data-trn-key="TR_COMMON_NODATA"><%--데이터가 존재하지 않습니다.--%></td>
                        </tr>
                    </c:if>
                    <c:if test="${fn:length(renewalData) > 0}">
                        <c:set var="renewalSize" value="${fn:length(renewalData)}"></c:set>
                        <c:forEach items="${renewalData}" var="renewal" varStatus="status">

                            <tr onclick="renewalPopup(${renewal.idx})">
                                <td class="a-center">${renewalSize - status.index}</td>
                                <td class="a-center">${renewal.formatedServiceStartDate} ~ ${renewal.formatedServiceEndDate}</td>
                                <td class="a-center"><fmt:formatNumber value="${renewal.addPrice}" pattern="#,###"/></td>
                                <td class="a-center">${renewal.regId}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5 trn" data-trn-value="TR_COMMON_DELETE" value="" onclick="deleteAjax(${customer.idx})"><%--삭제--%>

                <%-- LINE :: 서비스 구분이 B(BMT)면서, 장비 설치 구분 true(설치완료)인 경우 --%>
                <c:if test="${customer.serviceUseGubun == 'B' && customer.equipmentInstallYn}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_CLOUD_CHANGE_PRACTICAL_USE" value="실사용 전환" onclick="location.href='practicalUse?idx=${customer.idx}'">
                </c:if>
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_MODIFIED" value="수정" onclick="location.href='form?idx=${customer.idx}'">
            <%-- LINE :: 장비 설치 구분 true(설치완료)인 경우 --%>
            <c:if test="${!customer.equipmentInstallYn}">
                <input type="button" class="btn-base btn-detail btn-large mr5 trn" data-trn-value="TR_COMMON_INSTALL" value="설치" onclick="equipmentInstallPopup(${customer.idx})">
            </c:if>
            <%--LINE :: 해당 데이터에 결제할 금액이 존재할 경우--%>
            <c:if test="${customerPartnerCalc.consumerPrice > 0}">
                <c:choose>
                    <c:when test="${customer.paymentCompleteYn eq null}">
                        <%-- LINE :: 결제 처리가 되지 않았을 경우--%>
                        <input type="button" class="btn-base btn-large mr5 trn" data-trn-value="TR_CLOUD_PAYMENT" value="결제" onclick="updatePaymentCompleteYn(true)" style="color: #0b94d1">
                        <input type="button" class="btn-base btn-large mr5 trn" data-trn-value="TR_CLOUD_MAIL_PAYMENT_COMPLETE_YN_N" value="미결제" onclick="updatePaymentCompleteYn(false)" style="color: #9c3328">
                    </c:when>
                    <c:when test="${!customer.paymentCompleteYn}">
                        <%--LINE :: 결제 미완료일 경우--%>
                        <input type="button" class="btn-base btn-large mr5 trn" data-trn-value="TR_CLOUD_PAYMENT" value="결제" onclick="updatePaymentCompleteYn(true)" style="color: #0b94d1">
                    </c:when>
                </c:choose>
            </c:if>
            <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_LIST" value="목록" onclick="moveList()">
        </div>
        <input type="hidden" name="blankValue">
    </div>
</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>