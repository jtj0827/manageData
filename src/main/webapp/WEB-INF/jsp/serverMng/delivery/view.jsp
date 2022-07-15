<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/info/view.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">납품 서버 정보</h1>

    <div class="l-maxwrap">
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">납품 정보</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">납품 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr class="table-head">
                        <th colspan="4" class="a_left form-maintitle strong">서버 정보</th>
                    </tr>
                    <tr>
                        <th>관리번호</th>
                        <td colspan="3">${delivery.uniqueNumber}</td>
                    </tr>
                    <tr>
                        <th>CPU</th>
                        <td>${delivery.cpu}</td>
                        <th>RAM</th>
                        <td>${delivery.ram}</td>
                    </tr>
                    <tr>
                        <th>모델 이름</th>
                        <td colspan="3">${delivery.modelName}</td>
                    </tr>
                    <tr>
                        <th>용도</th>
                        <c:forEach items="${useGubunList}" var="code">
                            <c:if test="${code.code eq delivery.useGubunCode}">
                                <td>${code.codeExp}</td>
                            </c:if>
                        </c:forEach>
                        <th>납품 서버</th>
                        <td>
                            <c:if test="${delivery.serverGubun eq 'RG'}">ReceiveGUARD</c:if>
                            <c:if test="${delivery.serverGubun eq 'SG'}">Send&SpamGUARD</c:if>
                            <c:if test="${delivery.serverGubun eq 'SD'}">SendGUARD</c:if>
                            <c:if test="${delivery.serverGubun eq 'SP'}">SpamGUARD</c:if>
                            <c:if test="${delivery.serverGubun eq 'SM'}">SecuMail</c:if>
                            <c:if test="${delivery.serverGubun eq 'RC'}">CUBE</c:if>
                            <c:if test="${delivery.serverGubun eq 'SO'}">SPAMOUT</c:if>
                        </td>
                    </tr>
                    <tr class="table-head">
                        <th colspan="4" class="a_left form-maintitle strong">고객사 정보</th>
                    </tr>
                    <tr>
                        <th>회사명</th>
                        <td colspan="3">${delivery.manageName}</td>
                    </tr>
                    <tr>
                        <th>대표자 성함</th>
                        <td>${delivery.adminName}</td>
                        <th>대표 이메일</th>
                        <td>${delivery.email}</td>
                    </tr>
                    <tr>
                        <th>대표 전화번호</th>
                        <td>
                            <c:if test="${delivery.tel != '02--'}">
                                ${delivery.tel}
                            </c:if>
                        </td>
                        <th>팩스번호</th>
                        <td>${delivery.fax}</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td colspan="3">
                            <c:if test="${delivery.zipcode != null and delivery.zipcode != '' || delivery.addr != null and delivery.addr != '' || delivery.addrDetail != null and delivery.addrDetail != ''}">
                                <span class="dis_b">(${delivery.zipcode})</span>
                                <span class="dis_b">${delivery.addr}</span>
                                <span class="dis_b">${delivery.addrDetail}</span>
                            </c:if>
                            <c:if test="${delivery.zipcode == null || delivery.zipcode == '' and delivery.addr == null || delivery.addr == '' and delivery.addrDetail == null || delivery.addrDetail == ''}">
                                <span class="dis_b">-</span>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>메모</th>
                        <td colspan="3" style="white-space: pre-wrap;">${delivery.memo}</td>
                    </tr>
                    <tr class="table-head">
                        <th colspan="4" class="a_left form-maintitle strong">파트너사 정보</th>
                    </tr>
                    <tr>
                        <th>기업명</th>
                        <td colspan="3">${delivery.partnerName}</td>
                    </tr>
                    <tr>
                        <th>계약일</th>
                        <td>${delivery.formatedContractDate}</td>
                        <th>고유번호</th>
                        <td>${delivery.uniqueNumber}</td>
                    </tr>
                    <tr>
                        <th>대표자명</th>
                        <td>${delivery.repName}</td>
                        <th>대표 전화번호</th>
                        <td>${delivery.repTel}</td>
                    </tr>
                    <tr>
                        <th>매출형태</th>
                        <td>${delivery.salesForm}</td>
                        <th>종업원 수(명)</th>
                        <td><fmt:formatNumber value="${delivery.employCount}" pattern="#,###"/></td>
                    </tr>
                    <tr>
                        <th>주요 매출처</th>
                        <td>${delivery.mainSales}</td>
                        <th>주요 매입처</th>
                        <td>${delivery.mainBuyer}</td>
                    </tr>
                    <tr>
                        <th>연간 매출(억원)</th>
                        <td><fmt:formatNumber value="${delivery.annualSales}" pattern="#,###"/></td>
                        <th>수익배분율(%)</th>
                        <td>${delivery.revenue}</td>
                    </tr>

                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-large" value="목록" onclick="moveList()">
        </div>

    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>