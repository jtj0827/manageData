<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/stock/view.js" type="text/babel"></script>
<section class="l-content-area">

    <h1 class="main-title">서버 재고</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${serverStock.idx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">서버 재고</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">서버 재고</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>관리번호</th>
                        <td>${serverStock.uniqueNumber}</td>
                        <th>용도</th>
                        <td>${serverStock.stockUsage}</td>
                    </tr>
                    <tr>
                        <th>구분</th>
                        <td style="padding: 0;">
                            <table>
                                <colgroup>
                                    <col width="33%">
                                    <col width="33%">
                                    <col width="33%">
                                </colgroup>
                                <thead>
                                    <th class="gray">1 Depth</th>
                                    <th class="gray">2 Depth</th>
                                    <th class="gray">3 Depth</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="a_center bd-n bb-n">${firstDepth}</td>
                                        <td class="a_center bd-n bb-n">${secondDepth}</td>
                                        <td class="a_center bd-n bb-n">${thirdDepth}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>제조사</th>
                        <td>${serverStock.manufacturer}</td>
                        <th>입고일</th>
                        <td>${serverStock.formatedReceivingDate}</td>
                    </tr>
                    <tr>
                        <th>등록자</th>
                        <td>${serverStock.regName}</td>
                        <th>업데이트날짜</th>
                        <td>
                            ${serverStock.formatedonUpdateDate}
                        </td>
                    </tr>
                    <tr>
                        <th>분출용도</th>
                        <td>${serverStock.eruptionUsage}</td>
                        <th>상태</th>
                        <td>
                            <c:if test="${serverStock.state eq 'stock'}">
                                재고
                            </c:if>
                            <c:if test="${serverStock.state eq 'eruption'}">
                                사용중
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>수량</th>
                        <td colspan="3">${serverStock.volume}</td>
                    </tr>
                    <tr>
                        <th>메모</th>
                        <td colspan="3">${serverStock.memo}</td>
                    </tr>
                </table>
            </div>
        </section>
        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteStcok()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?idx=${serverStock.idx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="moveList()">
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>