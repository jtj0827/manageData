<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/appliance/versionMng/form.js" type="text/babel"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title">라이센스 관리</p>
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
                                <input type="hidden" name="nationCode" value="CM">
                            </c:when>
                            <%-- LINE :: 일반(업체별) 버전 등록인 경우 --%>
                            <c:otherwise>
                                <tr>
                                    <th>국가명</th>
                                    <td>
                                        <select name="nationCode" class="wp95">
                                            <option value="">국가명</option>
                                            <c:forEach var="nationCode" items="${nationList}">
                                                <option value="${nationCode.code}" ${version.nationCode eq nationCode.code ? 'selected' : ''}>${nationCode.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <th>사용 장비</th>
                                    <td>
                                        <select name="equipmentCode" class="wp95">
                                            <option value="">업체</option>
                                            <c:forEach var="code" items="${equipmentList}">
                                                <option value="${code.code}" ${version.equipmentCode eq code.code ? 'selected' : ''}>${code.codeExp}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <th>활성화 코드</th>
                            <td>
                                <input type="text" name="activationCode" value="${version.activationCode}" class="wp95" maxlength="30">
                            </td>
                            <th>제품명</th>
                            <td>
                                <select name="productCode" class="wp95">
                                    <option value="">업체</option>
                                    <c:forEach var="code" items="${productList}">
                                        <option value="${code.code}" ${version.productCode eq code.code ? 'selected' : ''}>${code.codeExp}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td colspan="3">
                                <textarea name="note" class="wp98 h100 mt5 mb5" style="resize: none">${version.note}</textarea>
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
