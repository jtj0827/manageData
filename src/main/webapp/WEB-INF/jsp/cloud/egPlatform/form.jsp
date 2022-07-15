<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/cloud/egPlatform/form.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<section class="l-content-area">
    <c:set var="now"><fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/></c:set>
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CLOUD_TITLE3"><%--고객사 관리--%></h1>
    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <span class="necessary">
                            <label class="trn" data-trn-key="TR_CLOUD_PARTNER_NAME"><%--파트너사 명--%></label>
                            <div class="inline-group ml15">
                                <select name="partnerIdx" onchange="setAreaByPartner(false)" class="default-input w200">
                                    <c:if test="${customer == null}">
                                        <option class="trn" data-trn-key="TR_COMMON_CHOICE" value=""><%--선택--%></option>
                                    </c:if>
                                    <c:forEach items="${oneStepPartnerList}" var="partner">
                                        <option value="${partner.idx}" ${customer.partnerIdx == partner.idx? 'selected' : ''}>${partner.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <form id="saveForm">
            <input type="hidden" id="equipmentInstallYn" value="false">
            <c:if test="${customer != null and customer.idx > 0}">
                <input type="hidden" name="idx" id="idx" value="${customer.idx}">
            </c:if>
            <input type="hidden" name="operationType" value="C">
            <input type="hidden" name="ecloudUseYn" value="false">
            <input type="hidden" id="isDuplicateCheck" value="${customer.idx > 0}">

            <div class="setAreaByPartner ${customer == null ? 'dis_n' : ''}">

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
                            <tr class="${gubun == 'practicalUse' ? 'dis-n' : ''}">
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_INSTALL_GUBUN"><%--설치 구분--%></span></th>
                                <td colspan="3">
                                    <label class="dis_ib w80">
                                        <input type="radio" name="serviceUseGubun" onchange="settingPaymentArea()" value="U" ${customer == null || customer.serviceUseGubun == 'U' || gubun == 'practicalUse' ? 'checked' : ''}>&nbsp;<span class="trn" data-trn-key="TR_CLOUD_PRACTICAL_USE"><%--실사용--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="serviceUseGubun" onchange="settingPaymentArea()" value="B" ${customer.serviceUseGubun == 'B' && gubun == 'form' ? 'checked' : ''}>&nbsp;BMT
                                    </label>

                                </td>
                            </tr>
                            <tr>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_SECU_EQUIP_GUBUN"><%--보안장비 종류--%></span></th>
                                <td colspan="3">
                                    <label class="w120 dis_ib">
                                        <input type="checkbox" name="spamUseYn" value="true" ${customer.equipmentInstallYn ? 'disabled' : ''} ${customer == null or customer.spamUseYn ? 'checked' : ''}>&nbsp;SpamGUARD
                                    </label>
                                    <label class="w120 dis_ib">
                                        <input type="checkbox" name="rguardUseYn" value="true" ${customer.equipmentInstallYn ? 'disabled' : ''} ${customer == null or customer.rguardUseYn ? 'checked' : ''}>&nbsp;ReceiveGUARD
                                    </label>
                                    <label class="w120 dis_ib">
                                        <input type="checkbox" name="sendUseYn" value="true" ${customer.equipmentInstallYn ? 'disabled' : ''} ${customer == null or customer.sendUseYn ? 'checked' : ''}>&nbsp;SendGUARD
                                    </label>
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
                                        <input type="radio" onchange="setAreaByBusinessYn()" name="businessYn" value="true" checked> <span class="trn" data-trn-key="TR_CORPORATE_BODY"><%--법인--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" onchange="setAreaByBusinessYn()" name="businessYn" value="false" ${customer != null && !customer.businessYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_INDIVIDUAL"><%--개인--%></span>
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
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_REP_EMAILs"><%--대표 이메일--%></span></th>
                                <td colspan="3">
                                    <c:set var="email" value="${fn:split(customer.email, '@')}"/>
                                    <input type="hidden" name="email">
                                    <input type="text" id="email1" class="default-input w120 mr1" value="${email[0]}" maxlength="50">@
                                    <input type="text" id="email2" class="default-input w120" value="${email[1]}" maxlength="20">
                                    <select onchange="changeEmailSelect(this);" data-target="email2" class="w120">
                                        <option class="trn" data-trn-key="TR_DIRECT_INPUT" value=""><%--직접입력--%></option>
                                        <option value="gmail.com" ${email[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                        <option value="naver.com" ${email[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                        <option value="daum.net" ${email[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="vatBillArea">
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL"><%--세금 계산서 발행 이메일--%></span></th>
                                <td colspan="3">
                                    <c:set var="vatBillEmail" value="${fn:split(customer.vatBillEmail, '@')}"/>
                                    <input type="hidden" name="vatBillEmail">
                                    <input type="text" id="vatBillEmail1" class="default-input w120 mr1" value="${vatBillEmail[0]}" maxlength="50">@
                                    <input type="text" id="vatBillEmail2" class="default-input w120" value="${vatBillEmail[1]}" maxlength="20">
                                    <select onchange="changeEmailSelect(this);" data-target="vatBillEmail2" id="vatBillEmail2_ex" class="w120">
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
                                    <input class="default-input onlynumber w50" id="businessNumber1" value="${businessNumber[0]}" type="text" maxlength="3">
                                    <span class="unit">-</span>
                                    <input class="default-input onlynumber w50" id="businessNumber2" value="${businessNumber[1]}" type="text" maxlength="2">
                                    <span class="unit">-</span>
                                    <input class="default-input onlynumber w50" id="businessNumber3" value="${businessNumber[2]}" type="text" maxlength="5">
                                    <input type="button" class="btn btn-baseRound" value="중복확인" onclick="bizNumberDuplicateCheckAjax(${customer.idx})">
                                </td>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_EMPLOY_COUNT"><%--총 임직원수--%></span></th>
                                <td>
                                    <input type="text" name="employCount" class="default-input w200 onlynumber autoComma" value="${customer.employCount}" onchange="settingApplyAccountCount()" placeholder="숫자만 입력하세요." maxlength="9">
                                </td>
                            </tr>
                            <tr>
                                <th class="individualArea"><span class="necessary trn" data-trn-key="TR_BIRTH_DATEs"><%--생년월일--%></span></th>
                                <td class="individualArea" colspan="3">
                                    <input type="text" name="birthDate" class="default-input calendar w155" value="${customer.birthDate}" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_BUSINESS_TYPEs"><%--업종--%></span></th>
                                <td colspan="3">
                                    <span>
                                        <input type="hidden" name="businessCode1" value="other">
                                        <input type="text" name="newBusinessCode1" class="default-input w155" value="${businessCode1}" maxlength="15">
                                    </span>
                                    <span>
                                        <input type="hidden" name="businessCode2" value="other">
                                        <input type="text" name="newBusinessCode2" class="default-input w155" value="${businessCode2}" maxlength="15">
                                    </span>
                                    <span>
                                        <input type="hidden" name="businessCode3" value="other">
                                        <input type="text" name="newBusinessCode3" class="default-input w155" value="${businessCode3}" maxlength="15">
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <th><span class="necessary trn" data-trn-key="TR_ADDR"><%--주소--%></span></th>
                                <td colspan="3">
                                    <span class="dis_b mb5">
                                        <input type="text" name="zipcode" class="default-input w155" value="${customer.zipcode}" readonly>
                                        <input type="button" class="btn btn-baseRound trn" data-trn-value="TR_SEARCH_ADDR" value="" onclick="openAddrPopup('customer')"><%--주소검색--%>
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
                                        <input type="file" id="applyFormFile" name="applyFormFile" class="w370" style="padding: 2px 0 0 0" onchange="fileTypeCheck(this)">
                                    </span>
                                </td>
                            </tr>
                            <%-- LINE :: 온라인 신청 데이터인 경우 메모란 비노출 --%>
                            <tr>
                                <th class="trn" data-trn-key="TR_COMMON_MEMO"><%--메모--%></th>
                                <td colspan="3">
                                    <textarea name="memo" class="wp100 h100" style="resize: none">${customer.memo}</textarea>
                                </td>
                            </tr>
                            <tr class="table-head">
                                <th colspan="4" class="a_left strong">
                                    <span class="form-maintitle trn" data-trn-key="TR_CLOUD_ADMIN_INFO"><%--담당자 정보--%></span>
                                    <label style="float: right;">
                                        <input type="checkbox" id="copyInfo" style="margin:0 7px 0 0;height: auto;" onclick="copyInfoCustomer();"><span class="trn" data-trn-key="TR_COMMON_CHECK_BOX_MSG"><%--위 정보와 동일--%></span>
                                    </label>
                                </th>
                            </tr>
                            <tr>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_INFO_NAME"><%--담당자 정보 (이름/직책)--%></span></th>
                                <td>
                                    <input type="text" class="wp45 default-input trn" data-trn-holder="TR_COMMON_NAME" name="adminName" placeholder="" value="${customer.adminName}" maxlength="10"><%--이름--%>
                                    /
                                    <input type="text" class="wp45 default-input trn" data-trn-holder="TR_POSITION" name="adminPosition" placeholder="" value="${customer.adminPosition}" maxlength="10"><%--직책--%>
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
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_SUB_EMAIL"><%--보조 이메일--%></span></th>
                                <td colspan="3">
                                    <c:set var="adminSubEmail" value="${fn:split(customer.adminSubEmail, '@')}"/>
                                    <input type="hidden" name="adminSubEmail">
                                    <input type="text" id="adminSubEmail_1" class="default-input w120 mr1" value="${adminSubEmail[0]}" maxlength="50">@
                                    <input type="text" id="adminSubEmail_2" class="default-input w120" value="${adminSubEmail[1]}" maxlength="20">
                                    <select onchange="changeEmailSelect(this);" data-target="adminSubEmail_2" class="w120">
                                        <option class="trn" data-trn-key="TR_DIRECT_INPUT" value=""><%--직접입력--%></option>
                                        <option value="gmail.com" ${adminSubEmail[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                        <option value="naver.com" ${adminSubEmail[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                        <option value="daum.net" ${adminSubEmail[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                    </select>
                                    <br/><span class="small-txt trn" data-trn-key="TR_CLOUD_ADMIN_SUB_EMAIL_DESCRIPTION"><%--(*보조 이메일을 통해 서비스 가입안내를 드릴 예정으로 정확한 내용 기재 부탁드립니다.)--%></span>
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
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_APPLY_DATE"><%--신청일자--%></span></th>
                                <td class="setSpanByServiceUseGubun">
                                    <c:set var="now"><fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/></c:set>
                                    <input type="text" name="applyDate" class="default-input w155 calendar" value="${customer.idx > 0 ? customer.applyDate : now}" readonly>
                                </td>
                                <th class="vatBillArea"><span class="necessary trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL"><%--세금 계산서 발행일--%></span></th>
                                <td class="vatBillArea">
                                    <input type="text" name="vatBillDate" class="default-input w155 calendar" value="${customer.idx > 0 ? customer.formatedVatBillDate : now}" readonly>
                                </td>

                            </tr>
                            <tr>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_CONTRACT_PERIOD"><%--계약 기간--%></span></th>
                                <td colspan="3">
                                    <label class="dis_ib w80"><input type="radio" onchange="setPageAreaByContractPeriodYn()" value="true" name="contractPeriodYn" ${customer == null || customer.contractPeriodYn == true ? 'checked' : ''} class="trn" data-trn-key="TR_YES"><%--있음--%></label>
                                    <label class="dis_ib w80"><input type="radio" onchange="setPageAreaByContractPeriodYn()" value="false" name="contractPeriodYn" ${customer.contractPeriodYn == false ? 'checked' : ''} class="trn" data-trn-key="TR_NONE"><%--없음--%></label>
                                </td>
                            </tr>

                            <tr>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_SERVICE_START_DATE"><%--서비스 적용일--%></span></th>
                                <td colspan="3">
                                    <input type="text" name="serviceChangeHopeDate" onchange="setServiceEndDate()" class="default-input w155 serviceChangeHopeDate" value="${customer.idx > 0 ? customer.formatedServiceChangeHopeDate : now}" readonly>
                                    <span class="trn" data-trn-key="TR_ONLY_WEEK_DAY"><%--※평일만 가능--%></span>
                                </td>
                            </tr>
                            <tr class="setPageAreaByContractPeriodYn">
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_SERVICE_END_DATE"><%--서비스 종료일--%></span></th>
                                <td colspan="3">
                                    <input type="text" name="serviceEndDate" class="default-input w155 calendar" value="${customer.formatedServiceEndDate}" readonly>
                                </td>
                            </tr>

                            <tr>
                                <th id="applyDomainArea"><span class="necessary trn" data-trn-key="TR_CLOUD_APPLY_DOMAIN"><%--신청 도메인--%></span></th>
                                <td colspan="3">
                                    <input id="domainOverlapCheckYn" type="hidden" value="${customer != null ? 'true' : 'false'}">
                                    <span class="dis_b">
                                        @<input type="text" class="default-input w155 ml10" name="applyMainDomain" value="${customer.applyMainDomain}" onchange="settingModifyDomain(this)" placeholder="ex) example.com">
                                        <input type="button" class="mViewBtn_permit ml10 w30" value="+" onclick="addDomainList()">
                                        <input type="button" class="mViewBtn_permit ml5 trn" data-trn-value="TR_COMMON_OVERLAP_CHECK" id="domainOverlapCheck" onclick="domainOverlapCheckAjax()" value="중복검사"> <span class="fs8 fc_g trn" data-trn-key="TR_CLOUD_APPLY_DOMAIN_DESCRIPTION"><%--(등록한 도메인 전체를 확인합니다.)--%></span>
                                    </span>
                                    <div id="domainArea" class="mb10">
                                        <c:forEach var="subDomain" items="${domainList}">
                                            <span class="dis_b mt10 ">
                                            @<input type="text" class="default-input w155 ml10" name="domainList" data-idx="${subDomain.idx}" value="${subDomain.domain}" onchange="settingModifyDomain(this)" placeholder="ex) example.com">
                                            <input type="button" class="mViewBtn_block ml10 w30" value="-" data-idx="${subDomain.idx}" onclick="removeDomain(this);">
                                            </span>
                                        </c:forEach>
                                    </div>
                                    <span class="small-txt trn" data-trn-key="TR_CLOUD_DOMAIN_MSG"><%--* 최상단에 입력한 도메인을 바탕으로 관리자 계정 ID, 임시 비밀번호를 설정합니다.--%></span>
                                </td>
                            </tr>
                            <tr class="ownDomainTrueArea" id="nameServerUseRowspan">
                                <th rowspan="5"><span class="necessary trn" data-trn-key="TR_CLOUD_NAME_SERVER_IN_USE"><%--사용 네임서버--%></span></th>
                                <td colspan="3">
                                    <label class="dis_ib mw155">
                                        <input type="radio" name="nameServerUseYn" onchange="setAreaByNameServerUseYn()" value="false" ${customer != null || !customer.nameServerUseUn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_CLOUD_SEPARATE_NAME_SERVER"><%--별도 네임서버--%></span>
                                        <span class="small-txt nameServerUseFalseArea trn" data-trn-key="TR_CLOUD_SEPARATE_NAME_SERVER_DESCRIPTION"><%--* 도메인 보유기업은 신청 접수 이후 메일로 dns 설정값을 안내해드립니다.--%></span>
                                    </label>
                                    <label class="mr10 dis_ib mw155">
                                        <input type="radio" name="nameServerUseYn" onchange="setAreaByNameServerUseYn()" value="true" ${!customer.nameServerUseYn ? '' : 'checked'}> <span class="trn" data-trn-key="TR_CLOUD_KIWONTECH_NAME_SERVER"><%--기원테크 네임서버--%></span>
                                        <span class="small-txt nameServerUseTrueArea trn" data-trn-key="TR_CLOUD_KIWONTECH_NAME_SERVER"><%--* 메일로 기원테크 네임서버 설정값을 안내해드립니다.--%></span>
                                    </label>
                                </td>
                            </tr>
                            <tr class="ownDomainTrueArea nameServerUseTrueArea">
                                <td colspan="3">
                                    <label class="dis_ib mw155">
                                        <input type="radio" onchange="setAreaByNameServerUseYn()" name="recordFileEmptyYn" value="true" checked> <span class="trn" data-trn-key="TR_CLOUD_RECORD_FILE_IS_EMPTY"><%--레코드 정보 파일 없음--%></span>
                                    </label>
                                    <label class="dis_ib mw155">
                                        <input type="radio" onchange="setAreaByNameServerUseYn()" name="recordFileEmptyYn" value="false" ${customer != null && !customer.recordFileEmptyYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_CLOUD_RECORD_FILE_IS_EXISTENCE"><%--레코드 정보 파일 존재--%></span>
                                    </label>
                                </td>
                            </tr>
                            <tr class="ownDomainTrueArea nameServerUseTrueArea recordFileExistArea">
                                <td colspan="3">
                                    <span class="dis-b mb10">
                                        <span class="trn" data-trn-key="TR_CLOUD_RECORD_MAKING_FILE"><%--레코드 정보 작성파일--%></span>
                                        <input type="button" class="btn btn-baseRound ownDomainTrueArea ml10" value="양식 다운로드" onclick="location.href='/file/formfileDownload?gubun=dns_record'">
                                    </span>
                                    <input type="file" name="dnsRecordFile" class="w370">
                                </td>
                            </tr>
                            <%--rowspan 방지용 tr 선언(미사용)--%>
                            <tr></tr>
                            <tr></tr>
                            <tr></tr>
                            <tr></tr>
                            <tr>
                                <th><span class="necessary">Mail Server IP</span></th>
                                <td colspan="3" id="mailServerIpList">
                                    <span class="dis_b">
                                                    <input type="text" class="default-input w155" name="mailServerIp" value="${mailServerIpList[0].ip}" placeholder="111.111.111.111">
                                                    <input type="button" class="mViewBtn_permit ml5 w30" value="+" onclick="addMailServerIp()">
                                                </span>
                                    <c:forEach var="mailServerIp" items="${mailServerIpList}" varStatus="status">
                                        <c:choose>
                                            <c:when test="${status.index == 0}">

                                            </c:when>
                                            <c:otherwise>
                                                <span class="dis_b">
                                                    <input type="text" class="default-input w155" name="mailServerIp" value="${mailServerIp.ip}" placeholder="111.111.111.111">
                                                    <input type="button" class="mViewBtn_block ml10" value="-" onclick="removeMailServerIp(this)">
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                </td>
                            </tr>
                        </table>
                    </div>
                </section>

                <section class="mt30">
                    <div class="b-title">
                        <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_PAYMENT_INFO"><%--결제 정보--%></h1>
                    </div>
                    <div class="b-list">
                        <div class="b-tableWrap over-x__n mt20">
                            <table class="b-listTable b-listTable--border">
                                <caption class="offscreen trn" data-trn-key="TR_CLOUD_PAYMENT_INFO"><%--결제 정보--%></caption>
                                <colgroup>
                                    <col width="20%">
                                    <col width="30%">
                                    <col width="20%">
                                    <col width="30%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th><span class="necessary trn" data-trn-key="TR_CLOUD_TOTAL_ACCOUNT_COUNT"><%--총 계정 수--%></span></th>
                                    <td>
                                        <div>
                                            <input type="text" name="applyAccountCount" onchange="settingConsumerPrice()" class="default-input w155 autoComma onlynumber trn" data-trn-holder="TR_ONLY_NUM" value="${customer.applyAccountCount}" placeholder=""><%--숫자만 입력--%>
                                            <label class="dis_ib w80"><input type="radio" onchange="setPageAreaByFullUseYn()" value="true" name="fullUseYn" ${customer == null || customer.fullUseYn == true ? 'checked' : ''}>&nbsp;<span class="trn" data-trn-key="TR_ALL_USE"><%--전체사용--%></span></label>
                                            <label class="dis_ib w80"><input type="radio" onchange="setPageAreaByFullUseYn()" value="false" name="fullUseYn" ${customer.fullUseYn == false ? 'checked' : ''}>&nbsp;<span class="trn" data-trn-key="TR_PART_USE"><%--일부사용--%></span></label>
                                        </div>
                                    </td>
                                    <th><span class="necessary trn" data-trn-key="TR_COMMON_PAYMENT_WAY"><%--납부 방식--%></span></th>
                                    <td>
                                        <label class="dis_ib w80"><input type="radio" onchange="setAreaByPaymentWay()" value="M" name="paymentWay" checked><span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY"><%--월납--%></span></label>
                                        <label class="dis_ib w80"><input type="radio" onchange="setAreaByPaymentWay()" value="Y" name="paymentWay" ${customer != null && customer.paymentWay == "Y" ? "checked" : ""}><span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_Y"><%--연납--%></span></label>
                                    </td>
                                </tr>
                                <tr class="servivceUserPeriodTr paymentYearArea">
                                    <th><span class="necessary trn" data-trn-key="TR_CLOUD_SERVICE_USE_PERIOD"><%--서비스 기간--%></span></th>
                                    <td colspan="3">
                                        <label class="dis_ib w80">
                                            <input type="radio" name="serviceUsePeriod" onchange="settingConsumerPrice()" value="12" checked>
                                            <span class="checkmark"></span>
                                            <span class="trn" data-trn-key="TR_ONE_YEARS"><%--1년--%></span>
                                        </label>
                                        <label class="dis_ib w80">
                                            <input type="radio" name="serviceUsePeriod" onchange="settingConsumerPrice()" value="24" ${customer.serviceUsePeriod == "24" ? "checked" : ""}>
                                            <span class="checkmark"></span>
                                            <span class="trn" data-trn-key="TR_TWO_YEARS"><%--2년--%></span>
                                        </label>
                                        <label class="dis_ib w80">
                                            <input type="radio" name="serviceUsePeriod" onchange="settingConsumerPrice()" value="36" ${customer.serviceUsePeriod == "36" ? "checked" : ""}>
                                            <span class="checkmark"></span>
                                            <span class="trn" data-trn-key="TR_THREE_YEARS"><%--3년--%></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr class="setPageAreaByFullUseYn">
                                    <th><span class="necessary trn" data-trn-key="TR_CLOUD_UNUSE_ACCOUNT_PER_PRICE"><%--미사용 계정당 가격--%></span></th>
                                    <td>
                                        <input type="text" class="onlynumber autoComma a_right" name="disPricePerUnusedAccount" value="${customer.disPricePerUnusedAccount == null ? '1000' : customer.disPricePerUnusedAccount}" onchange="settingConsumerPrice()"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                    </td>
                                </tr>

                                <tr class="setPageAreaByFullUseYn">
                                    <th rowspan="2"><span class="necessary trn" data-trn-key="TR_CLOUD_UNUSE_ACCOUNT_COUNT"><%--미사용 계정 수--%></span></th>

                                    <td colspan="3">
                                    <span class="dis-ib"><input type="text" class="default-input onlynumber w155 trn" data-trn-holer="TR_AUTO_INPUT" name="unUsedAccountCount" onchange="unUsedAccountCountChange()" placeholder="" value="${customer != null ? customer.unUsedAccountCount : '0'}" readonly><%--자동입력--%>
                                        <input type="button" class="w100 ml5 trn" data-trn-value="TR_CLOUD_RECORD_FORM_FILE" value="" onclick="location.href='/file/formfileDownload?gubun=unused_id'"><%--양식 다운로드--%>
                                        <div class="dis-b mt5"><span class="dis-ib"><input type="file" name="unUsedAccountFile" class="w370" style="padding: 2px 0 0 0" onchange="fileTypeCheck(this)"> <span class="fc_g trn" data-trn-key="TR_CLOUD_UNUSE_ACCOUNT_FILE_UPLOAD"><%--(미사용 계정 목록 파일 업로드)--%></span></span></div>
                                    </span>
                                    </td>
                                </tr>
                                <tr class="setPageAreaByFullUseYn pl15 pr15">
                                    <td colspan="3">
                                        <div class="conView_multyBox mb10 fs13 login_list max-h200" style="height: auto; width: 100%">
                                            <ul class="" id="unUsedIdList" style="opacity: 1; pointer-events: auto; min-height: 150px;">
                                                <c:forEach var="unUsedId" items="${unUsedAccountList}" varStatus="status">
                                                <li class="o_h">
                                                    <span class="fl dis_ib w230">
                                                        <input type="hidden" name="unUsedId" value="${unUsedId.id}">
                                                        ${status.index + 1}
                                                    </span>
                                                    ${unUsedId.id}
                                                </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>

                <section class="mt30 paymentArea">
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
                                    <th class="a-center trn" data-trn-key="TR_CLOUD_UNUSE_ACCOUNT_PRICE"><%--미사용 계정 금액--%></th>
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
                                            <input type="text" class="onlynumber autoComma costPerAccount" value="0" onchange="setMarginCalc(this)">%
                                        </td>
                                        <td class="a-center">
                                            <input type="text" class="onlynumber autoComma additionalPrice" value="0" onchange="setMarginCalc(this)">%
                                        </td>
                                        <td class="a-center">
                                            <input type="text" class="onlynumber w50 marginRate" value="0" onchange="setMarginCalc(this)">%
                                        </td>
                                        <td class="a-center">
                                            <input type="text" class="onlynumber autoComma a_right marginPrice" value="0" readonly> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                        </td>
                                        <td></td>
                                    </tr>
                                </c:if>

                                <c:if test="${customer != null}">
                                    <c:if test="${empty partnerMarginInfo}">
                                        <tr>
                                            <td class="a-center" colspan="6">
                                                <span class="trn" data-trn-key="TR_CLOUD_NO_PARTNER_MARGIN_INFO"><%--파트너사 마진금액관련 데이터가 존재하지않습니다.--%></span>
                                                <br>
                                                <input type="button" class="mListBtn_advertising mt10 trn" data-trn-value="TR_CLOUD_SET_PARTNER_MARGIN_INFO" value="" onclick="getPartnerInfo()"><%--파트너사 정보 셋팅--%>
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
                                                    <input type="text" class="onlynumber autoComma a_right marginPrice" value="${marginInfo.marginPrice}" onchange="setMarginCalc(this)" readonly> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
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


                <section class="mt30 paymentArea">
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
                                <th class="a-center trn" data-trn-key="TR_CLOUD_ADD_APPLY_TOTAL_PRICE"><%--월 부가서비스 이용금액--%></th>
                                <th class="a-center trn" data-trn-key="TR_CLOUD_PRICE_MONTHLY"><%--월 금액--%></th>
                                <th class="a-center"><span class="paymentYearArea" id="formatServiceUsePeriod"><fmt:parseNumber value="${customer.serviceUsePeriod/12}" integerOnly="true"/></span><span class="trn" data-trn-key="TR_CLOUD_PRICE_ANNUAL"><%--년 금액--%></span></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th class="trn" data-trn-key="TR_CLOUD_CUSTOMER_TOTAL_PRICE"><%--소비자 총 금액--%></th>
                                <td> - </td>
                                <td>
                                    <input type="text" name="costPerAccount" class="onlynumber autoComma a_right" onchange="settingConsumerPrice()" value="${customer != null ? customer.costPerAccount : '6,000'}"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <td>
                                    <input type="hidden" name="egCalc.additionalPrice" id="additionalPrice" class="onlynumber autoComma a_right" onchange="settingConsumerPrice()" value="${customerPartnerCalc != null ?customerPartnerCalc.additionalPrice : '0'}"> <span id="consumerAdditionalPrice"><fmt:formatNumber value="${customerPartnerCalc != null ? customerPartnerCalc.additionalPrice : 0}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <td>
                                    <input type="text" name="egCalc.consumerPrice" id="consumerPrice" class="onlynumber autoComma a_right w155" onchange="setMarginCalc(this)" value="${customerPartnerCalc != null ? customerPartnerCalc.consumerPrice : '0'}"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <td class="paymentYearArea ${customer.paymentWay == 'M' ? 'dis_n' : ''}">
                                    <span id="consumerPriceYearlyArea"><fmt:formatNumber value="${customerPartnerCalc.consumerPrice * customer.serviceUsePeriod}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <td rowspan="3" id="customerPaymentYearlyArea" class="${customer.paymentWay == 'M' ? '' : 'dis_n'} trn" data-trn-key="TR_NOT_APPLICABLE"><%--해당사항 없음--%></td>
                            </tr>
                            <tr>
                                <th class="trn" data-trn-key="TR_CLOUD_PARTNER_MARGIN_TOTAL_PRICE"><%--파트너사 총 마진금액--%></th>
                                <td>
                                    <input type="text" name="egCalc.marginRate" id="marginRate" class="onlynumber w55" value="${customerPartnerCalc != null ? customerPartnerCalc.marginRate : '20'}" readonly> %
                                </td>
                                <td>
                                    <span id="partnerCostPerAccountArea">
                                        <fmt:formatNumber value="${customerPartnerCalc != null ? ((customerPartnerCalc.marginPrice - customerPartnerCalc.partnerAdditionalPrice) / customer.applyAccountCount) : '0'}" pattern="#,###"/>
                                    </span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <td>
                                    <input type="hidden" name="egCalc.partnerAdditionalPrice" class="onlynumber autoComma" id="partnerAdditionalPrice" value="${customerPartnerCalc.partnerAdditionalPrice}">
                                    <span id="partnerAdditionalPriceArea"><fmt:formatNumber value="${customerPartnerCalc != null ? customerPartnerCalc.partnerAdditionalPrice : '0'}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <td>
                                    <input type="hidden" name="egCalc.marginPrice" id="marginPrice" class="autoComma onlynumber" value="${customerPartnerCalc != null ? customerPartnerCalc.marginPrice : '0'}" readonly>
                                    <span id="partnerPaymentMonthArea"><fmt:formatNumber value="${customerPartnerCalc != null ? customerPartnerCalc.marginPrice : '0'}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <td class="paymentYearArea ${customer.paymentWay == 'M' ? 'dis_n' : ''}">
                                    <span id="partnerMarginPriceYearlyArea"><fmt:formatNumber value="${customerPartnerCalc != null ? ((customerPartnerCalc.consumerPrice - customerPartnerCalc.supplyPrice) * customer.serviceUsePeriod) : 0}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                            </tr>
                            <tr>
                                <th class="red-txt trn" data-trn-key="TR_CLOUD_KIWONTECH_MARGIN_TOTAL_PRICE"><%--기원테크 총 마진금액--%></th>
                                <td class="red-txt">
                                    <span id="supplyMarginRateArea"><fmt:formatNumber value="${100 - customerPartnerCalc.marginRate}" pattern="#,###"/></span> %
                                </td>
                                <td class="red-txt">
                                    <span id="supplyCostPerAccountArea">
                                        <fmt:formatNumber value="${customerPartnerCalc != null ? ((customerPartnerCalc.supplyPrice - (customerPartnerCalc.additionalPrice - customerPartnerCalc.partnerAdditionalPrice)) / customer.applyAccountCount) : '0'}" pattern="#,###"/>
                                    </span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <td>
                                    <span id="supplyAdditionalPrice"><fmt:formatNumber value="${customerPartnerCalc != null ? (customerPartnerCalc.additionalPrice - customerPartnerCalc.partnerAdditionalPrice) : '0'}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <td class="red-txt">
                                    <input type="hidden" name="egCalc.supplyPrice" id="supplyPrice" class="onlynumber autoComma a_right w155" value="${customerPartnerCalc != null ? customerPartnerCalc.supplyPrice : '0'}" ${customer.secuEcloudGubun != 'O' ? 'readonly' : ''}>
                                    <span id="supplyPriceArea"><fmt:formatNumber value="${customerPartnerCalc != null ? customerPartnerCalc.supplyPrice : '0'}" pattern="#,###"/></span><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <td class="red-txt paymentYearArea ${customer.paymentWay == 'M' ? 'dis_n' : ''}">
                                    <span id="supplyPaymentYearlyArea"><fmt:formatNumber value="${customerPartnerCalc != null ? customerPartnerCalc.supplyPrice * customer.serviceUsePeriod : '0'}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                            </tr>
                            </tbody>

                        </table>
                    </div>
                </section>

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
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_GROUP_ACCESS_IP"><%--그룹관리자 IP--%></span></th>
                                <td colspan="3">
                                    <input type="text" name="guardAccessIp" class="default-input w155" placeholder="111.111.111.111" value="${customer.guardAccessIp}" ${customer.equipmentInstallYn ? 'readonly' : ''}>
                                    <span class="dis-b small-txt trn" data-trn-key="TR_CLOUD_GROUP_ACCESS_IP_MSG"><%--* 보안장비 접속 가능한 IP입니다. IP 추가는 유선으로 진행됩니다.--%></span>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_ACCOUNT_ID"><%--관리자 계정 ID--%></span></th>
                                <td>
                                    <input type="text" name="guardAdminId" class="default-input w155" value="${customer.guardAdminId}" readonly>
                                </td>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_ACCOUNT_PW"><%--관리자 계정 임시 비밀번호--%></span></th>
                                <td>
                                    <input type="text" name="guardAdminPw" class="default-input w155" value="${customer.guardAdminPw}" readonly>
                                </td>
                            </tr>
                        </table>
                    </div>
                </section>

                <section class="mt30">

                    <div class="b-title">
                        <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_MAIL_BACKUP"><%--메일 백업--%></h1>
                    </div>

                    <div class="b-tableWrap mt10 ofx-h">
                        <table class="b-listTable b-listTable--border">
                            <caption class="offscreen trn" data-trn-key="TR_CLOUD_MAIL_BACKUP"><%--메일 백업--%></caption>
                            <colgroup>
                                <col width="20%">
                                <col width="30%">
                                <col width="20%">
                                <col width="30%">
                            </colgroup>
                            <tr>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_MAIL_BACKUP_SERVICE_USE_YN"><%--메일 백업서비스 사용여부--%></span></th>
                                <td colspan="3">
                                    <label class="dis_ib w80">
                                        <input type="radio" name="mailBackupUseYn" value="false" onchange="setAreaByMailBackupUseYn()" ${customer == null || !customer.mailBackupUseYn ? "checked" : ""}>
                                        <span class="trn" data-trn-key="TR_UNUSE"><%--미사용--%></span>
                                    </label>
                                    <label class="dis_ib w80">
                                        <input type="radio" name="mailBackupUseYn" value="true" onchange="setAreaByMailBackupUseYn()" ${customer != null && customer.mailBackupUseYn ? "checked" : ""}>
                                        <span class="trn" data-trn-key="TR_USE"><%--사용--%></span>
                                    </label>
                                </td>
                            </tr>

                            <tr class="mailBackUpArea">
                                <th rowspan="5" class="trn" data-trn-key="TR_CLOUD_MAIL_BACKUP_SETTING"><%--메일 백업 설정--%></th>
                                <td colspan="3">
                                    <label class="dis_ib">
                                        <input type="radio" name="mailBackupType" value="E" onchange="setAreaByMailBackupType()" ${customer == null || customer.mailBackupType=='E' ? "checked" : ""}>
                                        Exchange
                                    </label>
                                    <label class="dis_ib">
                                        <input type="radio" name="mailBackupType" value="S" onchange="setAreaByMailBackupType()" ${customer != null && customer.mailBackupType=='S' ? "checked" : ""}>
                                        <span class="trn" data-trn-key="TR_CLOUD_MAIL_BACKUP_OTHER_STORAGE_SERVER"><%--별도 Storage서버--%></span>
                                    </label>
                                </td>
                            </tr>
                            <tr class="exchangeArea">
                                <td colspan="3">
                                                <span>
                                                    <input type="button" class="mViewBtn_permit fr mr50 trn" data-trn-value="TR_CLOUD_EXCHANGE_ACCOUNT_SETTING" value="" onclick="addExchangeAccountPopup(${customer.idx})"><%--Exchange 계정 설정--%>
                                                </span>
                                </td>
                            </tr>
                            <tr class="exchangeArea">
                                <td colspan="3">
                                    <div class="conView_multyBox mb10 fs13" style="width: 750px;">
                                        <ul id="exchangeAccountList">
                                            <c:forEach items="${exchangeAccountList}" var="account" varStatus="status">
                                                <li class="o_h">
                                                                <span class="exchangeAccount w300 dis_ib ml10">
                                                                    <input type="hidden" class="exchangeAccountIdx" name="exchangeAccount[${status.index}].idx" value="${account.idx}">
                                                                    ${account.account}
                                                                </span>
                                                    <span class="exchangeUseYn w100 dis_ib">
                                                                    <input type="hidden" class="exchangeSaveYn" name="exchangeAccount[${status.index}].exchangeSaveYn" value="${account.exchangeSaveYn}">
                                                                    ${account.exchangeSaveYn ? '사용' : '미사용'}
                                                                </span>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr class="separateArea" style="border-bottom: none;">
                                <td colspan="3" style="border-bottom: none;">
                                                <span>
                                                    <input type="text" id="storageServerIp" class="w250 mr10 trn" data-trn-holder="TR_CLOUD_SERVER_IP" maxlength="18" placeholder=""><%--서버 IP--%>
                                                </span>
                                    :
                                    <span>
                                                    <input type="text" id="storageServerPort" class="w100 ml10 onlynumber trn" data-trn-holder="TR_PORT" maxlength="5" placeholder=""><%--포트--%>
                                                </span>
                                    <span class="ml20">
                                        <span class="trn" data-trn-key="TR_CLOUD_TLS_USE_YN"><%--tls 사용여부--%></span>> :
                                                    <label class="dis_ib">
                                                        <input type="radio" name="storageServerTlsUseYnRadio" value="0" checked>
                                                        <span class="trn" data-trn-key="TR_UNUSE"><%--미사용--%></span>
                                                    </label>
                                                    <label class="dis_ib">
                                                        <input type="radio" name="storageServerTlsUseYnRadio" value="1">
                                                        <span class="trn" data-trn-key="TR_USE"><%--사용--%></span>
                                                    </label>
                                                </span>
                                    <input type="button" class="mViewBtn_permit fr mr50 trn" data-trn-value="TR_COMMON_ADD" value="" onclick="addSeparateInfo()"><%--추가--%>
                                </td>
                            </tr>

                            <tr class="separateArea">
                                <td colspan="3">
                                    <div class="conView_multyBox mb10 fs13" style="width: 750px;">
                                        <ul id="storageServerList">
                                            <c:forEach items="${storageServerInfo}" var="storageServer">
                                                <li class="o_h">
                                                                <span class="storageServerIp w250 mr10 dis_ib">
                                                                    <input type="hidden" name="storageServerIp" value="${storageServer.ip}">
                                                                    ${storageServer.ip}
                                                                </span>
                                                    :
                                                    <span class="storageServerPort w100 ml10 dis_ib">
                                                                    <input type="hidden" name="storageServerPort" value="${storageServer.port}">
                                                                    ${storageServer.port}
                                                                </span>
                                                    <span class="storageServerTlsUseYn dis_ib w100">
                                                                    <input type="hidden" name="storageServerTlsUseYn" value="${storageServer.tlsUseYn}">
                                                        <c:if test="${storageServer.tlsUseYn}">
                                                            <span class="trn" data-trn-key="TR_CLOUD_TLS_USE"><%--TLS 사용--%></span>
                                                        </c:if>
                                                        <c:if test="${!storageServer.tlsUseYn}">
                                                            <span class="trn" data-trn-key="TR_CLOUD_TLS_UNUSE"><%--TLS 미사용--%></span>
                                                        </c:if>
                                                                </span>
                                                    <span class="storageServerUseYn dis_ib">
                                                                    <label class="dis_ib">
                                                                        <span class="trn" data-trn-key="TR_USE"><%--사용--%></span> <input type="radio" name="storageServerUseYn" value="1" ${storageServer.useYn ? 'checked' : ''}>
                                                                    </label>
                                                                </span>
                                                    <span class="fr mr10">
                                                                    <input type="button" class="mViewBtn_block ml10 w30 mt5 storageServerRemoveBtn" value="-" onclick="removeLine(this);">
                                                                </span>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </div>
                </section>

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
                                <td id="partnerName">
                                    ${partnerInfo.name}
                                </td>
                            </tr>
                            <tr>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_NAME"><%--담당자명--%></span></th>
                                <td>
                                    <input type="text" class="w155 default-input trn" data-trn-holder="TR_COMMON_NAME" name="applyPartnerInfoEntity.adminName" id="applyPartnerAdminName" placeholder="이름" value="${applyPartnerInfo.adminName}" maxlength="10">
                                </td>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_PHONE_NUM"><%--담당자 핸드폰 번호--%></span></th>
                                <td>
                                    <c:set var="applyPartnerAdminPhone" value="${fn:split(applyPartnerInfo.adminPhone, '-')}"/>
                                    <input type="hidden" id="applyPartnerAdminPhone" name="applyPartnerInfoEntity.adminPhone">
                                    <%--<input class="default-input onlynumber w50" id="adminPhone_1" value="${adminPhone[0]}" type="text" maxlength="3">--%>
                                    <select id="applyPartnerAdminPhone_1" class="w55">
                                        <option value="010" ${applyPartnerAdminPhone[0] == '010' ? 'selected' : ''}>010</option>
                                        <option value="011" ${applyPartnerAdminPhone[0] == '011' ? 'selected' : ''}>011</option>
                                        <option value="016" ${applyPartnerAdminPhone[0] == '016' ? 'selected' : ''}>016</option>
                                        <option value="017" ${applyPartnerAdminPhone[0] == '017' ? 'selected' : ''}>017</option>
                                        <option value="018" ${applyPartnerAdminPhone[0] == '018' ? 'selected' : ''}>018</option>
                                        <option value="019" ${applyPartnerAdminPhone[0] == '019' ? 'selected' : ''}>019</option>
                                    </select>
                                    <span class="unit">-</span>
                                    <input class="default-input onlynumber w50" id="applyPartnerAdminPhone_2" value="${applyPartnerAdminPhone[1]}" type="text" maxlength="4">
                                    <span class="unit">-</span>
                                    <input class="default-input onlynumber w50" id="applyPartnerAdminPhone_3" value="${applyPartnerAdminPhone[2]}" type="text" maxlength="4">
                                </td>
                            </tr>
                            <tr>
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_ADMIN_EMAIL"><%--담당자 이메일--%></span></th>
                                <td colspan="3">
                                    <c:set var="applyPartnerAdminEmail" value="${fn:split(applyPartnerInfo.adminEmail, '@')}"/>
                                    <input type="hidden" id="applyPartnerAdminEmail" name="applyPartnerInfoEntity.adminEmail">
                                    <input type="text" id="applyPartnerAdminEmail_1" class="default-input w120 mr1" value="${applyPartnerAdminEmail[0]}" maxlength="50">@
                                    <input type="text" id="applyPartnerAdminEmail_2" class="default-input w120" value="${applyPartnerAdminEmail[1]}" maxlength="20">
                                    <select onchange="changeEmailSelect(this);" data-target="applyPartnerAdminEmail_2" class="w120">
                                        <option class="trn" data-trn-key="TR_DIRECT_INPUT" value=""><%--직접입력--%></option>
                                        <option value="gmail.com" ${applyPartnerAdminEmail[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                        <option value="naver.com" ${applyPartnerAdminEmail[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                        <option value="daum.net" ${applyPartnerAdminEmail[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="vatBillArea">
                                <th><span class="necessary trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL"><%--세금 계산서 발행 이메일--%></span></th>
                                <td colspan="3">
                                    <c:set var="applyPartnerAdminVatBillEmail" value="${fn:split(applyPartnerInfo.adminVatBillEmail, '@')}"/>
                                    <input type="hidden" id="applyPartnerAdminVatBillEmail" name="applyPartnerInfoEntity.adminVatBillEmail">
                                    <input type="text" id="applyPartnerAdminVatBillEmail_1" class="default-input w120 mr1" value="${applyPartnerAdminVatBillEmail[0]}" maxlength="50">@
                                    <input type="text" id="applyPartnerAdminVatBillEmail_2" class="default-input w120" value="${applyPartnerAdminVatBillEmail[1]}" maxlength="20">
                                    <select onchange="changeEmailSelect(this);" data-target="applyPartnerAdminVatBillEmail_2" id="applyPartnerAdminVatBillEmail_ex" class="w120">
                                        <option class="trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL" value=""><%--직접입력--%></option>
                                        <option value="gmail.com" ${applyPartnerAdminVatBillEmail[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                        <option value="naver.com" ${applyPartnerAdminVatBillEmail[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                        <option value="daum.net" ${applyPartnerAdminVatBillEmail[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                </section>

            </div>
            <div id="deleteDomain"></div>
            <div id="modifyDomain"></div>
            <div id="storageServerInfoList"></div>

            <div class="btn-area">
                <c:if test="${customer.idx > 0}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_MODIFIED" value="" onclick="saveConfirm()"><%--수정--%>
                </c:if>
                <c:if test="${customer.idx < 0}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_REGISTRATION" value="" onclick="saveConfirm()"><%--등록--%>
                </c:if>
                <c:choose>
                    <c:when test="${customer.idx > 0}">
                        <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_CANCEL" value="" onclick="location.href='view?idx=${customer.idx}'"><%--취소--%>
                    </c:when>
                    <c:otherwise>
                        <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_CANCEL" value="" onclick="moveList()"><%--취소--%>
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