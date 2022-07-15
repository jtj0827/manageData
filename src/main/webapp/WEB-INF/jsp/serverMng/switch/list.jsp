<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">스위치 장비 관리</h1>

    <div >
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="approvalState" value="${param.approvalState}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label>검색 조건</label>
                            <div class="inline-group">
                                <select name="ownerIdx" class="default-input w120">
                                    <option value="">선택</option>
                                    <c:forEach var="owner" items="${ownerList}">
                                        <option value="${owner.idx}" ${param.ownerIdx == owner.idx ? 'selected' : ''}>${owner.ownerName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="kindGubun" class="default-input w120">
                                    <option value="">네트워크 구분</option>
                                    <option value="I" ${param.kindGubun eq 'I' ? 'selected' : ''}>내부망</option>
                                    <option value="E" ${param.kindGubun eq 'E' ? 'selected' : ''}>외부망</option>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="useYn" class="default-input w120">
                                    <option value="">사용 여부</option>
                                    <option value="0" ${param.useYn eq '0' ? 'selected' : ''}>미사용</option>
                                    <option value="1" ${param.useYn eq '1' ? 'selected' : ''}>사용</option>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w120">
                                    <option value="">전체</option>
                                    <option value="name" ${param.searchType eq 'name' ? 'selected' : ''}>장비 이름</option>
                                    <option value="managementNumber" ${param.searchType eq 'managementNumber' ? 'selected' : ''}>관리번호</option>
                                    <option value="gubun" ${param.searchType eq 'gubun' ? 'selected' : ''}>장비 구분</option>
                                    <option value="rackNumber" ${param.searchType eq 'rackNumber' ? 'selected' : ''}>랙번호</option>
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
                    <input type="hidden" name="searchType" value="${param.searchType}">
                    <input type="hidden" name="searchText" value="${param.searchText}">
                    <input type="hidden" name="kindGubun" value="${param.kindGubun}">
                    <input type="hidden" name="useYn" value="${param.useYn}">
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
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="5%">
                            <col width="10%">
                            <col width="15%"><%--name--%>
                            <col width="15%"><%--managementNumber--%>
                            <col width="10%"><%--gubun--%>
                            <col width="10%"><%--rackNumber--%>
                            <col width="10%"><%--useYn--%>
                            <col width="10%"><%--kindGubun--%>
                            <col width="10%"><%--regId--%>
                            <col width="10%"><%--regDate--%>
                            <col width="10%"><%--사용 장비 수--%>
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="a-center">번호</th>
                            <th class="a-center">소유자<%--ownerName--%></th>
                            <th class="a-center">장비 이름<%--name--%></th>
                            <th class="a-center">관리번호<%--managementNumber--%></th>
                            <th class="a-center">랙번호<%--gubun--%></th>
                            <th class="a-center">장비 구분<%--gubun--%></th>
                            <th class="a-center">사용여부<%--useYn--%></th>
                            <th class="a-center">네트워크 구분<%--kindGubun--%></th>
                            <th class="a-center">등록자<%--regId--%></th>
                            <th class="a-center">등록일<%--regDate--%></th>
                            <th class="a-center">사용 장비수<%--사용 장비 수--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="8" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="switchEqip" items="${switchEqipList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${switchEqip.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a-center">${switchEqip.ownerName}<%--name--%></td>
                                <td class="a-center">${switchEqip.name}<%--name--%></td>
                                <td class="a-center">${switchEqip.managementNumber}<%--managementNumber--%></td>
                                <td class="a-center">
                                        <%--rackNumber--%>
                                    <c:if test="${switchEqip.rackNumber != null}">
                                        ${switchEqip.rackNum} / ${switchEqip.subRackNumber}
                                    </c:if>
                                    <c:if test="${switchEqip.rackNumber == null}">
                                        -
                                    </c:if>
                                </td>
                                <td class="a-center">${switchEqip.gubun}<%--gubun--%></td>

                                <td class="a-center">
                                    <c:choose>
                                        <c:when test="${switchEqip.useYn == 1}">
                                            사용
                                        </c:when>
                                        <c:when test="${switchEqip.useYn == 0}">
                                            미사용
                                        </c:when>
                                    </c:choose>
                                    <%--useYn--%>
                                </td>
                                <td class="a-center">
                                    <c:choose>
                                        <c:when test="${switchEqip.kindGubun == 'I'}">
                                            내부망
                                        </c:when>
                                        <c:when test="${switchEqip.kindGubun == 'E'}">
                                            외부망
                                        </c:when>
                                        <c:when test="${switchEqip.kindGubun == 'N'}">
                                            미확정
                                        </c:when>
                                    </c:choose>
                                    <%--kindGubun--%>
                                </td>
                                <td class="a-center">
                                    ${switchEqip.regId}
                                    <%--regId--%>
                                </td>
                                <td class="a-center">
                                    ${switchEqip.formatedRegDate}
                                    <%--regDate--%>
                                </td>
                                <td class="a-center">
                                    <fmt:formatNumber value="${switchEqip.equipCount}" pattern="#,###"/>
                                    <%--regDate--%>
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

                <input type="button" class="trn btn-baseRound btn-add w80 mt10" value="등록" onclick="location.href='form'">

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>

</div><!--l-container-->
</body>
</html>