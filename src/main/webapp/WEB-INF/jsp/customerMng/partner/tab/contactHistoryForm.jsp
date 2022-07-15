<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/customerMng/partner/tab/contactHistoryForm.js" type="text/babel"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title">파트너사 관리 > 컨택 기록</p>
        <div class="con_view">
            <div class="container_pop b-tableWrap" style="width: 760px">
                <%--<hr class="subLine">--%>
                <form id="saveForm">
                    <c:if test="${contactHistory.idx > 0}"><input type="hidden" name="idx" value="${contactHistory.idx}"></c:if>
                    <input type="hidden" name="partnerIdx" value="${param.partnerIdx}">
                    <table class="b-listTable b-listTable--border">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>고객사</th>
                            <td>
                                <select id="customerIdx" name="customerIdx" class="w155">
                                    <option value="">전체</option>
                                    <c:forEach var="customer" items="${customerList}">
                                    </c:forEach>
                                </select>
                            </td>
                            <th>컨택일</th>
                            <td>
                                <input type="text" name="contactDate" class="default-input calendar 155" value="${contactHistory.formatedContactDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                                <textarea name="contents" class="mb5 mt5 wp100 h100" style="resize: none">${contactHistory.contents}</textarea>
                            </td>
                        </tr>
                    </table>
                </form>

                <p class="clear mt10 a_center" style="overflow:hidden;">
                    <%-- LINE :: 수정인 경우에만 활성화 --%>
                    <c:if test="${contactHistory.idx > 0}">
                        <span class="fl">
                            <input type="button" class="type06" onclick="deleteAjax(${contactHistory.idx});" value="삭제">
                        </span>
                    </c:if>
                    <span class="a_center">
                        <input type="button" class="btn-large btn-add" onclick="save();" value="${contactHistory.idx > 0 ? '수정' : '등록'}">
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
