<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">
    <script src="/resources/js/lang/serverMng/test_lang.js" type="text/babel"></script>
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">V-Server</h1>

<%--    <div class="l-maxwrap">--%>
    <div>
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label>검색 조건</label>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w100">
                                    <option value="">전체</option>
                                    <option value="ip" ${param.searchType eq 'ip' ? 'selected' : ''}>서버 아이피</option>
                                    <option value="regId" ${param.searchType eq 'regId' ? 'selected' : ''}>작성자</option>
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
                    <input type="hidden" name="pageNo" value="${paging.pageNo}">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
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
                            <col width="5%">
                            <col width="20%">
                            <col width="20%">
                            <col width="20%">
                            <col width="15%">
                            <col width="20%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>서버구분</th>
                            <th>서버 아이피</th>
                            <th>서버 도메인</th>
                            <th>사용여부</th>
                            <th>작성일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="9" class="a_center">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="server" items="${serverList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${server.idx})">
                                <td class="a_center">
                                        ${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}
                                </td>
                                <td class="a_center">
                                    <c:if test="${server.gubun == 'RG'}">
                                        ReceiveGUARD
                                    </c:if>
                                    <c:if test="${server.gubun == 'SG'}">
                                        Send&SpamGUARD
                                    </c:if>
                                    <c:if test="${server.gubun == 'SP'}">
                                        SpamGUARD
                                    </c:if>
                                    <c:if test="${server.gubun == 'SD'}">
                                        SendGUARD
                                    </c:if>
                                    <c:if test="${server.gubun == 'SM'}">
                                        SecuMail
                                    </c:if>
                                </td><%-- 서버구분 --%>
                                <td class="a_center">${server.ip}</td><%-- 서버아이피 --%>
                                <td class="a_center">${server.domain}</td><%-- 서버 도메인 --%>
                                <td class="a_center">
                                    <c:if test="${server.useYn == true}">
                                        사용
                                    </c:if>
                                    <c:if test="${server.useYn == false}">
                                        사용 안함
                                    </c:if>
                                </td><%-- 사용여부 --%>
                                <td class="a_center">
                                    <fmt:formatDate value="${server.regDate}" pattern="yyyy-MM-dd"/></td><%-- 작성일 --%>
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