<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/solution/view.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">제품관리</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${solution.idx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">솔루션 정보</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">솔루션 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>제품명</th>
                        <td>
                            ${solution.name}
                        </td>
                        <th>구분</th>
                        <td>
                            <c:forEach var="gubun" items="${gubunList}">
                                <c:if test="${gubun.code eq solution.gubun}">
                                    ${gubun.codeExp}
                                </c:if>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <th>구입일</th>
                        <td>
                            ${solution.formatedPurchaseDate}
                        </td>
                        <th>만기일</th>
                        <td>
                            ${solution.formatedExpiryDate}
                        </td>
                    </tr>
                    <tr>
                        <th>활성화 코드</th>
                        <td>${solution.activeCode}</td>
                        <th>사용여부</th>
                        <td>
                            <c:choose>
                                <c:when test="${solution.useYn == 0}">사용</c:when>
                                <c:when test="${solution.useYn == 0}">미사용</c:when>
                                <c:when test="${solution.useYn == 0}">사용중지</c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>사용현황</th>
                        <td>
                            <c:if test="${serverInfo != null}">
                                <span>${serverInfo.managementNumber} / ${serverInfo.name}</span>
                                <input type="button" class="type09 ml10" onclick="moveServerView(${serverInfo.idx})" value="서버정보">
<%--                                ${serverInfo.managementNumber}--%>
                            </c:if>
                            <c:if test="${serverInfo == null}">
                                사용중인 서버가 없습니다.
                            </c:if>
                        </td>
                        <th>고유번호</th>
                        <td>
                            <c:if test="${solution.uniqueKey != null && solution.uniqueKey != ''}">
                                ${solution.uniqueKey}
                            </c:if>
                            <c:if test="${solution.uniqueKey == null || solution.uniqueKey == ''}">
                                <input type="button" onclick="updateUniqueKey()" class="btn-baseRound fwB" value="업데이트">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>비고</th>
                        <td colspan="3" style="white-space: pre-wrap;">${solution.note}</td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteAjax()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?idx=${solution.idx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="returnServerView()">
        </div>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">사용 로그</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable plus">
                    <caption class="offscreen">사용 로그</caption>
                    <colgroup>
                        <col width="5%">
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                    </colgroup>
                    <tr>
                        <th class="a_center">번호</th>
                        <th class="a_center">사용 유형</th>
                        <th class="a_center">사용 서버</th>
                        <th class="a_center">등록일</th>
                        <th class="a_center">등록자 아이디</th>
                    </tr>
                    <c:set var="logCount" value="${fn:length(useLog)}" />
                    <c:if test="${useLog == null || logCount == 0}">
                        <tr>
                            <td colspan="5" class="a_center">등록된 로그가 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:forEach var="log" items="${useLog}" varStatus="status">
                        <tr>
                            <td class="a_center">${logCount - status.index}</td>
                            <td class="a_center">
                                <c:choose>
                                    <c:when test="${log.code == 'S'}">
                                        사용
                                    </c:when>
                                    <c:when test="${log.code == 'U'}">
                                        미사용
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="a_center">
                                <c:if test="${log.serverIdx != null}">
                                    ${log.managementNumber}
                                </c:if>
                                <c:if test="${log.serverIdx == null}">
                                    -
                                </c:if>
                            </td>
                            <td class="a_center">${log.formatedRegDate}</td>
                            <td class="a_center">${log.regId}</td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </section>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>