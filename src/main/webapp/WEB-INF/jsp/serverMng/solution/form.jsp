<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/solution/form.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">제품관리</h1>
<%--    <form id="IDCinstallLocation">--%>
<%--        <input type="hidden" name="installLocation">--%>
<%--    </form>--%>
    <div class="l-maxwrap">
        <form id="saveForm">
            <c:if test="${solution.idx > 0}"><input type="hidden" name="idx" id="idx" value="${solution.idx}"></c:if>
            <div id="common_tempArea"></div>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">솔루션 정보</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">솔루션 정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>

                        <tr>
                            <th><span class="necessary">제품명</span></th>
                            <td>
                                <input type="text" name="name" class="default-input" value="${solution.name}">
                            </td>
                            <th>구분</th>
                            <td>
                                <select name="gubun" class="default-input wp80">
                                    <option value="">선택</option>
                                    <c:forEach var="gubun" items="${gubunList}">
                                        <option value="${gubun.code}" ${solution.gubun eq gubun.code ? "selected" : ""}>${gubun.codeExp}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">구입일</span></th>
                            <td>
                                <input type="text" name="purchaseDate" class="default-input calendar w155" value="${solution.formatedPurchaseDate}" readonly>
                            </td>
                            <th><span class="necessary">만기일</span></th>
                            <td>
                                <input type="text" name="expiryDate" class="default-input calendar w155" value="${solution.formatedExpiryDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">활성화 코드</span></th>
                            <td>
                                <input type="text" name="activeCode" class="default-input wp90" value="${solution.activeCode}">
                            </td>
                            <th><span class="necessary">사용여부</span></th>
                            <td>
                                <label class="mr10 w70">
                                    <input type="radio" name="useYn" value="0" data-target="mail" checked> 사용
                                </label>
                                <label class="mr10 w70">
                                    <input type="radio" name="useYn" value="1" data-target="mail" ${solution.useYn == "1" ? "checked" : ""}> 미사용
                                </label>
                                <label class="mr10 w70">
                                    <input type="radio" name="useYn" value="2" data-target="mail" ${solution.useYn == "2" ? "checked" : ""}> 사용중지
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td colspan="3">
                                <textarea name="note" class="wp100 h100" style="resize: none">${solution.note}</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
        </form>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5" value="${solution.idx > 0 ?  '수정' : '등록'}" onclick="saveConfirm()">
            <c:choose>
                <c:when test="${solution.idx > 0}">
                    <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view?idx=${solution.idx}'">
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