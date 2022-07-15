<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<script src="/resources/js/appliance/versionMng/list.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">Secu-Mail Version 관리</h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label>검색 조건</label>

                            <div class="inline-group">
                                <select name="nationCode" class="default-input w120">
                                    <option value="">국가명</option>
                                    <c:forEach var="nationCode" items="${nationList}">
                                        <option value="${nationCode.code}" ${param.nationCode eq nationCode.code ? 'selected' : ''}>${nationCode.name}</option>
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
                                <input type="button" class="btn-base btn-search w100" value="검색" onclick="search()">
                            </div>
                            <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                        </div>
                        <input type="button" class="btn-baseRound fr" value="최신버전 등록" onclick="lastVersionPopup();">
                    </div>
                </form>

                <form id="pageForm">
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="nationCode" value="${param.nationCode}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">최신버전 정보</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable">
                    <caption class="offscreen">게시글 목록</caption>
                    <colgroup>
                        <col width="*%">
                        <col width="14%">
                        <col width="14%">
                        <col width="14%">
                        <col width="14%">
                        <col width="14%">
                        <col width="14%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>SCM MAIL<br>(파일/운영)</th>
                        <th>SCM MAIL PAR<br>(파일/운영)</th>
                        <th>SCM ARCHIVE<br>(파일/운영)</th>
                        <th>SCM MANAGER<br>(파일/운영)</th>
                        <th>SCM MAIL SUB<br>(파일/운영)</th>
                        <th>SCM UP SERVER<br>(파일/운영)</th>
                        <th>SCM UP Server SSL<br>(파일/운영)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%-- LINE :: 최신버전 등록 안된경우 --%>
                    <c:if test="${lastVersionInfo == null}">
                        <tr>
                            <td colspan="7" class="nodata">최신버전이 등록되지 않았습니다.</td>
                        </tr>
                    </c:if>
                    <c:if test="${lastVersionInfo != null}">
                        <tr>
                            <td class="a_center">
                                <c:set var="scmMail" value="${fn:split(lastVersionInfo.scmMail, ',')}"/>
                                ${scmMail[0]}<br>${scmMail[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scmMailPar" value="${fn:split(lastVersionInfo.scmMailPar, ',')}"/>
                                ${scmMailPar[0]}<br>${scmMailPar[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scmArchive" value="${fn:split(lastVersionInfo.scmArchive, ',')}"/>
                                ${scmArchive[0]}<br>${scmArchive[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scmManager" value="${fn:split(lastVersionInfo.scmManager, ',')}"/>
                                ${scmManager[0]}<br>${scmManager[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scmMailSub" value="${fn:split(lastVersionInfo.scmMailSub, ',')}"/>
                                ${scmMailSub[0]}<br>${scmMailSub[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scmUpServer" value="${fn:split(lastVersionInfo.scmUpServer, ',')}"/>
                                ${scmUpServer[0]}<br>${scmUpServer[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="scmUpServerSsl" value="${fn:split(lastVersionInfo.scmUpServerSsl, ',')}"/>
                                ${scmUpServerSsl[0]}<br>${scmUpServerSsl[1]}
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
                    <input type="button" class="btn-baseRound" value="등록" onclick="savePopup();">

                    <div class="b-list-top__right">
                        <%@ include file="../../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">

                    <table class="b-listTable">
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="12.5%">
                            <col width="12.5%">
                            <col width="12.5%">
                            <col width="12.5%">
                            <col width="12.5%">
                            <col width="12.5%">
                            <col width="12.5%">
                            <col width="12.5%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>국가명</th>
                            <th>SCM MAIL<br>(파일/운영)</th>
                            <th>SCM MAIL PAR<br>(파일/운영)</th>
                            <th>SCM ARCHIVE<br>(파일/운영)</th>
                            <th>SCM MANAGER<br>(파일/운영)</th>
                            <th>SCM MAIL SUB<br>(파일/운영)</th>
                            <th>SCM UP SERVER<br>(파일/운영)</th>
                            <th>SCM UP Server SSL<br>(파일/운영)</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="8" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="version" items="${versionList}">
                            <tr class="pointer" onclick="savePopup(${version.idx})">
                                <td class="a_center">${version.nationName}</td>
                                <td class="a_center">
                                    <c:set var="scmMail" value="${fn:split(version.scmMail, ',')}"/>
                                    ${scmMail[0]}<br>${scmMail[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scmMailPar" value="${fn:split(version.scmMailPar, ',')}"/>
                                    ${scmMailPar[0]}<br>${scmMailPar[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scmArchive" value="${fn:split(version.scmArchive, ',')}"/>
                                    ${scmArchive[0]}<br>${scmArchive[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scmManager" value="${fn:split(version.scmManager, ',')}"/>
                                    ${scmManager[0]}<br>${scmManager[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scmMailSub" value="${fn:split(version.scmMailSub, ',')}"/>
                                    ${scmMailSub[0]}<br>${scmMailSub[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scmUpServer" value="${fn:split(version.scmUpServer, ',')}"/>
                                    ${scmUpServer[0]}<br>${scmUpServer[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="scmUpServerSsl" value="${fn:split(version.scmUpServerSsl, ',')}"/>
                                    ${scmUpServerSsl[0]}<br>${scmUpServerSsl[1]}
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