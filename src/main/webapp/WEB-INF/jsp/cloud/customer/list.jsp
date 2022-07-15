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
                                <select name="searchInstallYn" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_CLOUD_INSTALL_YN" value=""><%--설치여부--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_INSTALL_YN_Y" value="1" ${paging.searchInstallYn eq '1' ? 'selected' : ''}><%--설치완료--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_INSTALL_YN_N" value="0" ${paging.searchInstallYn eq '0' ? 'selected' : ''}><%--설치대기--%></option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="searchSecumailServerIdx" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_CLOUD_MAIL_SERVER" value=""><%--메일서버--%></option>
                                    <c:forEach items="${secumailServerList}" var="mailServer">
                                        <option value="${mailServer.idx}" ${paging.searchSecumailServerIdx == mailServer.idx ? 'selected' : ''}>${mailServer.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <c:if test="${paging.gubun ne 'iservice'}">
                            <div class="inline-group">
                                <select name="searchPaymentCompleteYn" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_CLOUD_MAIL_PAYMENT_COMPLETE_YN" value=""><%--결제여부--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_MAIL_PAYMENT_COMPLETE_YN_Y" value="1" ${paging.searchPaymentCompleteYn == true ? 'selected' : ''}><%--완료--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_MAIL_PAYMENT_COMPLETE_YN_N" value="0" ${paging.searchPaymentCompleteYn == false ? 'selected' : ''}><%--미결제--%></option>
                                </select>
                            </div>
                            </c:if>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_COMPANY_NAME" value="name" ${paging.searchType eq 'name' ? 'selected' : ''}><%--기업명--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_REP_NAME" value="repName" ${paging.searchType eq 'repName' ? 'selected' : ''}><%--대표자명--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_DOMAIN" value="domain" ${paging.searchType eq 'domain' ? 'selected' : ''}><%--도메인--%></option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${paging.searchText}" maxlength="100">
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
                    <input type="hidden" name="searchInstallYn" value="${paging.searchInstallYn}">
                    <input type="hidden" name="searchType" value="${paging.searchType}">
                    <input type="hidden" name="searchText" value="${paging.searchText}">
                    <input type="hidden" name="searchPaymentCompleteYn" value="${param.searchPaymentCompleteYn}">
                    <input type="hidden" name="searchSecumailServerIdx" value="${param.searchSecumailServerIdx}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <fmt:formatNumber value="${totalCount}" pattern="#,###"/></span>
                    <span class="ml5 mr5" style="font-weight: 600;"><span class="trn" data-trn-key="TR_CLOUD_MAIL_PAYMENT_PRICE_FOR_LIST"><%--총 금액(월)--%></span> : <fmt:formatNumber value="${paging.totalPaymentListView eq null ? 0 : paging.totalPaymentListView}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span></span>
                    /
                    <span class="ml5" style="font-weight: 600; color: red;"><span class="trn" data-trn-key="TR_CLOUD_MAIL_UNPAID_PRICE_FOR_LIST">총 미결제 금액</span> : <fmt:formatNumber value="${paging.notPaymentListView eq null ? 0 : paging.notPaymentListView}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span></span>
                    <div class="b-list-top__right">
                        <%@ include file="../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">
                    <table class="b-listTable plus">
                        <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                        <colgroup>
                            <col width="5%">
                            <c:if test="${paging.gubun eq 'total'}">
                                <col width="7%">
                            </c:if>
                            <col width="10%">
                            <col width="*%">
                            <c:if test="${paging.gubun ne 'oldcloud'}">
                                <col width="12%">
                            </c:if>
                            <col width="8%">
                            <col width="6%">
                            <col width="11%">
                            <col width="10%">
                            <col width="7%">
                            <col>
                            <col width="6%">
                        </colgroup>
                        <thead>
                        <tr>

                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <c:if test="${paging.gubun eq 'total'}">
                                <th class="trn" data-trn-key="TR_COMMON_GUBUN"><%--구분--%></th>
                            </c:if>
                            <th class="trn" data-trn-key="TR_COMMON_PARTNER"><%--파트너사--%></th>
                            <th class="trn" data-trn-key="TR_CUSTOMER"><%--고객사--%></th>
                            <c:if test="${paging.gubun ne 'oldcloud'}">
                                <th class="trn" data-trn-key="TR_CLOUD_MAIL_SERVER"><%--메일서버--%></th>
                            </c:if>
                            <th class="trn" data-trn-key="TR_CLOUD_APPLY_ACCOUNT_COUNT"><%--신청 계정 수--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_CONTRACT_PERIOD"><%--계약기간--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_APPLY_DOMAIN"><%--신청 도메인--%></th>
                            <c:if test="${paging.gubun eq 'pservice' or paging.gubun eq 'npservice'}">
                                <th class="trn" data-trn-key="TR_CLOUD_END_DATE"><%--종료일--%></th>
                            </c:if>
                            <c:if test="${paging.gubun ne 'pservice' and paging.gubun ne 'npservice'}">
                                <th class="trn" data-trn-key="TR_COMMON_REGDATE"><%--등록일--%></th>
                            </c:if>
                            <th class="trn" data-trn-key="TR_CLOUD_INSTALL_YN"><%--설치여부--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_MAIL_PAYMENT_PRICE_MONTHLY"><%--금액(월)--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_PAYMENT"><%--결제--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="${paging.gubun eq 'total' ? '11' : paging.gubun ne 'oldcloud' ? '10' : '9'}" class="nodata trn" data-trn-key="TR_COMMON_NODATA"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="customer" items="${customerList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${customer.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <c:if test="${paging.gubun eq 'total'}">
                                    <td class="a_center">
                                        <c:if test="${customer.secuEcloudGubun eq 'I'}">I</c:if>
                                        <c:if test="${customer.secuEcloudGubun eq 'P'}">P</c:if>
                                        <c:if test="${customer.secuEcloudGubun eq 'N'}">N</c:if>
                                        <c:if test="${customer.secuEcloudGubun eq 'O'}"><span class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_O"><%--이전메일--%></span></c:if>
                                        <c:if test="${customer.secuEcloudGubun eq 'C'}"><span class="trn" data-trn-key="TR_CLOUD"><%--클라우드--%></span></c:if>
                                    </td>
                                </c:if>
                                <td class="a_center">${customer.partnerName ne null && customer.partnerName ne '' ? customer.partnerName : '기원테크'}</td>
                                <td class="a_center fc-blue fwBold">${customer.name}</td>
                                <c:if test="${paging.gubun ne 'oldcloud'}"><td class="a_center">${customer.mailServerName}</td></c:if>
                                <td class="a_center"><fmt:formatNumber value="${customer.addAccountCount ne null ? (customer.applyAccountCount + customer.addAccountCount) : customer.applyAccountCount}" pattern="#,###"/> 개</td>
                                <td class="a_center">
                                    <c:if test="${customer.secuEcloudGubun eq 'I'}">
                                        <c:if test="${customer.serviceUsePeriod == 999}"><span class="trn" data-trn-key="TR_LIFETIME"><%--평생--%></span></c:if>
                                        <c:if test="${customer.serviceUsePeriod != 999}">
                                            <c:if test="${customer.paymentWay == 'M'}">
                                                -
                                            </c:if>
                                            <c:if test="${customer.paymentWay == 'Y'}">
                                                <fmt:formatNumber value="${customer.serviceUsePeriod / 12}"/><span class="trn" data-trn-key="TR_COMMON_YEAR"><%--년--%></span>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${customer.secuEcloudGubun ne 'I'}">
                                        <c:if test="${customer.paymentWay == 'M'}">
                                            -
                                        </c:if>
                                        <c:if test="${customer.paymentWay == 'Y'}">
                                            <fmt:formatNumber value="${customer.serviceUsePeriod / 12}"/><span class="trn" data-trn-key="TR_COMMON_YEAR"><%--년--%></span>
                                        </c:if>
                                    </c:if>
                                </td>
                                <td class="a_center">
                                    <c:if test="${customer.ownDomainYn}">${customer.applyMainDomain}</c:if>
                                    <c:if test="${!customer.ownDomainYn}">${customer.applyMainDomain}</c:if>
                                </td>
                                <td class="a_center">
                                    <c:if test="${paging.gubun eq 'pservice' or paging.gubun eq 'npservice'}">
                                        <c:if test="${customer.paymentWay == 'M'}">-</c:if>
                                        <c:if test="${customer.paymentWay != 'M'}">
<%--                                            <c:if test="${customer.renewalServiceEndDate != null}">--%>
<%--                                                <fmt:formatDate value="${customer.renewalServiceEndDate}" pattern="yyyy-MM-dd"/>--%>
<%--                                            </c:if>--%>
<%--                                            <c:if test="${customer.renewalServiceEndDate == null}">--%>
<%--                                                <fmt:formatDate value="${customer.serviceEndDate}" pattern="yyyy-MM-dd"/>--%>
<%--                                            </c:if>--%>
                                            <fmt:formatDate value="${customer.renewalServiceEndDate}" pattern="yyyy-MM-dd"/>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${paging.gubun ne 'pservice' and paging.gubun ne 'npservice'}">
                                        <fmt:formatDate value="${customer.regDate}" pattern="yyyy-MM-dd"/>
                                    </c:if>
                                </td>
                                <td class="a_center">
                                    <c:if test="${customer.equipmentInstallYn}"><span class="trn" data-trn-key="TR_COMPLETION"><%--완료--%></span></c:if>
                                    <c:if test="${!customer.equipmentInstallYn}"><span class="fc_r trn" data-trn-key="TR_STAND_BY"><%--대기--%></span></c:if>
                                </td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${customer.secuEcloudGubun eq 'O'}">
                                            <fmt:formatNumber value="${customer.supplyPrice}" pattern="#,###"/>
                                        </c:when>
                                        <c:when test="${customer.secuEcloudGubun eq 'N'}">
                                            <fmt:formatNumber value="${customer.supplyPrice}" pattern="#,###"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${customer.serviceUsePeriod != 999}">
                                                <fmt:formatNumber value="${customer.supplyPrice / customer.serviceUsePeriod}" pattern="#,###"/>
                                            </c:if>
                                            <c:if test="${customer.serviceUsePeriod == 999}">
                                                <fmt:formatNumber value="${customer.supplyPrice}" pattern="#,###"/>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
<%--                                    <c:if test="${customer.serviceUsePeriod != 999 && !customer.secuEcloudGubun eq 'O'}">--%>
<%--                                        <fmt:formatNumber value="${customer.supplyPrice / customer.serviceUsePeriod}" pattern="#,###"/>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${customer.serviceUsePeriod == 999 || customer.secuEcloudGubun eq 'O'}">--%>
<%--                                        <fmt:formatNumber value="${customer.supplyPrice}" pattern="#,###"/>--%>
<%--                                    </c:if>--%>
                                    <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                                </td>
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

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>

</div><!--l-container-->
</body>
</html>