<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/cloud/versionMng/form.js" type="text/babel"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title">R-Guard Version 관리 (파일|운영)</p>
        <div class="con_view">
            <div class="container_pop b-tableWrap" style="width: 680px">
                <%--<hr class="subLine">--%>
                <form id="versionForm">
                    <c:if test="${version.idx > 0}"><input type="hidden" name="idx" value="${version.idx}"></c:if>
                    <table class="b-listTable b-listTable--border">
                        <colgroup>
                            <col width="25%">
                            <col width="25%">
                            <col width="25%">
                            <col width="25%">
                        </colgroup>
                        <c:choose>
                            <%-- LINE :: 최신버전 등록인 경우 --%>
                            <c:when test="${isLastVersion}">
                                <tr>
                                    <th>WEB</th>
                                    <td colspan="3">
                                        <input type="hidden" name="nationCode" value="CM">
                                        <input type="text" name="web" value="${version.web}" class="w145" maxlength="30">
                                    </td>
                                </tr>
                            </c:when>
                            <%-- LINE :: 일반(업체별) 버전 등록인 경우 --%>
                            <c:otherwise>
                                <tr>
                                    <th>국가</th>
                                    <td>
                                        <select name="nationCode" class="wp95">
                                            <option value="">국가명</option>
                                            <c:forEach var="nation" items="${nationList}">
                                                <option value="${nation.code}" ${nation.code eq version.nationCode ? 'selected' : ''}>${nation.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <th>WEB</th>
                                    <td>
                                        <input type="text" name="web" value="${version.web}" style="width: 98%;" maxlength="30">
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <th>SCMA</th>
                            <td>
                                <c:set var="scma" value="${fn:split(version.scma, ',')}" />
                                <input type="text" name="scma" value="${scma[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scma" value="${scma[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SCM GUARD</th>
                            <td>
                                <c:set var="scmguard" value="${fn:split(version.scmguard, ',')}" />
                                <input type="text" name="scmguard" value="${scmguard[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmguard" value="${scmguard[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <th>SCM GUARD MTA</th>
                            <td>
                                <c:set var="scmguardMta" value="${fn:split(version.scmguardMta, ',')}" />
                                <input type="text" name="scmguardMta" value="${scmguardMta[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmguardMta" value="${scmguardMta[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SCM SUB</th>
                            <td>
                                <c:set var="scmsub" value="${fn:split(version.scmsub, ',')}" />
                                <input type="text" name="scmsub" value="${scmsub[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmsub" value="${scmsub[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <th>SCM GUARD SMTPC</th>
                            <td>
                                <c:set var="scmguardSmtpc" value="${fn:split(version.scmguardSmtpc, ',')}" />
                                <input type="text" name="scmguardSmtpc" value="${scmguardSmtpc[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmguardSmtpc" value="${scmguardSmtpc[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SECU MANAGER</th>
                            <td>
                                <c:set var="secuManager" value="${fn:split(version.secuManager, ',')}" />
                                <input type="text" name="secuManager" value="${secuManager[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="secuManager" value="${secuManager[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                    </table>
                </form>

                <p class="clear mt10 a_center" style="overflow:hidden">
                    <%-- LINE :: 수정인 경우에만 활성화 --%>
                    <c:if test="${version.idx > 0}">
                        <span class="a_center">
                            <input type="button" class="btn-large btn-rm" onclick="deleteAjax();" value="삭제">
                        </span>
                    </c:if>
                    <span class="a_center">
                        <input type="button" class="btn-large btn-add" onclick="save();" value="${version.idx > 0 ? '수정' : '등록'}">
                        <input type="button" class="btn-large" onclick="self.close();" value="취소">
                    </span>
                </p>
            </div><!--contentBox-->
        </div><!--container_list-->
    </div>
</div><!--article-->
</div><!--section-->
</div><!--wrapper-->
</body>
</html>