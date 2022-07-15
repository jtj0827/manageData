<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>

<script src="/resources/js/serverMng/solution/avast/view.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">Avast 라이센스 관리</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${license.idx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">Avast 라이센스 관리</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">Avast 라이센스 관리</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>제품명</th>
                        <td>${license.productName}</td>
                        <th>만료일자</th>
                        <td>${license.formatedExpiryDate}</td>
                    </tr>
                    <tr>
                        <th>활성화 코드</th>
                        <td>${license.activeCode}</td>
                        <th>최대 사용가능 장비수</th>
                        <td>${license.maxUseEquip}</td>
                    </tr>

                </table>
            </div>
        </section>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">사용 현황</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable plus">
                    <caption class="offscreen">사용 현황</caption>
                    <colgroup>
                        <col width="5%"> <%--번호--%>
                        <col width="20%"><%--서버명칭--%>
                        <col width="20%"><%--관리번호--%>
                        <col width="20%"><%--시리얼 번호--%>
                        <col width="20%"><%--용도--%>
                        <col width="20%"><%--서버 모델--%>
                        <col width="20%"><%--입고일--%>

                    </colgroup>
                    <thead>
                        <tr>
                            <th class="a-center">번호</th>
                            <th class="a-center">서버명칭</th>
                            <th class="a-center">관리번호</th>
                            <th class="a-center">시리얼 번호</th>
                            <th class="a-center">용도</th>
                            <th class="a-center">서버 모델</th>
                            <th class="a-center">입고일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${serverInfoCount == 0}">
                            <tr>
                                <td colspan="7" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach items="${serverInfoList}" var="serverInfo" varStatus="status">
                            <tr class="pointer hoverline" onclick="moveServerView(${serverInfo.idx})">
                                <td class="a-center">
                                    <%--번호--%>
                                    ${serverInfoCount - status.index}
                                </td>
                                <td class="a-center">
                                    <%--서버명칭--%>
                                    ${serverInfo.name}
                                </td>
                                <td class="a-center">
                                    <%--관리번호--%>
                                    ${serverInfo.managementNumber}
                                </td>
                                <td class="a-center">
                                    <%--시리얼 번호--%>
                                    ${serverInfo.uniqueNumber}
                                </td>
                                <td class="a-center">
                                    <%--용도--%>
                                        <c:set value="SU0009 SU0008 SU0004 SU0010 SU0011" var="useGubunCodeEtcArea"/>
                                        <c:set value="SU0007 SU0006 SU0005 SU0002 SU0000" var="serverGubunArea"/>

                                        <c:forEach items="${useGubunList}" var="code">
                                            <c:if test="${code.code eq serverInfo.useGubunCode}">
                                                ${code.codeExp}
                                            </c:if>
                                        </c:forEach>
                                        /
                                        <c:choose>
                                            <c:when test="${fn:contains(useGubunCodeEtcArea, serverInfo.useGubunCode)}">
                                                <%--대기 내부운영 기타운영--%>
                                                ${serverInfo.useGubunCodeEtc}
                                            </c:when>
                                            <c:when test="${fn:contains(serverGubunArea, serverInfo.useGubunCode)}">
                                                <%--일본 운영, 싱가폴 운영, 베트남 운영, 테스트, BMT--%>
                                                <c:choose>
                                                    <c:when test="${serverInfo.serverGubun == 'RG'}"> ReceiveGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SG'}"> Send&SpamGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SD'}"> SendGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'RC'}"> Cube</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SP'}"> SpamGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'EC'}"> Secu E Cloud</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SM'}"> SecuMail</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'EG'}"> EML Generator</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'IG'}"> 통합</c:when>
                                                </c:choose>
                                            </c:when>
                                            <c:when test="${serverInfo.useGubunCode eq 'SU0003'}">
                                                <%--클라우드 운영--%>
                                                <c:choose>
                                                    <c:when test="${serverInfo.serverGubun == 'RG'}"> ReceiveGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SG'}"> Send&SpamGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SD'}"> SendGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'RC'}"> Cube</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SP'}"> SpamGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'EC'}"> Secu E Cloud</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SM'}"> SecuMail</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'EG'}"> EML Generator</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'IG'}"> 통합</c:when>
                                                </c:choose>
                                                /
                                                <c:choose>
                                                    <c:when test="${serverInfo.cloudEquipGubun eq 'S'}">
                                                        Secu E Cloud
                                                    </c:when>
                                                    <c:when test="${serverInfo.cloudEquipGubun eq 'E'}">
                                                        EG-Platform
                                                    </c:when>
                                                </c:choose>
                                            </c:when>
                                            <c:when test="${serverInfo.useGubunCode eq 'SU0001'}">
                                                <%--납품--%>
                                                ${serverInfo.manageName}<%--고객사--%>
                                                /
                                                ${serverInfo.partnerName}<%--파트너사--%>
                                                /
                                                <c:choose>
                                                    <c:when test="${serverInfo.serverGubun == 'RG'}"> ReceiveGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SG'}"> Send&SpamGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SD'}"> SendGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'RC'}"> Cube</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SP'}"> SpamGUARD</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'EC'}"> Secu E Cloud</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'SM'}"> SecuMail</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'EG'}"> EML Generator</c:when>
                                                    <c:when test="${serverInfo.serverGubun == 'IG'}"> 통합</c:when>
                                                </c:choose>
                                            </c:when>
                                        </c:choose>
                                </td>
                                <td class="a-center">
                                    <%--서버 모델--%>
                                    ${serverInfo.modelName}
                                </td>
                                <td class="a-center">
                                    <%--입고일--%>
                                    ${serverInfo.formatedReceivingDate}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteAjax()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?idx=${license.idx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="returnServerInfoView()">
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>