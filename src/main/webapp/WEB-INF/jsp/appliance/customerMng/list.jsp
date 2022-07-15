<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/info/list.js" type="text/babel"></script>
<script src="/resources/js/lang/appliance/appliance_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_APPLIANCE_TITLE1"><%--고객사 관리--%></h1>

<%--    <div class="l-maxwrap">--%>
    <div class="l-maxwrap">
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
                                    <option class="trn" data-trn-key="TR_APPLIANCE_PARTNER" value="uniqueNumber" ${param.searchType eq 'uniqueNumber' ? 'selected' : ''}><%--파트너사--%></option>
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

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <fmt:formatNumber value="${totalCount}" pattern="#,###"/></span>

                    <div class="b-list-top__right">
                        <%@ include file="../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">

                    <table class="b-listTable plus">
                        <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                        <colgroup>
                            <col width="8%"> <!--번호-->
                            <col width="20%"><!--파트너사-->
                            <col width="20%"><!--기업명-->
                            <col width="10%"><!--납품일자-->
                            <col width=""><!--납품금액-->
                            <col width=""><!--부가세-->
                            <col width="10%"><!--계약 구분-->
                            <col width="10%"><!--장비개수-->
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_PARTNER"><%--파트너사--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_MANAGE_NAME"><%--기업명--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_DELIVERY_DATE"><%--납품일자--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_DELIVERY_PRICE"><%--납품금액--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_VAT"><%--부가세--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_CONTRACT_GUBUN"><%--계약 구분--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_EQUIPMENT_COUNT"><%--장비개수--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="8" class="nodata trn" data-trn-key="TR_COMMON_NODATA"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="appCustomer" items="${appCustomerList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${appCustomer.idx})">
                                <td class="a_center">
                                        ${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}
                                </td>
                                <td class="a_center">
                                    ${appCustomer.partnerName}
                                </td>
                                <td class="a_center">
                                    ${appCustomer.manageName}
                                </td>
                                <td class="a_center">
                                    <fmt:formatDate value="${appCustomer.deliveryDate}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td class="a_center">
                                    <fmt:formatNumber value="${appCustomer.paymentPrice}" pattern="#,###"/> 원
                                </td>
                                <td class="a_center">
                                    <span class="trn" data-trn-key="TR_APPLIANCE_VAT_${appCustomer.vat}"></span>
                                </td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${appCustomer.maintEndYn eq true}">
                                            <span class="trn" data-trn-key="TR_COMMON_END" style="color: #ff2222"><%--종료--%></span>
                                        </c:when>
                                        <c:when test="${appCustomer.contractGubun eq 'D'}">
                                            <span class="trn" data-trn-key="TR_APPLIANCE_CONTRACT_GUBUN_D" style="color: #4f45d9"><%--납품--%></span>
                                        </c:when>
                                        <c:when test="${appCustomer.contractGubun eq 'R'}">
                                            <span class="trn" data-trn-key="TR_APPLIANCE_CONTRACT_GUBUN_R"><%--임대--%></span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td class="a_center">
                                    ${appCustomer.equipmentCount}
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

                <input type="button" class="trn btn-baseRound btn-add mt20 w80 trn" data-trn-value="TR_COMMON_REGISTRATION" value="등록" onclick="location.href='form'">

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>