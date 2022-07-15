<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">계정 관리</h1>

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
                                    <option value="name" ${param.searchType eq 'name' ? 'selected' : ''}>업체</option>
                                    <option value="url" ${param.searchType eq 'url' ? 'selected' : ''}>웹 접속 URL</option>
                                    <option value="reg_id" ${param.searchType eq 'reg_id' ? 'selected' : ''}>등록자</option>
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
                            <col width="10%">
                            <col width="20%">
                            <col width="50%">
                            <col width="20%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>업체</th>
                            <th>웹 접속 URL</th>
                            <th>등록자</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="4" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="serverAccount" items="${accountList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${serverAccount.idx})">
                                <td class="a_center">${serverAccount.idx}</td>
                                <td class="a_center">${serverAccount.name}</td>
                                <td class="a_center">${serverAccount.webUrl}</td>
                                <td class="a_center">${serverAccount.regId}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../include/paging.jsp" %>
                </div>

                <input type="button" class="trn btn-baseRound btn-add mt20 w80" value="등록" onclick="location.href='form'">

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>