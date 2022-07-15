<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/appliance/maintain/form.js" type="text/babel"></script>
<script src="/resources/js/lang/appliance/appliance_lang.js"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_APPLIANCE_MAINTEN_TITLE_${gubun}">
        <%--납품 유지보수관리--%>
        <%--임대 유지보수관리--%>
        <%--종료된 유지보수--%>
    </h1>

    <input type="hidden" id="gubun" value="${gubun}">

    <div class="l-maxwrap">
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_APPLIANCE_CUSTOMER_DATA"><%--고객사 정보--%></h1>
            </div>
            <div class="b-tableWrap mt20"> <!--고객사 정보 시작-->
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_APPLIANCE_CUSTOMER_DATA"><%--고객사 정보--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_PARTNER_NAME"><%--파트너사 명--%></th>
                        <td colspan="3">${partnerName}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_EQUIPMENT_COUNT"><%--장비개수--%></th>
                        <td colspan="3">
                            ${manageList.equipmentCount} <span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_EQUIPMENT"><%--장비--%></th>
                        <td style="padding: 0;" colspan="3">
                            <table>
                                <colgroup>
                                    <col style="width: 16.66%">
                                    <col style="width: 16.66%">
                                    <col style="width: 16.66%">
                                    <col>
                                    <col style="width: 16.66%">
                                    <col style="width: 16.66%">
                                </colgroup>
                                <thead>
                                    <th class="gray bb-n trn" data-trn-key="TR_APPLIANCE_PARTNER_NAME"><%--파트너사 명--%></th>
                                    <th class="gray bb-n trn" data-trn-key="TR_APPLIANCE_SERVER_USE_GUBUN"><%--서버 용도--%></th>
                                    <th class="gray bb-n trn" data-trn-key="TR_APPLIANCE_SERVER_NAME"><%--명칭--%></th>
                                    <th class="gray bb-n trn" data-trn-key="TR_APPLIANCE_SERVER_LICENSE_NUMBER"><%--라이센스 번호--%></th>
                                    <th class="gray bb-n trn" data-trn-key="TR_APPLIANCE_SERVER_MANAGEMENT_NUMBER"><%--관리 번호--%></th>
                                    <th class="gray bb-n">IP</th>
                                </thead>
                                <tbody>
                                <c:forEach items="${serverList}" var="serverList">
                                    <tr>
                                        <td class="bd-n bb-n">${serverList.partnerName == null ? "-" : serverList.partnerName}</td>
                                        <td class="bd-n bb-n">
                                            <c:if test="${serverList.serverGubun eq 'RG'}">ReceiveGUARD</c:if>
                                            <c:if test="${serverList.serverGubun eq 'SG'}">Send&SpamGUARD</c:if>
                                            <c:if test="${serverList.serverGubun eq 'SD'}">SendGUARD</c:if>
                                            <c:if test="${serverList.serverGubun eq 'SP'}">SpamGUARD</c:if>
                                            <c:if test="${serverList.serverGubun eq 'SM'}">SecuMail</c:if>
                                            <c:if test="${serverList.serverGubun eq 'RC'}">CUBE</c:if>
                                            <c:if test="${serverList.serverGubun eq 'SO'}">SPAMOUT</c:if>
                                        </td>
                                        <td class="bd-n bb-n">${serverList.serverName}</td>
                                        <td class="bd-n bb-n">${serverList.serverLicenseNumber}</td>
                                        <td class="bd-n bb-n">${serverList.serverUniqueNumber}</td>
                                        <td class="bd-n bb-n">
                                            <input type="hidden" name="idx" value="${serverList.idx}">
                                            <input type="text" class="w130" name="deliveryServerIp" value="${serverList.deliveryServerIp}" maxlength="15">
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_DELIVERY_DATE"><%--납품일자--%></th>
                        <td>
                            <fmt:formatDate value="${manageList.deliveryDate}" pattern="yyyy-MM-dd"/>
                        </td>
                        <th class="trn" data-trn-key="TR_APPLIANCE_INSTALL_DATE"><%--설치일자--%></th>
                        <td>
                            <fmt:formatDate value="${manageList.installDate}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_SERVER_COMPOSITION"><%--서버 구성도--%></th>
                        <td colspan="3">
                            <c:if test="${not empty serverConfDiagramImg}">
                                <p>
                                    ${serverConfDiagramImg.name}
                                    <input type="button" class="mViewBtn_permit ml5 mb5" value="-" id="fileDeleteBtn" style="color:#e74701; width: 30px;" onclick="deleteAttach(this, ${serverConfDiagramImg.idx})">
                                </p>
                            </c:if>
                            <input type="file" name="serverConfDiagram" class="dis_b" onchange="fileTypeCheck(this)">
                        </td>
                    </tr>
                    <%--<tr>
                        <th>설치일자</th>
                        <td colspan="4">
                            <fmt:formatDate value="${manageList.installDate}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>--%>
                </table>
            </div><!--고객사 정보 끝-->
        </section>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_APPLIANCE_MAINTEN_INFO"><%--유지보수 정보--%></h1>
            </div>

            <c:forEach var="maintainList" items="${maintainList}" varStatus="status">
                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border maintainList">
                        <caption class="offscreen trn" data-trn-key="TR_APPLIANCE_MAINTEN_INFO"><%--유지보수 정보--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <c:if test="${gubun eq 'd'}">
                            <thead>
                            <tr>
                                <th class="table-head strong" colspan="4">
                                        ${maintainList.polynomial}<span class="trn" data-trn-key="TR_COMMON_TH"><%--차--%></span>
                                </th>
                            </tr>
                            </thead>
                        </c:if>
                        <tbody id="common_maintainList">
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_MAINTEN_PERIOD"><%--유지보수 기간--%></th>
                            <td colspan="3">
                                <input type="hidden" value="${maintainList.idx}" id="idx">
                                <input type="text" name="maintStartDate" class="default-input calendar" onchange="maintStartDateChange(this)"
                                       value="${maintainList.formatedStartDate}" readonly> ~
                                <input type="text" name="maintEndDate" class="default-input calendar"
                                       value="${maintainList.formatedEndDate}" onchange="maintEndDateChange(this)" readonly>
                                <input type="hidden" value="" class="w70 monthCal">
                                <span class="monthCalText ml10">
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_RENEWAL_DATE"><%--갱신일--%></th>
                            <td colspan="3">
                                <input type="text" name="renewalDate" class="default-input calendar"
                                       value="${maintainList.formatedRenewalDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <c:if test="${gubun eq 'd'}">
                                <th class="trn" data-trn-key="TR_APPLIANCE_PRICE"><%--유지보수금액--%></th>
                            </c:if>
                            <c:if test="${gubun eq 'r'}">
                                <th class="trn" data-trn-key="TR_APPLIANCE_MONTHLY_PAYMENT"><%--월 납입액--%></th>
                            </c:if>
                            <td colspan="3" class="fwB">
                                <fmt:formatNumber value="${maintainList.paymentPrice}" var="paymentPrice"
                                                  pattern="#,###"/>
                                <input type="text" class="default-input onlyNumber autoComma" value="${paymentPrice}" name="paymentPrice" onchange="changePaymentPrice(this)"><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_VAT"><%--부가세--%></th>
                            <td>
                                <label class="dis-ib w80">
                                    <input type="radio" name="vat+${status.index}" class="radio_vat a-center" value="S" checked><span class="trn" data-trn-key="TR_APPLIANCE_VAT_S"><%--별도--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="vat+${status.index}" class="radio_vat a-center" value="I"
                                        ${maintainList.vat == "I"? 'checked':''}><span class="trn" data-trn-key="TR_APPLIANCE_VAT_I"><%--포함--%></span>
                                </label>
                            </td>
                            <th class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY"><%--납부방식--%></th>
                            <td>
                                <label class="dis-ib w80">
                                    <input type="radio" onchange="paymentWayChange()" name="paymentWay+${status.index}" id="defaultPaymentWay" class="radio_paymentWay a-center"
                                           value="Y" checked><span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_Y"><%--연납--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" onchange="paymentWayChange()" name="paymentWay+${status.index}" class="radio_paymentWay a-center"
                                           value="M"
                                        ${maintainList.paymentWay == "M"? 'checked':''}><span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_M"><%--월납--%></span>
                                </label>
                                <label class="dis_ib mw80">
                                    <input type="radio" onchange="paymentWayChange()" name="paymentWay+${status.index}" class="radio_paymentWay a-center"
                                           value="Q"
                                        ${maintainList.paymentWay == "Q"? 'checked':''}><span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_Q"><%--분기별 납부--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr class="paymentWay_M ${maintainList.paymentWay == "M"? '':'dis_n'}">
                            <th class="trn" data-trn-key="TR_APPLIANCE_MONTHLY_PAYMENT"><%--월 납입액--%></th>
                            <td colspan="3" class="border-b fwB">
                                <input type="text" class="default-input onlyNumber autoComma" maxlength="18" value="${maintainList.paymentPriceMonth}" onchange="paymentPriceMonthChange(this)" name="paymentPriceMonth"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                        </tr>
                        <tr class="paymentWay_Q${status.index} ${maintainList.paymentWay == "Q"? '' : 'dis_n'}">
                            <th class="trn" data-trn-key=""><%--분기별 납입액--%></th>
                            <td colspan="3" class="border-b fwB">
                                <input type="text" class="default-input onlyNumber autoComma" value="${maintainList.paymentPriceQuarter}" onchange="paymentPriceQuarterChange(this)" name="paymentPriceQuarter"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                        </tr>
                        <tr class="dis_n paymentWay_Q${status.index} ${maintainList.paymentWay == "Q"? '' : 'dis_n'}">
                            <th class="trn" data-trn-key=""><%--분기별 납입월--%></th>
                            <td colspan="3">
                                <label>
                                    1<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                    <input type="text" name="q1PaymentMonth" class="onlynumber w55" value="${maintainList.q1PaymentMonth}" onchange="qarterCheck(this)">
                                </label>
                                <label class="ml50">
                                    2<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                    <input type="text" name="q2PaymentMonth" class="onlynumber w55" value="${maintainList.q2PaymentMonth}" onchange="qarterCheck(this)">
                                </label>
                                <label class="ml50">
                                    3<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                    <input type="text" name="q3PaymentMonth" class="onlynumber w55" value="${maintainList.q3PaymentMonth}" onchange="qarterCheck(this)">
                                </label>
                                <label class="ml50">
                                    4<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                    <input type="text" name="q4PaymentMonth" class="onlynumber w55" value="${maintainList.q4PaymentMonth}" onchange="qarterCheck(this)">
                                </label>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </c:forEach>
        </section>

        <section class="mt30">
            <div class="b-tableWrap mt20">
                <form id="saveForm">
                    <input type="hidden" name="delFileIdx" id="delFileIdx">
                    <input type="hidden" name="appCustomerIdx" id="appCustomerIdx" value="${manageList.idx}">
                    <div id="common_tempArea"></div>
                    <table class="b-listTable b-listTable--border maintainList">
                        <caption class="offscreen trn" data-trn-key="TR_APPLIANCE_MAINTEN_INFO"><%--유지보수 정보--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <c:if test="${gubun eq 'd'}">
                            <thead>
                            <tr>
                                <th class="table-head strong" colspan="4">
                                    <span class="trn" data-trn-key="TR_APPLIANCE_FREE"><%--무상--%></span>
                                </th>
                            </tr>
                            </thead>
                        </c:if>
                        <tbody>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_MAINTEN_PERIOD"><%--유지보수기간--%></th>
                            <td colspan="3">
                                <input type="text" name="customerMaintFreeStartDate" class="default-input calendar" onchange="customerMaintFreeStartDateChange()"
                                       value="${manageList.formatedMaintFreeStartDate}" readonly> ~
                                <input type="text" name="customerMaintFreeEndDate" class="default-input calendar" ${gubun eq 'd'? 'onchange="customerMaintFreeEndDateChange()"':''}
                                       value="${manageList.formatedMaintFreeEndDate}" readonly>
                            </td>
                        </tr>
                        <c:if test="${gubun eq 'd'}">
                            <tr>
                                <th class="trn" data-trn-key="TR_APPLIANCE_RENEWAL_DATE"><%--갱신일--%></th>
                                <td colspan="3">
                                    <input type="text" name="customerRenewalDate" class="default-input calendar"
                                           value="${manageList.formatedMaintFreeRenewalDate}" readonly>
                                    <%--                            ${manageList.renewalDate}--%>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${gubun eq 'r'}">
                            <tr>
                                <c:if test="${gubun eq 'd'}">
                                    <th class="trn" data-trn-key="TR_APPLIANCE_PRICE"><%--유지보수금액--%></th>
                                </c:if>
                                <c:if test="${gubun eq 'r'}">
                                    <th class="trn" data-trn-key="TR_APPLIANCE_MONTHLY_PAYMENT"><%--월 납입액--%></th>
                                </c:if>
                                <td colspan="3" class="fwB">
                                    <input type="text" id="customerPaymentPrice" maxlength="18" class="default-input onlyNumber autoComma"value="${manageList.paymentPrice}"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>

                                </td>
                            </tr>
                            <tr>
                                <th class="trn" data-trn-key="TR_APPLIANCE_VAT"><%--부가세--%></th>
                                <td colspan="3">
                                    <label class="dis-ib w80">
                                        <input type="radio" name="customerVat" value="S" checked><span class="trn" data-trn-key="TR_APPLIANCE_VAT_S"><%--별도--%></span>
                                    </label>
                                    <label class="dis-ib w80">
                                        <input type="radio" name="customerVat" value="I" ${manageList.vat == "I"? 'checked':''}><span class="trn" data-trn-key="TR_APPLIANCE_VAT_I"><%--포함--%></span>
                                    </label>
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-key="TR_COMMON_${manageList.idx > 0 ? 'MODIFIED' : 'REGISTRATION'}" value="<%--등록 or 수정--%>" onclick="save()">
            <input type="button" class="btn-base btn-large trn" value="<%--취소--%>" data-trn-key="TR_COMMON_CANCEL"
                   onclick="location.href='view?idx=${manageList.idx}'">
        </div>

    </div>

</section>
<!--l-content-area-->

</div><!--l-container-->
</body>
</html>
