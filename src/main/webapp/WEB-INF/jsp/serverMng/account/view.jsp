<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/account/view.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">계정 관리</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${serverAccount.idx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">계정 관리</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">계정 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>업체</th>
                        <td colspan="3">
                            ${serverAccount.name}
                        </td>
                    </tr>
                    <tr>
                        <th>웹 접속 URL</th>
                        <td colspan="3">
                          <a href="${serverAccount.webUrl}" target="_blank">${serverAccount.webUrl}</a>
                        </td>
                    </tr>
                    <tr>
                        <th>서버 아이디</th>
                        <td>
                            ${serverAccount.id}
                        </td>
                        <th>서버 비밀번호</th>
                        <td>
                            ${serverAccount.pwd}
                        </td>
                    </tr>
                    <tr>
                        <th>비고</th>
                        <td colspan="3" style="white-space: pre-wrap;">${serverAccount.memo}</td>
                    </tr>
                </table>
            </div>
        </section>
        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteAjax()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?idx=${serverAccount.idx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="moveList()">
        </div>

    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>