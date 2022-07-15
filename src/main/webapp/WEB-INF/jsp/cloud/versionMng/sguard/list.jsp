<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<script src="/resources/js/cloud/versionMng/list.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">S-Guard Version 관리</h1>


    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label>검색 조건</label>

                            <div class="inline-group">
                                <select name="companyIdx" class="default-input w120">
                                    <option value="">국가명</option>
                                    <c:forEach var="nation" items="${nationList}">
                                        <option value="${nation.code}" ${nation.code eq param.nationCode ? 'selected' : ''}>${nation.name}</option>
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
                    <input type="hidden" name="companyIdx" value="${param.companyIdx}">
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
                        <th>DAEMON<br>(파일/운영)</th>
                        <th>MAG<br>(파일/운영)</th>
                        <th>MTA<br>(파일/운영)</th>
                        <th>PARSER<br>(파일/운영)</th>
                        <th>SENDER<br>(파일/운영)</th>
                        <th>방화벽<br>(파일/운영)</th>
                        <th>SUB<br>(파일/운영)</th>
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
                                <c:set var="daemon" value="${fn:split(lastVersionInfo.daemon, ',')}" />
                                    ${daemon[0]}<br>${daemon[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="mag" value="${fn:split(lastVersionInfo.mag, ',')}" />
                                    ${mag[0]}<br>${mag[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="mta" value="${fn:split(lastVersionInfo.mta, ',')}" />
                                    ${mta[0]}<br>${mta[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="parser" value="${fn:split(lastVersionInfo.parser, ',')}" />
                                    ${parser[0]}<br>${parser[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="sender" value="${fn:split(lastVersionInfo.sender, ',')}" />
                                    ${sender[0]}<br>${sender[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="firewall" value="${fn:split(lastVersionInfo.firewall, ',')}" />
                                    ${firewall[0]}<br>${firewall[1]}
                            </td>
                            <td class="a_center">
                                <c:set var="sub" value="${fn:split(lastVersionInfo.sub, ',')}" />
                                    ${sub[0]}<br>${sub[1]}
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
                            <th>DAEMON<br>(파일/운영)</th>
                            <th>MAG<br>(파일/운영)</th>
                            <th>MTA<br>(파일/운영)</th>
                            <th>PARSER<br>(파일/운영)</th>
                            <th>SENDER<br>(파일/운영)</th>
                            <th>방화벽<br>(파일/운영)</th>
                            <th>SUB<br>(파일/운영)</th>
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
                                    <c:set var="daemon" value="${fn:split(version.daemon, ',')}" />
                                        ${daemon[0]}<br>${daemon[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="mag" value="${fn:split(version.mag, ',')}" />
                                        ${mag[0]}<br>${mag[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="mta" value="${fn:split(version.mta, ',')}" />
                                        ${mta[0]}<br>${mta[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="parser" value="${fn:split(version.parser, ',')}" />
                                        ${parser[0]}<br>${parser[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="sender" value="${fn:split(version.sender, ',')}" />
                                        ${sender[0]}<br>${sender[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="firewall" value="${fn:split(version.firewall, ',')}" />
                                        ${firewall[0]}<br>${firewall[1]}
                                </td>
                                <td class="a_center">
                                    <c:set var="sub" value="${fn:split(version.sub, ',')}" />
                                        ${sub[0]}<br>${sub[1]}
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