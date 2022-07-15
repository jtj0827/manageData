<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/appliance/versionMng/form.js" type="text/babel"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title">Secu-Mail Version 관리 (파일|운영)</p>
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
                                    <th>SCM MAIL</th>
                                    <td style="border-right: none">
                                        <c:set var="scmMail" value="${fn:split(version.scmMail, ',')}" />
                                        <input type="text" name="scmMail" value="${scmMail[0]}" class="wp45" maxlength="30"> |
                                        <input type="text" name="scmMail" value="${scmMail[1]}" class="wp45" maxlength="30">
                                        <input type="hidden" name="nationCode" value="CM">
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                            </c:when>
                            <%-- LINE :: 일반(업체별) 버전 등록인 경우 --%>
                            <c:otherwise>
                                <tr>
                                    <th>업체명</th>
                                    <td>
                                        <select name="nationCode" class="default-input wp95">
                                            <option value="">국가명</option>
                                            <c:forEach var="nationCode" items="${nationList}">
                                                <option value="${nationCode.code}" ${version.nationCode eq nationCode.code ? 'selected' : ''}>${nationCode.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <th>SCM MAIL</th>
                                    <td>
                                        <c:set var="scmMail" value="${fn:split(version.scmMail, ',')}" />
                                        <input type="text" name="scmMail" value="${scmMail[0]}" class="wp45" maxlength="30"> |
                                        <input type="text" name="scmMail" value="${scmMail[1]}" class="wp45" maxlength="30">
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <th>SCM MAIL PAR</th>
                            <td>
                                <c:set var="scmMailPar" value="${fn:split(version.scmMailPar, ',')}" />
                                <input type="text" name="scmMailPar" value="${scmMailPar[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmMailPar" value="${scmMailPar[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SCM ARCHIVE</th>
                            <td>
                                <c:set var="scmArchive" value="${fn:split(version.scmArchive, ',')}" />
                                <input type="text" name="scmArchive" value="${scmArchive[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmArchive" value="${scmArchive[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <th>SCM MANAGER</th>
                            <td>
                                <c:set var="scmManager" value="${fn:split(version.scmManager, ',')}" />
                                <input type="text" name="scmManager" value="${scmManager[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmManager" value="${scmManager[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SCM MAIL SUB</th>
                            <td>
                                <c:set var="scmMailSub" value="${fn:split(version.scmMailSub, ',')}" />
                                <input type="text" name="scmMailSub" value="${scmMailSub[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmMailSub" value="${scmMailSub[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <th>SCM UP SERVER</th>
                            <td>
                                <c:set var="scmUpServer" value="${fn:split(version.scmUpServer, ',')}" />
                                <input type="text" name="scmUpServer" value="${scmUpServer[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmUpServer" value="${scmUpServer[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SCM UP Server SSL</th>
                            <td>
                                <c:set var="scmUpServerSsl" value="${fn:split(version.scmUpServerSsl, ',')}" />
                                <input type="text" name="scmUpServerSsl" value="${scmUpServerSsl[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmUpServerSsl" value="${scmUpServerSsl[1]}" class="wp45" maxlength="30">
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
