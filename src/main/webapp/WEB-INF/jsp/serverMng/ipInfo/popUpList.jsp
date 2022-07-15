<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header_popup.jsp" %>

<script src="/resources/js/serverMng/ipInfo/list.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
    <p class="pop_title">사용중인 IP 조회</p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
                <div class="b-listSearchForm">
                    <div class="b-listSearchForm__inner">

                        <form id="searchForm">
                            <input type="hidden" name="pageSize" value="${paging.pageSize}">
                            <div class="b-form-group">
                                <div class="b-form-group__item mr0">
                                    <label>검색 조건</label>

                                    <div class="inline-group">
                                        <input type="text" class="default-input w300" name="searchText" value="${param.searchText}" maxlength="100">
                                        <input type="button" class="btn-base btn-search w70" value="검색" onclick="search()">
                                    </div>
                                </div>
                            </div>
                        </form>

                        <form id="pageForm">
                            <input type="hidden" name="pageNo">
                            <input type="hidden" name="pageSize" value="${paging.pageSize}">
                            <input type="hidden" name="searchText" value="${param.searchText}">
                        </form>

                    </div>
                </div>
        </div>
    </div>

    <div class="l-content" style="padding: 20px;">
        <div class="b-tableWrap">
            <div class="b-tableWrap">
                <table class="b-listTable">
                    <colgroup>
                        <col width="10%">
                        <col width="13%">
                        <col width="30%">
                        <col width="*">
                        <col width="20%">
                    </colgroup>
                    <thead>
                    <tr class="b-pop">
                        <th>번호</th>
                        <th>IDC 위치</th>
                        <th>네트워크 주소</th>
                        <th>IP</th>
                        <th>등록자</th>
                    </tr>
                    </thead>
                    <tbody class="text-center">
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="5" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="serverInfo" items="${serverList}" varStatus="status">
                            <tr>
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">
                                    ${serverInfo.idc_address}
                                </td>
                                <td class="a_center">
                                    ${serverInfo.network_address}
                                </td>
                                <td class="a_center">
                                    <span class="dis_b">${serverInfo.assignment_ip}</span>
                                </td>
                                <td class="a_center">${serverInfo.NAME}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <%@ include file="../../include/paging.jsp" %>
            </div>
        </div>
    </div>
</body>
</html>