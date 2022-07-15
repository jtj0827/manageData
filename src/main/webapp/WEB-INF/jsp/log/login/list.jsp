<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp"%>
<script src="/resources/js/log/login/list.js" type="text/babel"></script>

<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">LOGIN LOG</h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE">로그인 결과</label>

                            <div class="inline-group checkbox-group multi fixedW">

                                <label>
                                    <input type="checkbox" name="codeArray" value="S" ${paging.codeCheck("S") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_A">성공</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="codeArray" value="I" ${paging.codeCheck("I") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_T">실패(IP차단)</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="codeArray" value="P" ${paging.codeCheck("P") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_C">실패(비밀번호 불일치)</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="codeArray" value="N" ${paging.codeCheck("N") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_H">실패(존재하지 않는 계정)</span>
                                </label>

                            </div><!--inline-group-->
                        </div>

                        <div class="b-form-group">
                            <!--b-form-group__item-->

                            <div class="b-form-group__item">
                                <label class="trn" data-trn-key="TR_FILTER_RECV_ALLOW_CONTENTS">기간</label>

                                <div class="inline-group">
                                    <input type="text" class="default-input w140 calendar" name="searchStartDate" value="${paging.formatedSearchStartDate}" readonly>
                                </div><!--inlinesearchForm-group-->
                                ~
                                <div class="inline-group">
                                    <input type="text" class="default-input w140 calendar" name="searchEndDate" value="${paging.formatedSearchEndDate}" readonly>
                                </div><!--inlinesearchForm-group-->

                                <div class="b-form-group__item ml20 mt7">
                                    <div class="inline-group">

                                        <input type="button" value="검색" onclick="search()" class="btn-base btn-search w100 trn" data-trn-value="TR_SEARCH" data-trn-key="">
                                    </div><!--inline-group-->

                                </div><!--b-form-group__item-->

                            </div><!--b-form-group__item-->

                        </div>

                    </div>
                </form>
                <form id="pageForm">
                    <input type="hidden" name="pageNo" value="${paging.pageNo}">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="searchStartDate" value="${paging.formatedSearchStartDate}">
                    <input type="hidden" name="searchEndDate" value="${paging.formatedSearchEndDate}">

                    <c:forEach var="codeArray" items="${paging.codeArray}">
                        <input type="hidden" name="codeArray" value="${codeArray}">
                    </c:forEach>
                </form>

            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <span id="totalCount"><fmt:formatNumber value="${totalCount}" pattern="#,###"/></span></span>
                    <div class="b-list-top__right"><%@ include file="../../include/pageSize.jsp" %></div>

                </div>

                <div class="b-tableWrap">
                    <table class="b-listTable">
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="5%"/>
                            <col width="20%"/>
                            <col width="20%"/>
                            <col width="20%"/>
                            <col width="20%"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>로그인 시도 ID</th>
                            <th>로그인 시도 IP</th>
                            <th>로그인 결과</th>
                            <th>등록일</th>
                        </tr>
                        </thead>
                        <tbody id="tableBody">
                        <c:if test="${totalCount eq 0}">
                            <tr>
                                <td class="a-center" colspan="5">조회되는 데이터가 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:if test="${totalCount ne 0}">
                            <c:forEach items="${logList}" var="log" varStatus="status">
                                <tr>
                                    <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                    <td class="a-center">${log.attemptId}</td>
                                    <td class="a-center">${log.ip}</td>
                                    <td class="a-center">
                                        <c:choose>
                                            <c:when test="${log.loginCode == 'S'}">
                                                로그인 성공
                                            </c:when>
                                            <c:when test="${log.loginCode == 'P'}">
                                                비밀번호 불일치
                                            </c:when>
                                            <c:when test="${log.loginCode == 'I'}">
                                                허용되지 않은 IP
                                            </c:when>
                                            <c:when test="${log.loginCode == 'N'}">
                                                존재하지 않는 계정정보
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td class="a-center">${log.formatedRegDate}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div id="pagingDiv">
                    <%@ include file="../../include/paging.jsp" %>
                </div>

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>