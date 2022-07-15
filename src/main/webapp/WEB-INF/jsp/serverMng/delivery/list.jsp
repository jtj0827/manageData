<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/info/list.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">납품 서버 정보</h1>

<%--    <div class="l-maxwrap">--%>
    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label>검색 조건</label>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w120">
                                    <option value="">전체</option>
                                    <option value="uniqueNumber" ${param.searchType eq 'uniqueNumber' ? 'selected' : ''}>관리번호</option>
                                    <option value="serverName" ${param.searchType eq 'serverName' ? 'selected' : ''}>서버명칭</option>
                                    <option value="manage" ${param.searchType eq 'manage' ? 'selected' : ''}>고객사</option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${param.searchText}" maxlength="100">
                            </div>
                        </div>

                        <div class="b-form-group__item">
                            <div class="inline-group">
                                <input type="button" class="btn-base btn-search w100" value="검색" onclick="search()">
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
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="5%"> <%--번호--%>
                            <col width="10%"> <%--고객사--%>
                            <col width="10%"> <%--파트너사--%>
                            <col width="15%"> <%--서버명칭--%>
                            <col width="10%"> <%--관리번호--%>
                            <col width="15%"> <%--서버모델--%>
                            <col width="10%"> <%--모델명--%>
                            <col width="10%"> <%--입고일--%>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>고객사</th>
                            <th>파트너사</th>
                            <th>서버명칭</th>
                            <th>관리번호</th>
                            <th>서버모델</th>
                            <th>모델명</th>
                            <th>입고일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="6" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="delivery" items="${deliveryList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${delivery.idx})">
                                <td class="a_center">
                                        ${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}
                                </td>
                                <td class="a_center">${delivery.manageName}</td>
                                <td class="a_center">${delivery.partnerName}</td>
                                <td class="a_center">${delivery.serverName}</td>
                                <td class="a_center">${delivery.managementNumber}</td>
                                <td class="a-center">${delivery.modelName}</td>
                                <td class="a_center">${delivery.serverModelName}</td>
                                <td class="a_center">${delivery.formatedReceivingDate}</td>
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