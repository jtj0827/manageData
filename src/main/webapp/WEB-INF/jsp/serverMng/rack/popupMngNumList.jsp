<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header_popup.jsp" %>
<script src="/resources/js/serverMng/rack/popup.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
    <p class="pop_title">사용 가능한 관리번호 조회</p>
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
                                        <select name="useGubunCode" class="default-input w120">
                                            <option value="">용도</option>
                                            <c:forEach var="code" items="${useGubunList}">
                                                <option value="${code.code}" ${param.useGubunCode eq code.code ? 'selected' : ''}>${code.codeExp}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="inline-group">
                                        <select name="searchType" class="default-input w100">
                                            <option value="">전체</option>
                                            <option value="uniqueNumber" ${param.searchType eq 'uniqueNumber' ? 'selected' : ''}>관리번호</option>
                                            <option value="name" ${param.searchType eq 'name' ? 'selected' : ''}>서버명칭</option>
                                            <option value="cpu" ${param.searchType eq 'cpu' ? 'selected' : ''}>CPU</option>
                                            <option value="ram" ${param.searchType eq 'ram' ? 'selected' : ''}>RAM</option>
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
                            <input type="hidden" name="useGubunCode" value="${param.useGubunCode}">
                            <input type="hidden" name="searchType" value="${param.searchType}">
                            <input type="hidden" name="searchText" value="${param.searchText}">
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
                        <col width="6%">
                        <col width="20%">
                        <col width="20%">
                        <col width="15%">
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <thead>
                    <tr class="b-pop">
                        <th>번호</th>
                        <th>서버명칭</th>
                        <th>관리번호</th>
                        <th>용도</th>
                        <th>CPU</th>
                        <th>RAM</th>
                    </tr>
                    </thead>
                    <tbody class="text-center">
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="6" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="serverInfo" items="${serverList}" varStatus="status">
                            <tr class="pointer" onclick="selectMngNum(${serverInfo.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">
                                        ${serverInfo.name}
                                        <%-- LINE :: Secu E Cloud 서버인 경우 노출 --%>
                                    <c:if test="${serverInfo.secuEcloudYn}">
                                        <span class="dis_b">/</span>${serverInfo.mailServerName}
                                    </c:if>
                                </td>
                                <td class="a_center">${serverInfo.uniqueNumber}</td>
                                <td class="a-center">
                                    <c:if test="${serverInfo.useGubunCode != null}">
                                        <c:forEach var="code" items="${useGubunList}">
                                            <c:if test="${code.code eq serverInfo.useGubunCode}">
                                                <c:if test="${serverInfo.checkPastNow == true}">
                                                    (현재)${code.codeExp}
                                                </c:if>
                                                <c:if test="${serverInfo.checkPastNow == false}">
                                                    (과거)${code.codeExp}
                                                </c:if>
                                                <c:if test="${serverInfo.checkPastNow == null}">
                                                    ${code.codeExp}
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${serverInfo.useGubunCode == null}">선택되지 않았음</c:if>
                                </td>
                                <td class="a_center">${serverInfo.cpu}</td>
                                <td class="a_center">${serverInfo.ram}</td>
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