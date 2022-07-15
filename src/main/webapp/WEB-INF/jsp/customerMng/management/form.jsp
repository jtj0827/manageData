<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/customerMng/management/form.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>

<section class="l-content-area">
    <c:set var="now"><fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/></c:set>
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CLOUD_TITLE4"><%--고객사 현황--%></h1>

    <div class="l-maxwrap">
<%--        <input type="hidden" id="isDuplicateCheck" value="${management.idx > 0}">--%>
        <input type="hidden" id="equipmentInstallYn" value="false">
        <form id="saveForm">
            <c:if test="${management.idx > 0}"><input type="hidden" name="idx" id="idx" value="${management.idx}"></c:if>
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
                            <th><span class="necessary trn" data-trn-key="TR_CLOUD_COMPANY_NAME"><%--기업명--%></span></th>
                            <td>
                                <input type="text" id="name" name="name" class="default-input w155" value="${management.name}" maxlength="30">
                            </td>
                            <th><span class="trn" data-trn-key="TR_CLOUD_COMPANY_BUSINESS_YN"><%--기업형태--%></span></th>
                            <td>
                                <label class="dis_ib w80">
                                    <input type="radio" name="businessYn" value="true" checked> <span class="trn" data-trn-key="TR_CORPORATE_BODY"><%--법인--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="businessYn" value="false" ${management != null && !management.businessYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_INDIVIDUAL"><%--개인--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="trn" data-trn-key="TR_CLOUD_REP_NAME"><%--대표자 이름--%></span></th>
                            <td colspan="3">
                                <input type="text" name="repName" class="default-input w155" value="${management.repName}" maxlength="10">
                            </td>

                        </tr>
                        <tr>
                            <th><span class="trn" data-trn-key="TR_CLOUD_REP_TEL_NUMBER"><%--대표 전화번호--%></span></th>
                            <td>
                                <c:set var="tel" value="${fn:split(management.tel, '-')}"/>
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
                                <c:set var="fax" value="${fn:split(management.fax, '-')}"/>
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
                            <th><span class="trn" data-trn-key="TR_CLOUD_REP_EMAIL"><%--대표 이메일--%></span></th>
                            <td colspan="3">
                                <c:set var="email" value="${fn:split(management.email, '@')}"/>
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
                        <tr class="pServiceArea">
                            <th><span class="trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL"><%--세금 계산서 발행 이메일--%></span></th>
                            <td colspan="3">
                                <c:set var="vatBillEmail" value="${fn:split(management.vatBillEmail, '@')}"/>
                                <input type="hidden" name="vatBillEmail">
                                <input type="text" id="vatBillEmail1" class="default-input w120 mr1" value="${vatBillEmail[0]}" maxlength="50">@
                                <input type="text" id="vatBillEmail2" class="default-input w120" value="${vatBillEmail[1]}" maxlength="20">
                                <select onchange="changeEmailSelect(this);" data-target="vatBillEmail2" class="w120">
                                    <option class="trn" data-trn-key="TR_DIRECT_INPUT" value=""><%--직접입력--%></option>
                                    <option value="gmail.com" ${vatBillEmail[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                    <option value="naver.com" ${vatBillEmail[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                    <option value="daum.net" ${vatBillEmail[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="bb-n trn" data-trn-key="TR_CLOUD_BUSINESS_NUMBER"><%--사업자등록번호--%></span></th>
                            <td>
                                <c:set var="businessNumber" value="${fn:split(management.businessNumber, '-')}"/>
                                <input type="hidden" name="businessNumber">
                                <input class="default-input onlynumber w55" id="businessNumber1" value="${businessNumber[0]}" type="text" maxlength="3">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="businessNumber2" value="${businessNumber[1]}" type="text" maxlength="2">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="businessNumber3" value="${businessNumber[2]}" type="text" maxlength="5">
                                <input type="button" class="btn btn-baseRound mt5 mb5" value="중복확인" onclick="bizNumberDuplicateCheckAjax(${management.idx})">
                            </td>
                            <th><span class="trn" data-trn-key="TR_CLOUD_BUSINESS_NUMBER"><%--총 임직원수--%></span></th>
                            <td>
                                <input type="text" name="employCount" class="default-input w200 onlynumber autoComma trn" data-trn-key="TR_ONLY_NUMBER" value="${management.employCount}" placeholder="숫자만 입력하세요." maxlength="9">
                            </td>
                        </tr>
                        <tr>
                            <th class="individualArea"><span class="trn" data-trn-key="TR_BIRTH_DATE"><%--생년월일--%></span></th>
                            <td class="individualArea" colspan="3">
                                <input type="text" name="birthDate" class="default-input calendar w155" value="${management.birthDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_ADDR"><%--주소--%></span></th>
                            <td colspan="3">
                                <span class="dis_b mb5">
                                    <input type="text" name="zipcode" class="default-input w155" onclick="openAddrPopup('customer')" value="${management.zipcode}" readonly>
                                    <input type="button" class="btn btn-baseRound trn" data-trn-key="TR_SEARCH_ADDR" value="주소검색" onclick="openAddrPopup('customer')">
                                </span>
                                <input type="text" name="addr" class="default-input dis_b mb5 wp100" value="${management.addr}" readonly>
                                <input type="text" name="addrDetail" class="default-input wp100" value="${management.addrDetail}" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="trn" data-trn-key="TR_CLOUD_APPLY_FORM_FILE"><%--사업자등록증--%></span></th>
                            <td colspan="3">
                                ${applyFormFile.name}
                                <span class="dis_b">
                                    <input type="file" id="applyFormFile" name="applyFormFile" class="w370" style="padding: 2px 0 0 0" onchange="fileTypeCheck(this)">
                                </span>
                            </td>
                        </tr>
<%--                        &lt;%&ndash; LINE :: 온라인 신청 데이터인 경우 메모란 비노출 &ndash;%&gt;--%>
<%--                        <c:if test="${!management.onlineApplyYn}">--%>
                            <tr>
                                <th class="trn" data-trn-key="TR_COMMON_MEMO"><%--메모--%></th>
                                <td colspan="3">
                                    <textarea name="memo" class="wp100 h100" style="resize: none">${management.memo}</textarea>
                                </td>
                            </tr>
<%--                        </c:if>--%>
                        <tr class="table-head">
                            <th colspan="4" class="a_left strong">
                                <span class="form-maintitle trn" data-trn-key="TR_CLOUD_MAIN_ADMIN_INFO"><%--담당자 정보 1 (필수)--%></span>
                                <label style="float: right;">
                                    <input type="checkbox" id="copyInfo" style="margin:0 7px 0 0;height: auto;" onclick="copyInfoCustomer();"><span class="trn" data-trn-key="TR_COMMON_CHECK_BOX_MSG"><%--위 정보와 동일--%></span>
                                </label>
                            </th>
                        </tr>
                        <tr>
                            <th><span class="trn" data-trn-key="TR_CLOUD_ADMIN_INFO_NAME"><%--담당자 정보 (이름/직책)--%></span></th>
                            <td>
                                <input type="text" class="wp45 default-input" name="adminName" placeholder="이름" value="${management.adminName}" maxlength="10">
                                /
                                <input type="text" class="wp45 default-input" name="adminPosition" placeholder="직책" value="${management.adminPosition}" maxlength="10">
                            </td>
                            <th><span class="trn" data-trn-key="TR_CLOUD_PHONE_NUMBER"><%--핸드폰 번호--%></span></th>
                            <td>
                                <c:set var="adminPhone" value="${fn:split(management.adminPhone, '-')}"/>
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
                            <th><span class="trn" data-trn-key="TR_CLOUD_ADMIN_SUB_EMAIL"><%--보조 이메일--%></span></th>
                            <td colspan="3">
                                <c:set var="adminSubEmail" value="${fn:split(management.adminSubEmail, '@')}"/>
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


            <div class="btn-area">
                <c:if test="${management.idx > 0}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_MODIFIED" value="" onclick="saveConfirm()">
                </c:if>
                <c:if test="${!management.idx != null}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_REGISTRATION" value="" onclick="saveConfirm()">
                </c:if>
                <c:choose>
                    <c:when test="${management.idx > 0}">
                        <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_CANCEL" value="취소" onclick="location.href='view?idx=${management.idx}'">
                    </c:when>
                    <c:otherwise>
                        <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_CANCEL" value="취소" onclick="moveList()">
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