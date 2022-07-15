<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/appliance/versionMng/form.js" type="text/babel"></script>
<script src="/resources/js/lang/commonlanguagePack.js"></script>
<script src="/resources/js/lang/appliance/appliance_lang.js"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title trn" data-trn-key="TR_APPLIANCE_TITLE3"><%--Cube Version 관리 (파일|운영)--%></p>
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
                                <input type="hidden" name="customerIdx" value="0">
                            </c:when>
                            <%-- LINE :: 일반(업체별) 버전 등록인 경우 --%>
                            <c:otherwise>
                                <tr>
                                    <th class="trn" data-trn-key="TR_APPLIANCE_CUSTOMER_NAME"><%--업체명--%></th>
                                    <td style="border-right: none">
                                        <select name="customerIdx" class="w145">
                                            <option class="trn" data-trn-key="TR_APPLIANCE_CUSTOMER" value=""><%--업체--%></option>
                                            <c:forEach var="customer" items="${customerList}">
                                                <option value="${customer.idx}" ${version.customerIdx eq customer.idx ? 'selected' : ''}>${customer.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <th>SC DET</th>
                            <td>
                                <c:set var="scDet" value="${fn:split(version.scDet, ',')}" />
                                <input type="text" name="scDet" value="${scDet[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scDet" value="${scDet[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SC MAIN</th>
                            <td>
                                <c:set var="scMain" value="${fn:split(version.scMain, ',')}" />
                                <input type="text" name="scMain" value="${scMain[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scMain" value="${scMain[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <th>SC MANAGER</th>
                            <td>
                                <c:set var="scManager" value="${fn:split(version.scManager, ',')}" />
                                <input type="text" name="scManager" value="${scManager[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scManager" value="${scManager[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SCM SAND</th>
                            <td>
                                <c:set var="scmSand" value="${fn:split(version.scmSand, ',')}" />
                                <input type="text" name="scmSand" value="${scmSand[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmSand" value="${scmSand[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <th>SCM SAND RUN</th>
                            <td>
                                <c:set var="scmSandSub" value="${fn:split(version.scmSandSub, ',')}" />
                                <input type="text" name="scmSandSub" value="${scmSandSub[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmSandSub" value="${scmSandSub[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SCM SAND SUB</th>
                            <td>
                                <c:set var="scmSandRun" value="${fn:split(version.scmSandRun, ',')}" />
                                <input type="text" name="scmSandRun" value="${scmSandRun[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="scmSandRun" value="${scmSandRun[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                    </table>
                </form>

                <p class="clear mt10 a_center" style="overflow:hidden">
                    <%-- LINE :: 수정인 경우에만 활성화 --%>
                    <c:if test="${version.idx > 0}">
                        <span>
                            <input type="button" class="btn-large btn-rm trn" data-trn-value="TR_COMMON_DELETE" onclick="deleteAjax();" value="<%--삭제--%>">
                        </span>
                    </c:if>
                    <span>
                        <input type="button" class="btn-large btn-add trn" data-trn-value="TR_COMMON_${version.idx > 0 ? 'MODIFIED' : 'REGISTRATION'}" onclick="save();" value="<%--수정 or 등록--%>">
                        <input type="button" class="btn-large trn" data-trn-key="TR_COMMON_CANCEL" onclick="self.close();" value="<%--취소--%>">
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
