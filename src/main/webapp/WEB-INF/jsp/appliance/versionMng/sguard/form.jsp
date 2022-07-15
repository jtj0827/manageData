<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/appliance/versionMng/form.js" type="text/babel"></script>
<script src="/resources/js/lang/commonlanguagePack.js"></script>
<script src="/resources/js/lang/appliance/appliace_lang.js"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title trn" data-trn-key="TR_APPLIANCE_TITLE9"><%--S-Guard Version 관리 (파일|운영)--%></p>
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
                                    <th>DAEMON</th>
                                    <td style="border-right: none">
                                        <c:set var="daemon" value="${fn:split(version.daemon, ',')}" />
                                        <input type="text" name="daemon" value="${daemon[0]}" class="wp45" maxlength="30"> |
                                        <input type="text" name="daemon" value="${daemon[1]}" class="wp45" maxlength="30">
                                        <input type="hidden" name="customerIdx" value="0">
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                            </c:when>
                            <%-- LINE :: 일반(업체별) 버전 등록인 경우 --%>
                            <c:otherwise>
                                <tr>
                                    <th class="trn" data-trn-key="TR_APPLIANCE_CUSTOMER_NAME"><%--업체명--%></th>
                                    <td>
                                        <select name="customerIdx" class="wp95">
                                            <option value="" class="trn" data-trn-key="TR_APPLIANCE_CUSTOMER"><%--업체--%></option>
                                            <c:forEach var="customer" items="${customerList}">
                                                <option value="${customer.idx}" ${version.customerIdx eq customer.idx ? 'selected' : ''}>${customer.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <th>DAEMON</th>
                                    <td>
                                        <c:set var="daemon" value="${fn:split(version.daemon, ',')}" />
                                        <input type="text" name="daemon" value="${daemon[0]}" class="wp45" maxlength="30"> |
                                        <input type="text" name="daemon" value="${daemon[1]}" class="wp45" maxlength="30">
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <th>MAG</th>
                            <td>
                                <c:set var="mag" value="${fn:split(version.mag, ',')}" />
                                <input type="text" name="mag" value="${mag[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="mag" value="${mag[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>MTA</th>
                            <td>
                                <c:set var="mta" value="${fn:split(version.mta, ',')}" />
                                <input type="text" name="mta" value="${mta[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="mta" value="${mta[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <th>PARSER</th>
                            <td>
                                <c:set var="parser" value="${fn:split(version.parser, ',')}" />
                                <input type="text" name="parser" value="${parser[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="parser" value="${parser[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SENDER</th>
                            <td>
                                <c:set var="sender" value="${fn:split(version.sender, ',')}" />
                                <input type="text" name="sender" value="${sender[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="sender" value="${sender[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_FIREWALL"><%--방화벽--%></th>
                            <td>
                                <c:set var="firewall" value="${fn:split(version.firewall, ',')}" />
                                <input type="text" name="firewall" value="${firewall[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="firewall" value="${firewall[1]}" class="wp45" maxlength="30">
                            </td>
                            <th>SUB</th>
                            <td>
                                <c:set var="sub" value="${fn:split(version.sub, ',')}" />
                                <input type="text" name="sub" value="${sub[0]}" class="wp45" maxlength="30"> |
                                <input type="text" name="sub" value="${sub[1]}" class="wp45" maxlength="30">
                            </td>
                        </tr>
                    </table>
                </form>

                <p class="clear mt10 a_center" style="overflow:hidden">
                    <%-- LINE :: 수정인 경우에만 활성화 --%>
                    <c:if test="${version.idx > 0}">
                        <span>
                            <input type="button" class="btn-large btn-rm trn" data-trn-key="TR_COMMON_DELETE" onclick="deleteAjax();" value=""><%--삭제--%>
                        </span>
                    </c:if>
                    <span>
                        <input type="button" class="btn-large btn-add trn" data-trn-value="TR_COMMON_${version.idx > 0 ? 'MODIFIED' : 'REGISTRATION'}" onclick="save();" value=""><%--수정 or 등록--%>
                        <input type="button" class="btn-large trn" data-trn-value="TR_COMMON_CANCEL" onclick="self.close();" value=""><%--취소--%>
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
