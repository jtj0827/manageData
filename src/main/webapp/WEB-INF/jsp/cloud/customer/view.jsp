<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CLOUD_TITLE3"><%--고객사 관리--%></h1>

    <div class="l-maxwrap">
        <input type="hidden" id="serviceChangeHopeDate" value="${customer.formatedServiceChangeHopeDate}">
        <input type="hidden" id="serviceUsePeriod" value="${customer.serviceUsePeriod}">
        <input type="hidden" id="approvalState" value="${customer.approvalState}"/>
        <input type="hidden" id="equipmentInstallYn" value="${customer.equipmentInstallYn}"/>
        <input type="hidden" id="secuEcloudGubun" value="${customer.secuEcloudGubun}">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${customer.idx}">
<%--            <input type="hidden" name="mailServerDomainIdx" id="mailServerDomainIdx" value="${customer.idx}">--%>
            <c:forEach items="${domainList}" var="domain">
                <c:if test="${domain.default_option == true}">
                    <input type="hidden" name="domain_idx" id="mailServerDomainIdx" value="${domain.domain_idx}">
                </c:if>
            </c:forEach>
            <input type="hidden" name="paymentCompleteYn" id="paymentCompleteYn" value="">
        </form>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_AZURE_ACCOUNT_INFO"><%--Azure 계정 정보--%></h1>
                <input type="button" class="mViewBtn_permit" value="+" style="width: 30px; float: right" onclick="addAccountPopup(${customer.idx})">
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_CLOUD_AZURE_ACCOUNT_INFO"><%--Azure 계정 정보--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_EXCHANGE_ACCOUNT"><%--메일(Exchange) 계정--%></th>
                        <td colspan="3">
                            <c:if test="${fn:length(exchangeAccountList) <= 0}">
                                <span class="trn" data-trn-key="TR_UNSPECIFIED"><%--미지정--%></span>
                            </c:if>
                            <c:forEach items="${exchangeAccountList}" var="exchangeAccount" varStatus="status">
                                <c:if test="${status.index != 0}">
                                    ,&nbsp;
                                </c:if>
                                ${exchangeAccount.account}
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_ONEDRIVE_ACCOUNT"><%--그룹웨어(OneDrive) 계정--%></th>
                        <td colspan="3">
                            <c:if test="${fn:length(onedriveAccountList) <= 0}">
                                <span class="trn" data-trn-key="TR_UNSPECIFIED"><%--미지정--%></span>
                            </c:if>
                            <c:forEach items="${onedriveAccountList}" var="onedriveAccount" varStatus="status">
                                <c:if test="${status.index != 0}">
                                    ,&nbsp;
                                </c:if>
                                ${onedriveAccount.account}
                            </c:forEach>
                        </td>
                    </tr>
                </table>
            </div>
        </section>

        <c:if test="${customer.equipmentInstallYn}">
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_EQUIPMENT_INSTALL_INFO"><%--장비 설치 정보--%></h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_ADDITIONAL_INFO"><%--부가정보--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_SPAM_GUARD_SERVER"><%--SpamGUARD 서버--%></th>
                            <td colspan="3">${spamServer.name} (${spamServer.ip})</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_RECEIVE_GUARD_SERVER"><%--ReceiveGUARD 서버--%></th>
                            <td colspan="3">${rguardServer.name} (${rguardServer.ip})</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_SEND_GUARD_SERVER"><%--SendGUARD 서버--%></th>
                            <td colspan="3">${sguardServer.name} (${sguardServer.ip})</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_SECU_MAIL_SERVER"><%--SecuMail 서버--%></th>
                            <td colspan="3">${secumailServer.name} (${secumailServer.ip})</td>
                        </tr>
                        <c:if test="${customer.secuEcloudGubun eq 'N'}">
                            <tr>
                                <th class="trn" data-trn-key="TR_EML_GENERATOR_SERVER"><%--EML 생성기 서버--%></th>
                                <td colspan="3">${emlGeneratorServer.name} (${emlGeneratorServer.ip})</td>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </section>
        </c:if>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_CUSTOMER_INFO"><%--고객사 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
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
                        <th class="trn" data-trn-key="TR_OPERATION_METHOD"><%--운영 방식--%></th>
                        <td>${customer.operationType eq 'A' ? "Appliance" : "Cloud"}</td>
                        <th class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN" style="color: #fb4949"><%--Secu E Cloud 서비스 종류--%></th>
                        <td>
                            <c:if test="${customer.secuEcloudGubun eq 'I'}">I-Service</c:if>
                            <c:if test="${customer.secuEcloudGubun eq 'P'}">P-Service</c:if>
                            <c:if test="${customer.secuEcloudGubun eq 'N'}"><span class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_N"><%--P-Service(신규)--%></span></c:if>
                            <c:if test="${customer.secuEcloudGubun eq 'O'}"><span class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_O"><%--기존 메일--%></span></c:if>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_COMPANY_NAME"><%--기업명--%></th>
                        <td>${customer.name}</td>
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
                        <td>${customer.repName}</td>
                        <th class="trn" data-trn-key="TR_CLOUD_REP_NAME"><%--대표자 핸드폰번호--%></th>
                        <td>${customer.repPhone}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_REP_TEL_NUMBER"><%--대표 전화번호--%></th>
                        <td>${customer.tel}</td>
                        <th class="trn" data-trn-key="TR_CLOUD_REP_FAX_NUMBER"><%--팩스번호--%></th>
                        <td>${customer.fax}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_REP_EMAIL"><%--대표 이메일--%></th>
                        <td colspan="3">${customer.email}</td>
                    </tr>
                    <c:if test="${customer.secuEcloudGubun == 'P'}">
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL"><%--세금 계산서 발행 이메일--%></th>
                            <td colspan="3">${customer.vatBillEmail}</td>
                        </tr>
                    </c:if>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_BUSINESS_NUMBER"><%--사업자 등록번호--%></th>
                        <td>${customer.businessNumber}</td>
                        <th class="trn" data-trn-key="TR_CLOUD_EMPLOY_COUNT"><%--총 임직원 수--%></th>
                        <td><fmt:formatNumber value="${customer.employCount}" pattern="#,###"/> <spam class="trn" data-trn-key="TR_PEOPLE"><%--명--%></spam></td>
                    </tr>
                    <%-- LINE :: 사업자 여부 false(개인)인 경우 노출 --%>
                    <c:if test="${!customer.businessYn}">
                        <tr>
                            <th class="trn" data-trn-key="TR_BIRTH_DATE"><%--생년월일--%></th>
                            <td colspan="3">${customer.birthDate}</td>
                        </tr>
                    </c:if>
                    <c:if test="${customer.approvalState eq 'A'}">
                        <tr>
                            <th class="trn" data-trn-key="TR_SERVICE_USE"><%--서비스 사용--%></th>
                            <td>
                                <c:if test="${customer.servicePauseYn}">
                                    <input type="button" class="btn btn-baseRound trn" data-trn-value="TR_CLOUD_NONE_STOP_SERVICE" style="color:#fb4949;" value="" onclick="updateServicePauseAjax(${customer.servicePauseYn}, ${customer.idx})">
                                </c:if>
                                <c:if test="${customer.servicePauseYn}">
                                    <input type="button" class="btn btn-baseRound trn" data-trn-value="TR_CLOUD_NONE_STOP_SERVICE" style="color:#fb4949;" value="" onclick="updateServicePauseAjax(${customer.servicePauseYn}, ${customer.idx})">
                                </c:if>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_ORD_MAIL_BTN_USE"><%--구메일 버튼 사용--%></th>
                            <td>
                                <c:if test="${customer.oldmailBtnUseYn}">
                                    <input type="button" class="btn btn-baseRound trn" data-trn-value="TR_CLOUD_ORD_MAIL_BTN_UNUSE" style="color:#fb4949;" value="구메일 버튼 미사용" onclick="updateOldmailBtnUseAjax(${customer.oldmailBtnUseYn}, ${customer.idx})">
                                </c:if>
                                <c:if test="${!customer.oldmailBtnUseYn}">
                                    <input type="button" class="btn btn-baseRound trn" data-trn-value="TR_CLOUD_ORD_MAIL_BTN_USE" style="color:#fb4949;" value="구메일 버튼 사용" onclick="updateOldmailBtnUseAjax(${customer.oldmailBtnUseYn}, ${customer.idx})">
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <th class="trn" data-trn-key="TR_ADDR"><%--주소--%></th>
                        <td colspan="3">
                            <span class="dis_b">(${customer.zipcode})</span>
                            <span class="dis_b">${customer.addr}</span>
                            <span class="dis_b">${customer.addrDetail}</span>
                        </td>
                    </tr>
                    <%-- LINE :: 온라인 신청 데이터인 경우 메모란 비노출 --%>
                    <c:if test="${!customer.onlineApplyYn}">
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_MEMO"><%--메모--%></th>
                            <td colspan="3" style="white-space: pre-wrap;">${customer.memo}</td>
                        </tr>
                    </c:if>
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
                    <tr class="table-head">
                        <th colspan="4" class="a_left form-maintitle strong trn" data-trn-key="TR_CLOUD_MAIN_ADMIN_INFO">담당자 정보 1</th>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_ADMIN_INFO_NAME"><%--담당자 정보 (이름/직책)--%></th>
                        <td>${customer.adminName} / ${customer.adminPosition}
                        </td>
                        <th class="trn" data-trn-key="TR_PHONENUM"><%--휴대폰 번호--%></th>
                        <td>${customer.adminPhone}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_ADMIN_SUB_EMAIL"><%--보조 이메일--%></th>
                        <td>${customer.adminSubEmail}</td>
                        <th class="trn" data-trn-key="TR_CLOUD_ADMIN_ACCOUNT_ID"><%--관리자 계정 ID--%></th>
                        <td>${customer.adminId}</td>
                    </tr>
<%--                    <c:if test="${(customer.adminName2 ne null && customer.adminName2 ne '')}">--%>
<%--                        <tr class="table-head">--%>
<%--                            <th colspan="4" class="a_left form-maintitle strong">담당자 정보 2</th>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th>담당자 정보 (이름/직책)</th>--%>
<%--                            <td>${customer.adminName2} ${fn:length(customer.adminPosition2) > 0 ? '/' : ''} ${customer.adminPosition2}</td>--%>
<%--                            <th>휴대폰 번호</th>--%>
<%--                            <td>${customer.adminPhone2}</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th>보조 이메일</th>--%>
<%--                            <td>${customer.adminSubEmail2}</td>--%>
<%--                            <th>관리자 계정 ID</th>--%>
<%--                            <td>${customer.adminId2}</td>--%>
<%--                        </tr>--%>
<%--                    </c:if>--%>
                    <c:forEach var="subAdmin" items="${subAdminList}">
                        <tr class="table-head">
                            <th colspan="4" class="a_left form-maintitle strong trn" data-trn-key="TR_CLOUD_ADMIN_INFO"><%--담당자 정보--%></th>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_ADMIN_INFO_NAME"><%--담당자 정보 (이름/직책)--%></th>
                            <td>${subAdmin.adminName} / ${subAdmin.adminPosition}</td>
                            <th class="trn" data-trn-key="TR_PHONENUM"><%--휴대폰 번호--%></th>
                            <td>${subAdmin.adminPhone}</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_ADMIN_SUB_EMAIL"><%--보조 이메일--%></th>
                            <td colspan="3">${subAdmin.adminSubEmail}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </section>

        <section class="mt30">
            <div class="b-title mb10">
                <h1 class="b-title__title trn" data-trn-key="TR_COMMON_COMMENT"><%--코멘트--%></h1>
                <input type="button" class="btn-baseRound ml10 trn" data-trn-value="TR_COMMON_REGISTRATION" value="" onclick="commentPopup();"><%--등록--%>
            </div>

            <div class="b-tableWrap">

                <table class="b-listTable">
                    <caption class="offscreen trn" data-trn-key="TR_COMMON_REGISTRATION"><%--게시글 목록--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="*%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="trn" data-trn-key="TR_COMMON_PARTNER"><%--파트너사--%></th>
                        <th class="trn" data-trn-key="TR_COMMON_CONTENTS"><%--내용--%></th>
                        <th class="trn" data-trn-key="TR_COMMON_REGDATE"><%--등록일--%></th>
                        <th class="trn" data-trn-key="TR_COMMON_REGISTRANT"><%--등록자--%></th>
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

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_OTHER_INFO"><%--기타 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_OTHER_INFO"><%--기타 정보--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_BUSINESS_TYPE"><%--업종--%></th>
                        <td colspan="3">
                            <c:choose>
                                <c:when test="${businessCode1 eq null || businessCode1 eq ''}">
                                    <span class="trn" data-trn-key="TR_CLOUD_NONE_BUSINESS_TYPE_MSG"><%--업종 코드 없음--%></span>
                                </c:when>
                                <c:otherwise>
                                    ${businessCode1} ${fn:trim(businessCode2) ne '' ? ',' : ''} ${businessCode2} ${fn:trim(businessCode3) ne '' ? ',' : ''} ${businessCode3}
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </div>
        </section>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_APPLY_INFO"><%--신청 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_CLOUD_APPLY_INFO"><%--신청 정보--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_APPLY_DATE"><%--신청일자--%></th>
                        <td>${customer.applyDate}</td>
                        <th class="trn" data-trn-key="TR_CLOUD_SERVICE_CHANGE_HOPE_DATE"><%--서비스 적용 희망 날짜--%></th>
                        <td>${customer.formatedServiceChangeHopeDate}</td>

                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_APPLY_DOMAIN"><%--신청 도메인--%></th>
                        <td colspan="3">
                            <span class="dis_b">
                                <c:if test="${customer.ownDomainYn}">
                                    <span class="trn" data-trn-key="TR_CLOUD_RETAIN_EXISTING_DOMAIN"><%--기존 도메인 보유--%></span>
                                </c:if>
                                <c:if test="${!customer.ownDomainYn}">
                                    <span class="trn" data-trn-key="TR_CLOUD_NOT_RETAIN_EXISTING_DOMAIN"><%--기존 도메인 미보유--%></span>
                                </c:if>
                            </span>
                            <span><%--도메인--%></span> : ${customer.applyMainDomain}
                            <c:forEach items="${customerDomainList}" var="customerDomain" varStatus="status">
                                <c:if test="${!customerDomain.mainYn}">, ${customerDomain.domain}</c:if>
                            </c:forEach>
                        </td>
                    </tr>
                    <c:if test="${customer.ownDomainYn}">
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_NAME_SERVER_IN_USE" rowspan="${customer.nameServerUseYn ? '2' : '1'}">사용 네임서버</th>
                            <td colspan="3">
                                <c:if test="${customer.nameServerUseYn}">
                                    <span class="trn" data-trn-key="TR_CLOUD_KIWONTECH_NAME_SERVER"><%--기원테크 네임서버--%></span>
                                </c:if>
                                <c:if test="${!customer.nameServerUseYn}">
                                    <span class="trn" data-trn-key="TR_CLOUD_SEPARATE_NAME_SERVER"><%--별도 네임서버--%></span>
                                </c:if>
                            </td>
                        </tr>
                        <c:if test="${customer.nameServerUseYn}">
                            <tr>
                                <td colspan="3">
                                    <c:choose>
                                        <c:when test="${!customer.recordFileEmptyYn}">
                                            <span class="trn" data-trn-key="TR_CLOUD_RECORD_MAKING_FILE"><%--레코드 정보 작성파일--%></span> : <a href="/file/download/${dnsRecordFile.idx}">${dnsRecordFile.name}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="trn" data-trn-key="TR_CLOUD_RECORD_FILE_IS_EMPTY"><%--레코드 정보 없음--%></span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:if>
                    </c:if>
                </table>
            </div>
        </section>

        <%-- LINE :: 장비 미설치된 경우에만 노출. 설치된 경우 하단 탭에 표시됨 --%>
        <c:if test="${!customer.equipmentInstallYn}">
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">메일 기능</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_CLOUD_MAIL_FUNC"><%--메일 기능--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <c:if test="${customer.secuEcloudGubun == 'I'}">
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_POP3_USE_YN">POP3 사용 여부</th>
                            <td>
                                <c:if test="${customer.pop3UseYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </c:if>
                                <c:if test="${!customer.pop3UseYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </c:if>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_WORKMAIL_USE_YN"><%--업무형 메일 사용 여부--%></th>
                            <td>
                                <c:if test="${customer.workmailUse}">
                                    <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </c:if>
                                <c:if test="${!customer.workmailUse}">
                                    <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </c:if>
                            </td>
                        </tr>
                        </c:if>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_USE_SCHEDULE_YN"><%--일정 관리 기능 사용 여부--%></th>
                            <td>
                                <c:if test="${customer.useSchedule}">
                                    <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </c:if>
                                <c:if test="${!customer.useSchedule}">
                                    <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </c:if>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_ORGANIZATION_YN"><%--조직도 기능 사용 여부--%></th>
                            <td>
                                <c:if test="${customer.organizationYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </c:if>
                                <c:if test="${!customer.organizationYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </c:if>
                            </td>
                        </tr>
                        <tr class="nServiceMailArea">
                            <th class="trn" data-trn-key="TR_CLOUD_MESSAGE_USE_YN"><%--쪽지 기능 사용 여부--%></th>
                            <td class="border-b">
                                <c:if test="${customer.messageUseYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </c:if>
                                <c:if test="${!customer.messageUseYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </c:if>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_NOTICE_USE_YN"><%--알림 기능 사용 여부--%></th>
                            <td>
                                <c:if test="${customer.noticeUseYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </c:if>
                                <c:if test="${!customer.noticeUseYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_GROUPWARE_USE_YN"><%--그룹웨어 사용 여부--%></th>
                            <td class="border-b">
                                <c:if test="${customer.groupwareUseYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </c:if>
                                <c:if test="${!customer.groupwareUseYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </c:if>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_FINANCE_USE_YN"><%--관리 회계 기능 사용 여부--%></th>
                            <td class="border-b">
                                <c:if test="${customer.financeUseYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </c:if>
                                <c:if test="${!customer.financeUseYn}">
                                    <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </c:if>
                            </td>
                        </tr>
                        <c:if test="${customer.equipmentInstallYn}">
                            <tr>
                                <th class="trn" data-trn-key="TR_CLOUD_PER_ADDR_USE_YN"><%--개인주소록 사용여부--%></th>
                                <td>
                                    <c:if test="${customer.perAddrUseYn}">
                                        <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                    </c:if>
                                    <c:if test="${!customer.perAddrUseYn}">
                                        <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                    </c:if>
                                    <p class="trn fc-red mt5 perAddrUseYnDescription ${customer.perAddrUseYn ? 'dis_n' : ''}" data-trn-key="TR_CLOUD_GUARD_MAIL_BOX_USE_YN_DESCRIPTION1" data-key="1"><%--* 개인 주소록 + 공용주소록 사용--%></p>
                                    <p class="trn fc-red mt5 perAddrUseYnDescription ${!customer.perAddrUseYn ? 'dis_n' : ''}" data-trn-key="TR_CLOUD_GUARD_MAIL_BOX_USE_YN_DESCRIPTION2" data-key="0"><%--* 기업 주소록 + 공용주소록 사용--%></p>
                                </td>
                                <th class="trn" data-trn-key="TR_CLOUD_GUARD_MAIL_BOX_USE_YN"><%--가드메일함 사용여부--%></th>
                                <td>
                                    <c:if test="${customer.guardMailBoxUseYn}">
                                        <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                    </c:if>
                                    <c:if test="${!customer.guardMailBoxUseYn}">
                                        <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_AGREE_PASS"><%--최초로그인 이용약관 사용여부--%></th>
                            <td colspan="${customer.equipmentInstallYn ? '' : '3'}">
                                <c:if test="${customer.agreePass}">
                                    <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </c:if>
                                <c:if test="${!customer.agreePass}">
                                    <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </c:if>
                            </td>
                            <c:if test="${customer.equipmentInstallYn}">
                            <th class="trn" data-trn-key="TR_CLOUD_TELEGRAM_NOTIFICATION_USE_YN"><%--텔레그램 알림 기능 사용 여부--%></th>
                            <td>
                                <c:if test="${customer.telegramNotification}">
                                    <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </c:if>
                                <c:if test="${!customer.telegramNotification}">
                                    <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </c:if>
                            </td>
                            </c:if>
                        </tr>
                        <tr id="groupwareOpenPriceArea" class="${customer.secuEcloudGubun != 'N' && customer.groupwareUseYn ? '' : 'dis-n'}">
                            <th class="trn" data-trn-key="TR_CLOUD_GROUPWARE_OPEN_PRICE"><%--그룹웨어 기본제공 용량 금액--%></th>
                            <td colspan="3">
                                ${customer.groupwareOpenPrice}
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
        </c:if>

        <c:if test="${customer.approvalState eq 'R'}">
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_REJECTION_REASON"><%--반려 사유--%></h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_INFO"><%--게시글 정보--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width=*">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_REJECTION_REASON"><%--반려사유--%></th>
                                <%-- LINE :: 반려 상태인 경우 반려 사유 출력 --%>
                            <td style="white-space: pre-wrap;">${customer.approvalState == 'R' ? customer.refuseReason : '-'}</td>
                        </tr>
                    </table>
                </div>
            </section>
        </c:if>

        <c:choose>
            <c:when test="${customer.approvalState eq 'A' && customer.equipmentInstallYn}">
                <section class="mt30">
                    <ul class="set_step">
                        <li style="width: 25%;"><a href="#" name="tabSelector" path="dashBoard" class="active" onClick="tabSelect('dashBoard');"><span class="trn" data-trn-key="TR_CLOUD_DASH_BOARD"><%--대시보드--%></span> <span class="dis_ib fs8">▶</span></a></li>
                        <li style="width: 25%;"><a href="#" name="tabSelector" path="additionalService" onClick="tabSelect('additionalService');"><span class="trn" data-trn-key="TR_CLOUD_ADDITIONAL_SERVICE"><%--부가서비스--%></span> <span class="fs8">▶</span></a></li>
                        <li style="width: 25%;"><a href="#" name="tabSelector" path="user" onClick="tabSelect('user');"><span class="trn" data-trn-key="TR_CLOUD_TITLE2"><%--사용자 현황--%></span> <span class="fs8">▶</span></a></li>
                        <li style="width: 25%;"><a href="#" name="tabSelector" path="additionalFunction" onClick="tabSelect('additionalFunction');"><span class="trn" data-trn-key="TR_CLOUD_MAIL_FUNC_SETTING"><%--메일 기능설정--%></span> <span class="fs8">▶</span></a></li>
                    </ul>
                    <div id="dashBoard" class="tabDiv"><%@ include file="tab/dashboard.jsp" %></div>
                    <div id="additionalService" class="tabDiv dis_n"><%@ include file="tab/additionalService.jsp" %></div>
                    <div id="user" class="tabDiv dis_n"><%@ include file="tab/user.jsp" %></div>
                    <div id="additionalFunction" class="tabDiv dis_n"><%@ include file="tab/additionalFunction.jsp" %></div>
                </section>
            </c:when>
            <c:otherwise>
                <section class="mt30">
                    <div class="b-title">
                        <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_ADDITIONAL_SERVICE"><%--부가서비스--%></h1>
                    </div>

                    <div class="b-tableWrap mt20 ofx-h">
                        <table class="b-listTable b-listTable--border">
                            <caption class="offscreen trn" data-trn-key="TR_CLOUD_ADDITIONAL_SERVICE"><%--부가서비스--%></caption>
                            <colgroup>
                                <col width="20%">
                                <col width="*%">
                                <col width="20%">
                            </colgroup>
                            <tr>
                                <th class="trn" data-trn-key="TR_CLOUD_APPLY_ADDITIONAL_SERVICE"><%--부가서비스 신청--%></th>
                                <td colspan="3">
                                    <c:set var="addApplyYn">
                                        ${((customer.addStorage > 0) || (customer.moveMailStorage > 0) || (customer.moveMailAccountCount > 0) || (customer.moveMailStorage > 0) || (customer.addExchangeSize > 0) || (customer.addOnedriveSize > 0))}
                                    </c:set>
                                    <c:if test="${addApplyYn}">
                                        <span class="trn" data-trn-key="TR_SIGN_UP"><%--신청--%></span>
                                    </c:if>
                                    <c:if test="${!addApplyYn}">
                                        <span class="trn" data-trn-key="TR_UNAPPLIED"><%--미신청--%></span>
                                    </c:if>
                                </td>
                            </tr>
                            <c:if test="${customer.secuEcloudGubun == 'O'}">
                                <tr>
                                    <th class="trn" data-trn-key="TR_CLOUD_MAIL_SERVER_QUANTITY"><%--메일서버 할당 용량--%></th>
                                    <td>
                                        ${customer.mailServerQuantity} GB
                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${addApplyYn}">
                                <tr>
                                    <th class="trn" data-trn-key="TR_CLOUD_ADD_STORAGE"><%--용량 추가--%></th>
                                    <td colspan="2">
                                        <fmt:formatNumber value="${customer.addStorage > 0 ? customer.addStorage : 0}" pattern="#,###"/>GB
                                        <p style="color: #0b94d1;"><span class="trn" data-trn-key="TR_CLOUD_ADD_STORAGE_UNIT"><%--(단위 : 10GB)--%></span></p>
                                    </td>
                                    <td style="text-align: right;">
                                        <c:if test="${customer.secuEcloudGubun == 'N'}">
                                            <fmt:formatNumber value="${customer.addStorage > 0 ? (customer.addStorage/10) * 10000 : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </c:if>
                                        <c:if test="${customer.secuEcloudGubun != 'N'}">
                                            <fmt:formatNumber value="${customerCalc.storageCalc > 0 ? customerCalc.storageCalc : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </c:if>
                                    </td>
                                </tr>
                                <c:if test="${customer.secuEcloudGubun == 'N'}">
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_ADD_EXCHANGE_SIZE"><%--메일 백업 용량 추가--%></th>
                                        <td colspan="2">
                                            <fmt:formatNumber value="${customer.addExchangeSize > 0 ? customer.addExchangeSize : 0}" pattern="#,###"/>GB
                                            <p style="color: #0b94d1;"><span class="trn" data-trn-key="TR_CLOUD_ADD_EXCHANGE_SIZE_UNIT"><%--(단위 : 50GB)--%></span></p>
                                        </td>
                                        <td style="text-align: right;">
                                            <fmt:formatNumber value="${customer.addExchangeSize > 0 ? (customer.addExchangeSize/50) * 20000 : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="trn" data-trn-key=""><%--그룹웨어 용량 추가--%></th>
                                        <td colspan="2">
                                            <fmt:formatNumber value="${customer.addOnedriveSize > 0 ? customer.addOnedriveSize : 0}" pattern="#,###"/>GB
                                            <p style="color: #0b94d1;"><span class="trn" data-trn-key="TR_CLOUD_ADD_ONEDRIVE_SIZE_UNIT"><%--(단위 : 10GB)--%></span></p>
                                        </td>
                                        <td style="text-align: right;">
                                            <fmt:formatNumber value="${customer.addOnedriveSize > 0 ? (customer.addOnedriveSize/10) * 10000 : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${customer.secuEcloudGubun eq 'I'}">
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_ADD_ACCOUNT"><%--계정 추가--%></th>
                                        <td>
                                            <fmt:formatNumber value="${customer.addAccountCount > 0 ? customer.addAccountCount : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span>
                                            <p class="trn" data-trn-key="TR_CLOUD_ACCOUNT_DEFAULT_COUNT" style="color: #0b94d1;"><%--(30계정 무료제공)--%></p>
                                        </td>
                                        <td style="text-align: right;">
                                            <fmt:formatNumber value="${customerCalc.accountCalc > 0 ? customerCalc.accountCalc : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_GROUP_MAIL_COUNT"><%--그룹 메일--%></th>
                                        <td>
                                            <fmt:formatNumber value="${customer.groupMailCount > 0 ? customer.groupMailCount : 0}" pattern="#,###"/>개
                                            <p class="trn" data-trn-key="TR_CLOUD_GROUP_MAIL_COUNT_UNIT" style="color: #0b94d1;"><%--(신청 단위 5계정)--%></p>
                                        </td>
                                        <td style="text-align: right;">
                                            <fmt:formatNumber value="${customerCalc.groupMailCalc > 0 ? customerCalc.groupMailCalc : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${customer.secuEcloudGubun ne 'N'}">
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_MOVE_MAIL_STORAGE" rowspan="3"><%--메일 데이터 이전--%></th>
                                        <td colspan="2">
                                            <span class="dis-ib w120 trn" data-trn-key="TR_CLOUD_MOVE_MAIL_STORAGE_VALUE"><%--이전할 메일 용량--%></span><fmt:formatNumber value="${customer.moveMailStorage > 0 ? customer.moveMailStorage : 0}" pattern="#,###"/>GB
                                        </td>
                                        <td style="text-align: right;" rowspan="3">
                                            <fmt:formatNumber value="${customerCalc.moveMailCalc > 0 ? customerCalc.moveMailCalc : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-right: 1px solid #ddd;" colspan="2">
                                            <span class="dis-ib w120 trn" data-trn-key="TR_CLOUD_MOVE_MAIL_ACCOUNT_COUNT_VALUE"><%--이전할 계정수--%></span><fmt:formatNumber value="${customer.moveMailAccountCount > 0 ? customer.moveMailAccountCount : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_CLOUD_MOVE_MAIL_ACCOUNT_COUNT_VALUEs"><%--개--%></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-right: 1px solid #ddd;" colspan="2">
                                            <c:set var="moveEmailGubun" value="${fn:replace(customer.moveEmailGubun, ',', '')}"/>
                                            <span class="dis-ib w120 trn" data-trn-key="TR_CLOUD_MOVE_EMAIL_GUBUN"><%--이전할 메일 종류--%></span>
                                            <c:if test="${moveEmailGubun == 'C'}">
                                                <span class="trn" data-trn-key="TR_CLOUD_MOVE_EMAIL_GUBUN_C"><%--기업 메일--%></span>
                                            </c:if>
                                            <c:if test="${!moveEmailGubun == 'C' && moveEmailGubun == 'I'}">
                                                <span class="trn" data-trn-key="TR_CLOUD_MOVE_EMAIL_GUBUN_I"><%--개인 메일--%></span>
                                            </c:if>
                                            <c:if test="${!moveEmailGubun == 'C' && moveEmailGubun != 'I'}">
                                                <span class="trn" data-trn-key="TR_CLOUD_MOVE_EMAIL_GUBUN_OTHER"><%--이전 안함--%></span>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:if>
<%--                                <c:if test="${customer.secuEcloudGubun == 'N' && (customer.addExchangeSize != null && customer.addExchangeSize > 0)}">--%>
<%--                                <tr class="nServiceArea addApplyArea">--%>
<%--                                    <th>메일 백업용량 추가(50GB 단위)</th>--%>
<%--                                    <td colspan="3">--%>
<%--                                        ${customer.addExchangeSize}GB--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${customer.secuEcloudGubun == 'N' && (customer.addOnedriveSize != null && customer.addOnedriveSize > 0)}">--%>
<%--                                <tr class="nServiceArea addApplyArea">--%>
<%--                                    <th>그룹웨어 용량추가(100GB 단위)</th>--%>
<%--                                    <td colspan="3">--%>
<%--                                        ${customer.addOnedriveSize}GB--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                </c:if>--%>
                                <tr>
                                    <th class="trn" data-trn-key="TR_CLOUD_ADDITIONAL_SERVICE_TOTAL_PRICE"><%--부가서비스 신청 가격 (총)--%></th>
                                    <td colspan="3" class="point-bg" style="text-align: right;">
                                        <c:if test="${customer.secuEcloudGubun == 'I'}">
                                            <span class="point-num"><fmt:formatNumber value="${customerCalc.storageCalc + customerCalc.accountCalc + customerCalc.groupMailCalc + customerCalc.moveMailCalc}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </c:if>
                                        <c:if test="${customer.secuEcloudGubun == 'P'}">
                                            <span class="point-num"><fmt:formatNumber value="${customerCalc.storageCalc + customerCalc.moveMailCalc}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </c:if>
                                        <c:if test="${customer.secuEcloudGubun == 'N'}">
                                            <span class="point-num"><fmt:formatNumber value="${customerCalc.storageCalc + customerCalc.moveMailCalc}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:if>
                        </table>
                    </div>
                </section>
            </c:otherwise>
        </c:choose>

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
                            <col width="20%">
                            <col width="20%">
                            <col width="20%">
                            <col width="15%">
                            <col width="20%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="a-center trn" data-trn-key="TR_CLOUD_SALES_YN"><%--영업 여부--%></th>
                            <th class="a-center trn" data-trn-key="TR_CLOUD_PARTNER_NAME"><%--파트너사 명--%></th>
                            <th class="a-center">STEP</th>
                            <th class="a-center trn" data-trn-key="TR_CLOUD_COST_PER_ACCOUNT"><%--계정당 마진금액--%></th>
                            <th class="a-center trn" data-trn-key="TR_CLOUD_ADDITIONAL_PRICE_MONTHLY"><%--월 부가서비스 이용금액--%></th>
                            <th class="a-center trn" data-trn-key="TR_CLOUD_MARGIN_RATE"><%--마진율--%></th>
                            <th class="a-center trn" data-trn-key="TR_CLOUD_MARGIN_PRICE_MONTHLY"><%--월 마진 금액--%></th>
                        </tr>
                        </thead>
                        <tbody id="partnerInfoArea">
                        <c:if test="${customer != null}">
                            <c:if test="${empty partnerMarginInfo}">
                                <tr>
                                    <td class="a-center trn" colspan="7" data-trn-key="TR_CLOUD_NO_PARTNER_MARGIN_INFO">
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
                                            <fmt:formatNumber value="${marginInfo.additionalPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
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

        <section class="mt30 ${customer.secuEcloudGubun == 'O' ? 'dis_n' : ''}">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_PAYMENT_INFO"><%--결제 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_CLOUD_PAYMENT_INFO"><%--결제 정보--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                        <c:if test="${customer.paymentWay == 'Y'}">
                            <col width="20%">
                            <col width="30%">
                        </c:if>
                    </colgroup>
                    <tr>
                        <th class="secuEcloudInfo trn" data-trn-key="TR_CLOUD_APPLY_ACCOUNT_COUNT"><%--신청 계정 수--%></th>
                        <td class="secuEcloudInfo">
                            <c:if test="${customer.secuEcloudGubun eq 'I'}">
                                <span class="trn" data-trn-key="TR_CLOUD_COUNT_FREE"><%--30 개(무료)--%></span> + <fmt:formatNumber value="${customer.addAccountCount ne null && customer.addAccountCount ne '' ? customer.addAccountCount : '0'}" pattern="#,###"/> <span class="trn" data-trn-key="TR_CLOUD_COUNT_CHARGED"><%--개(유료)--%></span>
                            </c:if>
                            <c:if test="${customer.secuEcloudGubun eq 'P' || customer.secuEcloudGubun eq 'N'}">
                                <fmt:formatNumber value="${customer.applyAccountCount}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span>
                            </c:if>
                        </td>
                        <th class="trn" data-trn-key="TR_CLOUD_COST_PER_ACCOUNTs"><%--계정당 마진 금액--%></th>
                        <td><fmt:formatNumber value="${customer.costPerAccount}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span></td>
                        <c:if test="${customer.paymentWay == 'Y'}">
                            <th class="trn" data-trn-key="TR_CLOUD_SERVICE_USE_PERIOD"><%--서비스 기간--%></th>
                            <td>
                                <c:if test="${customer.secuEcloudGubun eq 'I'}">
                                    ${customer.formatedServiceChangeHopeDate} ~ ${customer.formatedServiceEndDate}
                                    <c:if test="${customer.serviceUsePeriod == 999}">(<span class="trn" data-trn-key="TR_LIFETIME"><%--평생--%></span>)</c:if>
                                    <c:if test="${customer.serviceUsePeriod != 999}">
                                        (<fmt:formatNumber value="${customer.serviceUsePeriod / 12}"/><span class="trn" data-trn-key="TR_COMMON_YEAR"><%--년--%></span>)
                                    </c:if>
                                </c:if>
                                <c:if test="${customer.secuEcloudGubun ne 'I'}">
                                    ${customer.formatedServiceChangeHopeDate} ~ ${customer.paymentWay eq 'Y' ? customer.formatedServiceEndDate : ''}
                                    <c:if test="${customer.paymentWay eq 'M'}">(<span class="trn" data-trn-key="TR_CLOUD_MAINTAIN_UNTIL_TERMINATION"><%--해지시까지 계약 유지--%></span>)</c:if>
                                    <c:if test="${customer.paymentWay eq 'Y'}">
                                        (<fmt:formatNumber value="${customer.serviceUsePeriod / 12}"/><span class="trn" data-trn-key="TR_COMMON_YEAR"><%--년--%></span>)
                                    </c:if>
                                </c:if>
                            </td>
                        </c:if>
                    </tr>
                </table>
            </div>
        </section>

        <section class="mt30 ${customer.secuEcloudGubun == 'O' ? 'dis_n' : ''}">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_MAINTAIN_UNTIL_TERMINATION"><%--결제 상세 정보--%></h1>
            </div>
            <div class="b-tableWrap mt20 over-x__n">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_CLOUD_MAINTAIN_UNTIL_TERMINATION"><%--결제 상세 정보--%></caption>
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
                            <th class="a-center"><span class="paymentYearArea" id="formatServiceUsePeriod"><fmt:parseNumber value="${customer.serviceUsePeriod/12}" integerOnly="true"/></span><span class="trn" data-trn-key="TR_CLOUD_PRICE_MONTHLY"><%--년 금액--%></span></th>
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

        <section class="mt30 ${customer.secuEcloudGubun == 'O' ? '' : 'dis_n'}">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_PAYMENT_DETAIL_INFO"><%--결제 상세 정보--%></h1>
            </div>
            <div class="b-tableWrap mt20 over-x__n">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_CLOUD_PAYMENT_DETAIL_INFO"><%--결제 상세 정보--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_SUPPLY_PRICE"><%--제조사 공급가--%></th>
                        <td>
                            <fmt:formatNumber value="${customerPartnerCalc.supplyPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                        </td>
                    </tr>
                </table>
            </div>
        </section>

        <section class="mt30 ${customer.secuEcloudGubun eq 'O' || customer.paymentWay == "M" ? 'dis_n' : ''}">
            <div class="b-title mb10">
                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_CONTRACT_EXTENSION_STATUS"><%--계약 연장현황--%></h1>
                <input type="button" class="btn-baseRound ml10" value="등록" onclick="renewalPopup()">
            </div>

            <div class="b-tableWrap">

                <table class="b-listTable">
                    <caption class="offscreen trn" data-trn-key="TR_CLOUD_CONTRACT_EXTENSION_STATUS"><%--게시글 목록--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="*%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--계약 기간--%></th>
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
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteConfirm()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?idx=${customer.idx}'">
            <c:choose>
                <c:when test="${customer.secuEcloudGubun eq 'P' || customerCalc.storageCalc + customerCalc.accountCalc + customerCalc.groupMailCalc + customerCalc.moveMailCalc > 0}">
                    <%-- LINE :: P서비스거나, 부가서비스 신청내역이 있을때(i서비스)--%>
                    <c:if test="${customer.paymentCompleteYn eq null}">
                        <%-- LINE :: 결제 처리가 되지 않았을 경우--%>
                        <input type="button" class="btn-base btn-large mr5 trn" data-trn-value="TR_CLOUD_PAYMENT" value="" onclick="updatePaymentCompleteYn(true)" style="color: #0b94d1"><%--결제--%>
                        <input type="button" class="btn-base btn-large mr5 trn" data-trn-value="TR_CLOUD_MAIL_PAYMENT_COMPLETE_YN_N" value="" onclick="updatePaymentCompleteYn(false)" style="color: #9c3328"><%--미결제--%>
                    </c:if>
                    <c:if test="${customer.paymentCompleteYn ne null}">
                        <%-- LINE :: 설치되지 않은 업체만 버튼 노출 --%>
                        <c:if test="${!customer.equipmentInstallYn}">
                            <%-- LINE :: 결제 완료된 업체 --%>
                            <input type="button" class="btn-base btn-detail btn-large mr5 trn" data-trn-value="TR_COMMON_INSTALL" value="" onclick="equipmentInstallPopup(${customer.idx})"><%--설치--%>
                        </c:if>
                        <c:if test="${!customer.paymentCompleteYn}">
                            <%-- LINE :: 결제 미완료일 경우 결제 버튼 노출 --%>
                            <input type="button" class="btn-base btn-large mr5 trn" data-trn-value="TR_CLOUD_PAYMENT" value="" onclick="updatePaymentCompleteYn(true)" style="color: #0b94d1"><%--결제--%>
                        </c:if>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <%-- LINE :: 부가서비스 무료일 경우 바로 설치 버튼 노출 --%>
                    <c:if test="${!customer.equipmentInstallYn}">
                        <%-- LINE :: 설치되지 않은 업체만 버튼 노출 --%>
                        <input type="button" class="btn-base btn-detail btn-large mr5 trn" data-trn-value="TR_COMMON_INSTALL" value="" onclick="equipmentInstallPopup(${customer.idx})"><%--설치--%>
                    </c:if>
                </c:otherwise>
            </c:choose>
            <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_LIST" value="" onclick="moveList()"><%--목록--%>
        </div>
    </div>
</section><!--l-content-area-->
<script src="/resources/js/customerMng/customer/view.js" type="text/babel"></script>

</div><!--l-container-->
</body>
</html>