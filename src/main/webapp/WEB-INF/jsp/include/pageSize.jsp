<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<select id="pageSizeSelect" class="default-input w100" onchange="setPageSize();">
    <option class="trn" data-trn-key="TR_COMMON_PAGE_SIZE_10" value="10" ${paging.pageSize eq '10' ? 'selected' : ''}><%--10개씩--%></option>
    <option class="trn" data-trn-key="TR_COMMON_PAGE_SIZE_30" value="30" ${paging.pageSize eq '30' ? 'selected' : ''}><%--30개씩--%></option>
    <option class="trn" data-trn-key="TR_COMMON_PAGE_SIZE_50" value="50" ${paging.pageSize eq '50' ? 'selected' : ''}><%--50개씩--%></option>
</select>