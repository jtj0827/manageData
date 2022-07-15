<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/holiday/holiday.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">메일서버 공휴일</h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label>검색 조건</label>

                            <div class="inline-group">
                                <select name="lang" class="default-input w100">
                                    <option value="">언어구분</option>
                                    <option value="ko" ${param.lang eq 'ko' ? 'selected' : ''}>한국어</option>
                                    <option value="en" ${param.lang eq 'en' ? 'selected' : ''}>영어</option>
                                    <option value="jp" ${param.lang eq 'jp' ? 'selected' : ''}>일본어</option>
                                    <option value="vn" ${param.lang eq 'vn' ? 'selected' : ''}>베트남어</option>
                                    <option value="cn" ${param.lang eq 'cn' ? 'selected' : ''}>중국어</option>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w100">
                                    <option value="">전체</option>
                                    <option value="holidayName" ${param.searchType eq 'holidayName' ? 'selected' : ''}>공휴일명</option>
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
                    <input type="hidden" name="lang" value="${param.lang}">
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
                    <input type="button" class="btn-baseRound trn" onclick="popupForm()" value="등록">
                    <input type="button" class="btn-baseRound fc-red" onclick='deleteAll()' value="삭제">
                </div>

                <div class="b-tableWrap">

                    <table class="b-listTable plus">
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="5%">
                            <col width="15%"><%--holidayDate--%>
                            <col width="*"><%--holidayName--%>
                            <col width="10%"><%--repeatYn--%>
                            <col width="10%"><%--lang--%>
                            <col width="10%"><%--regId--%>
                        </colgroup>
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="allChk" onchange="allCheck()"></th>
                            <th>공휴일<%--holidayDate--%></th>
                            <th>공휴일명<%--holidayName--%></th>
                            <th>반복여부<%--repeatYn--%></th>
                            <th>언어<%--lang--%></th>
                            <th>작성자<%--regId--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="6" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="holiday" items="${holidayList}" varStatus="status">
                            <tr>
                                <td class="a_center"><input type="checkbox" class="checkIdx" name="delIdx" value="${holiday.idx}"></td>
                                <td class="a_center"><fmt:formatDate value="${holiday.holidayDate}" pattern="yyyy-MM-dd"/></td>
                                <td class="a_center">${holiday.holidayName}</td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${holiday.repeatYn == true}">
                                            반복
                                        </c:when>
                                        <c:when test="${holiday.repeatYn == false}">
                                            미반복
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${holiday.lang eq 'ko'}">한국어</c:when>
                                        <c:when test="${holiday.lang eq 'en'}">영어</c:when>
                                        <c:when test="${holiday.lang eq 'jp'}">일본어</c:when>
                                        <c:when test="${holiday.lang eq 'vn'}">베트남어</c:when>
                                        <c:when test="${holiday.lang eq 'cn'}">중국어</c:when>
                                    </c:choose>
                                </td>
                                <td class="a_center">${holiday.regId}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../include/paging.jsp" %>
                </div>

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