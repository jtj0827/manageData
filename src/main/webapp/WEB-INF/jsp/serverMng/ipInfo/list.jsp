<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/ipInfo/list.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">배정 IP 관리</h1>

    <div>
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" id="idx" name="idx" value=""/>
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <div class="inline-group mr10">
                                <label>IP or 대역</label>
                                <input type="text" class="default-input w120 ml10" id="ip" name="ip" maxlength="21">
                            </div>
                            <div class="inline-group mr10">
                                <label>IDC 위치</label>
                                <select name="idcAddress" id="idcAddress" class="wp50">
                                    <option value="">선택</option>
                                    <c:forEach var="idc" items="${serverIdc}">
                                        <option value="${idc.idcAddress}">${idc.idcAddress}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="inline-group mr10">
                                <label>사용 구분</label>
                                <select name="useGubun" id="useGubun" class="w100">
                                    <option value="K">기원테크</option>
                                    <c:forEach items="${ipUseGubun}" var="useGubun">
                                        <c:if test="${useGubun.code != 'K'}">
                                            <option value="${useGubun.code}">${useGubun.codeExp}</option>
                                        </c:if>
                                    </c:forEach>
<%--                                    <option value="K">기원테크</option>--%>
<%--                                    <option value="H">한국 사회복지사 협회</option>--%>
                                </select>
                            </div>
                            <div class="inline-group mr10">
                                <label>서브넷 마스크</label>
                                <input type="text" class="default-input w120 ml10" id="subnet" name="subnet" maxlength="20">
                            </div>
                            <div class="inline-group mr10">
                                <label>게이트 웨이</label>
                                <input type="text" class="default-input w120 ml10" id="gateway" name="gateway" maxlength="20">
                            </div>
                            <div class="inline-group mr10">
                                <label>사용 여부</label>
                                <select name="useYn" id="useYn" class="wp50">
                                    <option value="true">사용</option>
                                    <option value="false">미사용</option>
                                </select>
                            </div>
                            <input type="button" class="btn-base btn-add btn-large w80" value="등록" onclick="saveIP()" style="width: 80px; min-width: inherit; line-height: 30px; height: 30px;">
                        </div>
                    </div>
                    <div class="b-form-group">
                        <br>

                        <div class="b-form-group__item">
                            <label>검색 조건</label>
                            <div class="inline-group">
                                <select name="searchUseYn" class="default-input w120">
                                    <option value="">사용유무</option>
                                    <option value="true" ${param.searchUseYn == 'true' ? 'selected' : ''}>사용</option>
                                    <option value="false" ${param.searchUseYn == 'false' ? 'selected' : ''}>미사용</option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="searchHaveRack" class="default-input w120">
                                    <option value="">배정유무</option>
                                    <option value="rackhave" ${param.searchHaveRack eq 'rackhave' ? 'selected' : ''}>배정</option>
                                    <option value="racknone" ${param.searchHaveRack eq 'racknone' ? 'selected' : ''}>미배정</option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="searchType" class="default-input w120">
                                    <option value="">전체</option>
                                    <option value="ip" ${param.searchType eq 'ip' ? 'selected' : ''}>IP</option>
                                    <option value="subnet" ${param.searchType eq 'subnet' ? 'selected' : ''}>서브넷 마스크</option>
                                    <option value="gateway" ${param.searchType eq 'gateway' ? 'selected' : ''}>게이트 웨이</option>
                                    <option value="useGubun" ${param.searchType eq 'useGubun' ? 'selected' : ''}>사용구분</option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${param.searchText}" maxlength="100">
                            </div>
                        </div>

                        <div class="b-form-group__item">
                            <div class="inline-group">
                                <input type="button" class="btn-base btn-search w100" value="검색" onclick="search()">
                            </div>
                        </div>
                    </div>
                </form>

                <form id="pageForm">
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="searchType" value="${param.searchType}">
                    <input type="hidden" name="searchText" value="${param.searchText}">
                    <input type="hidden" name="searchHaveRack" value="${param.searchHaveRack}">
                    <input type="hidden" name="searchUseYn" value="${param.searchUseYn}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

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
                            <col width="5%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="5%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>배정IP</th>
                            <th>IP정보</th>
                            <th>랙 번호</th>
                            <th>IDC 위치</th>
                            <th>사용 구분</th>
                            <th>서브넷 마스크</th>
                            <th>게이트 웨이</th>
                            <th>사용유무</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="7" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="ipAllList" items="${ipAllList}" varStatus="status">
<%--                            <tr class="pointer" onclick="view(this, ${ipAllList.idx})">--%>
                            <tr>
                                <td class="a_center pointer" onclick="openPopupview(${ipAllList.idx})">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center pointer" onclick="openPopupview(${ipAllList.idx})">${ipAllList.assignmentIp}</td>
                                <td class="a_center pointer" onclick="openPopupview(${ipAllList.idx})">${ipAllList.ipInfo == null ? '-' : ipAllList.ipInfo}</td>
                                <td class="a_center pointer" onclick="openPopupview(${ipAllList.idx})">
                                    <c:if test="${ipAllList.rackIdx == null}">
                                        등록되지 않음
                                    </c:if>
                                    <c:if test="${ipAllList.rackIdx != null}">
                                        ${ipAllList.rackNumber}/${ipAllList.subRackNumber}
                                    </c:if>
                                </td>
                                <td class="a_center pointer" onclick="openPopupview(${ipAllList.idx})">${ipAllList.idcAddress}</td>
                                <td class="a_center pointer" onclick="openPopupview(${ipAllList.idx})">
                                    <input type="hidden" name="useGubun" value="${ipAllList.useGubun}">
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${ipAllList.useGubun == 'K'}">--%>
<%--                                            기원테크--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${ipAllList.useGubun == 'H'}">--%>
<%--                                            한국 사회복지사 협회--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
                                    ${ipAllList.useGubunExp}
                                </td>
                                <td class="a_center pointer" onclick="openPopupview(${ipAllList.idx})">${ipAllList.subnet}</td>
                                <td class="a_center pointer" onclick="openPopupview(${ipAllList.idx})">${ipAllList.gateway}</td>
<%--                                <td class="a_center"><fmt:formatDate value="${ipAllList.regDate}" pattern="yyyy-MM-dd"/></td>--%>
                                <td class="a-center">
                                    <select class="w100 useynselect" onchange="useYnChange(this, ${ipAllList.idx})">
                                        <option value="1" ${ipAllList.useYn ? "selected" : ""}>사용</option>
                                        <option value="0" ${!ipAllList.useYn ? "selected" : ""}>미사용</option>
                                    </select>
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

                <%--<input type="button" class="trn btn-baseRound btn-add mt20 w80" value="등록" onclick="location.href='form'">--%>

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>