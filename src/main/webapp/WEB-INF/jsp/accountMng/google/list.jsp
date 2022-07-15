<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">
    <script src="/resources/js/lang/accountMng/accountMng_lang.js"></script>
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_ACCOUNT_MNG_TITLE"><%--계정 관리--%></h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w100">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_ACCOUNT" value="accountId" ${paging.searchType == 'accountId' ? 'selected' : ''}><%--계정--%></option>
                                    <option class="trn" data-trn-key="TR_ACCOUNT_MNG_GOOGLE_GMAIL_ADDR" value="gmailAddr" ${paging.searchType == 'gmailAddr' ? 'selected' : ''}><%--Gmail 주소--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_NAME" value="name" ${paging.searchType == 'name' ? 'selected' : ''}><%--이름--%></option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${paging.searchText}" maxlength="100">
                            </div>
                        </div>

                        <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                        <div class="b-form-group__item">
                            <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                            <div class="inline-group">

                                <%--검색--%>
                                <input type="button" class="btn-base btn-search w100 trn" data-trn-value="TR_SEARCH" value="<%--검색--%>" onclick="search()">
                            </div>
                            <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                        </div>
                    </div>
                </form>
                <form id="pageForm">
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="searchType" value="${paging.searchType}">
                    <input type="hidden" name="searchText" value="${paging.searchText}">
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
                            <col width="5%">
                            <col width="10%">
                            <col width="15%">
                            <col width="15%">
                            <col width="15%">
                            <col width="10%">
                            <col width="5%">
                        </colgroup>

                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <th class="trn" data-trn-key="TR_COMMON_NAME"><%--이름--%></th>
                            <th class="trn" data-trn-key="TR_COMMON_ACCOUNT"><%--계정--%></th>
                            <th class="trn" data-trn-key="TR_ACCOUNT_MNG_GOOGLE_GMAIL_ADDR"><%--Gmail 주소--%></th>
                            <th>API Key</th>
                            <th class="trn" data-trn-key="TR_COMMON_REGDATE"><%--등록일--%></th>
                            <th class="trn" data-trn-key="TR_COMMON_IS_USE"><%--사용 여부--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="7" class="nodata trn" data-trn-key="TR_COMMON_NOTDATALIST"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="account" items="${accountList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${account.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td>
                                    <%--이름--%>
                                    ${account.name}
                                </td>
                                <td>
                                    <%--계정--%>
                                    ${account.accountId}
                                </td>
                                <td>
                                    <%--Gmail 주소--%>
                                    ${account.gmailAddr}
                                </td>
                                <td>
                                    <%--API Key--%>
                                    ${account.apiKey}
                                </td>
                                <td>
                                    <%--생성일--%>
                                    <fmt:formatDate value="${account.regDate}" pattern="yyyy-MM-dd"/>

                                </td>
                                <td>
                                    <%--사용여부--%>
                                    <c:choose>
                                        <c:when test="${account.useYn == true}">사용</c:when>
                                        <c:when test="${account.useYn == false}">미사용</c:when>
                                    </c:choose>
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

                <input type="button" class="trn btn-baseRound btn-add mt20 w80 trn" data-trn-value="TR_COMMON_REGISTRATION" value="<%--등록--%>" onclick="location.href='form'">

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>

</div><!--l-container-->
</body>
</html>