<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/ipInfo/form.js" type="text/babel"></script>
<script src="/resources/js/serverMng/info/view.js" type="text/babel"></script>
<section class="l-content-area">

    <h1 class="main-title">분출 현황</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${serverIp.idx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">분출 현황</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">분출 현황</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>관리번호</th>
                        <td colspan="4">${serverEruption.erUniqueNumber}</td>
                    </tr>
                    <tr>
                        <th>용도</th>
                        <td>${serverEruption.erUsage}</td>
                        <th>사용여부</th>
                        <td>
                            <c:if test="${serverEruption.useGubun eq true}">
                                분출중
                            </c:if>
                            <c:if test="${serverEruption.useGubun eq false}">
                                입고
                            </c:if></td>
                    </tr>
                    <tr>
                        <th>사용자</th>
                        <td>${serverEruption.regName}</td>
                        <th>사용일자</th>
                        <td>
                            <fmt:formatDate value="${serverEruption.erReceivingDate}" pattern="yyyy-MM-dd"/>
                        </td>
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