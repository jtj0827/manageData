<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/ipInfo/form.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">
    <h1 class="main-title">IP 배정</h1>
    <div class="l-maxwrap">
        <form id="ipForm">
            <c:if test="${sessionScope.accountInfo.idx > 0}"><input type="hidden" name="infoIdx" id="infoIdx" value="${sessionScope.accountInfo.idx}"></c:if>
            <c:if test="${serverIp.idx > 0}"><input type="hidden" name="idx" id="ipIdx" value="${serverIp.idx}"></c:if>
            <div id="common_tempArea"></div>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">IP 정보</h1>
                </div>
                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="oppscreen">IP 정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>IDC 위치</th>
                            <td colspan="4">
                                <select name="idcAddress" id="idcAddress" class="wp50">
                                    <option value="">선택</option>
                                    <c:forEach var="idc" items="${serverIdc}">
                                    <option value="${idc.idcAddress}" ${idc.idcAddress eq serverIp.idcAddress ? 'selected' : ''}>${idc.idcAddress}</option>
                                        <p>${idc.idcAddress}</p>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>네트워크 주소</th>
                            <td colspan="4">
                                <select name="networkAddress" id="networkAddress" class="wp50">
                                    <option value="">선택</option>
                                    <c:forEach var="network" items="${serverNetwork}">
                                    <option value="${network.ip}" ${network.ip eq serverIp.networkAddress ? 'selected' : ''}>${network.ip} (${network.gateway})</option>
                                    </c:forEach>
                                </select>
                                <input type="button" value="사용중인 IP목록" onclick="findIpPopup()">
                            </td>
                        </tr>
                        <tr>
                            <th>IP 배정</th>
                            <td colspan="4">
                                <input type="text" id="assignmentIp" class="default-input w155" name="assignmentIp" value="${serverIp.assignmentIp}">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </form>
        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5" value="${serverIp.idx > 0 ?  '수정' : '등록'}" onclick="saveIP()">
            <c:choose>
                <c:when test="${serverIp.idx > 0}">
                    <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view?idx=${serverIp.idx}'">
                </c:when>
                <c:otherwise>
                    <input type="button" class="btn-base btn-large" value="취소" onclick="moveList();">
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section>
</body>
</html>