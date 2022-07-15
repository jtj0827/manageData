<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<script src="/resources/js/customerMng/customer/list.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CLOUD_TITLE3"><%--고객사 관리--%></h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="approvalState" value="${param.approvalState}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>
                            <div class="inline-group">
                                <select name="secuEcloudGubun" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_APPLY_SERVICE" value=""><%--신청 서비스--%></option>
                                    <option value="I" ${param.secuEcloudGubun eq 'I' ? 'selected' : ''}>I-Service</option>
                                    <option value="P" ${param.secuEcloudGubun eq 'P' ? 'selected' : ''}>P-Service</option>
                                    <option class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_O" value="O" ${param.secuEcloudGubun eq 'O' ? 'selected' : ''}><%--이전 메일--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_N" value="N" ${param.secuEcloudGubun eq 'N' ? 'selected' : ''}><%--P-Service(신규)--%></option>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w120">
                                    <option value="">전체</option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER" value="name" ${param.searchType eq 'name' ? 'selected' : ''}><%--고객사--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_REP_NAME" value="repName" ${param.searchType eq 'repName' ? 'selected' : ''}><%--대표자명--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_DOMAIN" value="domain" ${param.searchType eq 'domain' ? 'selected' : ''}><%--도메인--%></option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${param.searchText}" maxlength="100">
                            </div>
                        </div>

                        <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                        <div class="b-form-group__item">
                            <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                            <div class="inline-group">

                                <%--검색--%>
                                <input type="button" class="btn-base btn-search w100" value="검색" onclick="search()">
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
                    <input type="hidden" name="approvalState" value="${param.approvalState}">
                    <input type="hidden" name="secuEcloudGubun" value="${param.secuEcloudGubun}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <fmt:formatNumber value="${totalCount}" pattern="#,###"/></span>

                    <div class="b-list-top__right">
                        <select id="approvalStateSelect" class="default-input w150" onchange="approvalStateChange();">
                            <option class="trn" data-trn-key="TR_CLOUD_APPROVAL_STATE" value=""><%--승인 여부--%></option>
                            <option class="trn" data-trn-key="TR_CLOUD_APPROVAL_STATE_WAIT" value="W" ${param.approvalState eq 'W' ? 'selected' : ''}><%--승인대기--%></option>
                            <option class="trn" data-trn-key="TR_CLOUD_PARTNER_APPROVED" value="P" ${param.approvalState eq 'P' ? 'selected' : ''}><%--파트너사 승인--%></option>
                            <option class="trn" data-trn-key="TR_CLOUD_APPROVAL_STATE_REJECTED" value="R" ${param.approvalState eq 'R' ? 'selected' : ''}><%--반려--%></option>
                        </select>
                        <%@ include file="../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">
                    <table class="b-listTable plus">
                        <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                        <colgroup>
                            <col width="5%">
                            <col width="8%">
                            <col width="10%">
                            <col width="*%">
                            <col width="10%">
                            <col width="9%">
                            <col width="8%">
                            <col width="12%">
                            <col width="15%">
                            <col width="13%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <th class="trn" data-trn-key="TR_APPLY_SERVICE"><%--신청서비스--%></th>
                            <th class="trn" data-trn-key="TR_COMMON_PARTNER"><%--파트너사--%></th>
                            <th class="trn" data-trn-key="TR_CUSTOMER"><%--고객사--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_REP_NAME"><%--대표자 이름--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_APPROVAL_STATE_2"><%--승인상태--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_APPLY_ACCOUNT_COUNT"><%--신청 계정 수--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_PAID_PRICE"><%--결제금액--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_USE_DOMAIN"><%--사용도메인--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_SERVICE_REQUEST_DATE"><%--서비스 요청일--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="10" class="nodata trn" data-trn-key="TR_COMMON_NOTDATALIST"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="customer" items="${customerList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${customer.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">
                                    <c:if test="${customer.secuEcloudGubun eq 'I'}">I-Service</c:if>
                                    <c:if test="${customer.secuEcloudGubun eq 'P'}">P-Service</c:if>
                                    <c:if test="${customer.secuEcloudGubun eq 'O'}"><span class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_O"><%--기존 메일--%></span></c:if>
                                    <c:if test="${customer.secuEcloudGubun eq 'N'}"><span class="trn" data-trn-key="TR_CLOUD_SECU_E_CLOUD_GUBUN_N"><%--P-Service(신규)--%></span></c:if>
                                </td>
                                <td class="a_center">${customer.partnerName ne null && customer.partnerName ne '' ? customer.partnerName : '기원테크'}</td>
                                <td class="a_center fc-blue fwBold">${customer.name}</td>
                                <td class="a_center">${customer.repName}</td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${customer.approvalState == 'A'}">
                                            <span class="fc_bn fwBold trn" data-trn-key="TR_CLOUD_APPROVAL"><%--승인--%></span>
                                        </c:when>
                                        <c:when test="${customer.approvalState == 'R'}">
                                            <span class="fc_r fwBold trn" data-trn-key="TR_CLOUD_APPROVAL_STATE_REJECTED"><%--반려--%></span>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${customer.partnerApprovalYn}"><span class="fc_gn fwBold trn" data-trn-key="TR_CLOUD_PARTNER_APPROVED"><%--파트너사 승인--%></span></c:if>
                                            <c:if test="${!customer.partnerApprovalYn}"><span class="trn" data-trn-key="TR_CLOUD_APPROVAL_STATE_WAIT"><%--승인대기--%></span></c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="a_center"><fmt:formatNumber value="${customer.addAccountCount ne null ? (customer.applyAccountCount + customer.addAccountCount): customer.applyAccountCount}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span></td>
                                <td class="a_center"><fmt:formatNumber value="${customer.totalPayment}" pattern="#,###"/> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span></td>
                                <td class="a_center">
                                    <c:if test="${customer.ownDomainYn}">${customer.applyMainDomain}</c:if>
                                    <c:if test="${!customer.ownDomainYn}">${customer.applyMainDomain}</c:if>
                                </td>
                                <td class="a_center"><fmt:formatDate value="${customer.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../include/paging.jsp" %>
                </div>

                <input type="button" class="trn btn-baseRound btn-add w80 mt10 trn" data-trn-value="TR_COMMON_REGISTRATION" value="등록" onclick="location.href='form'">

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>

</div><!--l-container-->
</body>
</html>