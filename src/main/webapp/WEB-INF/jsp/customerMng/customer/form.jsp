<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/customerMng/customer/form.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<section class="l-content-area">
    <c:set var="now"><fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/></c:set>
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CLOUD_TITLE_REGISTER"><%--고객사 관리 - 접수--%></h1>

    <div class="l-maxwrap">
        <input type="hidden" id="isDuplicateCheck" value="${customer.idx > 0 ? 'true' : 'false'}">
        <input type="hidden" id="equipmentInstallYn" value="false">
        <form id="saveForm">
            <c:if test="${customer.idx > 0}"><input type="hidden" name="idx" id="idx" value="${customer.idx}"></c:if>
            <input type="hidden" name="operationType" value="C">
            <input type="hidden" name="ecloudUseYn" value="true">

            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CUSTOMER_INFO"><%--고객사 정보--%></h1>
                </div>

                <p style="color: red; text-align: right" class="lh20 dis_b mt10 trn" data-trn-key="TR_COMMON_ESSENTIAL_MSG"><%-- * 표시는 필수 입력 항목입니다.--%></p>

                <div class="b-tableWrap mt10 ofx-h">
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
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN"><%--Secu E Cloud 서비스 종류--%></span></th>
                            <td>
                                <select id="secuEcloudGubun" name="secuEcloudGubun" class="w155 dis_n">
                                    <option class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_N" value="N" ${customer == null || customer.secuEcloudGubun eq 'N' ? 'selected' : 'disabled'}><%--P-Service(신규)--%></option>
                                    <option value="I" ${customer.secuEcloudGubun eq 'I' ? 'selected' : 'disabled'}>I-Service</option>
                                    <option value="P" ${customer.secuEcloudGubun eq 'P' ? 'selected' : 'disabled'}>P-Service</option>
                                    <option class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_O" value="O" ${customer.secuEcloudGubun eq 'O' ? 'selected' : 'disabled'}><%--기존 메일--%></option>
                                </select>
                                <span>
                                    <c:choose>
                                        <c:when test="${customer == null || customer.secuEcloudGubun eq 'N'}"><span class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_N"><%--P-Service(신규)--%></span></c:when>
                                        <c:when test="${customer.secuEcloudGubun eq 'I'}">I-Service</c:when>
                                        <c:when test="${customer.secuEcloudGubun eq 'P'}">P-Service</c:when>
                                        <c:when test="${customer.secuEcloudGubun eq 'O'}"><span class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_O"><%--기존 메일--%></span></c:when>
                                    </c:choose>
                                </span>
                            </td>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_PARTNER_NAME"><%--파트너사 명--%></span></th>
                            <td>
                                <select class="default-input w155" name="partnerIdx" onchange="getPartnerInfo()">
                                    <c:forEach var="partner" items="${partnerList}">
                                        <c:if test="${customer.partnerIdx == null || customer.partnerIdx == 0}">
                                            <option value="${partner.idx}" ${partner.name == '기원테크2' ? "selected":""}>${partner.name}</option>
                                        </c:if>
                                        <c:if test="${customer.partnerIdx != null && customer.partnerIdx > 0}">
                                            <option value="${partner.idx}" ${customer.partnerIdx == partner.idx? "selected":""}>${partner.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_COMPANY_NAME"><%--기업명--%></span></th>
                            <td>
                                <input type="text" id="name" name="name" class="default-input w155" value="${customer.name}" maxlength="30">
                            </td>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_COMPANY_BUSINESS_YN"><%--기업형태--%></span></th>
                            <td>
                                <label class="dis_ib w80">
                                    <input type="radio" name="businessYn" value="true" checked> <span class="trn" data-trn-key="TR_CORPORATE_BODY"><%--법인--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="businessYn" value="false" ${customer != null && !customer.businessYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_INDIVIDUAL"><%--개인--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_REP_NAME"><%--대표자 이름--%></span></th>
                            <td>
                                <input type="text" name="repName" class="default-input w155" value="${customer.repName}" maxlength="10">
                            </td>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_REP_PHONE_NUMBER"><%--대표자 핸드폰번호--%></span></th>
                            <td>
                                <c:set var="repPhone" value="${fn:split(customer.repPhone, '-')}"/>
                                <input type="hidden" name="repPhone">
                                <%--<input class="default-input onlynumber w50" id="repPhone1" value="${repPhone[0]}" type="text" maxlength="3">--%>
                                <select id="repPhone1" class="w55">
                                    <option value="010" ${repPhone[0] == '010' ? 'selected' : ''}>010</option>
                                    <option value="011" ${repPhone[0] == '011' ? 'selected' : ''}>011</option>
                                    <option value="016" ${repPhone[0] == '016' ? 'selected' : ''}>016</option>
                                    <option value="017" ${repPhone[0] == '017' ? 'selected' : ''}>017</option>
                                    <option value="018" ${repPhone[0] == '018' ? 'selected' : ''}>018</option>
                                    <option value="019" ${repPhone[0] == '019' ? 'selected' : ''}>019</option>
                                </select>
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="repPhone2" value="${repPhone[1]}" type="text" maxlength="4">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="repPhone3" value="${repPhone[2]}" type="text" maxlength="4">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_REP_TEL_NUMBER"><%--대표 전화번호--%></span></th>
                            <td>
                                <c:set var="tel" value="${fn:split(customer.tel, '-')}"/>
                                <input type="hidden" name="tel">
                                <%--<input class="default-input onlynumber w50" id="tel1" value="${tel[0]}" type="text" maxlength="3">--%>
                                <select id="tel1" class="w55">
                                    <option value="02" ${tel[0] == '02' ? 'selected' : ''}>02</option>
                                    <option value="031" ${tel[0] == '031' ? 'selected' : ''}>031</option>
                                    <option value="032" ${tel[0] == '032' ? 'selected' : ''}>032</option>
                                    <option value="033" ${tel[0] == '033' ? 'selected' : ''}>033</option>
                                    <option value="041" ${tel[0] == '041' ? 'selected' : ''}>041</option>
                                    <option value="042" ${tel[0] == '042' ? 'selected' : ''}>042</option>
                                    <option value="043" ${tel[0] == '043' ? 'selected' : ''}>043</option>
                                    <option value="044" ${tel[0] == '044' ? 'selected' : ''}>044</option>
                                    <option value="051" ${tel[0] == '051' ? 'selected' : ''}>051</option>
                                    <option value="052" ${tel[0] == '052' ? 'selected' : ''}>052</option>
                                    <option value="053" ${tel[0] == '053' ? 'selected' : ''}>053</option>
                                    <option value="054" ${tel[0] == '054' ? 'selected' : ''}>054</option>
                                    <option value="055" ${tel[0] == '055' ? 'selected' : ''}>055</option>
                                    <option value="061" ${tel[0] == '061' ? 'selected' : ''}>061</option>
                                    <option value="062" ${tel[0] == '062' ? 'selected' : ''}>062</option>
                                    <option value="063" ${tel[0] == '063' ? 'selected' : ''}>063</option>
                                    <option value="064" ${tel[0] == '064' ? 'selected' : ''}>064</option>
                                    <option value="070" ${tel[0] == '070' ? 'selected' : ''}>070</option>
                                </select>
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="tel2" value="${tel[1]}" type="text" maxlength="4">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="tel3" value="${tel[2]}" type="text" maxlength="4">
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_REP_FAX_NUMBER"><%--팩스번호--%></th>
                            <td>
                                <c:set var="fax" value="${fn:split(customer.fax, '-')}"/>
                                <input type="hidden" name="fax">
                                <%--<input class="default-input onlynumber w50" id="fax1" value="${fax[0]}" type="text" maxlength="3">--%>
                                <select id="fax1" class="w55">
                                    <option value="02" ${fax[0] == '02' ? 'selected' : ''}>02</option>
                                    <option value="031" ${fax[0] == '031' ? 'selected' : ''}>031</option>
                                    <option value="032" ${fax[0] == '032' ? 'selected' : ''}>032</option>
                                    <option value="033" ${fax[0] == '033' ? 'selected' : ''}>033</option>
                                    <option value="041" ${fax[0] == '041' ? 'selected' : ''}>041</option>
                                    <option value="042" ${fax[0] == '042' ? 'selected' : ''}>042</option>
                                    <option value="043" ${fax[0] == '043' ? 'selected' : ''}>043</option>
                                    <option value="044" ${fax[0] == '044' ? 'selected' : ''}>044</option>
                                    <option value="051" ${fax[0] == '051' ? 'selected' : ''}>051</option>
                                    <option value="052" ${fax[0] == '052' ? 'selected' : ''}>052</option>
                                    <option value="053" ${fax[0] == '053' ? 'selected' : ''}>053</option>
                                    <option value="054" ${fax[0] == '054' ? 'selected' : ''}>054</option>
                                    <option value="055" ${fax[0] == '055' ? 'selected' : ''}>055</option>
                                    <option value="061" ${fax[0] == '061' ? 'selected' : ''}>061</option>
                                    <option value="062" ${fax[0] == '062' ? 'selected' : ''}>062</option>
                                    <option value="063" ${fax[0] == '063' ? 'selected' : ''}>063</option>
                                    <option value="064" ${fax[0] == '064' ? 'selected' : ''}>064</option>
                                    <option value="070" ${fax[0] == '070' ? 'selected' : ''}>070</option>
                                </select>
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="fax2" value="${fax[1]}" type="text" maxlength="4">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="fax3" value="${fax[2]}" type="text" maxlength="4">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_REP_EMAIL"><%--대표 이메일--%></span></th>
                            <td colspan="3">
                                <c:set var="email" value="${fn:split(customer.email, '@')}"/>
                                <input type="hidden" name="email">
                                <input type="text" id="email1" class="default-input mr5" value="${email[0]}" style="width:130px;" maxlength="50">@
                                <input type="text" id="email2" class="default-input" value="${email[1]}" style="width:130px;" maxlength="20">
                                <select onchange="changeEmailSelect(this);" data-target="email2" class="w155">
                                    <option class="trn" data-trn-key="TR_DIRECT_INPUT" value=""><%--직접입력--%></option>
                                    <option value="gmail.com" ${email[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                    <option value="naver.com" ${email[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                    <option value="daum.net" ${email[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="pServiceArea">
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL"><%--세금 계산서 발행 이메일--%></span></th>
                            <td colspan="3">
                                <c:set var="vatBillEmail" value="${fn:split(customer.vatBillEmail, '@')}"/>
                                <input type="hidden" name="vatBillEmail">
                                <input type="text" id="vatBillEmail1" class="default-input mr5" value="${vatBillEmail[0]}" style="width:130px;" maxlength="50">@
                                <input type="text" id="vatBillEmail2" class="default-input" value="${vatBillEmail[1]}" style="width:130px;" maxlength="20">
                                <select style="width:110px;" onchange="changeEmailSelect(this);" data-target="vatBillEmail2">
                                    <option class="trn" data-trn-key="TR_DIRECT_INPUT" value=""><%--직접입력--%></option>
                                    <option value="gmail.com" ${vatBillEmail[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                    <option value="naver.com" ${vatBillEmail[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                    <option value="daum.net" ${vatBillEmail[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_BUSINESS_NUMBER"><%--사업자등록번호--%></span></th>
                            <td>
                                <c:set var="businessNumber" value="${fn:split(customer.businessNumber, '-')}"/>
                                <input type="hidden" name="businessNumber">
                                <input class="default-input onlynumber w55" id="businessNumber1" value="${businessNumber[0]}" type="text" maxlength="3">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="businessNumber2" value="${businessNumber[1]}" type="text" maxlength="2">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="businessNumber3" value="${businessNumber[2]}" type="text" maxlength="5">
                                <input type="button" class="btn btn-baseRound" value="중복확인" onclick="bizNumberDuplicateCheckAjax(${customer.idx})">
                            </td>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_EMPLOY_COUNT"><%--총 임직원수--%></span></th>
                            <td>
                                <input type="text" name="employCount" class="default-input w155 onlynumber autoComma trn" data-trn-holder="TR_ONLY_NUM" value="${customer.employCount}" placeholder="숫자만 입력하세요." maxlength="9">
                            </td>
                        </tr>
                        <tr>
                            <th class="individualArea"><span class="necessary trn" data-trn-key="TR_BIRTH_DATE"><%--생년월일--%></span></th>
                            <td class="individualArea" colspan="3">
                                <input type="text" name="birthDate" class="default-input calendar w155" value="${customer.birthDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_ADDR"><%--주소--%></span></th>
                            <td colspan="3">
                                <span class="dis_b mb5">
                                    <input type="text" name="zipcode" class="default-input w155" value="${customer.zipcode}" readonly>
                                    <input type="button" class="btn btn-baseRound trn" data-trn-valye="TR_SEARCH_ADDR" value="주소검색" onclick="openAddrPopup('customer')">
                                </span>
                                <input type="text" name="addr" class="default-input dis_b mb5 wp100" value="${customer.addr}" readonly>
                                <input type="text" name="addrDetail" class="default-input wp100" value="${customer.addrDetail}" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_APPLY_FORM_FILE"><%--사업자등록증--%></span></th>
                            <td colspan="3">
                                ${applyFormFile.name}
                                <span class="dis_b">
                                    <input type="file" id="applyFormFile" name="applyFormFile" class="w250" style="padding: 2px 0 0 0" onchange="fileTypeCheck(this)">
                                </span>
                            </td>
                        </tr>
                        <%-- LINE :: 온라인 신청 데이터인 경우 메모란 비노출 --%>
                        <c:if test="${!customer.onlineApplyYn}">
                            <tr>
                                <th class="trn" data-trn-key="TR_COMMON_MEMO"><%--메모--%></th>
                                <td colspan="3">
                                    <textarea name="memo" class="wp100 h100" style="resize: none">${customer.memo}</textarea>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </section>


            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_ADMIN_INFO"><%--담당자 정보--%></h1>
                </div>

                <div class="b-tableWrap mt10 ofx-h">
                    <table class="b-listTable b-listTable--border adminInfoTable">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr class="table-head">
                            <th colspan="4" class="a_left strong">
                                <span class="form-maintitle trn" data-trn-key="TR_CLOUD_MAIN_ADMIN_INFO"><%--담당자 정보 1 (필수)--%></span>
                                <label style="float: right;">
                                    <input type="checkbox" id="copyInfo" style="margin:0 7px 0 0;height: auto;" onclick="copyInfoCustomer();"><span class="trn" data-trn-key="TR_COMMON_CHECK_BOX_MSG"><%--위 정보와 동일--%></span>
                                </label>
                            </th>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_INFO_NAME"><%--담당자 정보 (이름/직책)--%></span></th>
                            <td>
                                <input type="text" class="w120 default-input trn" data-trn-holder="TR_COMMON_NAME" name="adminName" placeholder="이름" value="${customer.adminName}" maxlength="10">
                                /
                                <input type="text" class="w120 default-input trn" data-trn-holder="TR_POSITION" name="adminPosition" placeholder="직책" value="${customer.adminPosition}" maxlength="10">
                            </td>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_PHONE_NUMBER"><%--핸드폰 번호--%></span></th>
                            <td>
                                <c:set var="adminPhone" value="${fn:split(customer.adminPhone, '-')}"/>
                                <input type="hidden" name="adminPhone">
                                <%--<input class="default-input onlynumber w50" id="adminPhone_1" value="${adminPhone[0]}" type="text" maxlength="3">--%>
                                <select id="adminPhone_1" class="w55">
                                    <option value="010" ${adminPhone[0] == '010' ? 'selected' : ''}>010</option>
                                    <option value="011" ${adminPhone[0] == '011' ? 'selected' : ''}>011</option>
                                    <option value="016" ${adminPhone[0] == '016' ? 'selected' : ''}>016</option>
                                    <option value="017" ${adminPhone[0] == '017' ? 'selected' : ''}>017</option>
                                    <option value="018" ${adminPhone[0] == '018' ? 'selected' : ''}>018</option>
                                    <option value="019" ${adminPhone[0] == '019' ? 'selected' : ''}>019</option>
                                </select>
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="adminPhone_2" value="${adminPhone[1]}" type="text" maxlength="4">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="adminPhone_3" value="${adminPhone[2]}" type="text" maxlength="4">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_SUB_EMAIL">보조 이메일</span></th>
                            <td colspan="3">
                                <c:set var="adminSubEmail" value="${fn:split(customer.adminSubEmail, '@')}"/>
                                <input type="hidden" name="adminSubEmail">
                                <input type="text" id="adminSubEmail_1" class="default-input w120 mr1" value="${adminSubEmail[0]}" maxlength="50">@
                                <input type="text" id="adminSubEmail_2" class="default-input w120" value="${adminSubEmail[1]}" maxlength="20">
                                <select onchange="changeEmailSelect(this);" data-target="adminSubEmail_2" class="w155">
                                    <option class="trn" data-trn-key="TR_DIRECT_INPUT" value=""><%--직접입력--%></option>
                                    <option value="gmail.com" ${adminSubEmail[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                    <option value="naver.com" ${adminSubEmail[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                    <option value="daum.net" ${adminSubEmail[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                </select>
                                <br/><span class="small-txt trn" data-trn-key="TR_CLOUD_ADMIN_SUB_EMAIL_DESCRIPTION"><%--(*보조 이메일을 통해 서비스 가입안내를 드릴 예정으로 정확한 내용 기재 부탁드립니다.)--%></span>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_ACCOUNT_ID"><%--관리자 계정 ID--%></span></th>
                            <td>
                                <c:choose>
                                    <c:when test="${customer.idx > 0}">${customer.adminId}</c:when>
                                    <c:otherwise>
                                        <input type="text" class="w155 default-input trn" data-trn-holder="TR_ID_DESCRIPTION" name="adminId" value="${customer.adminId}" placeholder="영문, 숫자 조합" maxlength="30">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_ACCOUNT_PW"><%--관리자 계정 임시 비밀번호--%></span></th>
                            <td>
                                <input type="password" class="default-input w200 trn" data-trn-holder="TR_PW_DESCRIPTION" name="adminPwd" placeholder="영문, 숫자, 특수문자 8~16자" maxlength="30">
                            </td>
                        </tr>

                        <c:forEach var="subAdmin" items="${subAdminList}" varStatus="status">
                            <tr class="table-head subAdminData subAdminInfo${status.index + 2}">
                                <th colspan="4" class="a_left form-maintitle strong">
                                    <span class="trn" data-trn-key="TR_CLOUD_SUB_ADMIN_INFO"><%--보조 담당자 정보 (선택사항)--%></span>
                                    <input type="button" class="mViewBtn_permit fr removeAdminBtn${status.index + 2}" value="-" style="color:#e74701; width: 30px;" onclick="removeAdminInfo(${status.index + 2})">
                                </th>
                            </tr>
                            <tr class="subAdminInfo${status.index + 2}">
                                <th class="trn" data-trn-key="TR_CLOUD_ADMIN_INFO_NAME"><%--담당자 정보 (이름/직책)--%></th>
                                <td>
                                    <input type="text" class="w120 default-input subAdminName trn" data-trn-holder="TR_COMMON_NAME" name="sub[${status.index}].adminName" placeholder="이름" value="${subAdmin.adminName}" maxlength="10">
                                    /
                                    <input type="text" class="w120 default-input subAdminPosition trn" data-trn-holder="TR_POSITION" name="sub[${status.index}].adminPosition" placeholder="직책" value="${subAdmin.adminPosition}" maxlength="10"></td>
                                <th class="trn" data-trn-key="TR_PHONENUM"><%--휴대폰 번호--%></th>
                                <td>
                                    <c:set var="adminPhone" value="${fn:split(subAdmin.adminPhone, '-')}"/>
                                    <input type="hidden" class="adminPhone${status.index + 2}" name="sub[${status.index}].adminPhone">
                                    <select id="adminPhone${status.index + 2}_1" style="width:55px;">
                                        <option value="010" ${adminPhone[0] == '010' ? 'selected' : ''}>010</option>
                                        <option value="011" ${adminPhone[0] == '011' ? 'selected' : ''}>011</option>
                                        <option value="016" ${adminPhone[0] == '016' ? 'selected' : ''}>016</option>
                                        <option value="017" ${adminPhone[0] == '017' ? 'selected' : ''}>017</option>
                                        <option value="018" ${adminPhone[0] == '018' ? 'selected' : ''}>018</option>
                                        <option value="019" ${adminPhone[0] == '019' ? 'selected' : ''}>019</option>
                                    </select>
                                    <span class="unit">-</span>
                                    <input class="default-input onlynumber w50" id="adminPhone${status.index + 2}_2" value="${adminPhone[1]}" type="text" maxlength="4">
                                    <span class="unit">-</span>
                                    <input class="default-input onlynumber w50" id="adminPhone${status.index + 2}_3" value="${adminPhone[2]}" type="text" maxlength="4">
                                </td>
                            </tr>
                            <tr class="subAdminInfo${status.index + 2}">
                                <th class="trn" data-trn-key="TR_CLOUD_ADMIN_SUB_EMAIL"><%--보조 이메일--%></th>
                                <td colspan="3">
                                    <c:set var="adminSubEmail" value="${fn:split(subAdmin.adminSubEmail, '@')}"/>
                                    <input type="hidden" class="adminSubEmail${status.index + 2}" name="sub[${status.index}].adminSubEmail">
                                    <input type="text" id="adminSubEmail${status.index + 2}_1" class="default-input w120 mr1" value="${adminSubEmail[0]}" maxlength="50">@
                                    <input type="text" id="adminSubEmail${status.index + 2}_2" class="default-input w120" value="${adminSubEmail[1]}" maxlength="20">
                                    <select onchange="changeEmailSelect(this);" data-target="adminSubEmail${status.index + 2}_2" class="w155">
                                        <option class="trn" data-trn-key="TR_DIRECT_INPUT" value=""><%--직접입력--%></option>
                                        <option value="gmail.com" ${adminSubEmail[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                        <option value="naver.com" ${adminSubEmail[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                        <option value="daum.net" ${adminSubEmail[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                    </select>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr id="addSubAdmin">
                            <th colspan="4">
                                <label class="pointer" style="margin-left: 45%;">
                                    <span class="trn" data-trn-key="TR_CLOUD_ADD_SUB_ADMIN_INFO"><%--담당자 추가--%></span>
                                    <input type="button" class="mViewBtn_permit ml10" value="+" style="width: 30px;" onclick="addSubAdmin();">
                                </label>
                            </th>
                        </tr>
                    </table>
                </div>
            </section>

            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_OTHER_INFO"><%--기타 정보--%></h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_CLOUD_OTHER_INFO"><%--기타 정보--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_BUSINESS_TYPE"><%--업종--%></span></th>
                            <td colspan="3" class="border-b">
                                <span>
                                    <input type="hidden" name="businessCode1" value="other">
                                    <input type="text" name="newBusinessCode1" class="default-input" value="${businessCode1}" maxlength="15">
                                </span>
                                <span>
                                    <input type="hidden" name="businessCode2" value="other">
                                    <input type="text" name="newBusinessCode2" class="default-input" value="${businessCode2}" maxlength="15">
                                </span>
                                <span>
                                    <input type="hidden" name="businessCode3" value="other">
                                    <input type="text" name="newBusinessCode3" class="default-input" value="${businessCode3}" maxlength="15">
                                </span>
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
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_APPLY_DATE"><%--신청일자--%></span></th>
                            <td colspan="3">
                                <c:set var="now"><fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/></c:set>
                                <input type="text" name="applyDate" class="default-input w155 calendar" value="${customer.idx > 0 ? customer.applyDate : now}" readonly onchange="changeDate(this)">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_SERVICE_CHANGE_HOPE_DATE"><%--서비스 적용 희망 날짜--%></span></th>
                            <td>
                                <input type="text" name="serviceChangeHopeDate" class="default-input w155 serviceChangeHopeDate" value="${customer.formatedServiceChangeHopeDate}" readonly onchange="changeDate(this)">
                                <span class="trn" data-trn-key="TR_ONLY_WEEK_DAY"><%--※평일만 가능--%></span>
                            </td>
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_APPLY_ACCOUNT_COUNT"><%--신청 계정 수--%></span></th>
                            <td>
                                <span class="iServiceArea trn" data-trn-key="TR_CLOUD_APPLY_ACCOUNT_COUNT_DESCRIPTION"><%--최대 30계정 생성가능--%></span>
                                <span class="pServiceArea">
                                    <input type="text" name="applyAccountCount" class="default-input wp60 onlynumber autoComma trn" data-trn-key="TR_ONLY_NUM" onchange="setConsumerPrice()" value="${customer.applyAccountCount}" placeholder="숫자만 입력">
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th id="applyDomainArea"><span class="necessary trn" data-trn-key="TR_CLOUD_APPLY_DOMAIN"><%--신청 도메인--%></span></th>
                            <td colspan="3">
                                <p class="mb10 mt5">
                                    <label class="dis_ib w80">
                                        <input type="radio" name="ownDomainYn" value="true" ${customer == null || customer.ownDomainYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_OWNED"><%--보유--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="ownDomainYn" value="false" ${customer != null && !customer.ownDomainYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_UNOWNED"><%--미보유--%></span>
                                    </label>
                                    <span class="small-txt ownDomainTrueArea trn" data-trn-key="TR_CLOUD_NAME_SERVER_DESCRIPTION"><%--* 네임서버 및 DNS 변경은 금요일로 권장 드립니다.--%></span>
                                </p>

                                <input type="hidden" id="domain" value="${domain}">
                                @ <input type="text" name="applyMainDomain" class="default-input w200"
                                         value="${customer != null && !customer.ownDomainYn ? fn:split(customer.applyMainDomain, ".")[0] : customer.applyMainDomain}"
                                         placeholder="ex) ${customer == null || customer.ownDomainYn ? 'example.com' : 'example'}">
                                <span class="ownDomainFalseArea" style="${customer == null || customer.ownDomainYn ? 'display: none;' : ''}">
                                    ${domain == null ? ".secuecloud.com" : domain}
                                    <input type="button" class="btn btn-baseRound trn" data-trn-value="TR_COMMON_OVERLAP_CHECK" value="중복검사" onclick="domainDuplicateCheckAjax();">
                                </span>

                                <input type="button" class="mViewBtn_permit pServiceAndOwnDomainTrueArea" value="+" style="width: 30px;" onclick="addSubDomain()">
                                <input type="button" class="btn btn-baseRound ownDomainTrueArea trn" data-trn-key="TR_COMMON_OVERLAP_CHECK" value="중복검사" onclick="domainDuplicateCheckAjax();" style="${!customer.ownDomainYn ? 'display: none;' : ''}">
                                <span class="pServiceAndOwnDomainTrueArea ml5 trn" style="${customer == null || customer.ownDomainYn ? 'display: none;' : ''}" data-trn-key="TR_CLOUD_APPLY_DOMAIN_DESCRIPTION">
                                    <%--(등록한 도메인 전체를 확인합니다)--%>
                                </span>
                                <span id="domainList" class="pServiceAndOwnDomainTrueArea">
                                <c:forEach var="subDomain" items="${subDomainList}">
                                    <span class="dis_b mt5">
                                        @ <input type="text" name="applySubDomain" class="default-input" value="${subDomain.domain}" placeholder="ex) example.com" style="width: 201px;" onkeyup="subDomainKeyup();">
                                        <input type="button" class="mViewBtn_permit" value="-" style="color:#e74701; width: 30px;" onclick="deleteSubDomain(this)">
                                    </span>
                                </c:forEach>
                                </span>
                                <input type="hidden" id="isDomainDuplicateCheck" value="${customer.idx > 0 ? 'true' : 'false'}">
                            </td>
                        </tr>
                        <tr class="ownDomainTrueArea" id="nameServerUseRowspan">
                            <th rowspan="5"><span class="necessary trn" data-trn-key="TR_CLOUD_NAME_SERVER_IN_USE"><%--사용 네임서버--%></span></th>
                            <td colspan="3">
                                <label class="mr10 dis_ib mw155">
                                    <input type="radio" name="nameServerUseYn" value="false" checked> <span class="trn" data-trn-key="TR_CLOUD_SEPARATE_NAME_SERVER"><%--별도 네임서버--%></span>
                                    <span class="small-txt nameServerUseFalseArea trn" data-trn-key="TR_CLOUD_SEPARATE_NAME_SERVER_DESCRIPTION"><%--* 도메인 보유기업은 신청 접수 이후 메일로 dns 설정값을 안내해드립니다.--%></span>
                                </label>
                                <label class="mr10 dis_ib mw155">
                                    <input type="radio" name="nameServerUseYn" value="true" ${customer.nameServerUseYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_CLOUD_KIWONTECH_NAME_SERVER"><%--기원테크 네임서버--%></span>
                                    <span class="small-txt nameServerUseTrueArea trn" data-trn-key="TR_CLOUD_KIWONTECH_NAME_SERVER_DESCRIPTION"><%--* 메일로 기원테크 네임서버 설정값을 안내해드립니다.--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr class="ownDomainTrueArea nameServerUseTrueArea">
                            <td colspan="3">
                                <label class="mr10 dis_ib mw155">
                                    <input type="radio" name="recordFileEmptyYn" value="true" checked> <span class="trn" data-trn-key="TR_CLOUD_RECORD_FILE_IS_EMPTYs"><%--레코드 정보 파일 없음--%></span>
                                </label>
                                <label class="mr10 dis_ib mw155">
                                    <input type="radio" name="recordFileEmptyYn" value="false" ${customer != null && !customer.recordFileEmptyYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_CLOUD_RECORD_FILE_IS_EXISTENCE"><%--레코드 정보 파일 존재--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr class="ownDomainTrueArea nameServerUseTrueArea recordFileExistArea">
                            <td colspan="3">
                                <span class="dis-b mb10">
                                    <span class="trn" data-trn-key="TR_CLOUD_RECORD_MAKING_FILE"><%--레코드 정보 작성파일--%></span>
                                    <input type="button" class="btn btn-baseRound ownDomainTrueArea ml10 trn" data-trn-key="TR_CLOUD_RECORD_FORM_FILE" value="양식 다운로드" onclick="location.href='/file/formfileDownload?gubun=dns_record'">
                                </span>
                                <input type="file" name="dnsRecordFile">
                            </td>
                        </tr>
                        <%--rowspan 방지용 tr 선언(미사용)--%>
                        <tr class="iServiceArea"></tr>
                        <tr class="iServiceArea"></tr>
                    </table>
                </div>
            </section>

            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_MAIL_FUNC"><%--메일 기능--%></h1>
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
                        <tr class="iServiceArea">
                            <th class="trn" data-trn-key="TR_CLOUD_POP3_USE_YN"><%--POP3 사용 여부--%></th>
                            <td>
                                <label class="dis_ib w80">
                                    <input type="radio" name="pop3UseYn" value="true" ${customer != null && !customer.pop3UseYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="pop3UseYn" value="false" checked> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </label>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_WORKMAIL_USE_YN"><%--업무형 메일 사용 여부--%></th>
                            <td>
                                <label class="dis_ib w80">
                                    <input type="radio" name="workmailUse" value="true" checked> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="workmailUse" value="false" ${!customer.workmailUse ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_USE_SCHEDULE_YN"><%--일정 관리 기능 사용 여부--%></th>
                            <td class="border-b">
                                <label class="dis_ib w80">
                                    <input type="radio" name="useSchedule" value="true" checked> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="useSchedule" value="false" ${customer.useSchedule == false ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </label>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_ORGANIZATION_YN"><%--조직도 기능 사용 여부--%></th>
                            <td class="border-b">
                                <label class="dis_ib w80">
                                    <input type="radio" name="organizationYn" value="true" checked> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="organizationYn" value="false" ${customer.organizationYn == false ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </label>
                            </td>

                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_MESSAGE_USE_YN"><%--쪽지 기능 사용 여부--%></th>
                            <td class="border-b">
                                <label class="dis_ib w80">
                                    <input type="radio" name="messageUseYn" value="true" checked> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="messageUseYn" value="false" ${customer.messageUseYn == false ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </label>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_NOTICE_USE_YN"><%--알림 기능 사용 여부--%></th>
                            <td>
                                <label class="dis_ib w80">
                                    <input type="radio" name="noticeUseYn" value="true" checked> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="noticeUseYn" value="false" ${customer.noticeUseYn == false ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_GROUPWARE_USE_YN"><%--그룹웨어 사용 여부--%></th>
                            <td class="border-b">
                                <label class="dis_ib w80">
                                    <input type="radio" name="groupwareUseYn" value="true" onchange="setAreaByGroupwareUseYn()" checked> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="groupwareUseYn" value="false" onchange="setAreaByGroupwareUseYn()" ${customer.groupwareUseYn == false ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </label>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_FINANCE_USE_YN"><%--관리 회계 기능 사용 여부--%></th>
                            <td class="border-b">
                                <label class="dis_ib w80" id="nServiceColspan">
                                    <input type="radio" name="financeUseYn" value="true" checked> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="financeUseYn" value="false" ${customer.financeUseYn == false ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </label>
                            </td>
                        </tr>
                        <c:if test="${customer.equipmentInstallYn}">
                            <tr>
                                <th class="trn" data-trn-key="TR_CLOUD_PER_ADDR_USE_YN"><%--개인주소록 사용여부--%></th>
                                <td>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="perAddrUseYn" value="1" onchange="setPerAddrUseYnDescription()" checked> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="perAddrUseYn" value="0" onchange="setPerAddrUseYnDescription()" ${!customer.perAddrUseYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                    </label>
                                    <p class="fc-red mt5 perAddrUseYnDescription ${customer.perAddrUseYn ? 'dis_n' : ''} trn" data-trn-key="TR_CLOUD_GUARD_MAIL_BOX_USE_YN_DESCRIPTION1" data-key="1">* 개인 주소록 + 공용주소록 사용</p>
                                    <p class="fc-red mt5 perAddrUseYnDescription ${!customer.perAddrUseYn ? 'dis_n' : ''} trn" data-trn-key="TR_CLOUD_GUARD_MAIL_BOX_USE_YN_DESCRIPTION2" data-key="0">* 기업 주소록 + 공용주소록 사용</p>
                                </td>
                                <th class="trn" data-trn-key="TR_CLOUD_GUARD_MAIL_BOX_USE_YN"><%--가드메일함 사용여부--%></th>
                                <td>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="guardMailBoxUseYn" value="1" onchange="setPerAddrUseYnDescription()" checked> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="guardMailBoxUseYn" value="0" onchange="setPerAddrUseYnDescription()" ${customer.guardMailBoxUseYn == false ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                    </label>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_AGREE_PASS"><%--최초로그인 이용약관 사용여부--%></th>
                            <td colspan="3">
                                <label class="dis_ib w80">
                                    <input type="radio" name="agreePass" value="1" checked> <span class="trn" data-trn-key="TR_COMMON_USED"><%--사용함--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="agreePass" value="0" ${customer.agreePass == false ? 'checked' : ''}> <span class="trn" data-trn-key="TR_COMMON_NOT_USED"><%--사용 안함--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr id="groupwareOpenPriceArea" class="${customer.secuEcloudGubun != 'N' && customer.groupwareUseYn ? '' : 'dis-n'}">
                            <th class="trn" data-trn-key="TR_CLOUD_GROUPWARE_OPEN_PRICE"><%--그룹웨어 기본제공 용량 금액--%></th>
                            <td colspan="3">
                                <input type="text" name="groupwareOpenPrice" class="default-input w155 onlynumber autoComma" onchange="setConsumerPrice()" value="${customer.groupwareOpenPrice}">
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_ADDITIONAL_SERVICE"><%--부가서비스--%></h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_CLOUD_ADDITIONAL_SERVICE"><%--부가서비스--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_APPLY_ADDITIONAL_SERVICE"><%--부가서비스 신청--%></th>
                            <td colspan="3">
                                <c:set var="addApplyYn">
                                    ${((customer.addStorage > 0) || (customer.moveMailStorage > 0) || (customer.moveMailAccountCount > 0) || (customer.moveMailStorage > 0) || (customer.addExchangeSize > 0) || (customer.addOnedriveSize > 0))}
                                </c:set>
                                <label class="dis_ib w80">
                                    <input type="radio" name="addApplyYn" value="true" onchange="setAreaByAddApplyYn(false)"
                                    ${addApplyYn ? 'checked' : ''}>
                                    <span class="trn" data-trn-key="TR_SIGN_UP"><%--신청--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="addApplyYn" value="false" onchange="setAreaByAddApplyYn(false)"
                                    ${!addApplyYn ? 'checked' : ''}>
                                    <span class="trn" data-trn-key="TR_UNAPPLIED"><%--미신청--%></span>
                                </label>
                            </td>
                        </tr>

                        <tr class="addApplyArea">
                            <fmt:formatNumber value="${customer.addStorage}" var="storage"/>
                            <c:set value="10 20 30 40 50" var="ectStorage"/>
                            <th class="trn" data-trn-key="TR_CLOUD_ADD_STORAGE"><%--용량 추가--%></th>
                            <td>
                                <select class="w155" id="addStorage" onchange="setConsumerPrice()">
                                    <option class="trn" data-trn-key="TR_COMMON_CHOICE" value=""><%--선택--%></option>
                                    <option value="10" ${storage eq '10' ? 'selected' : ''}>10</option>
                                    <option value="20" ${storage eq '20' ? 'selected' : ''}>20</option>
                                    <option value="30" ${storage eq '30' ? 'selected' : ''}>30</option>
                                    <option value="40" ${storage eq '40' ? 'selected' : ''}>40</option>
                                    <option value="50" ${storage eq '50' ? 'selected' : ''}>50</option>
                                    <option class="trn" data-trn-key="TR_OTHER" value="999" ${storage ne null && !fn:contains(ectStorage, storage) ? 'selected' : ''}><%--기타--%></option>
                                </select>
                                <span class="addStorageOtherArea">
                                    <input type="text" class="default-input w100 onlynumber autoComma w155" onchange="addApplyChange(this)" name="addStorage" value="${customer.addStorage}" maxlength="6"> GB
                                </span>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_ADD_STORAGE_PRICE"><%--추가용량 10GB당 금액--%></th>
                            <td>
                                <input type="text" class="onlynumber autoComma" name="addStoragePrice" value="${customer.addStoragePrice}" onchange="setConsumerPrice()"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                        </tr>
                        <tr class="iServiceArea addApplyArea">
                            <th class="trn" data-trn-key="TR_CLOUD_ADD_ACCOUNT"><%--계정 추가--%></th>
                            <td colspan="3">
                                <input type="text" name="addAccountCount" class="default-input w155 onlynumber autoComma" onchange="setConsumerPrice()" value="${customer.addAccountCount}" maxlength="6"> 개
                                <span class="trn" data-trn-key="TR_CLOUD_ACCOUNT_DEFAULT_COUNT"><%--(30계정 기본 무료제공)--%></span>
                            </td>
                        </tr>
                        <tr class="iServiceArea addApplyArea">
                            <th class="trn" data-trn-key="TR_CLOUD_GROUP_MAIL_COUNT"><%--그룹 메일--%></th>
                            <td colspan="3">
                                <input type="text" name="groupMailCount" class="default-input w155 onlynumber autoComma" onchange="setConsumerPrice()" value="${customer.groupMailCount}" maxlength="6"> 개 (단위 5계정)
                            </td>
                        </tr>
                        <%--<tr class="addApplyArea moveMailArea">
                            <th>메일 데이터 이전</th>
                            <td colspan="3">
                                <p>
                                    <label class="dis_ib w80">
                                        <input type="radio" class="moveApplyBtn" name="moveApply" value="false" checked> 미신청
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" class="moveApplyBtn" name="moveApply" value="true" ${customer ne null && customer.moveApply ? 'checked' : ''}> 신청
                                    </label>
                                </p>
                                <span class="moveApplyInfo dis_b mt5">
                                    <span class="dis_ib w120">이전할 메일 용량</span>
                                    <input type="text" name="moveMailStorage" class="default-input w100 onlynumber autoComma" onchange="setConsumerPrice()" value="${customer.moveMailStorage}" maxlength="6"> GB
                                </span>
                                <span class="moveApplyInfo dis_b mt5">
                                    <span class="dis_ib w120">이전할 계정 수</span>
                                    <input type="text" name="moveMailAccountCount" class="default-input w100 onlynumber autoComma" onchange="setConsumerPrice()" value="${customer.moveMailAccountCount}" maxlength="6"> 개
                                </span>
                                <p class="moveApplyInfo mt5">
                                    <span class="dis_ib w120">이전할 메일 종류</span>
                                    <label class="dis_ib w80">
                                        <input type="radio" class="moveEmailGubunBtn" name="moveEmailGubun" value="C" ${customer eq null || customer.moveEmailGubun eq 'C' ? 'checked' : ''}> 기업메일
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" class="moveEmailGubunBtn" name="moveEmailGubun" value="I" ${customer.moveEmailGubun eq 'I' ? 'checked' : ''}> 개인메일
                                    </label>
                                </p>
                            </td>
                        </tr>--%>
                        <tr class="nServiceArea">
                            <th class="trn" data-trn-key="TR_CLOUD_ADD_EXCHANGE_SIZE"><%--메일 백업 용량 추가--%></th>
                            <td>
                                <input name="addExchangeSize" class="default-input w155 onlynumber autoComma" onchange="addApplyChange(this)" value="${customer.addExchangeSize}">
                                <span class="ml2">GB</span>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_ADD_EXCHANGE_PRICE"><%--메일 백업용량 50GB당 금액--%></th>
                            <td>
                                <input type="text" class="onlynumber autoComma" name="addExchangePrice" value="${customer.addExchangePrice}" onchange="addApplyChange(this)"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                        </tr>
                        <tr class="addApplyArea" id="groupWareArea">
                            <th class="trn" data-trn-key="TR_CLOUD_ADD_ONEDRIVE_SIZE"><%--그룹웨어 용량추가(10GB 단위)--%></th>
                            <td>
                                <input name="addOnedriveSize" class="default-input w155 onlynumber autoComma" onchange="addApplyChange(this)" value="${customer.addOnedriveSize}">
                                <span class="ml2">GB</span>
                            </td>
                            <th class="trn" data-trn-key="TR_CLOUD_ADD_ONEDRIVE_PRICE"><%--그룹웨어 10GB당 금액--%></th>
                            <td>
                                <input type="text" class="onlynumber autoComma" name="addOnedrivePrice" value="${customer.addOnedrivePrice}" onchange="setConsumerPrice(this)"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                        </tr>
                        <tr class="oldMailServerStorage">
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_MAIL_SERVER_QUANTITY"><%--메일서버 할당 용량--%></span></th>
                            <td colspan="3">
                                <input type="text" class="onlynumber autoComma w155" name="mailServerQuantity" value="${customer.mailServerQuantity}"> GB
                            </td>
                        </tr>
                        <tr class="addApplyArea">
                            <th class="trn" data-trn-key="TR_CLOUD_ADD_APPLY_TOTAL_PRICE"><%--월 부가서비스 이용금액--%></th>
                            <td colspan="3"><span class="red-txt" id="addApplyTotalPriceArea">0</span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span></td>
                        </tr>
                    </table>
                </div>
            </section>

            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_PAYMENT_WAY"><%--결제 유형--%></h1>
                </div>
                <div class="b-list">
                    <div class="b-tableWrap mt20">
                        <table class="b-listTable b-listTable--border">
                            <caption class="offscreen trn" data-trn-key="TR_CLOUD_PAYMENT_WAY"><%--결제 유형--%></caption>
                            <colgroup>
                                <col width="20%">
                                <col width="80%">
                            </colgroup>
                            <tbody>
                            <tr class="servivceUserPeriodTr">
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_PAYMENT_WAY"><%--결제 유형--%></span></th>
                                <td>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="paymentWay" onchange="setAreaByPaymentWay()" value="Y" checked>
                                        <span class="checkmark"></span>
                                        <span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_Y"><%--연납--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="paymentWay" onchange="setAreaByPaymentWay()" value="M" ${customer.paymentWay == "M" ? "checked" : ""}>
                                        <span class="checkmark"></span>
                                        <span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_M"><%--월납--%></span>
                                    </label>
                                </td>
                            </tr>
                            <tr class="servivceUserPeriodTr paymentYearArea">
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_SERVICE_USE_PERIOD"><%--서비스 기간--%></span></th>
                                <td>
                                    <label class="dis_ib iServiceArea">
                                        <input type="radio" name="serviceUsePeriod" value="999" checked>
                                        <span class="checkmark"></span>
                                        <span class="trn" data-trn-key="TR_NOT_APPLICABLE"><%--해당없음--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="serviceUsePeriod" onchange="setConsumerPrice()" value="12" ${customer eq null || customer.serviceUsePeriod == "12" || customer.serviceUsePeriod == "999" ? "checked" : ""}>
                                        <span class="checkmark"></span>
                                        <span class="trn" data-trn-key="TR_ONE_YEARS"><%--1년--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="serviceUsePeriod" onchange="setConsumerPrice()" value="24" ${customer.serviceUsePeriod == "24" ? "checked" : ""}>
                                        <span class="checkmark"></span>
                                        <span class="trn" data-trn-key="TR_TWO_YEARS"><%--2년--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="serviceUsePeriod" onchange="setConsumerPrice()" value="36" ${customer.serviceUsePeriod == "36" ? "checked" : ""}>
                                        <span class="checkmark"></span>
                                        <span class="trn" data-trn-key="TR_THREE_YEARS"><%--3년--%></span>
                                    </label>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <section id="partnerInfo" class="mt30 ${customer.secuEcloudGubun eq 'O' ? 'dis_n' : ''}">
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
                                <col width="20%">
                                <col width="25%">
                                <col width="5%">
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
                                    <th class="a-center"><input type="button" id="plusBtn" class="mViewBtn_permit ${empty partnerMarginInfo && customer != null ? 'dis_n' : 'dis_b'}" value="+" onclick="getPartnerInfoPopup()" style="width: 30px; margin: 0 auto"></th>
                                </tr>
                            </thead>
                            <tbody id="partnerInfoArea">
                            <c:if test="${customer == null}">
                                <tr>
                                    <td class="a-center">
                                        <img src="/resources/images/icon/check_ico.png">
                                        <input type="hidden" class="salesYn" value="1">
                                        <input type="hidden" class="partnerIdx" value="73">
                                    </td>
                                    <td class="a-center trn" data-trn-key="TR_KIWONTECH2"><%--기원테크2--%></td>
                                    <td class="a-center">OneStep</td>
                                    <td class="a-center">
                                        <input type="text" class="onlynumber autoComma costPerAccount" value="0" onchange="setMarginCalc(this)"><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                    </td>
                                    <td class="a-center">
                                        <input type="text" class="onlynumber autoComma additionalPrice" value="0" onchange=""> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                    </td>
                                    <td class="a-center">
                                        <input type="text" class="onlynumber w50 marginRate" value="0" onchange="setMarginCalc(this)">%
                                    </td>
                                    <td class="a-center">
                                        <input type="text" class="onlynumber autoComma a_right marginPrice" value="0" onchange="setMarginCalc(this)"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                    </td>
                                    <td></td>
                                </tr>
                            </c:if>

                            <c:if test="${customer != null}">
                                <c:if test="${empty partnerMarginInfo}">
                                    <tr>
                                        <td class="a-center" colspan="8">
                                            <span class="trn" data-trn-key="TR_CLOUD_NO_PARTNER_MARGIN_INFO"><%--파트너사 마진금액관련 데이터가 존재하지않습니다.--%></span>
                                            <br>
                                            <input type="button" class="mListBtn_advertising mt10 trn" data-trn-value="TR_CLOUD_SET_PARTNER_MARGIN_INFO" value="파트너사 정보 셋팅" onclick="getPartnerInfo()">
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
                                                <input type="hidden" class="salesYn" value="${marginInfo.salesYn}">
                                                <input type="hidden" class="partnerIdx" value="${marginInfo.partnerIdx}">
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
                                                <input type="text" class="onlynumber autoComma costPerAccount" value="${marginInfo.costPerAccount}" onchange="setMarginCalc(this)"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td class="a-center">
                                                <input type="text" class="onlynumber autoComma additionalPrice" value="${marginInfo.additionalPrice}" onchange="setMarginCalc(this)"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td class="a-center">
                                                <input type="text" class="onlynumber w50 marginRate" value="${marginInfo.marginRate}" onchange="setMarginCalc(this)">%
                                            </td>
                                            <td class="a-center">
                                                <input type="text" class="onlynumber autoComma a_right marginPrice" value="${marginInfo.marginPrice}" readonly> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </td>
                                            <td>
                                                <c:if test="${!marginInfo.salesYn}">
                                                    <input type="button" class="mViewBtn_permit dis_b" value="-" style="color:#e74701; width: 30px;" onclick="removeLine(this)">
                                                </c:if>
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
                            <col width="20%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="a-center trn" data-trn-key="TR_COMMON_CONTENTS"><%--내용--%></th>
                            <th class="a-center trn" data-trn-key="TR_CLOUD_MARGIN_RATE"><%--마진율--%></th>
                            <th class="a-center trn" data-trn-key="TR_CLOUD_COST_PER_ACCOUNT"><%--계정당 금액--%></th>
                            <th class="a-center trn" data-trn-key="TR_CLOUD_ADDITIONAL_PRICE_MONTHLY"><%--월 부가서비스 이용금액--%></th>
                            <th class="a-center trn" data-trn-key="TR_CLOUD_PRICE_MONTHLY"><%--월 금액--%></th>
                            <th class="a-center"><span class="paymentYearArea" id="formatServiceUsePeriod"><fmt:parseNumber value="${customer.serviceUsePeriod/12}" integerOnly="true"/></span><span class="trn" data-trn-key="TR_CLOUD_PRICE_ANNUAL"><%--년 금액--%></span></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_CONSUMER_TOTAL_PRICE"><%--소비자 총 금액--%></th>
                            <td> - </td>
                            <td>
                                <input type="text" name="costPerAccount" class="onlynumber autoComma a_right" onchange="setConsumerPrice()" value="${customer != null ? customer.costPerAccount : '10,000'}"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                            <td>
                                <input type="hidden" name="egCalc.additionalPrice" id="additionalPrice" class="onlynumber autoComma a_right" onchange="setConsumerPrice()" value="${customerPartnerCalc.additionalPrice}"> <span id="consumerAdditionalPrice"><fmt:formatNumber value="${customerPartnerCalc.additionalPrice}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                            <td>
                                <input type="text" name="egCalc.consumerPrice" id="consumerPrice" class="onlynumber autoComma a_right w155" onchange="setMarginCalc(this)" value="${customerPartnerCalc != null ? customerPartnerCalc.consumerPrice : '0'}"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                            <td class="paymentYearArea ${customer.paymentWay == 'M' ? 'dis_n' : ''}">
                                <span id="consumerPriceYearlyArea"><fmt:formatNumber value="${customerPartnerCalc.consumerPrice * customer.serviceUsePeriod}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                            <td rowspan="3" id="customerPaymentYearlyArea" class="${customer.paymentWay == 'M' ? '' : 'dis_n'}">해당사항 없음</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_PARTNER_MARGIN_TOTAL_PRICE">파트너사 총 마진금액</th>
                            <td>
                                <input type="text" name="egCalc.marginRate" id="marginRate" class="onlynumber w55" value="${customerPartnerCalc != null ? customerPartnerCalc.marginRate : '20'}" readonly> %
                            </td>
                            <td>
                                    <span id="partnerCostPerAccountArea">
                                        <fmt:formatNumber value="${(customerPartnerCalc.marginPrice - customerPartnerCalc.partnerAdditionalPrice) / customer.applyAccountCount}" pattern="#,###"/>
                                    </span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                            <td>
                                <input type="hidden" name="egCalc.partnerAdditionalPrice" class="onlynumber autoComma" id="partnerAdditionalPrice" value="${customerPartnerCalc.partnerAdditionalPrice}">
                                <span id="partnerAdditionalPriceArea"><fmt:formatNumber value="${customerPartnerCalc.partnerAdditionalPrice}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                            <td>
                                <input type="hidden" name="egCalc.marginPrice" id="marginPrice" class="autoComma onlynumber" value="${customerPartnerCalc != null ? customerPartnerCalc.marginPrice : '0'}" readonly>
                                <span id="partnerPaymentMonthArea"><fmt:formatNumber value="${customerPartnerCalc.marginPrice}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                            <td class="paymentYearArea ${customer.paymentWay == 'M' ? 'dis_n' : ''}">
                                <span id="partnerMarginPriceYearlyArea"><fmt:formatNumber value="${(customerPartnerCalc.consumerPrice - customerPartnerCalc.supplyPrice) * customer.serviceUsePeriod}" pattern="#,###"/></span> 원
                            </td>
                        </tr>
                        <tr>
                            <th class="red-txt trn" data-trn-key="TR_CLOUD_KIWONTECH_MARGIN_TOTAL_PRICE"><%--기원테크 총 마진금액--%></th>
                            <td class="red-txt">
                                <span id="supplyMarginRateArea"><fmt:formatNumber value="${100 - customerPartnerCalc.marginRate}" pattern="#,###"/></span> %
                            </td>
                            <td class="red-txt">
                                <span id="supplyCostPerAccountArea">
                                    <fmt:formatNumber value="${(customerPartnerCalc.supplyPrice - (customerPartnerCalc.additionalPrice - customerPartnerCalc.partnerAdditionalPrice)) / customer.applyAccountCount}" pattern="#,###"/>
                                </span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>

                            </td>
                            <td>
                                <span id="supplyAdditionalPrice"><fmt:formatNumber value="${customerPartnerCalc != null ? (customerPartnerCalc.additionalPrice - customerPartnerCalc.partnerAdditionalPrice) : 0}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                            <td class="red-txt">
                                <input type="hidden" name="egCalc.supplyPrice" id="supplyPrice" class="onlynumber autoComma a_right w155" value="${customerPartnerCalc != null ? customerPartnerCalc.supplyPrice : '0'}" ${customer.secuEcloudGubun != 'O' ? 'readonly' : ''}>
                                <span id="supplyPriceArea"><fmt:formatNumber value="${customerPartnerCalc.supplyPrice}" pattern="#,###"/></span><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                            <td class="red-txt paymentYearArea ${customer.paymentWay == 'M' ? 'dis_n' : ''}">
                                <span id="supplyPaymentYearlyArea"><fmt:formatNumber value="${customerPartnerCalc.supplyPrice * customer.serviceUsePeriod}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                        </tr>
                        </tbody>

                    </table>
                </div>
            </section>


            <div class="btn-area">
                <c:if test="${customer.idx > 0}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_MODIFIED" value="" onclick="saveConfirm()">
                </c:if>
                <c:if test="${customer.idx == null}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_REGISTRATION" value="" onclick="saveConfirm()">
                </c:if>
                <c:choose>
                    <c:when test="${customer.idx > 0}">
                        <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_CANCEL" value="<%--취소--%>" onclick="location.href='view?idx=${customer.idx}'">
                    </c:when>
                    <c:otherwise>
                        <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_CANCEL" value="<%--취소--%>" onclick="moveList()">
                    </c:otherwise>
                </c:choose>
            </div>
            <input type="hidden" name="blankValue">
        </form>
    </div>
</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>