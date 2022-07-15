<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">IDC 랙 관리</h1>

<%--    <div class="l-maxwrap">--%>
    <div>
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label>검색 조건</label>
                            <div class="inline-group">
                                <select name="manageGubun" class="default-input w120">
                                    <option value="">관리 부서</option>
                                    <option value="E" ${serverRack.manageGubun eq 'E' ? 'selected' : ''}>EG-Platform 팀</option>
                                    <option value="S" ${serverRack.manageGubun eq 'S' ? 'selected' : ''}>Secu E Cloud 팀</option>
                                    <option value="O" ${serverRack.manageGubun eq 'O' ? 'selected' : ''}>운영팀</option>
                                    <option value="R" ${serverRack.manageGubun eq 'R' ? 'selected' : ''}>기타</option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="idcIdx" class="default-input w120">
                                    <option value="">IDC 위치</option>
                                    <c:forEach var="IdcCountry" items="${IdcCountry}">
                                        <option value="${IdcCountry.idx}" ${IdcCountry.idx eq serverRack.idcIdx ? 'selected' : ''}>${IdcCountry.idcAddress}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="useGubunCode" class="default-input w120">
                                    <option value="">용도</option>
                                    <c:forEach var="code" items="${useGubunList}">
                                        <c:if test="${code.code ne 'SU0001'}">
                                            <%--리스트 데이터에 납품정보가 빠짐에 따른 조건--%>
                                            <option value="${code.code}" ${param.useGubunCode eq code.code ? 'selected' : ''}>${code.codeExp}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="ownerIdx" class="default-input w120">
                                    <option value="">소유자</option>
                                    <c:forEach var="owner" items="${ownerList}">
                                        <option value="${owner.idx}" ${param.ownerIdx == owner.idx ? 'selected' : ''}>${owner.ownerName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w120">
                                    <option value="">전체</option>
                                    <option value="uniqueNumber" ${param.searchType eq 'uniqueNumber' ? 'selected' : ''}>관리번호</option>
                                    <option value="serverName" ${param.searchType eq 'serverName' ? 'selected' : ''}>서버명칭</option>
                                    <option value="rackNumber" ${param.searchType eq 'rackNumber' ? 'selected' : ''}>렉번호</option>
                                    <option value="ip" ${param.searchType eq 'ip' ? 'selected' : ''}>IP</option>
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
                    <input type="hidden" name="sortBy" value="${param.sortBy}">
                    <input type="hidden" name="idcIdx" value="${param.idcIdx}">
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="useGubunCode" value="${param.useGubunCode}">
                    <input type="hidden" name="searchType" value="${param.searchType}">
                    <input type="hidden" name="searchText" value="${param.searchText}">
                    <input type="hidden" name="manageGubun" value="${param.manageGubun}">
                    <input type="hidden" name="ownerIdx" value="${param.ownerIdx}">
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
                            <col width="8%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="15%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">

                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th class="pointer hoverline ${param.sortBy == 'manageGubun' ? 'fc-blue' : ''}" onclick="sortByChange('manageGubun')">관리 부서</th>
                            <th class="pointer hoverline ${param.sortBy == 'owner' ? 'fc-blue' : ''}" onclick="sortByChange('owner')">소유자</th>
                            <th class="pointer hoverline ${param.sortBy == 'inspectionDate' ? 'fc-blue' : ''}" onclick="sortByChange('inspectionDate')">점검일</th>
                            <th class="pointer hoverline ${param.sortBy == 'inspectioner' ? 'fc-blue' : ''}" onclick="sortByChange('inspectioner')">점검자</th>
                            <th class="pointer hoverline ${param.sortBy == 'installLocation' ? 'fc-blue' : ''}" onclick="sortByChange('installLocation')">IDC위치</th>
                            <th class="pointer hoverline ${param.sortBy == 'rackNum' ? 'fc-blue' : ''}" onclick="sortByChange('rackNum')">RACK번호</th>
                            <th class="pointer hoverline ${param.sortBy == 'assignmentIp' ? 'fc-blue' : ''}" onclick="sortByChange('assignmentIp')">배정IP</th>
                            <th class="pointer hoverline ${param.sortBy == 'managementNumber' ? 'fc-blue' : ''}" onclick="sortByChange('managementNumber')">관리번호</th>
                            <th class="pointer hoverline ${param.sortBy == 'serverName' ? 'fc-blue' : ''}" onclick="sortByChange('serverName')">서버명칭</th>
                            <th class="pointer hoverline ${param.sortBy == 'useGubunCode' ? 'fc-blue' : ''}" onclick="sortByChange('useGubunCode')">용도</th>
                            <th class="pointer hoverline ${param.sortBy == 'useWhether' ? 'fc-blue' : ''}" onclick="sortByChange('useWhether')">사용여부</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="11" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="serverRack" items="${rackList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${serverRack.idx})">
                                <td class="a_center ">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${serverRack.manageGubun eq 'E'}">
                                            EG-Platform 팀
                                        </c:when>
                                        <c:when test="${serverRack.manageGubun eq 'S'}">
                                            Secu E Cloud 팀
                                        </c:when>
                                        <c:when test="${serverRack.manageGubun eq 'O'}">
                                            운영팀
                                        </c:when>
                                        <c:when test="${serverRack.manageGubun eq 'R'}">
                                            기타
                                        </c:when>
                                        <c:otherwise>
                                            -
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="a_center">
                                    ${serverRack.ownerName}
                                    <c:if test="${serverRack.ownerName == null}">-</c:if>
                                </td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${serverRack.inspectionDate != null}">
                                            ${serverRack.inspectionDate}
                                        </c:when>
                                        <c:otherwise>
                                            -
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${serverRack.inspectioner != null}">
                                            ${serverRack.inspectioner}
                                        </c:when>
                                        <c:otherwise>
                                            -
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="a_center">${serverRack.installLocation}</td>
                                <td class="a_center">${serverRack.rackNum}/${serverRack.subRackNumber}</td>
                                <td class="a_center">
                                        ${serverRack.assignmentIp}
                                    <c:if test="${serverRack.assignmentIp == null}">
                                        선택된IP가 없습니다
                                    </c:if>
                                </td>
                                <td class="a_center">
                                    <c:if test="${serverRack.managementNumber != null}">
                                        ${serverRack.managementNumber}
                                    </c:if>
                                    <c:if test="${serverRack.managementNumber == null}">
                                        할당된 서버가 없습니다.
                                    </c:if>
                                </td>
                                <td class="a_center">
                                    <c:if test="${serverRack.serverName == null}">
                                        할당된 서버가 없습니다.
                                    </c:if>
                                    <c:if test="${serverRack.serverName != null}">
                                        ${serverRack.serverName}
                                    </c:if>
                                </td>
                                <td class="a_center">
                                    <c:forEach items="${useGubunList}" var="code">
                                        <c:if test="${code.code eq serverRack.useGubunCode}">
                                            ${code.codeExp}
                                        </c:if>
                                    </c:forEach>
                                    /
                                    <c:if test="${serverRack.useGubunCode eq 'SU0008' || serverRack.useGubunCode eq 'SU0004' || serverRack.useGubunCode eq 'SU0010' || serverRack.useGubunCode eq 'SU0011'}">
                                        ${serverRack.useGubunCodeEtc}</c:if>
                                    <c:if test="${serverRack.useGubunCode != 'SU0008' && serverRack.useGubunCode != 'SU0004'}">

                                        <c:choose>
                                            <c:when test="${serverRack.serverGubun == 'RG'}"> ReceiveGUARD</c:when>
                                            <c:when test="${serverRack.serverGubun == 'SG'}"> Send&SpamGUARD</c:when>
                                            <c:when test="${serverRack.serverGubun == 'SD'}"> SendGUARD</c:when>
                                            <c:when test="${serverRack.serverGubun == 'RC'}"> Cube</c:when>
                                            <c:when test="${serverRack.serverGubun == 'SP'}"> SpamGUARD</c:when>
                                            <c:when test="${serverRack.serverGubun == 'EC'}"> Secu E Cloud</c:when>
                                            <c:when test="${serverRack.serverGubun == 'SM'}"> SecuMail</c:when>
                                            <c:when test="${serverRack.serverGubun == 'EG'}"> EML Generator</c:when>
                                            <c:when test="${serverRack.serverGubun == 'IG'}"> 통합</c:when>
                                        </c:choose>
                                    </c:if>
                                </td>
                                <td class="a-center">
                                    <c:if test="${serverRack.useWhether == 1}">사용</c:if>
                                    <c:if test="${serverRack.useWhether == 0}">미사용</c:if>
                                    <c:if test="${serverRack.useWhether == 3}">중지</c:if>
                                    <c:if test="${serverRack.useWhether == 4}">대기</c:if>
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

                <input type="button" class="trn btn-baseRound btn-add mt20 w80" value="등록" onclick="location.href='form'">

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>