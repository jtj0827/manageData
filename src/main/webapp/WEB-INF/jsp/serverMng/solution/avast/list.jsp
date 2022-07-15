<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>

<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">Avast 라이센스 관리</h1>

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
                                <select name="searchType" class="default-input w120">
                                    <option value="">전체</option>
                                    <option value="productName" ${param.searchType eq 'productName' ? 'selected' : ''}>제품명</option>
                                    <option value="activeCode" ${param.searchType eq 'activeCode' ? 'selected' : ''}>활성화 코드</option>
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
                        <%@ include file="../../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">

                    <table class="b-listTable plus">
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="5%"><%--번호--%>
                            <col width="15%"><%--제품명--%>
                            <col width="15%"><%--활성화 코드--%>
                            <col width="10%"><%--만료일자--%>
                            <col width="10%"><%--최대 사용장비수--%>
                            <col width="10%"><%--작성자--%>
                            <col width="15%"><%--등록일--%>

                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>제품명</th>
                            <th>활성화 코드</th>
                            <th>만료일자</th>
                            <th>사용장비수</th>
                            <th>작성자</th>
                            <th>등록일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="7" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="info" items="${licenseInfoList}" varStatus="status">
                            <tr class="pointer ${info.remainData == 0 ? 'red-line' : (info.remainData == 1 ? 'blue-line' : '')}" onclick="moveView(${info.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a-center">
                                    <%--제품명--%>
                                    ${info.productName}
                                </td>
                                <td class="a-center">
                                    <%--활성화 코드--%>
                                    ${info.activeCode}
                                </td>
                                <td class="a-center">
                                    <%--만료일자--%>
                                    ${info.formatedExpiryDate}
                                </td>
                                <td class="a-center">
                                    <%--최대 사용장비수--%>
                                    ${info.useEquipCount} / ${info.maxUseEquip}
                                </td>
                                <td class="a-center">
                                    <%--작성자--%>
                                    ${info.regId}
                                </td>
                                <td class="a-center">
                                    <%--등록일--%>
                                    ${info.formatedRegDate}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../../include/paging.jsp" %>
                </div>

                <input type="button" class="trn btn-baseRound btn-add mt20 w80" value="등록" onclick="location.href='form'">

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>