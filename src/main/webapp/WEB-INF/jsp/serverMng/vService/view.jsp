<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/lang/serverMng/test_lang.js" type="text/babel"></script>
<script src="/resources/js/serverMng/view.js" type="text/babel"></script>

<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">V-Server</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">서버정보</h1>
            </div>
            <input type="hidden" name="idx" value="${serverInfo.idx}">
            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">서버정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>서버구분</th>
                        <td>
                            <c:if test="${serverInfo.gubun == 'RG'}">
                                ReceiveGUARD
                            </c:if>
                            <c:if test="${serverInfo.gubun == 'SG'}">
                                Send&SpamGUARD
                            </c:if>
                            <c:if test="${serverInfo.gubun == 'SP'}">
                                SpamGUARD
                            </c:if>
                            <c:if test="${serverInfo.gubun == 'SD'}">
                                SendGUARD
                            </c:if>
                            <c:if test="${serverInfo.gubun == 'SM'}">
                                SecuMail
                            </c:if>
                        </td>
                        <th>서버명칭</th>
                        <td>
                            ${serverInfo.name}
                        </td>
                    </tr>
                    <tr>
                        <th>운영체제 아이디</th>
                        <td>${serverInfo.osId}</td>
                        <th>운영체제 비밀번호</th>
                        <td>${serverInfo.osPwd}</td>
                    </tr>
                    <tr>
                        <th>서버 아이피</th>
                        <td>${serverInfo.ip}</td>
                        <th>서버 도메인</th>
                        <td>${serverInfo.domain}</td>
                    </tr>
                    <tr>
                        <th>사용여부</th>
                        <td colspan="3">
                            <c:if test="${serverInfo.useYn == true}">
                                사용
                            </c:if>
                            <c:if test="${serverInfo.useYn == false}">
                                사용 안함
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>메모</th>
                        <td colspan="3">${serverInfo.memo}</td>
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