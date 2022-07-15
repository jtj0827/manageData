<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="b-tableWrap mt20">
    <form id="dashboardForm">
        <input type="hidden" name="company_idx" value="${customer.idx}">
    </form>
    <table class="b-listTable b-listTable--border">
        <caption class="offscreen trn" data-trn-key="TR_CLOUD_ADDITIONAL_SERVICE"><%--부가서비스--%></caption>
        <colgroup>
            <col width="20%">
            <col width="30%">
            <col width="20%">
            <col width="30%">
        </colgroup>
        <tr>
            <th class="trn" data-trn-key="TR_CLOUD_SALSE_PARTNER_NAME"><%--영업 파트너사 명--%></th>
                <td ${customer.groupwareUseYn ? '' : 'colspan="3"'}>
                    <c:if test="${customer.partnerIdx eq null || customer.partnerIdx eq 0}">
                        <span class="trn" data-trn-key="TR_KIWONTECH"><%--기원테크--%></span>
                    </c:if>
                    <c:if test="${customer.partnerIdx != null && customer.partnerIdx != 0}">
                        ${partner.name}
                    </c:if>
                </td>
                <c:if test="${customer.groupwareUseYn}">
                    <th class="trn" data-trn-key="TR_CLOUD_GROUPWARE_QUANTITY"><%--그룹웨어 용량--%></th>
                    <td>${companyInfo.groupware_limit} GB</td>
                </c:if>
<%--            <td colspan="3">${customer.partnerIdx eq null || customer.partnerIdx eq 0 ? '기원테크' : partner.name}</td>--%>
        </tr>
        <tr>
            <th class="trn" data-trn-key="TR_CLOUD_COMPANY_QUANTITY"><%--업체 할당 용량--%></th>
            <td id="totalStorage">${secuMailCompanyInfo ne null ? secuMailCompanyInfo.company_quantity : '0'} GB</td>
            <th class="trn" data-trn-key="TR_CLOUD_USER_ALLOCATE_TOTAL_QUANTITY"><%--사용자 총 할당 용량--%></th>
            <td id="useStorage">
                <c:if test="${sumByStaff != null && sumByStaff != ''}">
                    ${secuMailCompanyInfo ne null && (sumByStaff ne null && sumByStaff ne '') ? sumByStaff : '0 GB'}
                </c:if>
                <c:if test="${sumByStaff == null || sumByStaff == ''}">
                    ${secuMailCompanyInfo ne null && (mailTotalSize ne null && mailTotalSize ne '') ? mailTotalSize : '0 GB'}
                </c:if>
            </td>
        </tr>
    </table>
</div>