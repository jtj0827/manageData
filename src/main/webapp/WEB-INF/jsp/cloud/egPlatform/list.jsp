<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CLOUD_TITLE3"><%--고객사 관리--%></h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>
                            <div class="inline-group">
                                <select name="serviceUseGubun" class="default-input w100">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_PRACTICAL_USE" value="U" ${param.serviceUseGubun eq 'U' ? 'selected' : ''}><%--실사용--%></option>
                                    <option value="B" ${param.serviceUseGubun eq 'B' ? 'selected' : ''}>BMT</option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="searchPaymentCompleteYn" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_CLOUD_MAIL_PAYMENT_COMPLETE_YN" value=""><%--결제여부--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_MAIL_PAYMENT_COMPLETE_YN_Y" value="1" ${paging.searchPaymentCompleteYn == true ? 'selected' : ''}><%--완료--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_MAIL_PAYMENT_COMPLETE_YN_N" value="0" ${paging.searchPaymentCompleteYn == false ? 'selected' : ''}><%--미결제--%></option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="searchType" class="default-input w100">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_COMPANY_NAME" value="name" ${param.searchType eq 'name' ? 'selected' : ''}><%--기업명--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_REP_NAME" value="repName" ${param.searchType eq 'repName' ? 'selected' : ''}><%--대표자명--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_DOMAIN" value="domain" ${param.searchType eq 'domain' ? 'selected' : ''}><%--도메인--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_PARTNER_NAME" value="partner" ${param.searchType eq 'partner' ? 'selected' : ''}><%--파트너사 명--%></option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${param.searchText}" maxlength="100">
                            </div>

                        </div>

                        <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                        <div class="b-form-group__item">
                            <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                            <div class="inline-group">

                                <%--검색--%>
                                <input type="button" class="btn-base btn-search w100 trn" data-trn-value="TR_SEARCH" value="" onclick="search()"><%--검색--%>
                            </div>
                            <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                        </div>
                    </div>
                </form>
                <form id="pageForm">
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="searchType" value="${param.searchType}">
                    <input type="hidden" name="searchText" value="${param.searchText}">
                    <input type="hidden" name="serviceUseGubun" value="${param.serviceUseGubun}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <fmt:formatNumber value="${totalCount}" pattern="#,###"/></span>
                    <span class="ml5 mr5" style="font-weight: 600;"><span class="trn" data-trn-key="TR_CLOUD_MAIL_PAYMENT_PRICE_FOR_LIST"><%--총 금액(월)--%></span> : <fmt:formatNumber value="${paging.totalPaymentListView eq null ? 0 : paging.totalPaymentListView}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span></span>

                    <div class="b-list-top__right">
                        <%@ include file="../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">
                    <table class="b-listTable plus">
                        <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                        <colgroup>
                            <col width="5%"><%--번호--%>
                            <col width="10%"><%--파트너사--%>
                            <col width="15%"><%--고객사--%>
                            <col width="8%"><%--총 계정 수--%>
                            <col width="12%"><%--사용도메인--%>
                            <col width="8%"><%--설치여부--%>
                            <col width="8%"><%--설치구분--%>
                            <col width="14%"><%--서비스 적용일--%>
                            <col width="10%"><%--남은기간--%>
                            <col width="10%"><%--월 결제액--%>
                            <col width="6%"><%--결제--%>
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <th class="trn" data-trn-key="TR_COMMON_PARTNER"><%--파트너사--%></th>
                            <th class="trn" data-trn-key="TR_CUSTOMER"><%--고객사--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_TOTAL_ACCOUNT_COUNT"><%--총 계정 수--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_USE_DOMAIN"><%--사용도메인--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_INSTALL_YN"><%--설치여부--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_INSTALL_GUBUN"><%--설치구분--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_SERVICE_END_DATE"><%--서비스 종료일--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_REMAINING_PERIOD"><%--남은기간--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_PAYMENT_PRICE_MONTHLY"><%--월 결제액--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_PAYMENT"><%--결제--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="10" class="nodata trn" data-trn-key="TR_COMMON_NODATA"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="customer" items="${customerList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${customer.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">
                                    ${customer.partnerName}
                                </td>
                                <td class="a_center">${customer.name}</td>
                                <td class="a_center">${customer.applyAccountCount} 개</td>
                                <td class="a_center">${customer.applyMainDomain}</td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${customer.equipmentInstallYn == true}">
                                            <span class="fc_bn fwBold trn" data-trn-key="TR_COMPLETION"><%--완료--%></span>
                                        </c:when>
                                        <c:when test="${customer.equipmentInstallYn == false}">
                                            <span class="fc_r fwBold trn" data-trn-key="TR_STAND_BY"><%--대기--%></span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td class="a_center">
                                    <c:if test="${customer.serviceUseGubun == 'B'}">
                                        <span class="fc_r fwBold">BMT</span>
                                    </c:if>
                                    <c:if test="${customer.serviceUseGubun == 'U'}">
                                        <span class="trn" data-trn-key="TR_CLOUD_PRACTICAL_USE"><%--실사용--%></span>
                                    </c:if>
                                </td>
                                <td class="a_center">
                                    <c:if test="${customer.contractPeriodYn == true}">
                                        <fmt:formatDate value="${customer.renewalServiceEndDate}" pattern="yyyy-MM-dd"/>
                                    </c:if>
                                    <c:if test="${customer.contractPeriodYn == false}">
                                        -
                                    </c:if>
                                </td>
                                <td class="a_center">
                                    <c:if test="${customer.contractPeriodYn}">
                                        <c:choose>
                                            <c:when test="${customer.remainingDate > 60}">
                                                <span class="trn" data-trn-key="TR_CLOUD_MORE_THAN_60_DAYS"><%--60일 이상--%></span>
                                            </c:when>
                                            <c:when test="${customer.remainingDate < 30}">
                                                <p style="color: red">${customer.remainingDate}<span class="trn" data-trn-key="TR_COMMON_DAY"><%--일--%></span></p>
                                            </c:when>
                                            <c:when test="${customer.remainingDate >= 30}">
                                                ${customer.remainingDate}<span class="trn" data-trn-key="TR_COMMON_DAY"><%--일--%></span>
                                            </c:when>
                                        </c:choose>
                                    </c:if>
                                    <c:if test="${!customer.contractPeriodYn}">
                                        -
                                    </c:if>
                                </td>
                                <td class="a_center"> <fmt:formatNumber value="${customer.totalPayment}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%-- 원--%></span></td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${customer.totalPayment eq 0}"> - </c:when>
                                        <c:otherwise>
                                            <c:if test="${customer.paymentCompleteYn}"><span class="trn" data-trn-key="TR_COMPLETION"><%--완료--%></span></c:if>
                                            <c:if test="${!customer.paymentCompleteYn}"><span class="fc_r trn" data-trn-key="TR_CLOUD_MAIL_PAYMENT_COMPLETE_YN_N"><%--미결제--%></span></c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../include/paging.jsp" %>
                </div>

                <input type="button" class="trn btn-baseRound btn-add w80 mt10 trn" data-trn-value="TR_COMMON_REGISTRATION" value="" onclick="location.href='form'"><%--등록--%>

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>

</div><!--l-container-->
</body>
</html>