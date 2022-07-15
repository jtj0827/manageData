<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/appliance/customerMng/form.js" type="text/babel"></script>
<script src="/resources/js/lang/appliance/appliance_lang.js"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_APPLIANCE_TITLE1"><%--고객사 관리--%></h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <c:if test="${appCustomerInfo.idx == null}">
                                <span class="necessary">
                                <label class="trn" data-trn-key="TR_APPLIANCE_NAME"><%--고객사 명--%></label>
                                <div class="inline-group ml15">
                                    <select name="managementIdx" class="default-input w200" onchange="managementChangeAJAX()">
                                        <option class="trn" data-trn-key="TR_COMMON_CHOICE" value=""><%--선택--%></option>
                                        <c:forEach items="${managementList}" var="mng">
                                            <option value="${mng.idx}">${mng.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                </span>
                            </c:if>
                            <c:if test="${appCustomerInfo.idx != null}">

                                <label class="trn" data-trn-key="TR_APPLIANCE_NAME"><%--고객사 명--%></label>
                                <div class="inline-group">
                                        ${appCustomerInfo.manageName}
                                </div>
                            </c:if>
                        </div>
                    </div>
                </form>
            </div>

        </div>
        <form id="saveForm">
            <c:if test="${appCustomerInfo != null and appCustomerInfo.idx > 0}">
                <input type="hidden" name="idx" id="idx" value="${appCustomerInfo.idx}">
            </c:if>
            <div id="common_tempArea"></div>
            <section class="customer_form mt30 ${appCustomerInfo.idx > 0? '':'dis_n'}">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_APPLIANCE_TITLE1"><%--고객사 관리--%></h1>
                </div>

                <p style="color: red; text-align: right" class="lh20 dis_b mt10 trn" data-trn-key="TR_COMMON_ESSENTIAL_MSG"><%-- * 표시는 필수 입력 항목입니다.--%></p>

                <div class="b-tableWrap mt10">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_APPLIANCE_TITLE1"><%--고객사 관리--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_PARTNER_NAME"><%--파트너사 명--%></th>
                            <td colspan="3">
                                <select class="w155" name="partnerIdx" ${appCustomerInfo == null ? "disabled" : ""}>
                                    <option class="trn" data-trn-key="TR_COMMON_CHOICE" value=""><%--선택--%></option>
                                    <c:forEach items="${partnerList}" var="partner">
                                        <option value="${partner.idx}"${appCustomerInfo.partnerIdx == partner.idx ? "selected":""}>${partner.name}</option>
                                    </c:forEach>
                                </select>
                                <%--<span id="partnerIdx">${appCustomerInfo.partnerName}</span>--%>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_EQUIPMENT_COUNT"><%--장비개수--%></th>
                            <td colspan="3">
                                <span id="deliverySize">${appCustomerInfo.equipmentCount}</span>&nbsp;<span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="necessary trn" data-trn-key="TR_COMMON_EQUIPMENT"><%--장비--%></span>
                            </th>
                            <td style="padding: 0;" colspan="3">
                                <table>
                                    <c:if test="${appCustomerInfo == null}">
                                        <colgroup>
                                            <col style="width: 5%">
                                            <col style="width: 13.9%">
                                            <col style="width: 18.4%">
                                            <col style="width: 25%">
                                            <col>
                                            <col style="width: 16%">
                                        </colgroup>
                                        <thead>
                                            <th class="gray"><input type="checkbox" onchange="allCheckedBox()" class="equipment"></th>
                                            <th class="gray trn" data-trn-key="TR_APPLIANCE_PARTNER_NAME" style="text-align: center;"><%--파트너사 명--%></th>
                                            <th class="gray trn" data-trn-key="TR_APPLIANCE_SERVER_USE_GUBUN" style="text-align: center;"><%--서버 용도--%></th>
                                            <th class="gray trn" data-trn-key="TR_APPLIANCE_SERVER_NAME" style="text-align: center;"><%--명칭--%></th>
                                            <th class="gray trn" data-trn-key="TR_APPLIANCE_SERVER_LICENSE_NUMBER" style="text-align: center;"><%--라이센스 번호--%></th>
                                            <th class="gray trn" data-trn-key="TR_APPLIANCE_SERVER_MANAGEMENT_NUMBER" style="text-align: center;"><%--관리 번호--%></th>
                                        </thead>
                                        <tbody id="equipment">
                                        </tbody>
                                    </c:if>
                                    <c:if test="${appCustomerInfo != null}">
                                        <colgroup>
                                            <col style="width: 5%">
                                            <col style="width: 18.9%">
                                            <col style="width: 18.5%">
                                            <col style="width: 20%">
                                            <col>
                                            <col style="width: 18%">
                                        </colgroup>
                                        <thead>
                                        <th class="gray"></th>
                                        <th class="gray trn" data-trn-key="TR_APPLIANCE_PARTNER_NAME" style="text-align: left;"><%--파트너사 명--%></th>
                                        <th class="gray trn" data-trn-key="TR_APPLIANCE_SERVER_USE_GUBUN" style="text-align: left;"><%--서버 용도--%></th>
                                        <th class="gray trn" data-trn-key="TR_APPLIANCE_SERVER_NAME" style="text-align: left;"><%--명칭--%></th>
                                        <th class="gray trn" data-trn-key="TR_APPLIANCE_SERVER_LICENSE_NUMBER" style="text-align: left;"><%--라이센스 번호--%></th>
                                        <th class="gray trn" data-trn-key="TR_APPLIANCE_SERVER_MANAGEMENT_NUMBER" style="text-align: left;"><%--관리 번호--%></th>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${equipmentList}" var="equipment">
                                                <tr>
                                                    <td style="text-align: left;" class="bd-n"><input type="checkbox" name="equipment" value="${equipment.idx}" checked></td>
                                                    <td style="text-align: left;" class="bd-n">${equipment.partnerName == null ? "-" : equipment.partnerName}</td>
                                                    <td style="text-align: left;" class="bd-n">
                                                        <c:if test="${equipment.serverGubun eq 'RG'}">ReceiveGUARD</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'SG'}">Send&SpamGUARD</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'SD'}">SendGUARD</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'RC'}">CUBE</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'SP'}">SpamGUARD</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'SM'}">SecuMail</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'SO'}">SPAMOUT</c:if>
                                                    </td>
                                                    <td style="text-align: left;" class="bd-n">${equipment.serverName == null ? "-" : equipment.serverName}</td>
                                                    <td style="text-align: left;" class="bd-n">${equipment.serverLicenseNumber == null ? "-" : equipment.serverLicenseNumber}</td>
                                                    <td style="text-align: left;" class="bd-n">${equipment.serverUniqueNumber == null ? "-" : equipment.serverUniqueNumber}</td>
                                                </tr>
                                            </c:forEach>
                                            <c:forEach items="${unSelectedEquipmentList}" var="equipment">
                                                <tr>
                                                    <td style="text-align: left;" class="bd-n"><input type="checkbox" name="equipment" value="${equipment.idx}"></td>
                                                    <td style="text-align: left;" class="bd-n">${equipment.partnerName == null ? "-" : equipment.partnerName}</td>
                                                    <td style="text-align: left;" class="bd-n">
                                                        <c:if test="${equipment.serverGubun eq 'RG'}">ReceiveGUARD</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'SG'}">Send&SpamGUARD</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'SD'}">SendGUARD</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'RC'}">CUBE</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'SP'}">SpamGUARD</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'SM'}">SecuMail</c:if>
                                                        <c:if test="${equipment.serverGubun eq 'SO'}">SPAMOUT</c:if>
                                                    </td>
                                                    <td style="text-align: left;" class="bd-n">${equipment.serverName == null ? "-" : equipment.serverName}</td>
                                                    <td style="text-align: left;" class="bd-n">${equipment.licenseNumber == null ? "-" : equipment.licenseNumber}</td>
                                                    <td style="text-align: left;" class="bd-n">${equipment.managementNumber == null ? "-" : equipment.managementNumber}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </c:if>

                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th class="bb-n"><span class="necessary trn" data-trn-key="TR_APPLIANCE_DELIVERY_DATE"><%--납품일자--%></span></th>
                            <td class="bb-n">
                                <input type="text" name="deliveryDate" class="default-input calendar w140" onchange="startDateSettingByDeliveryDate()" value="${appCustomerInfo.formatedDeliveryDate}" readonly>
                            </td>
                            <th class="bb-n"><span class="necessary trn" data-trn-key="TR_APPLIANCE_INSTALL_DATE"><%--설치일자--%></span></th>
                            <td class="bb-n">
                                <input type="text" name="installDate" class="default-input w140 ${appCustomerInfo != null and appCustomerInfo.formatedInstallDate eq appCustomerInfo.formatedDeliveryDate ? "": "calendar"} installDate" value="${appCustomerInfo.formatedInstallDate}" onchange="startDateSettingByInstallDate()" readonly>

                                <div class="mt5">
                                    <label style="font-weight: bold; font-size: 13px;">
                                        <input type="checkbox" style="margin:0 7px 0 0;height: auto;" id="beTheSameData" onclick="equalsDeliveryDate(this);" ${appCustomerInfo == null || appCustomerInfo != null and appCustomerInfo.formatedInstallDate eq appCustomerInfo.formatedDeliveryDate ? "checked": ""}><span class="trn" data-trn-key="TR_COMMON_CHECK_BOX_MSG"><%--위 정보와 동일--%></span>
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_PHYSICAL_COMPOSITION"><%--물리적 구성도--%></th>
                            <td>
<%--                                <c:if test="${not empty beForeImg}">--%>
<%--                                    <p>${beForeImg.name}--%>
<%--                                        <input type="button" class="mViewBtn_permit" value="-" style="color:#e74701; width: 30px;" onclick="deleteAttach(this, ${beForeImg.idx})">--%>
<%--                                    </p>--%>
<%--                                </c:if>--%>
                                <input type="file" name="physicalComposition" class="dis_b w295">
                            </td>
                            <th class="trn" data-trn-key="TR_APPLIANCE_LOGICAL_COMPOSITION"><%--논리적 구성도--%></th>
                            <td>
<%--                                <c:if test="${not empty beForeImg}">--%>
<%--                                    <p>${beForeImg.name}--%>
<%--                                        <input type="button" class="mViewBtn_permit" value="-" style="color:#e74701; width: 30px;" onclick="deleteAttach(this, ${beForeImg.idx})">--%>
<%--                                    </p>--%>
<%--                                </c:if>--%>
                                <input type="file" name="logicalComposition" class="dis_b w295">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary trn" data-trn-key="TR_APPLIANCE_CONTRACT_GUBUN"><%--계약 구분--%></span></th>
                            <td colspan="3">
                                <span>
                                      <label class="dis-ib w80">
                                          <input type="radio" name="contractGubun" onchange="contractGubunChange()" value = "D" checked><span class="trn" data-trn-key="TR_APPLIANCE_CONTRACT_GUBUN_D"><%--납품--%></span>
                                      </label>
                                      <label class="dis-ib w80">
                                          <input type="radio" name="contractGubun" onchange="contractGubunChange()" value = "R" ${appCustomerInfo.contractGubun == "R"? 'checked':''}><span class="trn" data-trn-key="TR_APPLIANCE_CONTRACT_GUBUN_R"><%--임대--%></span>
                                      </label>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th class="disByContractGubun_D ${appCustomerInfo.contractGubun == "D" or appCustomerInfo == null? '':'dis_n'}"><span class="necessary trn" data-trn-key="TR_APPLIANCE_DELIVERY_PRICE"><%--납품금액--%></span></th>
                            <th class="disByContractGubun_R ${appCustomerInfo.contractGubun == "R"? '':'dis_n'}"><span class="necessary trn" data-trn-key="TR_APPLIANCE_MONTHLY_PAYMENT"><%--월 납입액--%></span></th>
                            <td>
                                <span class="fwB"><input type="text" class="default-input onlynumber autoComma a-right w140" id="paymentPrice" value="${appCustomerInfo.paymentPrice}" onkeyup="changePaymentPrice()">&nbsp;<span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span></span>
                            </td>
                            <th><span class="necessary trn" data-trn-key="TR_APPLIANCE_VAT">부가세</span></th>
                            <td>
                                <label class="dis-ib w80">
                                    <input type="radio" name="vat" value="S" checked><span class="trn" data-trn-key="TR_APPLIANCE_VAT_S"><%--별도--%></span>
                                </label>
                                <label class="dis-ib w80">
                                    <input type="radio" name="vat" value="I" ${appCustomerInfo.vat == "I"? 'checked':''}><span class="trn" data-trn-key="TR_APPLIANCE_VAT_I"><%--포함--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr class="disByContractGubun_D ${appCustomerInfo.contractGubun == 'D' or appCustomerInfo == null? '':'dis_n'}">
                            <th><span class="necessary trn" data-trn-key="TR_APPLIANCE_MAINTEN_PERIOD"><%--유지보수기간--%></span></th>
                            <td style="padding: 0;" colspan="3">
                                <table>
                                    <colgroup>
                                        <col width="50%">
                                        <col width="50%">
                                    </colgroup>
                                    <thead>
                                        <th class="a_center gray trn" data-trn-key="TR_APPLIANCE_FREE"><%--무상--%></th>
                                        <th class="a_center gray trn" data-trn-key="TR_APPLIANCE_PAID"><%--유상--%></th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="bd-n">
                                                <input type="text" name="maintFreeStartDate" value="${appCustomerInfo.formatedMaintFreeStartDate}" onchange="maintDateChange(this)" class="default-input calendar w110" readonly>
                                                ~ <input type="text" name="maintFreeEndDate" value="${appCustomerInfo.formatedMaintFreeEndDate}" onchange="maintDateChange(this)" class="default-input calendar w110" readonly>
                                            </td>
                                            <td class="bd-n">
                                                <input type="text" name="maintPayStartDate" value="${appCustomerInfo.formatedMaintPayStartDate}" onchange="maintDateChange(this)" class="default-input calendar w110" readonly>
                                                ~ <input type="text" name="maintPayEndDate" value="${appCustomerInfo.formatedMaintPayEndDate}" onchange="maintDateChange(this)" class="default-input calendar w110" readonly>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr class="disByContractGubun_D ${appCustomerInfo.contractGubun == 'D' or appCustomerInfo == null? '':'dis_n'}">
                            <th><span class="necessary trn" data-trn-key="TR_APPLIANCE_PRICE"><%--유지보수금액--%></span></th>
                            <td colspan="3">
                                <span class="fwB mr20"><input type="text" class="default-input onlyNumber autoComma a-right w140" value="${appCustomerInfo.maintTotalPrice}" id="maintTotalPrice" onchange="setMaintAmount()">&nbsp;원</span>
                                <input type="text" class="default-input a_center ml10 w100" value="${appCustomerInfo.maintPriceRate}" name="maintPriceRate" onchange="setMaintAmount()"> %

                                <span class="fwB"><input type="text" class="ml60 onlyNumber autoComma a-right w155" id="maintAmount" value="${appCustomerInfo.maintPrice}"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span></span>
                            </td>
                        </tr>
                        <tr class="disByContractGubun_R ${appCustomerInfo.contractGubun == "R"? '':'dis_n'}">
                            <th><span class="necessary trn" data-trn-key="TR_APPLIANCE_PAYMENT_PERIOD"><%--납입기간--%></span></th>
                            <td colspan="3">
                                <input type="text" name="rentalPayStartDate" value="${appCustomerInfo.formatedRentalPayStartDate}" onchange="monthCal()" class="default-input calendar w110" readonly>
                                ~ <input type="text" name="rentalPayEndDate" value="${appCustomerInfo.formatedRentalPayEndDate}" onchange="monthCal()" class="default-input calendar w110" readonly>
                                <span class="monthCalText ml10">
                            </span>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NOTE"><%--비고--%></th>
                            <td colspan="3">
                                <textarea name="note" class="wp98 h100 mt5 mb5" style="resize: none">${appCustomerInfo.note}</textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </form>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="${appCustomerInfo.idx > 0 ?  'TR_COMMON_MODIFIED' : 'TR_COMMON_REGISTRATION'}" value="<%--수정 or 등록--%>" onclick="saveConfirm()">
            <c:choose>
                <c:when test="${appCustomerInfo.idx > 0}">
                    <input type="button" class="btn-base btn-large trn" data-trn-valye="TR_COMMON_CANCEL" value="<%--취소--%>" onclick="location.href='view?idx=${appCustomerInfo.idx}'">
                </c:when>
                <c:otherwise>
                    <input type="button" class="btn-base btn-large trn" data-trn-valye="TR_COMMON_CANCEL" value="<%--취소--%>" onclick="moveList();">
                </c:otherwise>
            </c:choose>
        </div>

        <div id="beforeContract">
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>