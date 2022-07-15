<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/info/list.js" type="text/babel"></script>
<script src="/resources/js/serverMng/stock/list.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">재고 관리</h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label>검색 조건</label>
                            <div class="inline-group">
                                <select name="state" class="default-input w110">
                                    <option value="">상태</option>
                                    <option value="stateTrue" ${param.state eq 'stateTrue' ? 'selected' : ''}>입고</option>
                                    <option value="stateFalse" ${param.state eq 'stateFalse' ? 'selected' : ''}>분출</option>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w110">
                                    <option value="">구분</option>
                                    <option value="uniqueNumber" ${param.searchType eq 'uniqueNumber' ? 'selected' : ''}>관리번호</option>
                                    <option value="stockUsage" ${param.searchType eq 'stockUsage' ? 'selected' : ''}>사용용도</option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="firstDepth" class="w110" onchange="getSubdDepthAjax(this)">
                                    <option value="">선택</option>
                                    <c:forEach var="firstStep" items="${firstDepth}">
                                        <option value="${firstStep.idx}" ${param.firstDepth eq firstStep.idx ? 'selected' : ''}>${firstStep.name}</option>
                                    </c:forEach>
                                </select>
                                <select name="secondDepth" class="w110" onchange="getSubdDepthAjax(this)">
                                    <option value="">선택</option>
                                    <c:forEach var="secondStep" items="${secondDepth}">
                                        <option value="${secondStep.idx}" ${param.secondDepth eq secondStep.idx ? 'selected' : ''}>${secondStep.name}</option>
                                    </c:forEach>
                                </select>
                                <select name="thirdDepth" class="w110">
                                    <option value="">선택</option>
                                    <c:forEach var="thirdStep" items="${thirdDepth}">
                                        <option value="${thirdStep.idx}" ${param.thirdDepth eq thirdStep.idx ? 'selected' : ''}>${thirdStep.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="inline-group">
                                <input type="text" class="default-input w190" name="searchText"
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
                    <input type="hidden" name="state" value="${param.state}">
                    <input type="hidden" id="firstDepth" name="firstDepth" value="${param.firstDepth}">
                    <input type="hidden" id="secondDepth" name="secondDepth" value="${param.secondDepth}">
                    <input type="hidden" name="thirdDepth" value="${param.thirdDepth}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <fmt:formatNumber value="${totalCount}"
                                                                              pattern="#,###"/></span>
                    <div class="b-list-top__right">
                        <%@ include file="../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">

                    <table class="b-listTable plus">
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="5%">
                            <col width="20%">
                            <col width="10%">
                            <col width="10%">
                            <col width="30%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>관리번호</th>
                            <th>사용 용도</th>
                            <th>상태</th>
                            <th>코드</th>
                            <th>수량</th>
                            <th>입고일</th>
                            <th>등록자</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="8" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="serverStock" items="${serverStock}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${serverStock.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">${serverStock.uniqueNumber}</td>
                                <td class="a_center">${serverStock.stockUsage}</td>
                                <td class="a_center">
                                    <c:if test="${serverStock.state eq 'stock'}">
                                        재고
                                    </c:if>
                                    <c:if test="${serverStock.state eq 'eruption'}">
                                        사용중
                                    </c:if>
                                </td>
                                <td class="a_center">${serverStock.firstDepth} ${serverStock.secondDepth} ${serverStock.thirdDepth}</td>
                                <td class="a_center">${serverStock.volume}</td>
                                <td class="a_center">${serverStock.formatedReceivingDate}</td>
                                <td class="a_center">${serverStock.regName}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../include/paging.jsp" %>
                </div>

                <input type="button" class="trn btn-baseRound btn-add mt20 w80" value="분출 현황"
                       onclick="location.href='/serverMng/eruption/list'">
                <input type="button" class="trn btn-baseRound btn-add mt20 w80" value="등록"
                       onclick="location.href='form'">
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