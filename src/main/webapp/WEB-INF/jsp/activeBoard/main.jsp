<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/resources/js/activeBoard/echarts.js"></script>
<script src="/resources/js/activeBoard/jquery-2.2.4.min.js"></script>
<script src="/resources/js/activeBoard/front.js"></script>
<input type="hidden" id="codeKey" value="${codeKey}">

<section class="b-activeBoard">
    <div class="floor-header">
        <%--LINE::날짜, 시간--%>
        <%@ include file="components/dateClock.jsp" %>
        <%--LINE::lightComm--%>
        <%@ include file="components/lightCommunication.jsp" %>
    </div>

    <article class="floor-wrap">

        <div class="floor wp13">
            <%--LINE::총 관제 수--%>
            <%@ include file="components/allControl.jsp" %>
            <%--LINE::위치 구분--%>
            <%@ include file="components/location.jsp" %>
            <%--LINE::관리 구분--%>
            <%@ include file="components/management.jsp" %>
        </div>

        <div class="floor floor-add wp65">
            <%--LINE::dividion--%>
            <%@ include file="components/division.jsp" %>
            <%--LINE::server--%>
            <%@ include file="components/server.jsp" %>
        </div>

        <div class="floor wp20">
            <%--LINE::chart--%>
            <%@ include file="components/chart.jsp" %>
            <%--LINE::warning--%>
            <%@ include file="components/warning.jsp" %>
            <%--LINE::occurrence--%>
            <%@ include file="components/occurrence.jsp" %>
        </div>
    </article>

<%@ include file="include/footer.jsp" %>