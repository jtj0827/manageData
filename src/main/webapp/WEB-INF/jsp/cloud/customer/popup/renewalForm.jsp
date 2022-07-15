<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/cloud/customerMng/renewalForm.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title trn" data-trn-key="TR_CLOUD_TITLE1"><%--계약 연장--%></p>
        <div class="con_view">
            <div class="container_pop b-tableWrap" style="width: 680px">
                <%--<hr class="subLine">--%>
                <form id="saveForm">
                    <input type="hidden" name="idx" value="${renewalData.idx}">
                    <input type="hidden" name="customerIdx" value="${customer.idx}">
                    <table class="b-listTable b-listTable--border">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th rowspan="2" class="trn" data-trn-key="TR_CLOUD_SERVICE_USE_PERIOD_PLUS"><%--연장기간--%></th>
                            <td colspan="3">
                                <label class="dis_ib w80">
                                    <input type="radio" name="serviceUsePeriod" onchange="serviceUsePeriodChange()" value="12" checked>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_ONE_YEARS"><%--1년--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="serviceUsePeriod" onchange="serviceUsePeriodChange()" value="24" ${renewalData.serviceUsePeriod == "24" ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_TWO_YEARS"><%--2년--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="serviceUsePeriod" onchange="serviceUsePeriodChange()" value="36" ${renewalData.serviceUsePeriod == "36" ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_THREE_YEARS"><%--3년--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <c:choose>
                                    <c:when test="${renewalData != null}">
                                        <input type="hidden" name="serviceStartDate" value="${renewalData.formatedServiceStartDate}">
                                        <input type="hidden" name="serviceEndDate" value="${renewalData.formatedServiceEndDate}">
                                        <span id="period">${renewalData.formatedServiceStartDate} ~ ${renewalData.formatedServiceEndDate}</span>
                                    </c:when>
                                    <c:when test="${renewalData == null and prevRenewalData != null}">
                                        <input type="hidden" name="serviceStartDate" value="${prevRenewalData.formatedServiceEndNextDate}">
                                        <input type="hidden" name="serviceEndDate" value="${prevRenewalData.formatedServiceEndNextYear}">
                                        <span id="period">${prevRenewalData.formatedServiceEndNextDate} ~ ${prevRenewalData.formatedServiceEndNextYear}</span>
                                    </c:when>
                                    <c:when test="${renewalData == null and prevRenewalData == null}">
                                        <input type="hidden" name="serviceStartDate" value="${customer.formatedServiceEndNextDate}">
                                        <input type="hidden" name="serviceEndDate" value="${customer.formatedServiceEndNextYear}">
                                        <span id="period">${customer.formatedServiceEndNextDate} ~ ${customer.formatedServiceEndNextYear}</span>
                                    </c:when>
                                </c:choose>

                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_ADD_PRICE"><%--추가금액--%></th>
                            <td colspan="3">
                                <input type="text" name="addPrice" class="onlynumber autoComma a_right w155" value="${renewalData != null ? renewalData.addPrice : '0'}">
                            </td>
                        </tr>
                    </table>
                </form>

                <p class="clear mt10 a_center" style="overflow:hidden;">
                    <span class="mt10 a_center">
                        <input type="button" class="btn-large btn-add trn" data-trn-value="TR_COMMON_${renewalData.idx > 0 ? 'MODIFIED' : 'TR_COMMON_REGISTRATION'}" onclick="saveAjax();" value="">
                        <input type="button" class="btn-large trn" data-trn-key="TR_COMMON_CANCEL" onclick="self.close();" value=""><%--취소--%>
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
