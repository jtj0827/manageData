<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header_popup.jsp" %>
<script src="/resources/js/customerMng/customer/popup.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title trn" data-trn-key="TR_CLOUD_TITLE_REJECT"><%--고객사 관리 > 반려--%></p>
        <div class="con_view">
            <div class="container_pop b-tableWrap" style="width: 680px">
                <%--<hr class="subLine">--%>
                <form id="approvalForm">
                    <input type="hidden" name="idx" value="${param.idx}">
                    <input type="hidden" name="approvalState" value="R">
                    <table class="b-listTable b-listTable--border">
                        <colgroup>
                            <col width="20%">
                            <col width="*%">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_REJECTION_REASON"><%--반려사유--%></th>
                            <td>
                                <textarea name="refuseReason" class="mb5 wp100 h100" style="resize: none"></textarea>
                            </td>
                        </tr>
                    </table>
                </form>

                <p class="clear mt10 a_center" style="overflow:hidden;">
                    <span class="a_center">
                        <input type="button" class="btn-large btn-detail trn" data-trn-value="TR_CLOUD_APPROVAL_STATE_REJECTED" onclick="refuseAjax();" value="반려">
                        <input type="button" class="btn-large trn" data-trn-key="TR_COMMON_CANCEL" onclick="self.close();" value="취소">
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
