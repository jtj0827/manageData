<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/customerMng/customer/popup/addAccount.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title trn" data-trn-key="TR_CLOUD_ADD_ACCOUNT"><%--계정 추가--%></p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
                <form id="saveForm"></form>
            <%--<hr class="subLine">--%>

                <input type="hidden" name="idx" value="${customer.idx}">
                    <div style="display: flex; justify-content: space-around;">
                        <div class="" style="height: 300px;border: 1px solid #333; overflow: auto; flex: 0 1 49%;">
                            <table class="b-listTable plus">
                                <thead>
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_EXCHANGE_ACCOUNT"><%--메일(Exchange)--%></th>
                                    </tr>
                                    <tr>
                                        <th>
                                            <select id="exchangeAccount" class="w200">
                                                <option class="trn" data-trn-key="TR_COMMON_CHOICE" value=""><%--선택--%></option>
                                                <c:forEach var="unUsedExchangeAccount" items="${unUsedExchangeAccountList}" varStatus="status">
                                                    <option value="${unUsedExchangeAccount.idx}">${unUsedExchangeAccount.account}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="button" class="trn" data-trn-value="TR_COMMON_ADD" value="추가" onclick="addExchangeAccountBtn()">
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="exchangeList">
                                    <c:forEach var="exchangeAccount" items="${exchangeAccountList}">
                                        <c:set var="accountIdx"><fmt:parseNumber value="${exchangeAccount.idx}"/></c:set>
                                        <c:set var="exchangeStorage"><fmt:formatNumber value="${exchangeAccount.exchangeStorage}" pattern="#,###"/></c:set>
                                        <c:set var="usedStorage">
                                            <fmt:formatNumber value="${accountUseAmount.get(accountIdx) > 0 ? (accountUseAmount.get(accountIdx) / (1024*1024*1024)) : 0}" pattern="#,###.##"/>
                                        </c:set>
                                        <tr>
                                            <td style="display: flex; justify-content: space-between; align-items: center; height: auto" class="clear">
                                                <input type="hidden" name="exchangeAccountIdx" class="exchangeAccountIdx" value="${exchangeAccount.idx}">
                                                <span class="text dis_ib w200">${exchangeAccount.account} <span class="fwB">
                                                    <c:if test="${customer.secuEcloudGubun == 'N'}">
                                                        [${usedStorage}GB / ${exchangeStorage}GB]
                                                    </c:if>
                                                </span></span>
                                                <span><span class="trn" data-trn-key="TR_USE"><%--사용--%></span>> : <input type="radio" value="true"${exchangeAccount.exchangeSaveYn ? ' class="check"' : ''} name="exchangeSaveYn" onchange="radioChange('exchange', this)" ${exchangeAccount.exchangeSaveYn ? 'checked' : ''}> </span>
                                                <input type="button" class="mViewBtn_permit dis_b" value="-" style="color:#e74701; width: 30px;" onclick="removeLine(this, `exchangeAccount`);">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="" style="height: 300px; border: 1px solid #333; overflow: auto; flex: 0 1 49%;">
                            <table class="b-listTable plus" id="onedriveList">
                                <thead>
                                    <tr>
                                        <th class="trn" data-trn-key="TR_CLOUD_ONEDRIVE_ACCOUNT"><%--그룹웨어(OneDrive)--%></th>
                                    </tr>
                                    <tr>
                                        <th>
                                            <select id="onedriveAccount" class="w200">
                                                <option class="trn" data-trn-key="TR_COMMON_CHOICE" value=""><%--선택--%></option>
                                                <c:forEach var="unUsedOnedriveAccount" items="${unUsedOnedriveAccountList}" varStatus="status">
                                                    <option value="${unUsedOnedriveAccount.idx}">${unUsedOnedriveAccount.account}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="button" class="trn" data-trn-value="TR_COMMON_ADD" value="추가" onclick="addOnedriveAccountBtn()">
                                        </th>
                                    </tr>
                                </thead>
                                <c:forEach var="onedriveAccount" items="${onedriveAccountList}" varStatus="status">
                                    <c:set var="accountIdx"><fmt:parseNumber value="${onedriveAccount.idx}"/></c:set>
                                    <c:set var="exchangeStorage"><fmt:formatNumber value="${onedriveAccount.exchangeStorage}" pattern="#,###"/></c:set>
                                    <c:set var="usedStorage">
                                        <fmt:formatNumber value="${accountUseAmount.get(accountIdx) > 0 ? (accountUseAmount.get(accountIdx) / (1024*1024*1024)) : 0}" pattern="#,###.##"/>
                                    </c:set>
                                    <tr>
                                        <td style="display: flex; justify-content: space-between; align-items: center; height: auto" class="clear">
                                            <input type="hidden" name="onedriveAccountIdx" class="onedriveAccountIdx" value="${onedriveAccount.idx}">
                                            <span class="text dis_ib w200">${onedriveAccount.account} <span class="fwB">
                                                <c:if test="${customer.secuEcloudGubun == 'N'}">
                                                    [${usedStorage}GB / ${onedriveStorage}GB]
                                                </c:if>
                                            </span></span>
                                            <span><span class="trn" data-trn-key="TR_COMMON_USEYN_TRUE"><%--사용--%></span> : <input type="radio" value="true"${onedriveAccount.onedriveSaveYn ? ' class="check"' : ''} name="onedriveSaveYn" onchange="radioChange('onedrive', this)" ${onedriveAccount.onedriveSaveYn ? 'checked' : ''}> </span>
                                            <input type="button" class="mViewBtn_permit dis_b" value="-" style="color:#e74701; width: 30px;" onclick="removeLine(this, `onedriveAccount`);">
                                        </td>
                                    </tr>
<%--                                    <tr>--%>
<%--                                        <td>--%>
<%--                                            <input type="hidden" name="onedriveAccountIdx" value="${onedriveAccount.idx}">--%>
<%--                                            ${onedriveAccount.account}--%>
<%--                                            <input type="button" class="mViewBtn_permit dis_b fr" value="-" style="color:#e74701; width: 30px; margin: 0 auto" onclick="removeLine(this, `onedriveAccount`);">--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                    <p class="clear a_center mt10" style="overflow:hidden;">
                        <input type="button" class="btn-large btn-add trn" data-trn-value="TR_COMMON_REGISTRATION" onclick="save();" value="등록">
                        <input type="button" class="btn-large trn" data-trn-value="TR_COMMON_CANCEL" onclick="self.close();" value="취소">
                    </p>
            </div><!--contentBox-->
        </div><!--container_list-->
    </div>
</div><!--article-->
</div><!--section-->
</div><!--wrapper-->
</body>
</html>
