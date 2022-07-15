<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/appliance/maintain/view.js" type="text/babel"></script>
<script src="/resources/js/lang/appliance/appliance_lang.js"></script>
<section class="l-content-area">
    <input type="hidden" name="contractGubun" value="${manageList.contractGubun}">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_APPLIANCE_MAINTEN_TITLE_${gubun}">
        <%--납품 유지보수관리--%>
        <%--임대 유지보수관리--%>
        <%--종료된 유지보수--%>
    </h1>
    <c:if test="${gubun != null}"><input type="hidden" id="gubun" value="${gubun}"></c:if>
    <c:if test="${gubun != null}"><input type="hidden" id="gubun" value="${gubun}"></c:if>
    <div class="l-maxwrap">
        <form>
            <input type="hidden" name="idx" id="idx" value="${manageList.idx}">
        </form>
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
                        <th class="trn" data-trn-key="TR_APPLIANCE_NAME"><%--고객사 명--%></th>
                        <td colspan="3">${manageList.manageName}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_PARTNER_NAME"><%--파트너사 명--%></th>
                        <td colspan="3">${partnerName}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_EQUIPMENT_COUNT"><%--장비개수--%></th>
                        <td colspan="3">
                            ${manageList.equipmentCount} 개
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
                                            <c:if test="${serverList.deliveryServerIp == null or serverList.deliveryServerIp == ''}">
                                                -
                                            </c:if>
                                            ${serverList.deliveryServerIp}
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
                        <th class="trn" data-trn-key="TR_APPLIANCE_DELIVERY_PRICE"><%--납품금액--%></th>
                        <td colspan="3" class="border-b fwB"><fmt:formatNumber value="${manageList.paymentPrice}" pattern="#,###"/> 원</td>
                    </tr>

                </table>
            </div><!--고객사 정보 끝-->
        </section>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_APPLIANCE_SERVER_COMPOSITION"><%--서버 구성도--%></h1>
            </div>

            <div class="b-tableWrap mt20"> <!--서버 구성도 시작-->
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_APPLIANCE_SERVER_COMPOSITION"><%--서버 구성도--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_SERVER_COMPOSITION"><%--서버 구성도--%></th>
                        <td colspan="3">
                            <c:if test="${empty serverConfDiagramImg}">
                                <span class="trn" data-trn-key="TR_APPLIANCE_NO_SERVER_COMPOSITION">등록된 서버 구성도가 존재하지 않습니다.</span>

                            </c:if>
                            <c:if test="${not empty serverConfDiagramImg}">
                                <span class="dis_b">
                                    <img class="mt10" alt src="/file/download/${serverConfDiagramImg.idx}" style="max-width: 100%; height: auto">
                                </span>
                            </c:if>
                        </td>
                    </tr>

                </table>
            </div><!--고객사 정보 끝-->
        </section>

        <c:if test="${gubun eq 'd'}">
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_APPLIANCE_MAINTEN_INFO"><%--유지보수 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
                <form id="saveForm">
                <table class="b-listTable b-listTable--border">
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
                            <th colspan="4" class="a_left polynomial strong"></th>
                        </tr>
                        </thead>
                    </c:if>
                    <tbody>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_MAINTEN_PERIOD"><%--유지보수기간--%></th>
                        <td colspan="3">
                            <input type="text" name="maintStartDate" onchange="changeMaintStartDate()" class="default-input w155 calendar" readonly> ~
                            <input type="text" name="maintEndDate" class="default-input w155 calendar" onchange="maintEndDateChange()" readonly>
                            <input type="hidden" value="" class="monthCal">
                            <span class="monthCalText ml10">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_RENEWAL_DATE"><%--갱신일--%></th>
                        <td colspan="3">
                            <input type="text" name="renewalDate" class="default-input calendar w155" readonly>
                        </td>
                    </tr>
                    <c:if test="${gubun eq 'd'}">
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_PRICE"><%--유지보수금액--%></th>
                            <td colspan="3" class="fwB">
                                <input type="text" value="${manageList.maintPrice}" class="default-input onlyNumber autoComma w155" id="paymentPrice" maxlength="18" onchange="changePaymentPrice()"> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_VAT"><%--부가세--%></th>
                        <td>
                            <label class="dis_ib w80">
                                <input type="radio" name="vat" value="S" checked> <span class="trn" data-trn-key="TR_APPLIANCE_VAT_S"><%--별도--%></span>
                            </label>
                            <label class="dis_ib w80">
                                <input type="radio" name="vat" value="I"> <span class="trn" data-trn-key="TR_APPLIANCE_VAT_I"><%--포함--%></span>
                            </label>
                        </td>
                        <th class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY"><%--납부방식--%></th>
                        <td>
                            <label class="dis-ib w80">
                                <input type="radio" name="paymentWay" value="Y" id="defaultPaymentWay" onchange="changePaymentWay()" checked><span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_Y"><%--연납--%></span>
                            </label>
                            <label class="dis_ib w80">
                                <input type="radio" name="paymentWay" value="M" onchange="changePaymentWay()"><span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_M"><%--월납--%></span>
                            </label>
                            <label class="dis_ib mw80">
                                <input type="radio" name="paymentWay" value="Q" onchange="changePaymentWay()"><span class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_Q"><%--분기별 납부--%></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="dis_n" id="paymentWay_M"> <!--납부방식 : 월납 선택시 출력 -->
                        <th class="trn" data-trn-key="TR_APPLIANCE_MONTHLY_PAYMENT"><%--월 납입액--%></th>
                        <td colspan="3" class="border-b fwB">
                            <input type="text" class="default-input onlyNumber autoComma" value="" onchange="paymentPriceMonthChange()" id="paymentPriceMonth"> 원
                        </td>
                    </tr>
                    <tr class="dis_n paymentWay_Q">
                        <th class="trn" data-trn-key="TR_APPLIANCE_QUARTERLY_PAYMENT"><%--분기별 납입액--%></th>
                        <td colspan="3" class="border-b fwB">
                            <input type="text" class="default-input onlyNumber autoComma w155" value="" onchange="paymentPriceQuarterChange()" id="paymentPriceQuarter"> 원
                        </td>
                    </tr>
                    <tr class="dis_n paymentWay_Q">
                        <th class="trn" data-trn-key="TR_APPLIANCE_QUARTERLY_PAYMENT_MONTH"><%--분기별 납입월--%></th>
                        <td colspan="3">
                            <label>
                                1<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                <input type="text" name="q1PaymentMonth" class="onlynumber w55" onchange="qarterCheck(this)">
                            </label>
                            <label class="ml50">
                                2<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                <input type="text" name="q2PaymentMonth" class="onlynumber w55" onchange="qarterCheck(this)">
                            </label>
                            <label class="ml50">
                                3<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                <input type="text" name="q3PaymentMonth" class="onlynumber w55" onchange="qarterCheck(this)">
                            </label>
                            <label class="ml50">
                                4<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                <input type="text" name="q4PaymentMonth" class="onlynumber w55" onchange="qarterCheck(this)">
                            </label>
                        </td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </section>
        </c:if>

        <section class="mt30">
            <c:forEach var="maintainList" items="${maintainList}">
            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border maintainList">
                    <caption class="offscreen trn" data-trn-key="TR_APPLIANCE_MAINTEN_INFO"><%--유지보수 정보--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <c:if test="${gubun eq 'd' || maintainList.maintEndDate ne null}">
                    <thead>
                        <tr>
                            <th class="table-head strong" colspan="4">
                                    ${maintainList.polynomial}<span class="trn" data-trn-key="TR_COMMON_TH"><%--차--%></span>
                            </th>
                        </tr>
                    </thead>
                    </c:if>
                    <tbody>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_MAINTEN_PERIOD"><%--유지보수기간--%></th>
                        <td colspan="3">
                            <span class="maintFreeStartDate"><fmt:formatDate value="${maintainList.maintStartDate}" pattern="yyyy-MM-dd"/></span>
                            ~ <span class="maintFreeEndDate"><fmt:formatDate value="${maintainList.maintEndDate}" pattern="yyyy-MM-dd"/></span>
                            <span class="month">[<span class="monthDifference"></span>]</span>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_RENEWAL_DATE"><%--갱신일--%></th>
                        <td class="renewalDate">
                            <fmt:formatDate value="${maintainList.renewalDate}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>
                    <tr>
                        <c:if test="${gubun eq 'd'}">
                            <th class="trn" data-trn-key="TR_APPLIANCE_PRICE"><%--유지보수금액--%></th>
                        </c:if>
                        <c:if test="${gubun eq 'r'}">
                            <th class="trn" data-trn-key="TR_APPLIANCE_MONTHLY_PAYMENT"><%--월 납입액--%></th>
                        </c:if>
                        <c:if test="${gubun eq 'e'}">
                            <th class="trn" data-trn-key="TR_APPLIANCE_PAID_PAYMENT"><%--지불된 금액--%></th>
                        </c:if>
                        <td colspan="3" class="paymentPrice fwB">
                            <fmt:formatNumber value="${maintainList.paymentPrice}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_VAT"><%--부가세--%></th>
                        <td class="vat border-b trn" data-trn-key="TR_APPLIANCE_VAT_${maintainList.vat}">
                            <%--별도 or 포함--%>
                        </td>
                        <th class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY"><%--납부방식--%></th>
                        <td class="paymentWay border-b trn" data-trn-key="TR_COMMON_PAYMENT_WAY_${maintainList.paymentWay}">
                            <%--연납, 월납, 분기별 납부--%>
                        </td>
                    </tr>
                    <c:if test="${maintainList.paymentWay eq 'M'}">
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_MONTHLY_PAYMENT"><%--월 납입액--%></th>
                            <td colspan="3" class="paymentPriceMonth border-b fwB">
                                <fmt:formatNumber value="${maintainList.paymentPriceMonth}" pattern="#,###"/>&nbsp;<span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${maintainList.paymentWay eq 'Q'}">
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_PAYMENT_WAY_Q"><%--분기별 납입액--%></th>
                            <td colspan="3" class="paymentPriceQuarter border-b fwB">
                                <fmt:formatNumber value="${maintainList.paymentPriceQuarter}" pattern="#,###"/>&nbsp;<span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_QUARTERLY_PAYMENT_MONTH"><%--분기별 납입월--%></th>
                            <td colspan="3">
                                <span>
                                    1<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                    <span id="q1PaymentMonth">${maintainList.q1PaymentMonth}</span><span class="trn" data-trn-key=""><%--월--%></span>
                                </span>
                                <span class="ml70">
                                    2<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                    <span id="q2PaymentMonth">${maintainList.q2PaymentMonth}</span><span class="trn" data-trn-key=""><%--월--%></span>
                                </span>
                                <span class="ml70">
                                    3<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                    <span id="q3PaymentMonth">${maintainList.q3PaymentMonth}</span><span class="trn" data-trn-key=""><%--월--%></span>
                                </span>
                                <span class="ml70">
                                    4<span class="trn" data-trn-key="TR_COMMON_QUARTERLY"><%--분기--%></span> :
                                    <span id="q4PaymentMonth">${maintainList.q4PaymentMonth}</span><span class="trn" data-trn-key=""><%--월--%></span>
                                </span>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
            </c:forEach>
        </section>

        <section class="mt30">
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
                                <th class="table-head strong trn" colspan="4" data-trn-key="TR_APPLIANCE_FREE">
                                    <%--무상--%>
                                </th>
                            </tr>
                            </thead>
                        </c:if>
                        <tbody>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_MAINTEN_PERIOD"><%--유지보수기간--%></th>
                            <td colspan="3">
                                <span class="maintFreeStartDate"><fmt:formatDate value="${manageList.maintFreeStartDate}" pattern="yyyy-MM-dd"/></span>
                                ~ <span class="maintFreeEndDate"><fmt:formatDate value="${manageList.maintFreeEndDate}" pattern="yyyy-MM-dd"/></span>
                                <span class="month">[<span class="monthDifference"></span>]</span>
                            </td>
                        </tr>
                        <c:if test="${gubun eq 'd'}">
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_RENEWAL_DATE"><%--갱신일--%></th>
                            <td colspan="3" class="renewalDate border-b">
                                ${manageList.formatedMaintFreeRenewalDate}
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
                            <td colspan="3" class="paymentPrice fwB">
                                <fmt:formatNumber value="${manageList.paymentPrice}" pattern="#,###"/><span class="trn" data-trn-key=""><%--월--%></span>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_VAT"><%--부가세--%></th>
                            <td colspan="3" class="vat border-b trn" data-trn-key="TR_APPLIANCE_VAT_${manageList.vat}">
                                <%--별도 or 포함--%>
                            </td>
                        </tr>
                        </c:if>
                        </tbody>
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
                <input type="hidden" id="customerIdx" name="customerIdx" value="${manageList.idx}">
            </form>
            <div id="pagingArea"></div>
        </section>

        <div class="btn-area">
            <c:if test="${gubun eq 'd'}">
                <input type="button" class="btn-base btn-detail btn-large mr5 trn" data-trn-value="TR_COMMON_RENEWAL" value="<%--갱신--%>" onclick="saveAJAX()">
            </c:if>
            <c:if test="${gubun ne 'e'}">
                <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-valye="TR_COMMON_MODIFIED" value="<%--수정--%>" onclick="location.href='form?idx=${manageList.idx}'">
            </c:if>
            <c:if test="${gubun ne 'e'}">
            <input type="button" class="btn-base btn-rm btn-large mr5 trn" data-trn-value="TR_COMMON_END" value="<%--종료--%>" onclick="endAJAX()">
            </c:if>
            <c:if test="${gubun eq 'e'}">
                <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-key="TR_COMMON_RESTART" value="<%--재시작--%>" onclick="maintainReStartAJAX()">
            </c:if>
            <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_LIST" value="<%--목록--%>" onclick="moveList()">
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>