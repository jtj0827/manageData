<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.24.0/babel.js"></script>
    <script src="/resources/js/common.js" type="text/babel"></script>
    <link rel="stylesheet" type="text/css" href="/resources/mycss/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
    <title>다운로드 현황</title>
</head>
<body>
<div style="min-height: 100%">
    <div>
        <div class="l-content">
            <form id="pageForm">
                <input type="hidden" name="pageNo">
                <input type="hidden" name="pageSize" value="${paging.pageSize}">
                <input type="hidden" name="idx" value="${param.idx}">
            </form>
            <div class="b-tableWrap">
                <table class="b-listTable">
                    <colgroup>
                        <col width="16%">
                        <col width="42%">
                        <col width="42%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>사용자 ID</th>
                        <th>다운로드 날짜</th>
                    </tr>
                    </thead>
                    <tbody class=" text-center">
                        <c:if test="${totalCount eq 0 }">
                            <tr>
                                <td colspan="3" class="nodata">데이터가 존재하지 않습니다.</td>
                                <td colspan="3" class="nodata">데이터가 존재하지 않습니다.</td>
                                <td colspan="3" class="nodata">데이터가 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="log" items="${logList}" varStatus="status">
                            <tr>
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">${log.regId}</td>
                                <td class="a_center"><fmt:formatDate value="${log.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div>
                    <%@ include file="../../include/paging.jsp" %>
                </div>
            </div>
        </div>
    </div>

</div>

<%--<div>--%>
<%--    <table class="b-listTable">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>번호</th>--%>
<%--            <th>사용자 ID</th>--%>
<%--            <th>다운로드 시간</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach var="log" items="${logList}" varStatus="status">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${totalCount == 0}">--%>
<%--                    <tr>--%>
<%--                        <td>데이터가 존재하지 않습니다.</td>--%>
<%--                    </tr>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <span>test</span>--%>
<%--                    <tr>--%>
<%--                        <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>--%>
<%--                        <td>${log.regId}</td>--%>
<%--                        <td>${log.regDate}</td>--%>
<%--                    </tr>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </c:forEach>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</div>--%>

</body>
</html>
