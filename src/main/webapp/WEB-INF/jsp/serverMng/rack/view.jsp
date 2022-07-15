<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/rack/view.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">IDC 랙 관리</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${serverRack.idx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">IDC 랙 관리</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">IDC RACK 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>IDC 위치</th>
                        <td>
                            ${serverRack.installLocation}
                        </td>
                        <th>RACK 위치</th>
                        <td>
                            ${serverRack.rackNum} / ${serverRack.subRackNumber}
                        </td>
                    </tr>
                    <tr>
                        <th>배정IP</th>
                        <td>
                            ${serverRack.assignmentIp}
                        </td>
                        <th>입고일</th>
                        <td>${serverRack.formatedReceivingDate}</td>
                    </tr>
                    <tr>
                        <th>관리 번호</th>
                        <td>
                            <span>${adminNum.uniqueNumber} / ${adminNum.name}</span>
                            <input type="button" class="type09 ml10" onclick="moveServerView(${adminNum.idx})" value="서버정보">
                        </td>
                        <th>등록자</th>
                        <td>${serverRack.regId}</td>
                    </tr>
                    <tr>
                        <th>외부망 Switch</th>
                        <td>${serverRack.externalSwitchName} : ${serverRack.externalSwitchPort}</td>
                        <th>외부망 Switch</th>
                        <td>${serverRack.subExternalSwitchName} : ${serverRack.subExternalSwitchPort}</td>
                    </tr>
                    <tr>
                        <th>내부망 Switch</th>
                        <td>${serverRack.internalSwitchName} : ${serverRack.internalSwitchPort}</td>
                        <th>내부망 Switch</th>
                        <td>${serverRack.subInternalSwitchName} : ${serverRack.subInternalSwitchPort}</td>
                    </tr>
                    <tr>
                        <th>점검일</th>
                        <c:choose>
                            <c:when test="${serverRack.inspectionDate != null}">
                                <td>
                                        ${serverRack.inspectionDate}
                                </td>
                                <th>점검자</th>
                                <td>${serverRack.inspectioner}</td>
                            </c:when>
                            <c:when test="${serverRack.inspectionDate == null}">
                                <td colspan="3">-</td>
                            </c:when>
                        </c:choose>
                    </tr>
                    <tr>
                        <th>상태</th>
                        <td>
                            <c:if test="${serverRack.useWhether == 1}">
                                사용
                            </c:if>
                            <c:if test="${serverRack.useWhether == 0}">
                                미사용
                            </c:if>
                            <c:if test="${serverRack.useWhether == 3}">중지</c:if>
                            <c:if test="${serverRack.useWhether == 4}">대기</c:if>
                        </td>
                        <th>관리 부서</th>
                        <td>
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
                    </tr>
                    <tr>
                        <th>비고</th>
                        <td colspan="3" style="white-space: pre-wrap;">${serverRack.memo}</td>
                    </tr>
<%--=================================================================================================================================================--%>
<%--                    <tr>--%>
<%--                        <th>IDC 위치</th>--%>
<%--                        <td>--%>
<%--                            ${serverRack.installLocation}--%>
<%--                        </td>--%>
<%--                        <th>RACK 번호</th>--%>
<%--                        <td>--%>
<%--                            ${serverRack.rackNum} / ${serverRack.subRackNumber}--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th>배정IP</th>--%>
<%--                        <td>--%>
<%--                            ${serverRack.assignmentIp}--%>
<%--                        </td>--%>
<%--                        <th>등록자</th>--%>
<%--                        <td>${serverRack.regId}</td>--%>
<%--                    </tr>--%>

<%--                    <tr>--%>
<%--                        <th>관리 번호</th>--%>
<%--                        <td colspan="3">--%>
<%--                            <span>${adminNum.uniqueNumber} / ${adminNum.name}</span>--%>
<%--                            <input type="button" class="type09 ml10" onclick="moveServerView(${adminNum.idx})" value="서버정보">--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th>용도</th>--%>
<%--                        <td>--%>
<%--                            <c:if test="${serverRack.useGubunCode eq '내부운영' || serverRack.useGubunCode eq '기타운영'}">${serverRack.useGubunCode} - ${serverRack.useGubunCodeEtc}</c:if>--%>
<%--                            <c:if test="${serverRack.useGubunCode != '내부운영' && serverRack.useGubunCode != '기타운영'}">--%>
<%--                                ${serverRack.useGubunCode} ---%>
<%--                                <c:if test="${serverRack.serverGubun eq 'RG'}">ReceiveGUARD</c:if>--%>
<%--                                <c:if test="${serverRack.serverGubun eq 'SG'}">Send&SpamGUARD</c:if>--%>
<%--                                <c:if test="${serverRack.serverGubun eq 'SD'}">SendGUARD</c:if>--%>
<%--                                <c:if test="${serverRack.serverGubun eq 'SP'}">SpamGUARD</c:if>--%>
<%--                                <c:if test="${serverRack.serverGubun eq 'RC'}">CUBE</c:if>--%>
<%--                                <c:if test="${serverRack.serverGubun eq 'SO'}">SPAMOUT</c:if>--%>
<%--                            </c:if>--%>
<%--                        </td>--%>
<%--                        <th>입고일</th>--%>
<%--                        <td>${serverRack.formatedReceivingDate}</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th>점검일</th>--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${serverRack.inspectionDate != null}">--%>
<%--                                <td>--%>
<%--                                    ${serverRack.inspectionDate}--%>
<%--                                </td>--%>
<%--                                <th>점검자</th>--%>
<%--                                <td>${serverRack.inspectioner}</td>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${serverRack.inspectionDate == null}">--%>
<%--                                <td colspan="3">-</td>--%>
<%--                            </c:when>--%>
<%--                        </c:choose>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th>메모</th>--%>
<%--                        <td colspan="3">--%>
<%--                            ${serverRack.memo}--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th>점검일</th>--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${serverRack.inspectionDate != null}">--%>
<%--                                <td>--%>
<%--                                    ${serverRack.inspectionDate}--%>
<%--                                </td>--%>
<%--                                <th>점검자</th>--%>
<%--                                <td>${serverRack.inspectioner}</td>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${serverRack.inspectionDate == null}">--%>
<%--                                <td colspan="3">-</td>--%>
<%--                            </c:when>--%>
<%--                        </c:choose>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th>사용 여부</th>--%>
<%--                        <td colspan="3">--%>
<%--                            <c:if test="${serverRack.useWhether == 1}">--%>
<%--                                사용--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${serverRack.useWhether == 0}">--%>
<%--                                미사용--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${serverRack.useWhether == 3}">중지</c:if>--%>
<%--                            <c:if test="${serverRack.useWhether == 4}">대기</c:if>--%>
<%--                        </td>--%>
<%--                    </tr>--%>

<%--                    <tr id="common_raidPossibleArea" class="dis-n">--%>
<%--                    </tr>--%>
                </table>
            </div>
        </section>
        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteAjax()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?idx=${serverRack.idx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="returnServerView()">
        </div>

    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>