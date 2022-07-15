<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<select id="pageSize" class="default-input w100">
    <option value="20" ${param.pageSize eq '10' ? 'selected' : ''}>10개씩</option>
    <option value="30" ${param.pageSize eq '30' ? 'selected' : ''}>30개씩</option>
    <option value="50" ${param.pageSize eq '50' ? 'selected' : ''}>50개씩</option>
</select>