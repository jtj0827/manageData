<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/appliance/maintain/list.js" type="text/babel"></script>
<script src="/resources/js/lang/appliance/appliance_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_APPLIANCE_MAINTEN_TITLE_${gubun}">
        <%--납품 유지보수관리--%>
        <%--임대 유지보수관리--%>
        <%--종료된 유지보수--%>
    </h1>

    <div class="b-listSearchForm">
        <div class="b-listSearchForm__inner">
            <form id="searchForm">
                <input type="hidden" name="pageSize" value="${paging.pageSize}">
                <div class="b-form-group">
                    <div class="b-form-group__item">
                        <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>

                        <div class="inline-group">
                            <select name="searchType" class="default-input w120">
                                <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                <option class="trn" data-trn-key="TR_APPLIANCE_PARTNER" value="partnerName" ${param.searchType eq 'partnerName' ? 'selected' : ''}><%--파트너사--%></option>
                                <option class="trn" data-trn-key="TR_APPLIANCE_MANAGE_NAME" value="manageName" ${param.searchType eq 'manageName' ? 'selected' : ''}><%--기업명--%></option>
                            </select>

                            <input type="text" class="default-input w200" name="searchText" value="${param.searchText}" maxlength="100">
                        </div>
                    </div>

                    <div class="b-form-group__item">
                        <div class="inline-group">
                            <input type="button" class="btn-base btn-search w100 trn" data-trn-value="TR_SEARCH" value="<%--검색--%>" onclick="search()">
                        </div>
                    </div>
                </div>
            </form>

            <form id="pageForm">
                <input type="hidden" name="pageNo">
                <input type="hidden" name="pageSize" value="${paging.pageSize}">
                <input type="hidden" name="useGubunCode" value="${param.useGubunCode}">
                <input type="hidden" name="searchType" value="${param.searchType}">
                <input type="hidden" name="searchText" value="${param.searchText}">
            </form>
        </div><!--b-listSearchForm__inner-->

    </div><!--b-listSearchForm-->

    <div class="l-content">
        <div class="b-list">
            <div class="b-list-top">
                <span class="b-list-top__total">TOTAL - <fmt:formatNumber value="${totalCount}" pattern="#,###"/></span>
                <c:if test="${gubun != 'e'}">
                    <span class="ml5 mr5" style="font-weight: 600;"><span class="trn" data-trn-key="TR_COMMON_TOTAL_PRICE_MONTH"><%--총 금액 (월)--%></span> : <fmt:formatNumber value="${totalPayment}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span></span>
                </c:if>
                <div class="b-list-top__right">
                    <%@ include file="../../include/pageSize.jsp" %>
                </div>
            </div>
            <div class="b-tableWrap">
                <!--종료된 유지보수가 아닌경우 (납품,임대)-->
                <c:if test="${gubun != 'e'}">
                <table class="b-listTable plus">
                    <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                    <colgroup>
                        <col width="5%"> <!--번호-->
                        <col width="17%"><!--파트너사-->
                        <col width="17%"><!--기업명-->
                        <c:if test="${gubun eq 'd'}"><col width="5%"></c:if><!--상태-->
                        <col width="13%"><!--완료일-->
                        <col width="13%"><!--갱신일-->
                        <c:if test="${gubun eq 'd'}">
                        <col width="9%"><!--남은기간-->
                        <col width="14%"><!--월 유지보수금액-->
                        </c:if>
                        <col width="14%"><!--연 지보수금액-->
                        <col width="7%"><!--부가세-->
                        <c:if test="${gubun eq 'd'}"><col width="7%"></c:if><!--납부구분-->
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                        <th class="trn" data-trn-key="TR_APPLIANCE_PARTNER"><%--파트너사--%></th>
                        <th class="trn" data-trn-key="TR_APPLIANCE_MANAGE_NAME"><%--기업명--%></th>
                        <c:if test="${gubun eq 'd'}">
                            <th class="trn" data-trn-key="TR_COMMON_STATE"><%--상태--%></th>
                        </c:if>
                        <th class="trn" data-trn-key="TR_APPLIANCE_COMPLET_DATE"><%--완료일--%></th>
                        <th class="trn" data-trn-key="TR_APPLIANCE_RENEWAL_DATE"><%--갱신일--%></th>
                        <c:if test="${gubun eq 'd'}"><th class="trn" data-trn-key="TR_APPLIANCE_REMAINING_PERIOD"><%--남은기간--%></th>
                        <th class="trn" data-trn-key="TR_APPLIANCE_MAINTEN_PERIOD_ANNUAL"><%--연 유지보수금액--%></th>
                        <th class="trn" data-trn-key="TR_APPLIANCE_MAINTEN_PERIOD_MONTHLY"><%--월 유지보수금액--%></th>
                        </c:if>
                        <c:if test="${gubun eq 'r'}"><th class="trn" data-trn-key="TR_APPLIANCE_MAINTEN_PERIOD_MONTHLY"><%--월 유지보수금액--%></th></c:if>
                        <th class="trn" data-trn-key="TR_APPLIANCE_VAT"><%--부가세--%></th>
                        <c:if test="${gubun eq 'd'}">
                        <th class="trn" data-trn-key="TR_APPLIANCE_PAYMENT_GUBUN"><%--납부구분--%></th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody>

                    <c:if test="${totalCount == 0}">
                        <c:if test="${gubun eq 'd'}">
                            <tr>
                                <td colspan="11" class="nodata trn" data-trn-key="TR_COMMON_NOTDATALIST"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:if test="${gubun eq 'r'}">
                            <tr>
                                <td colspan="7" class="nodata trn" data-trn-key="TR_COMMON_NOTDATALIST"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                    </c:if>

                    <c:forEach var="maintain" items="${maintainList}" varStatus="status">
                        <tr class="pointer" onclick="moveView(${maintain.appCustomerIdx})">
                            <td class="a_center">
                                    ${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}
                            </td>
                            <td class="a_center">
                                ${maintain.partnerName}
                            </td>
                            <td class="a_center">
                                ${maintain.manageName}
                            </td>
                            <c:if test="${gubun eq 'd'}"> <!--납품 n차 상태-->
                            <td class="a_center">
                                <c:if test="${maintain.polynomial eq 0}">
                                    <span class="trn" data-trn-key="TR_APPLIANCE_FREE"><%--무상--%></span>
                                </c:if>
                                <c:if test="${maintain.polynomial ne 0}">
                                    ${maintain.polynomial} <span class="trn" data-trn-key="TR_COMMON_TH"><%--차--%></span>
                                </c:if>
                            </td>
                            </c:if>
                            <td class="a_center"> <!--완료일-->
                                <c:if test="${not empty maintain.formatedEndDate}">
                                    ${maintain.formatedEndDate}
                                </c:if>
                                <c:if test="${empty maintain.formatedEndDate}">
                                    ${maintain.formatedMaintFreeEndDate}
                                </c:if>
                            </td>
                            <td class="a_center"> <!--갱신일-->
                                <c:if test="${not empty maintain.formatedRenewalDate}">
                                    ${maintain.formatedRenewalDate}
                                </c:if>
                                <c:if test="${empty maintain.formatedRenewalDate}">
                                    ${maintain.freeRenewalDate}
                                </c:if>
                            </td>
                            <c:if test="${gubun eq 'd'}"> <!--납품 남은기간-->
                                <td class="a_center">
                                    <c:if test="${empty maintain.idx}"> <!--무상 남은기간-->
                                        <c:choose>
                                            <c:when test="${maintain.freeEffectiveDate < 0}"><p style="color: red; font-weight: 600" class="trn" data-trn-key="TR_COMMON_EXCESS"><%--초과--%></p></c:when>
                                            <c:when test="${maintain.freeEffectiveDate < 31}">
                                                <p style="color: red; font-weight: 600">${maintain.freeEffectiveDate}<span class="trn" data-trn-key="TR_COMMON_DAY"><%--일--%></span></p>
                                            </c:when>
                                            <c:when test="${maintain.freeEffectiveDate < 61}">
                                                <p style="font-weight: 600">${maintain.freeEffectiveDate}<span class="trn" data-trn-key="TR_COMMON_DAY"><%--일--%></span></p>
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <c:if test="${not empty maintain.idx}"> <!--유상 남은기간-->
                                        <c:choose>
                                            <c:when test="${maintain.effectiveDate < 0}">
                                                <p style="color: red; font-weight: 600" class="trn" data-trn-key="TR_COMMON_EXCESS"><%--초과--%></p>
                                            </c:when>
                                            <c:when test="${maintain.effectiveDate < 31}">
                                                <p style="font-weight: 600;color: red">${maintain.effectiveDate}<span class="trn" data-trn-key="TR_COMMON_DAY"><%--일--%></span></p>
                                            </c:when>
                                            <c:when test="${maintain.effectiveDate < 61}">
                                                <p style="font-weight: 600">${maintain.effectiveDate}<span class="trn" data-trn-key="TR_COMMON_DAY"><%--일--%></span></p>
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </td>
                            </c:if>
                            <c:if test="${gubun eq 'd'}" >
                            <td class="a_center"><!--연 유지보수금액-->
                                <c:if test="${empty maintain.paymentPrice}">
                                    -
                                </c:if>
                                <c:if test="${not empty maintain.paymentPrice}">
                                    <fmt:formatNumber value="${maintain.paymentPrice}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </c:if>
                            </td>
                            </c:if>
                            <td class="a_center"> <!--월 유지보수금액-->
                                <span class="monthPayment">
                                <c:if test="${gubun eq 'd'}">
                                    <c:if test="${empty maintain.paymentPrice}">
                                        -
                                    </c:if>
                                    <c:if test="${not empty maintain.paymentPrice}">
                                        <c:choose>
                                            <c:when test="${maintain.paymentWay eq 'Y'}">
                                                <fmt:formatNumber value="${maintain.paymentPrice / maintain.monthsDifference}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </c:when>
                                            <c:when test="${maintain.paymentWay eq 'M'}">
                                                <fmt:formatNumber value="${maintain.paymentPriceMonth}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </c:when>
                                            <c:when test="${gubun eq 'r'}" >
                                                <fmt:formatNumber value="${maintain.customerPaymentPriceMonth}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                            </c:when>
                                        </c:choose>
                                    </c:if>
                                </c:if>
                                <c:if test="${gubun eq 'r'}">
                                    <c:if test="${empty maintain.customerPaymentPriceMonth}">
                                        -
                                    </c:if>
                                    <c:if test="${not empty maintain.customerPaymentPriceMonth}">
                                        <fmt:formatNumber value="${maintain.customerPaymentPriceMonth}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                    </c:if>
                                </c:if>
                                </span>
                            </td>
                            <td class="a_center trn" data-trn-key="TR_APPLIANCE_VAT_${maintain.vat}">
                                <%--별도 or 포함--%>
                            </td>
                            <c:if test="${gubun eq 'd'}">
                            <td class="a_center trn" data-trn-key="TR_COMMON_PAYMENT_WAY_${maintain.paymentWay}">
                                <%--연납 or 월납 or 분기별 납부--%>
                            </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                </c:if>
                <!--종료된 유지보수-->
                <c:if test="${ gubun eq 'e'}">
                    <table class="b-listTable plus">
                        <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                        <colgroup>
                            <col width="7%">
                            <col width="*">
                            <col width="*">
                            <col width="15%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_PARTNER"><%--파트너사--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_MANAGE_NAME"><%--기업명--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_END_DATE"><%--종료일--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="4" class="nodata trn" data-trn-key="TR_COMMON_NOTDATALIST"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="maintain" items="${maintainList}" varStatus="status">
                        <tr class="pointer" onclick="moveView(${maintain.appCustomerIdx})">
                            <td class="a_center">
                                    ${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}
                            </td>
                            <td class="a_center">${maintain.partnerName}</td>
                            <td class="a_center">${maintain.manageName}</td>
                            <td class="a_center">${maintain.formateMaintEndDate}</td>
                        </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </c:if>
            </div>
            <div>
                <%@ include file="../../include/paging.jsp" %>
            </div>
        </div><%--b-list--%>
    </div><%--l-content--%>
</section>


</div><!--l-container-->
</body>
</html>