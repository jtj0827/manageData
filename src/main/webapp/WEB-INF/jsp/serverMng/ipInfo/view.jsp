<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/ipInfo/form.js" type="text/babel"></script>
<script src="/resources/js/serverMng/info/view.js" type="text/babel"></script>
<section class="l-content-area">

    <h1 class="main-title">IP 배정 관리</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${serverIp.idx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">IP 배정 관리</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">IP 배정 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>배정 IP</th>
                        <td colspan="3">
                            ${serverIp.assignmentIp}
                        </td>
                    </tr>
                    <tr>
                        <th>RACK 번호</th>
                        <td colspan="3">
                            <c:if test="${rackIdx == null}">
                                배정되지 않음
                            </c:if>
                            <c:if test="${rackIdx != null}">
                                ${ipAllList.rackNumber}/${ipAllList.subRackNumber}
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>IDC 위치</th>
                        <td colspan="3">
                            ${serverIp.idcAddress}
                        </td>
                    </tr>
                    <tr>
                        <th>네트워크 주소</th>
                        <td colspan="3">
                            ${serverIp.networkAddress}
                        </td>
                    </tr>
                </table>
            </div>
        </section>
        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteIp()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?idx=${serverIp.idx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="moveList()">
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>