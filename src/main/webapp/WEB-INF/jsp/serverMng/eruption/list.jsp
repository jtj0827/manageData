<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/eruption/list.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">분출 현황</h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label>검색 조건</label>
                            <div class="inline-group">
                                <select name="useGubun" class="default-input w100">
                                    <option value="">전체</option>
                                    <option value="wearing" ${param.useGubun eq 'wearing' ? 'selected' : ''}>분출</option>
                                    <option value="release" ${param.useGubun eq 'release' ? 'selected' : ''}>재입고</option>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w100">
                                    <option value="">구분</option>
                                    <option value="erUniqueNumber" ${param.searchType eq 'erUniqueNumber' ? 'selected' : ''}>관리번호</option>
                                    <option value="erUsage" ${param.searchType eq 'erUsage' ? 'selected' : ''}>사용용도</option>
                                </select>
                            </div>

                            <div class="inline-group">
                                <input type="text" class="default-input w200" name="searchText"
                                       value="${param.searchText}" maxlength="100">
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
                    <input type="hidden" name="searchType" value="${param.searchType}">
                    <input type="hidden" name="searchText" value="${param.searchText}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <fmt:formatNumber value="${totalCount}" pattern="#,###"/></span>

                    <div class="b-list-top__right">
                        <%@ include file="../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">

                    <table class="b-listTable">
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="5%">
                            <col width="15%">
                            <col width="20%">
                            <col width="20%">
                            <col width="16%">
                            <col width="20%">
                            <col width="14%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>관리번호</th>
                            <th>사용 용도</th>
                            <th>사용 일자</th>
                            <th>사용 여부</th>
                            <th>재입고 처리</th>
                            <th>등록자</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="7" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="serverEruption" items="${serverEruption}" varStatus="status">
                        <tr class="pointer" onclick="moveView(${serverEruption.idx})">
                            <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                            <td class="a_center">${serverEruption.erUniqueNumber}</td>
                            <td class="a_center">${serverEruption.erUsage}</td>
                            <td class="a_center">${serverEruption.formatedReceivingDate}</td>
                            <td class="a_center">
                                <c:if test="${serverEruption.useGubun eq true}">
                                    분출중
                                </c:if>
                                <c:if test="${serverEruption.useGubun eq false}">
                                    재입고
                                </c:if>
                            </td>
                            <td class="a_center">
                                <c:if test="${serverEruption.useGubun eq true}">
                                <input type="button" onclick="onStateUpdate('${serverEruption.erUniqueNumber}')" class="btn-baseRound fwB" value="재입고 등록">
                                </c:if>
                                <c:if test="${serverEruption.useGubun eq false}">
                                    입고완료
                                </c:if>
                            </td>
                            <td class="a_center">${serverEruption.regName}</td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../include/paging.jsp" %>
                </div>

                <input type="button" class="trn btn-baseRound btn-add mt20 w80" value="재고 목록"
                       onclick="location.href='/serverMng/stock/list'">

            </div>
            <%--b-list--%>
        </div>
        <%--l-content--%>
    </div>
    <%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>