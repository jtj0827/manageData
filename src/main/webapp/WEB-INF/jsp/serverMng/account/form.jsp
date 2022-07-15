<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/account/form.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">계정 관리</h1>
<%--    <form id="IDCinstallLocation">--%>
<%--        <input type="hidden" name="installLocation">--%>
<%--    </form>--%>
    <div class="l-maxwrap">
        <form id="saveForm">
            <c:if test="${serverAccount.idx == null}">
            <input type="hidden" value="${sessionScope.accountInfo.name}" name="regId">
            </c:if>
            <c:if test="${serverAccount.idx > 0}"><input type="hidden" name="idx" id="idx" value="${serverAccount.idx}"></c:if>
            <div id="common_tempArea"></div>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">계정 정보</h1>
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
                            <th><span class="necessary">업체</span></th>
                            <td colspan="3">
                                <input type="text" class="wp100" name="name" value="${serverAccount.name}" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <th>웹 접속 URL</th>
                            <td colspan="3">
                                <input type="text" class="wp100" name="webUrl" value="${serverAccount.webUrl}" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">서버 아이디</span></th>
                            <td>
                                <input type="text" class="wp100" name="id" value="${serverAccount.id}" autocomplete="off">
                            </td>
                            <th><span class="necessary">서버 비밀번호</span></th>
                            <td>
                                <input type="text" class="wp100" name="pwd" value="${serverAccount.pwd}" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td colspan="3">
                                <textarea name="memo" class="wp100 h100">${serverAccount.memo}</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
        </form>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5" value="${serverAccount.idx > 0 ?  '수정' : '등록'}" onclick="serverAccountSaveConfirm()">
            <c:choose>
                <c:when test="${serverAccount.idx > 0}">
                    <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view?idx=${serverAccount.idx}'">
                </c:when>
                <c:otherwise>
                    <input type="button" class="btn-base btn-large" value="취소" onclick="moveList();">
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>