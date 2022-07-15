<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="b-tableWrap mt20">
    <table class="b-listTable b-listTable--border">
        <caption class="offscreen trn" data-trn-key="TR_CLOUD_ADDITIONAL_SERVICE"><%--부가서비스--%></caption>
        <colgroup>
            <col width="20%">
            <col width="30%">
            <col width="20%">
            <col width="30%">
        </colgroup>
        <tr>
            <th class="trn" data-trn-key="TR_CLOUD_WORKMAIL_USE"><%--업무형 메일 사용 여부--%></th>
            <td class="trn" data-trn-key="TR_COMMON_${customer.workmailUse ? "USED" : "NOT_USED"}"></td>
            <th class="trn" data-trn-key="TR_CLOUD_USE_SCHEDULE"><%--일정 관리 기능 사용 여부--%></th>
            <td class="trn" data-trn-key="TR_COMMON_${customer.useSchedule ? "USED" : "NOT_USED"}"></td>
        </tr>
        <tr>
            <th class="trn" data-trn-key="TR_CLOUD_ORGANIZATION_YN"><%--조직도 기능 사용 여부--%></th>
            <td colspan="3" class="trn" data-trn-key="TR_COMMON_${customer.organizationYn ? "USED" : "NOT_USED"}"></td>
        </tr>
    </table>
</div>