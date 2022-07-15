<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/serverMng/useStatus/status.js" type="text/babel"></script>

<section class="l-content-area">
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <div class="l-maxwrap">
        <h1 class="main-title">서버 사용 현황</h1>

        <c:if test="${gubun eq 's'}">
        <%-- Secu Mail 테이블 --%>
        <div class="b-title">
            <h1 class="b-title__title mt20">Secu Mail</h1>
        </div>
        <div class="b-tableWrap mt20">
            <table class="b-listTable add-thBorder">
                <caption class="offscreen">Secu Mail 서버 사용 현황</caption>
                <colgroup>
                    <col style="width: 15%">
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th rowspan="2">-</th>
                    <th colspan="3">HDD</th>
                    <th colspan="5">할당</th>
                </tr>

                <tr>
                    <th>총용량</th>
                    <th>사용용량</th>
                    <th>사용 가능 용량</th>
                    <th>총 용량</th>
                    <th>사용용량</th>
                    <th>사용 가능 용량</th>
                    <th>업체 수</th>
                    <th>사용자 수</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${secuMail}" var="mailServer">
                    <tr>
                        <td class="a_center">${mailServer.serverName}</td>
                        <td class="a_center">${mailServer.formatedTotalCapacity}</td>
                        <td class="a_center">${mailServer.formatedUseCapacity}</td>
                        <td class="a_center">
                            ${mailServer.formatedAvailableCapacity}
                            <input type="hidden" class="mailServer" value="${mailServer.availableCapacity}">
                        </td>
                        <td class="a_center">${mailServer.formatedAllowTotalCapacity}</td>
                        <td class="a_center">${mailServer.formatedAllowUseCapacity}</td>
                        <td class="a_center">${mailServer.formatedAllowAvailableCapacity}</td>
                        <td class="a_center">${mailServer.cntCustomer}</td>
                        <td class="a_center">${mailServer.cntUser}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <%-- Spam GURAD 테이블 --%>
        <div class="b-title mt30">
             <h1 class="b-title__title">Spam GUARD</h1>
        </div>
        <div class="b-tableWrap mt20">
            <table class="b-listTable add-thBorder">
                <caption class="offscreen">Spam GUARD 서버 사용 현황</caption>
                <colgroup>
                    <col style="width: 15%">
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th rowspan="2">-</th>
                    <th colspan="3">HDD</th>
                    <th colspan="4">리소스</th>
                    <th rowspan="2">업체수</th>
                </tr>

                <tr>
                    <th>총용량</th>
                    <th>사용용량</th>
                    <th>사용가능</th>
                    <th>CPU</th>
                    <th>CPU 사용량(최대)</th>
                    <th>메모리</th>
                    <th>메모리 사용량(최대)</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${spam}" var="spamServer">
                    <tr>
                        <td class="a_center">${spamServer.serverName}</td>
                        <td class="a_center">${spamServer.formatedTotalCapacity}</td>
                        <td class="a_center">${spamServer.formatedUseCapacity}</td>
                        <td class="a_center">
                            ${spamServer.formatedAvailableCapacity}
                            <input type="hidden" class="spamServer" value="${spamServer.availableCapacity}">
                        </td>
                        <td class="a_center">${spamServer.cpu}</td>
                        <td class="a_center">${spamServer.maxCpuUsage} %</td>
                        <td class="a_center">${spamServer.ram}</td>
                        <td class="a_center">${spamServer.maxRamUsage} %</td>
                        <td class="a_center">${spamServer.cntCustomer}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <%-- Spam GURAD 테이블 --%>
        <div class="b-title mt30">
             <h1 class="b-title__title">Send GUARD</h1>
        </div>
        <div class="b-tableWrap mt20">
            <table class="b-listTable add-thBorder">
                <caption class="offscreen">Send GUARD 서버 사용 현황</caption>
                <colgroup>
                    <col style="width: 15%">
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th rowspan="2">-</th>
                    <th colspan="3">HDD</th>
                    <th colspan="4">리소스</th>
                    <th rowspan="2">업체수</th>
                </tr>

                <tr>
                    <th>총용량</th>
                    <th>사용용량</th>
                    <th>사용가능</th>
                    <th>CPU</th>
                    <th>CPU 사용량(최대)</th>
                    <th>메모리</th>
                    <th>메모리 사용량(최대)</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${send}" var="sendServer">
                    <tr>
                        <td class="a_center">${sendServer.serverName}</td>
                        <td class="a_center">${sendServer.formatedTotalCapacity}</td>
                        <td class="a_center">${sendServer.formatedUseCapacity}</td>
                        <td class="a_center">
                            ${sendServer.formatedAvailableCapacity}
                            <input type="hidden" class="sendServer" value="${sendServer.availableCapacity}">
                        </td>
                        <td class="a_center">${sendServer.cpu}</td>
                        <td class="a_center">${sendServer.maxCpuUsage} %</td>
                        <td class="a_center">${sendServer.ram}</td>
                        <td class="a_center">${sendServer.maxRamUsage} %</td>
                        <td class="a_center">${sendServer.cntCustomer}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        </c:if>

        <c:if test="${gubun eq 'e'}">
            <%-- S GURAD 테이블 --%>
            <div class="b-title mt30">
                <h1 class="b-title__title">Spam & Send GUARD</h1>
            </div>
            <div class="b-tableWrap mt20">
                <table class="b-listTable add-thBorder">
                    <caption class="offscreen">Spam & Send GUARD 서버 사용 현황</caption>
                    <colgroup>
                        <col style="width: 15%">
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th rowspan="2">-</th>
                        <th colspan="3">HDD</th>
                        <th colspan="4">리소스</th>
                        <th rowspan="2">업체수</th>
                    </tr>

                    <tr>
                        <th>총용량</th>
                        <th>사용용량</th>
                        <th>사용가능</th>
                        <th>CPU</th>
                        <th>CPU 사용량(최대)</th>
                        <th>메모리</th>
                        <th>메모리 사용량(최대)</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${send}" var="sendServer">
                        <tr>
                            <td class="a_center">${sendServer.serverName}</td>
                            <td class="a_center">${sendServer.formatedTotalCapacity}</td>
                            <td class="a_center">${sendServer.formatedUseCapacity}</td>
                            <td class="a_center">
                                ${sendServer.formatedAvailableCapacity}
                                <input type="hidden" class="sendServer" value="${sendServer.availableCapacity}">
                            </td>
                            <td class="a_center">${sendServer.cpu}</td>
                            <td class="a_center">${sendServer.maxCpuUsage} %</td>
                            <td class="a_center">${sendServer.ram}</td>
                            <td class="a_center">${sendServer.maxRamUsage} %</td>
                            <td class="a_center">${sendServer.cntCustomer}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <%-- Receive GURAD 테이블 --%>
        <div class="b-title mt30">
             <h1 class="b-title__title">Receive GUARD</h1>
        </div>
        <div class="b-tableWrap mt20">
            <table class="b-listTable add-thBorder">
                <caption class="offscreen">Receive GURAD 서버 사용 현황</caption>
                <colgroup>
                    <col style="width: 15%">
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th rowspan="2">-</th>
                    <th colspan="3">HDD</th>
                    <th colspan="4">리소스</th>
                    <th rowspan="2">업체수</th>
                </tr>

                <tr>
                    <th>총용량</th>
                    <th>사용용량</th>
                    <th>사용가능</th>
                    <th>CPU</th>
                    <th>CPU 사용량(최대)</th>
                    <th>메모리</th>
                    <th>메모리 사용량(최대)</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${receive}" var="receiveServer">
                    <tr>
                        <td class="a_center">${receiveServer.serverName}</td>
                        <td class="a_center">${receiveServer.formatedTotalCapacity}</td>
                        <td class="a_center">${receiveServer.formatedUseCapacity}</td>
                        <td class="a_center">
                            ${receiveServer.formatedAvailableCapacity}
                            <input type="hidden" class="receiveServer" value="${receiveServer.availableCapacity}">
                        </td>
                        <td class="a_center">${receiveServer.cpu}</td>
                        <td class="a_center">${receiveServer.maxCpuUsage} %</td>
                        <td class="a_center">${receiveServer.ram}</td>
                        <td class="a_center">${receiveServer.maxRamUsage} %</td>
                        <td class="a_center">${receiveServer.cntCustomer}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="btn-area">
            <input type="button" class="btn-base btn-large" value="업데이트" onclick="updateStorageData()">
        </div>
    </div>


</section>