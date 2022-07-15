<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="/resources/js/appliance/customerMng/view.js" type="text/babel"></script>
<script src="/resources/js/lang/appliance/appliance_lang.js"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_APPLIANCE_TITLE1"><%--고객사 관리--%></h1>

    <div class="l-maxwrap">
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_APPLIANCE_CUSTOMER_DATA"><%--고객사 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_APPLIANCE_CUSTOMER_DATA"><%--고객사 정보--%></caption>
                    <colgroup>
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_NAME"><%--고객사 명--%></th>
                        <td colspan="3">${appCustomerInfo.manageName}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_PARTNER_NAME"><%--파트너사 명--%></th>
                        <td colspan="3">${appCustomerInfo.partnerName}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_EQUIPMENT_COUNT"><%--장비개수--%></th>
                        <td colspan="3">
                            ${appCustomerInfo.equipmentCount} <span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_DELIVERY_DATE"><%--납품일자--%></th>
                        <td>
                            <fmt:formatDate value="${appCustomerInfo.deliveryDate}" pattern="yyyy-MM-dd"/>
                        </td>
                        <th class="trn" data-trn-key="TR_APPLIANCE_INSTALL_DATE"><%--설치일자--%></th>
                        <td>
                            <fmt:formatDate value="${appCustomerInfo.installDate}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_CONTRACT_GUBUN"><%--계약 구분--%></th>
                        <td colspan="3">
                            <span class="trn" data-trn-key="TR_APPLIANCE_CONTRACT_GUBUN_${appCustomerInfo.contractGubun}"><%--납품 or 임대--%></span>
                        </td>
                    </tr>
                    <c:choose>
                        <c:when test="${appCustomerInfo.contractGubun eq 'D'}">
                            <tr>
                                <th class="trn" data-trn-key="TR_APPLIANCE_DELIVERY_PRICE"><%--납품금액--%></th>
                                <td class="fwB">
                                    <fmt:formatNumber value="${appCustomerInfo.paymentPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <th class="trn" data-trn-key="TR_APPLIANCE_VAT"><%--부가세--%></th>
                                <td>
                                    <span class="trn" data-trn-key="TR_APPLIANCE_VAT_${appCustomerInfo.vat}"><%--별도 or 포함--%></span>

                                </td>
                            </tr>
                            <tr>
                                <th class="trn" data-trn-key="TR_APPLIANCE_MAINTEN_PERIOD"><%--유지보수 기간<--%>/th>
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
                                                <fmt:formatDate value="${appCustomerInfo.maintFreeStartDate}" pattern="yyyy-MM-dd"/>
                                                ~ <fmt:formatDate value="${appCustomerInfo.maintFreeEndDate}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td class="bd-n">
                                                <fmt:formatDate value="${appCustomerInfo.maintPayStartDate}" pattern="yyyy-MM-dd"/>
                                                ~ <fmt:formatDate value="${appCustomerInfo.maintPayEndDate}" pattern="yyyy-MM-dd"/>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <th class="trn" data-trn-key="TR_APPLIANCE_PRICE"><%--유지보수금액--%></th>
                                <td class="border-b fwB">
                                    <fmt:formatNumber value="${appCustomerInfo.maintPrice}" pattern="#,###"/>&nbsp;<span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
                                <th class="trn" data-trn-key="TR_APPLIANCE_MAINTEN_RATE"><%--유지보수율--%></th>
                                <td>
                                    ${appCustomerInfo.maintPriceRate}%&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <th class="trn" data-trn-key="TR_COMMON_NOTE"><%--비고--%></th>
                                <td style="white-space: pre-wrap;">${appCustomerInfo.note}</td>
                            </tr>

                        </c:when>
                        <c:when test="${appCustomerInfo.contractGubun eq 'R'}">
                            <tr>
                                <th class="trn" data-trn-key="TR_APPLIANCE_MONTHLY_PAYMENT"><%--월 납입액--%></th>
                                <td class="fwB"><fmt:formatNumber value="${appCustomerInfo.paymentPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span></td>
                                <th class="trn" data-trn-key="TR_APPLIANCE_VAT"><%--부가세--%></th>
                                <td>
                                    <span class="trn" data-trn-key="TR_APPLIANCE_VAT_"><%--별도 or 포함--%></span>
                                </td>
                            </tr>
                            <tr>
                                <th class="trn" data-trn-key="TR_APPLIANCE_PAYMENT_PERIOD"><%--납입기간--%></th>
                                <td colspan="4">
                                    <fmt:formatDate value="${appCustomerInfo.rentalPayStartDate}" pattern="yyyy-MM-dd"/>
                                    ~ <fmt:formatDate value="${appCustomerInfo.rentalPayEndDate}" pattern="yyyy-MM-dd"/>
                                </td>
                            </tr>
                        </c:when>
                    </c:choose>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_PHYSICAL_COMPOSITION"><%--물리적 구성도--%></th>
                        <td colspan="3">
                            <c:if test="${empty physicalComposition}"><span class="trn" data-trn-key="TR_APPLIANCE_NO_PHYSICAL_COMPOSITION"><%--등록된 물리적 구성도사진이 없습니다.--%></span></c:if>
                            <span class="dis_b">
                                <a href="/file/download/${physicalComposition.idx}">${physicalComposition.name}</a><br>
                                <img class="mt10" alt src="/file/download/${physicalComposition.idx}" style="max-width: 100%; max-height: 100%" onclick="openLayerPopUp(${physicalComposition.idx})">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_LOGICAL_COMPOSITION"><%--논리적 구성도--%></th>
                        <td colspan="3">
                            <c:if test="${empty logicalComposition}"><span class="trn" data-trn-key="TR_APPLIANCE_NO_LOGICAL_COMPOSITION"><%--등록된 논리적 구성도사진이 없습니다.--%></span></c:if>
                            <span class="dis_b">
                                <a href="/file/download/${logicalComposition.idx}">${logicalComposition.name}</a><br>
                                <img class="mt10" alt src="/file/download/${logicalComposition.idx}" style="max-width: 100%; height: auto" onclick="openLayerPopUp(${logicalComposition.idx})">
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
        </section>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_APPLIANCE_SERVER_INFO"><%--장비 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_APPLIANCE_SERVER_INFO"><%--장비 정보--%></caption>
                    <colgroup>
                        <col width="15%">
                        <col width="15%">
                        <col width="15%">
                        <col width="15%">
                        <col width="">
                        <col width="15%">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key="TR_APPLIANCE_PARTNER_NAME"><%--파트너사명--%></th>
                        <th class="trn" data-trn-key="TR_APPLIANCE_SERVER_NAME"><%--명칭--%></th>
                        <th class="trn" data-trn-key="TR_APPLIANCE_SERVER_USE_GUBUN"><%--서버용도--%></th>
                        <th class="trn" data-trn-key="TR_APPLIANCE_SERVER_MODEL_NAME"><%--모델명--%></th>
                        <th class="trn" data-trn-key="TR_APPLIANCE_SERVER_LICENSE_NUMBER"><%--라이센스 번호--%></th>
                        <th class="trn" data-trn-key="TR_APPLIANCE_SERVER_MANAGEMENT_NUMBER"><%--관리번호--%></th>
                    </tr>
                    <c:forEach items="${serverList}" var="serverList" varStatus="status">
                        <tr class="hover" onclick="viewStorageArea('.storageArea${status.index}')">
                            <td>
                                ${serverList.partnerName == null ? "-" : serverList.partnerName}
                            </td>
                            <td>
                                ${serverList.name}
                            </td>
                            <td>
                                <c:if test="${serverList.serverGubun eq 'RG'}">ReceiveGUARD</c:if>
                                <c:if test="${serverList.serverGubun eq 'RC'}">CUBE</c:if>
                                <c:if test="${serverList.serverGubun eq 'SG'}">Send&SpamGUARD</c:if>
                                <c:if test="${serverList.serverGubun eq 'SD'}">SendGUARD</c:if>
                                <c:if test="${serverList.serverGubun eq 'SP'}">SpamGUARD</c:if>
                                <c:if test="${serverList.serverGubun eq 'SM'}">SecuMail</c:if>
                                <c:if test="${serverList.serverGubun eq 'SO'}">SPAMOUT</c:if>
                                <c:if test="${serverList.serverGubun eq 'IG'}"><span class="trn" data-trn-key="TR_COMMON_INTEGRATION"><%--통합--%></span></c:if>

                            </td>
                            <td>
                                ${serverList.serverModelName == null || serverList.serverModelName == "" ? "-":serverList.serverModelName}
                            </td>
                            <td>
                                ${serverList.licenseNumber}
                            </td>
                            <td>
                                ${serverList.uniqueNumber}
                            </td>
                        </tr>
                        <tr class="storageArea${status.index} dis_n">
                            <td colspan="6" style="padding: 0;">
                                <table>
                                    <colgroup>
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="10%">
                                    </colgroup>
                                    <tr>
                                        <th class="gray trn" data-trn-key="TR_COMMON_GUBUN"><%--구분--%></th>
                                        <th class="gray trn" data-trn-key="TR_COMMON_CAPACITY"><%--용량--%></th>
                                        <th class="gray trn" data-trn-key="TR_COMMON_INCH"><%--인치--%></th>
                                        <th class="gray trn" data-trn-key="TR_APPLIANCE_SERVER_RECV_DATE"><%--입고일--%></th>
                                    </tr>
                                    <c:forEach var="storage" items="${serverList.storageList}" varStatus="status2">
                                        <tr>
                                            <td class="a_center bd-n">
                                                <c:if test="${storage.gubun eq 'H'}">SATA</c:if>
                                                <c:if test="${storage.gubun eq 'S'}">SSD</c:if>
                                                <c:if test="${storage.gubun eq 'A'}">SAS</c:if>
                                            </td>
                                            <td class="a_center bd-n">${storage.capacity}</td>
                                            <td class="a_center bd-n">
                                                <c:if test="${storage.inch eq '0.0'}"><span class="trn" data-trn-key="TR_COMMON_PLZ_CHECK"><%--확인 요망--%></span></c:if>
                                                <c:if test="${storage.inch != '0.0'}">${storage.inch}인치</c:if>
                                            </td>
                                            <c:if test="${status2.first}">
                                            <fmt:formatDate value="${storage.storageDate}" pattern="yyyy-MM-dd" var="storageDate"/>
                                            <td class="a_center bd-n" rowspan="${fn:length(serverList.storageList)}" style="border-left: 1px solid #ddd;">${storageDate}</td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>

                                </table>
                            </td>
                        </tr>
                    </c:forEach>


                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_MODIFIED" value="<%--수정--%>" onclick="location.href='form?idx=${appCustomerInfo.idx}'">
            <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_LIST" value="<%--목록--%>" onclick="moveList()">
        </div>

    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>
<%@ include file="../../popup/layerpopup.jsp" %>