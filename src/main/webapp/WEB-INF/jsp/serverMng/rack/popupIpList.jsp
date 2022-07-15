<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header_popup.jsp" %>
<script src="/resources/js/serverMng/rack/popup.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
    <p class="pop_title">사용 가능한 IP 조회</p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
                <div class="b-listSearchForm">
                    <div class="b-listSearchForm__inner">
                        <form id="searchForm">
                            <input type="hidden" name="pageSize" value="${paging.pageSize}">
                            <input type="hidden" name="idcIdx" value="${paging.idcIdx}">
                            <div class="b-form-group">
                                <div class="b-form-group__item">
                                    <label>검색 조건</label>

                                    <div class="inline-group">
                                        <select name="searchType" class="default-input w100">
                                            <option value="">검색 조건</option>
                                            <option value="assignmentIp">IP</option>
                                            <option value="networkAddress">네트워크 주소</option>
                                        </select>
                                    </div>

                                    <div class="inline-group">
                                        <input type="text" class="default-input w200" name="searchText" value="${paging.searchText}" maxlength="100">
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
                            <input type="hidden" name="searchType" value="${paging.searchType}">
                            <input type="hidden" name="searchText" value="${paging.searchText}">
                        </form>
                    </div><!--b-listSearchForm__inner-->

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
                    </colgroup>
                    <thead>
                    <tr class="b-pop">
                        <th>번호</th>
                        <th>IDC 위치</th>
                        <th>네트워크 주소</th>
                        <th>IP</th>
                    </tr>
                    </thead>
                    <tbody class="text-center">
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="4" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="serverIp" items="${ipList}" varStatus="status">
                            <tr class="pointer" onclick="selectIpAJAX(${serverIp.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">
                                    ${serverIp.idcAddress}
                                </td>
                                <td class="a_center">
                                    ${serverIp.networkAddress}
                                </td>
                                <td class="a_center">
                                    <span class="dis_b">${serverIp.assignmentIp}</span>
                                </td>
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