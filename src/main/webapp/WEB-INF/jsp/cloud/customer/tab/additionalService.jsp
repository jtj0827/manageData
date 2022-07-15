<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="b-tableWrap mt20" style="width: 95%;">
    <table class="b-listTable b-listTable--border">
        <caption class="offscreen trn" data-trn-key="TR_CLOUD_ADDITIONAL_SERVICE"><%--부가서비스--%></caption>
        <colgroup>
            <col width="20%">
            <col width="%%">
            <col width="20%">
        </colgroup>
        <tr>
            <th class="trn" data-trn-key="TR_CLOUD_ADD_STORAGE"><%--용량 추가--%></th>
            <td>
                <fmt:formatNumber value="${customer.addStorage > 0 ? customer.addStorage : 0}" pattern="#,###"/>GB
                <p style="color: #0b94d1;" class="trn" data-trn-key="TR_CLOUD_ADD_STORAGE_UNIT"><%--(단위 : 10GB)--%></p>
            </td>
            <td style="text-align: right;">
                <fmt:formatNumber value="${customerCalc.storageCalc > 0 ? customerCalc.storageCalc : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
            </td>
        </tr>
        <c:if test="${customer.secuEcloudGubun eq 'I'}">
            <tr>
                <th class="trn" data-trn-key="TR_CLOUD_ADD_ACCOUNT"><%--계정 추가--%></th>
                <td>
                    <fmt:formatNumber value="${customer.addAccountCount > 0 ? customer.addAccountCount : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span>
                    <p style="color: #0b94d1;" class="trn" data-trn-key="TR_CLOUD_ACCOUNT_DEFAULT_COUNT"><%--(30계정 무료제공)--%></p>
                </td>
                <td style="text-align: right;">
                    <fmt:formatNumber value="${customerCalc.accountCalc > 0 ? customerCalc.accountCalc : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                </td>
            </tr>
            <tr>
                <th class="trn" data-trn-key="TR_CLOUD_GROUP_MAIL_COUNT"><%--그룹 메일--%></th>
                <td>
                    <fmt:formatNumber value="${customer.groupMailCount > 0 ? customer.groupMailCount : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span>
                    <p style="color: #0b94d1;" class="trn" data-trn-key="TR_CLOUD_GROUP_MAIL_COUNT_UNIT"><%--(신청 단위 5계정)--%></p>
                </td>
                <td style="text-align: right;">
                    <fmt:formatNumber value="${customerCalc.groupMailCalc > 0 ? customerCalc.groupMailCalc : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                </td>
            </tr>
        </c:if>
        <c:if test="${customer.secuEcloudGubun == 'N'}">
            <tr>
                <th class="trn" data-trn-key="TR_CLOUD_ADD_EXCHANGE_SIZE"><%--메일 백업 용량 추가--%></th>
                <td>
                    <fmt:formatNumber value="${customer.addExchangeSize > 0 ? customer.addExchangeSize : 0}" pattern="#,###"/>GB
                    <p style="color: #0b94d1;" class="trn" data-trn-key="TR_CLOUD_ADD_EXCHANGE_SIZE_UNIT"><%--(단위 : 50GB)--%></p>
                </td>
                <td style="text-align: right;">
                    <fmt:formatNumber value="${customer.addExchangeSize > 0 ? (customer.addExchangeSize/50) * 20000 : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                </td>
            </tr>
            <tr>
                <th class="trn" data-trn-key="TR_CLOUD_ADD_ONEDRIVE_SIZE"><%--그룹웨어 용량 추가--%></th>
                <td>
                    <fmt:formatNumber value="${customer.addOnedriveSize > 0 ? customer.addOnedriveSize : 0}" pattern="#,###"/>GB
                    <p style="color: #0b94d1;" class="trn" data-trn-key="TR_CLOUD_ADD_ONEDRIVE_SIZE_UNIT"><%--(단위 : 10GB)--%></p>
                </td>
                <td style="text-align: right;">
                    <fmt:formatNumber value="${customer.addOnedriveSize > 0 ? (customer.addOnedriveSize/10) * 10000 : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                </td>
            </tr>
        </c:if>
        <c:if test="${customer.secuEcloudGubun ne 'N'}">
            <tr>
                <th rowspan="3" class="trn" data-trn-key="TR_CLOUD_MOVE_MAIL_STORAGE"><%--메일 데이터 이전--%></th>
                <td>
                    <span class="dis-ib w120 trn" data-trn-key="TR_CLOUD_MOVE_MAIL_STORAGE_VALUE"><%--이전할 메일 용량--%></span><fmt:formatNumber value="${customer.moveMailStorage > 0 ? customer.moveMailStorage : 0}" pattern="#,###"/>GB
                </td>
                <td style="text-align: right;" rowspan="3">
                    <fmt:formatNumber value="${customerCalc.moveMailCalc > 0 ? customerCalc.moveMailCalc : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                </td>
            </tr>
            <tr>
                <td style="border-right: 1px solid #ddd;">
                    <span class="dis-ib w120 trn" data-trn-key="TR_CLOUD_MOVE_MAIL_ACCOUNT_COUNT_VALUE"><%--이전할 계정수--%></span><fmt:formatNumber value="${customer.moveMailAccountCount > 0 ? customer.moveMailAccountCount : 0}" pattern="#,###"/><span class="trn" data-trn-key="TR_COMMON_COUNT"><%--개--%></span>
                </td>
            </tr>
            <tr>
                <td style="border-right: 1px solid #ddd;">
                    <c:set var="moveEmailGubun" value="${fn:replace(customer.moveEmailGubun, ',', '')}"/>
                    <span class="dis-ib w120 trn" data-trn-key="TR_CLOUD_MOVE_EMAIL_GUBUN"><%--이전할 메일 종류--%></span><span class="trn" data-trn-key="TR_CLOUD_MOVE_EMAIL_GUBUN_${moveEmailGubun}"><%--${moveEmailGubun == "C" ? "기업 메일" : ( moveEmailGubun == "I" ? "개인 메일" : "이전 안함" )}--%></span>
                </td>
            </tr>
        </c:if>
        <tr>
            <th class="trn" data-trn-key="TR_CLOUD_ADDITIONAL_SERVICE_TOTAL_PRICE"><%--부가서비스 신청 가격 (총)--%></th>
            <td colspan="2" style="text-align: right;" class="point-bg border-b">
                <c:if test="${customer.secuEcloudGubun == 'I'}">
                    <span class="point-num"><fmt:formatNumber value="${customerCalc.storageCalc + customerCalc.accountCalc + customerCalc.groupMailCalc + customerCalc.moveMailCalc}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                </c:if>
                <c:if test="${customer.secuEcloudGubun == 'P'}">
                        <span class="point-num"><fmt:formatNumber value="${customerCalc.storageCalc + customerCalc.moveMailCalc}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                </c:if>
                <c:if test="${customer.secuEcloudGubun == 'N'}">
                    <span class="point-num"><fmt:formatNumber value="${customerCalc.storageCalc + customerCalc.moveMailCalc}" pattern="#,###"/></span> <span class="trn" data-trn-key="TR_COMMON_WON"><%--원--%></span>
                </c:if>
            </td>
        </tr>
    </table>
</div>