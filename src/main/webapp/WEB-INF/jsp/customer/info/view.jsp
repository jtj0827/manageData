<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/info/view.js" type="text/babel"></script>
<script src="/resources/js/serverMng/info/serverCommon.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">고객 정보 관리</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="customerIdx" id="idx" value="${info.customerIdx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">고객 정보</h1>
            </div>

            <div class="b-tableWrap mt10">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">고객 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>고객명</th>
                        <td>
                            ${info.customerName}
                        </td>
                        <th>유입경로</th>
                        <td>
                            <c:forEach var="inflowPathInfo" items="${inflowList}">
                                <c:if test="${inflowPathInfo.code eq info.inflowPathCode}">${inflowPathInfo.codeExp}</c:if>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <th>고객 핸드폰번호</th>
                        <td>${info.phoneNum}</td>
                        <th>고객 Email</th>
                        <td>${info.email}</td>
                    </tr>
                </table>
            </div>
        </section>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">담당자 정보</h1>
            </div>

            <div class="b-tableWrap mt10">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">담당자 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>담당 부서</th>
                        <td>
                            <c:forEach var="member" items="${memberInfo}">
                                <c:if test="${info.contactAccountIdx eq member.idx}">${code.codeExp}</c:if>
                            </c:forEach>
                        </td>
                        <th>OS 설치일자</th>
                        <td>
                            ${info.formatedOsInstallDate}
                        </td>
                    </tr>
                    <tr>
                        <th>OS 업데이트일자</th>
                        <td>
                            ${info.formatedOsUpdateDate}
                        </td>
                        <th>OS 리부팅일자</th>
                        <td colspan="3">
                            ${info.formatedOsRebootDate}
                        </td>
                    </tr>
                    <tr>
                        <th><span class="necessary">운영체제 아이디</span></th>
                        <td>
                            ${info.osId}
                        </td>
                        <th><span class="necessary">운영체제 비밀번호</span></th>
                        <td>
                            ${info.osPwd}
                        </td>
                    </tr>
                    <tr>
                        <th>비고</th>
                        <td colspan="3" style="white-space: pre-wrap;">${info.note}</td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteAjax()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?customerIdx=${serverInfo.serverIdx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="moveList()">
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>