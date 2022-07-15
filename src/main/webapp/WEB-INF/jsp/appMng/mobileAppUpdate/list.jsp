<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<script src="/resources/js/appMng/mobileAppUpdate/list.js" type="text/babel"></script>
<script src="/resources/js/lang/appmng/appmng_lang.js"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_APPMNG_TITLE2"><%--버전관리--%></h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>
                            <div class="inline-group">
                                <select name="appEssential" class="default-input w140">
                                    <option value="" class="trn" data-trn-key="TR_APPMNG_APP_ESSENTIAL_UPDATE_YN"><%--필수 업데이트 여부--%></option>
                                    <option value="1" class="trn" data-trn-key="TR_APPMNG_APP_ESSENTIAL_UPDATE_Y" ${paging.appEssential eq '1' ? 'selected' : ''}><%--필수--%></option>
                                    <option value="0" class="trn" data-trn-key="TR_APPMNG_APP_ESSENTIAL_UPDATE_N" ${paging.appEssential eq '0' ? 'selected' : ''}><%--자율--%></option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="searchType" class="default-input w100">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <option class="trn" data-trn-key="TR_APPMNG_APP_VERSION" value="appVersion" ${paging.searchType == 'appVersion' ? 'selected' : ''}><%--버전--%></option>
                                    <option class="trn" data-trn-key="TR_APPMNG_APP_APP_EXPLAIN" value="appExplain" ${paging.searchType == 'appExplain' ? 'selected' : ''}><%--앱 설명--%></option>
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
                    <input type="hidden" name="appEssential" value="${paging.appEssential}">
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
                            <col width="15%">
                            <col width="*">
                            <col width="15%">
                        </colgroup>

                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <th class="trn" data-trn-key="TR_APPMNG_APP_VERSION"><%--앱 버전--%></th>
                            <th class="trn" data-trn-key="TR_APPMNG_APP_APP_EXPLAIN"><%--앱 설명--%></th>
                            <th class="trn" data-trn-key="TR_APPMNG_APP_ESSENTIAL_UPDATE_YN"><%--필수 업데이트 유무--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="4" class="nodata trn" data-trn-key="TR_COMMON_NOTDATALIST"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="version" items="${list}" varStatus="status">
                            <tr class="pointer" onclick="moveForm('${version.appVersion}')">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">
                                    ${version.appVersion}
                                </td>
                                <td class="a_center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
                                        ${version.appExplain}
                                </td>
                                <td class="a_center">
                                    <span class="trn" data-trn-key="TR_APPMNG_APP_ESSENTIAL_UPDATE_${version.appEssential ? 'Y' : 'N'}"><%--필수 or 자율--%></span>
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

                <input type="button" class="trn btn-baseRound btn-add mt20 w80" data-trn-key="TR_COMMON_REGISTRATION" value="" onclick="moveForm(0)"><%--등록--%>

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>

</div><!--l-container-->
</body>
</html>