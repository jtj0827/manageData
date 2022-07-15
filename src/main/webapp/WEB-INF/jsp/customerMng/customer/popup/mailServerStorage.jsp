<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<p class="pop_title trn" data-trn-key="TR_CLOUD_MAIL_SERVER_AVAILABLE_CAPACITY"><%--메일 서버 사용 가능 용량--%></p>
<div class="con_view">
    <div class="container_pop" style="width: 680px">
    </div>
</div>
<div class="l-content">
    <div class="b-tableWrap">
        <div class="b-tableWrap">
            <table class="b-listTable">
                <colgroup>
                    <col width="30%">
                    <col width="40%">
                    <col width="*">
                </colgroup>
                <thead>
                <tr class="b-pop">
                    <th class="trn" data-trn-key="TR_CLOUD_SERVER_NAME"><%--서버명--%></th>
                    <th>IP</th>
                    <th class="trn" data-trn-key="TR_CLOUD_AVAILABLE_CAPACITY"><%--사용 가능 용량--%></th>
                </tr>
                </thead>
                <tbody class="text-center">
                <c:if test="${fn:length(serverList) == 0}">
                    <tr>
                        <td colspan="3" class="nodata trn" data-trn-key="TR_COMMON_NOTDATALIST"><%--데이터가 존재하지 않습니다.--%></td>
                    </tr>
                </c:if>
                <c:forEach var="server" items="${serverList}" varStatus="status">
                    <tr>
                        <td class="a_center">
                            ${server.name}
                        </td>
                        <td class="a_center">
                            ${server.assignmentIp}
                        </td>
                        <td class="a_center">
                          ${server.disk_available} GB
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>