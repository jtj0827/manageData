<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/info/list.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">MAIL SERVER 버전 관리</h1>

<%--    <div class="l-maxwrap">--%>
    <div>
        <%--<div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label>검색 조건</label>


                            <div class="inline-group">
                                &lt;%&ndash;<select name="searchType" class="default-input w120">
                                    <option value="">전체</option>
                                    <option value="uniqueNumber" ${param.searchType eq 'managementNumber' ? 'selected' : ''}>관리번호</option>
                                    <option value="name" ${param.searchType eq 'name' ? 'selected' : ''}>서버명칭</option>
                                    <option value="ip" ${param.searchType eq 'ip' ? 'selected' : ''}>IP</option>
                                    <option value="cpu" ${param.searchType eq 'cpu' ? 'selected' : ''}>CPU</option>
                                    <option value="ram" ${param.searchType eq 'ram' ? 'selected' : ''}>RAM</option>
                                    <option value="uniqueNumber" ${param.searchType eq 'uniqueNumber' ? 'selected' : ''}>시리얼 번호</option>
                                </select>&ndash;%&gt;

                                <input type="text" class="default-input w200" name="searchText" value="${param.searchText}" maxlength="100">
                            </div>
                        </div>

                        <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                        <div class="b-form-group__item">
                            <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                            <div class="inline-group">

                                &lt;%&ndash;검색&ndash;%&gt;
                                <input type="button" class="btn-base btn-search w100" value="검색" onclick="search()">
                            </div>
                            <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                        </div>
                    </div>
                </form>


            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->--%>
        <form id="pageForm">
            <input type="hidden" name="pageNo">
            <input type="hidden" name="pageSize" value="${paging.pageSize}">
            <input type="hidden" name="searchType" value="${param.searchType}">
            <input type="hidden" name="searchText" value="${param.searchText}">
        </form>

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
                            <col width="5%"> <%--번호--%>
                            <col width="8%"><%--SCMMAIL--%>
                            <col width="8%"><%--서버명칭--%>
                            <col width="8%"><%--시리얼 번호--%>
                            <col width="8%"><%--SCMMAIL PAR--%>
                            <col width="8%"><%--SCMARCHIVE--%>
                            <col width="8%"><%--SCMMANAGER--%>
                            <col width="8%"><%--SCMMAILSUB--%>
                            <col width="8%"><%--SCMUPSERVER--%>
                            <col width="8%"><%--SCMUP SERVER SSL--%>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>서버명칭</th>
                            <th>시리얼 번호</th>
                            <th>SCMMAIL</th>
                            <th>SCMMAIL PAR</th>
                            <th>SCMARCHIVE</th>
                            <th>SCMMANAGER</th>
                            <th>SCMMAILSUB</th>
                            <th>SCMUPSERVER</th>
                            <th>SCMUP SERVER SSL</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="11" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="versionInfo" items="${infoList}" varStatus="status">
                            <tr class="pointer" onclick="moveServerView(${versionInfo.serverIdx})">
                                <td class="a_center">
                                    <%--번호--%>
                                    ${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}
                                </td>
                                <td class="a-center">
                                    <%--서버명칭--%>
                                    ${versionInfo.name}
                                </td>
                                <td class="a-center">
                                    <%--시리얼 번호--%>
                                    ${versionInfo.uniqueNumber}
                                </td>
                                <td class="a-center">
                                    <%--SCMMAIL--%>
                                    <span class="${versionInfo.scmmail != latestInfo.scmmail ? 'red-txt' : ''}">${versionInfo.scmmail}</span>
                                </td>
                                <td class="a-center">
                                    <%--SCMMAIL PAR--%>
                                    <span class="${versionInfo.scmmailPar != latestInfo.scmmail ? 'red-txt' : ''}">${versionInfo.scmmailPar}</span>
                                </td>
                                <td class="a-center">
                                    <%--SCMARCHIVE--%>
                                    <span class="${versionInfo.scmarchive != latestInfo.scmarchive ? 'red-txt' : ''}">${versionInfo.scmarchive}</span>
                                </td>
                                <td class="a-center">
                                    <%--SCMMANAGER--%>
                                    <span class="${versionInfo.scmmanager != latestInfo.scmmanager ? 'red-txt' : ''}">${versionInfo.scmmanager}</span>
                                </td>
                                <td class="a-center">
                                    <%--SCMMAILSUB--%>
                                    <span class="${versionInfo.scmmailsub != latestInfo.scmmailsub ? 'red-txt' : ''}">${versionInfo.scmmailsub}</span>
                                </td>
                                <td class="a-center">
                                    <%--SCMUPSERVER--%>
                                    <span class="${versionInfo.scmupserver != latestInfo.scmupserver ? 'red-txt' : ''}">${versionInfo.scmupserver}</span>
                                </td>
                                <td class="a-center">
                                    <%--SCMUP SERVER SSL--%>
                                    <span class="${versionInfo.scmupServerSsl != latestInfo.scmupServerSsl ? 'red-txt' : ''}">${versionInfo.scmupServerSsl}</span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

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