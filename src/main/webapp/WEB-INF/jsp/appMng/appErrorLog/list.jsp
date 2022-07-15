<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<script src="/resources/js/lang/appmng/appmng_lang.js"></script>
<script src="/resources/js/appMng/appErrorLog/list.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_APPMNG_TITLE1"><%--에러로그--%></h1>

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
                                    <option value="mailServer" class="trn" data-trn-key="TR_APPMNG_MAIL_SERVER" ${paging.searchType == 'mailServer' ? 'selected' : ''}><%--메일서버--%></option>
                                    <option value="customerName" class="trn" data-trn-key="TR_APPMNG_CUSTOMER_NAME" ${paging.searchType == 'customerName' ? 'selected' : ''}><%--고객사 명--%></option>
                                    <option value="appVersion" class="trn" data-trn-key="TR_APPMNG_APP_VERSION" ${paging.searchType == 'appVersion' ? 'selected' : ''}><%--버전--%></option>
                                    <option value="mobileName" class="trn" data-trn-key="TR_APPMNG_MOBILE_NAME" ${paging.searchType == 'mobileName' ? 'selected' : ''}><%--기기명--%></option>
                                    <option value="mobileVersion" class="trn" data-trn-k-ey="TR_APPMNG_MOBILE_VERSION" ${paging.searchType == 'mobileVersion' ? 'selected' : ''}><%--기기버전--%></option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${paging.searchText}" maxlength="100">
                            </div>
                        </div>

                        <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                        <div class="b-form-group__item">
                            <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                            <div class="inline-group">

                                <%--검색--%>
                                <input type="button" class="btn-base btn-search w100 trn" data-trn-value="TR_SEARCH" value="" onclick="search()"><%--검색--%>
                            </div>
                            <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                        </div>
                    </div>
                </form>
                <form id="pageForm">
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="serachCategory" value="${paging.serachCategory}">
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
                            <col width="10%">       <%--고객사 명--%>
                            <col width="10%">       <%--메일서버--%>
                            <col width="*">         <%--로그--%>
                            <col width="10%">       <%--앱버전--%>
                            <col width="10%">       <%--기기명--%>
                            <col width="10%">       <%--기기버전--%>
                        </colgroup>

                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <th class="trn" data-trn-key="TR_APPMNG_CUSTOMER_NAME"><%--고객사 명--%></th>
                            <th class="trn" data-trn-key="TR_APPMNG_MAIL_SERVER"><%--메일서버--%></th>
                            <th class="trn" data-trn-key="TR_APPMNG_LOG"><%--로그--%></th>
                            <th class="trn" data-trn-key="TR_APPMNG_APP_VERSION"><%--앱버전--%></th>
                            <th class="trn" data-trn-key="TR_APPMNG_MOBILE_NAME"><%--기기명--%></th>
                            <th class="trn" data-trn-key="TR_APPMNG_MOBILE_VERSION"><%--모바일 버전--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="7" class="nodata trn" data-trn-key="TR_COMMON_NODATA"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="log" items="${list}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${log.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">
                                    <%--고객사 명--%>
                                    ${log.customerName}
                                </td>
                                <td class="a_center">
                                    <%--메일서버--%>
                                    ${log.mailServer}
                                </td>
                                <td class="a_center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
                                    <%--로그--%>
                                    ${log.errFunc}
                                </td>
                                <td class="a_center">
                                    <%--앱버전--%>
                                    ${log.appVersion}
                                </td>
                                <td class="a_center">
                                    <%--기기명--%>
                                    ${log.mobileName}
                                </td>
                                <td class="a_center">
                                    <%--기기버전--%>
                                    ${log.mobileVersion}
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

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>

</div><!--l-container-->
</body>
</html>