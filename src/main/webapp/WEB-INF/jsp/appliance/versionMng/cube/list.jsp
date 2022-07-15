<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<script src="/resources/js/appliance/versionMng/list.js" type="text/babel"></script>
<script src="/resources/js/lang/appliance/appliance_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_APPLIANCE_TITLE2"><%--Cube Version 관리--%></h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>

                            <div class="inline-group">
                                <select name="customerIdx" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_APPLIANCE_CUSTOMER_NAME" value=""><%--업체명--%></option>
                                    <c:forEach var="customer" items="${customerList}">
                                        <option value="${customer.idx}" ${param.customerIdx eq customer.idx ? 'selected' : ''}>${customer.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <%--<div class="inline-group">
                                <select name="searchType" class="default-input w100">
                                    <option value="">전체</option>
                                    <option value="subject" ${param.searchType eq 'subject' ? 'selected' : ''}>제목</option>
                                    <option value="regId" ${param.searchType eq 'regId' ? 'selected' : ''}>작성자</option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${param.searchText}" maxlength="100">
                            </div>--%>
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
                        <input type="button" class="btn-baseRound fr trn" data-trn-valye="TR_APPLIANCE_NEW_VERSION_REGISTER" value="<%--최신버전 등록--%>" onclick="lastVersionPopup();">
                    </div>
                </form>

                <form id="pageForm">
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="customerIdx" value="${param.customerIdx}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_APPLIANCE_NEW_LATEST_VERSION_INFO"><%--최신버전 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable">
                    <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                    <colgroup>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>SC DET<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                        <th>SC MAIN<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                        <th>SC MANAGER<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                        <th>SCM SAND<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                        <th>SCM SAND RUN<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                        <th>SCM SAND SUB<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%-- LINE :: 최신버전 등록 안된경우 --%>
                    <c:if test="${lastVersionInfo == null}">
                        <tr>
                            <td colspan="6" class="nodata trn" data-trn-key="TR_APPLIANCE_NO_LATEST_VERSION_INFO"><%--최신버전이 등록되지 않았습니다.--%></td>
                        </tr>
                    </c:if>
                    <c:if test="${lastVersionInfo != null}">
                        <tr>
                            <td class="a_center">
                                <c:set var="scDet" value="${fn:split(lastVersionInfo.scDet, ',')}"/>
                                ${scDet[0]}<br>${scDet[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scMain" value="${fn:split(lastVersionInfo.scMain, ',')}"/>
                                ${scMain[0]}<br>${scMain[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scManager" value="${fn:split(lastVersionInfo.scManager, ',')}"/>
                                ${scManager[0]}<br>${scManager[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scmSand" value="${fn:split(lastVersionInfo.scmSand, ',')}"/>
                                ${scmSand[0]}<br>${scmSand[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scmSandRun" value="${fn:split(lastVersionInfo.scmSandRun, ',')}"/>
                                ${scmSandRun[0]}<br>${scmSandRun[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scmSandSub" value="${fn:split(lastVersionInfo.scmSandSub, ',')}"/>
                                ${scmSandSub[0]}<br>${scmSandSub[1]}
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </section>

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <fmt:formatNumber value="${totalCount}" pattern="#,###"/></span>
                    <input type="button" class="btn-baseRound trn" data-trn-value="TR_COMMON_REGISTRATION" value="<%--등록--%>" onclick="savePopup();">

                    <div class="b-list-top__right">
                        <%@ include file="../../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">

                    <table class="b-listTable">
                        <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                        <colgroup>
                        </colgroup>
                        <thead>
                        <tr>
                            <th data-trn-key="TR_APPLIANCE_CUSTOMER_NAME"><%--업체명--%></th>
                            <th>SC DET<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                            <th>SC MAIN<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                            <th>SC MANAGER<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                            <th>SCM SAND<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                            <th>SCM SAND RUN<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                            <th>SCM SAND SUB<br>(<span class="trn" data-trn-key="TR_FILE"><%--파일--%></span>/<span class="trn" data-trn-key="TR_OPERATION"><%--운영--%></span>)</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="7" class="nodata trn" data-trn-key="TR_COMMON_NODATA"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="version" items="${versionList}">
                            <tr class="pointer" onclick="savePopup(${version.idx})">
                                <td class="a_center">${version.customerName}</td>
                                <td class="a_center">
                                    <c:set var="scDet" value="${fn:split(version.scDet, ',')}"/>
                                    ${scDet[0]}<br>${scDet[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scMain" value="${fn:split(version.scMain, ',')}"/>
                                    ${scMain[0]}<br>${scMain[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scManager" value="${fn:split(version.scManager, ',')}"/>
                                    ${scManager[0]}<br>${scManager[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scmSand" value="${fn:split(version.scmSand, ',')}"/>
                                    ${scmSand[0]}<br>${scmSand[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scmSandRun" value="${fn:split(version.scmSandRun, ',')}"/>
                                    ${scmSandRun[0]}<br>${scmSandRun[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scmSandSub" value="${fn:split(version.scmSandSub, ',')}"/>
                                    ${scmSandSub[0]}<br>${scmSandSub[1]}
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

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>