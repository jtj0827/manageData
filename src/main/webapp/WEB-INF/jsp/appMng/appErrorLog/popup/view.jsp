<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/lang/appmng/appmng_lang.js"></script>
<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title trn" data-trn-key="TR_APPMNG_TITLE1"><%--에러로그--%></p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
                <%--<hr class="subLine">--%>

                    <table class="pop_tbl_t2">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPMNG_MAIL_SERVER"><%--메일서버--%></th>
                            <td>${log.mailServer}</td>
                            <th class="trn" data-trn-key="TR_APPMNG_CUSTOMER_NAME"><%--고객사 명--%></th>
                            <td>${log.customerName}</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPMNG_USER_NAME"><%--사용자 명--%></th>
                            <td>${log.userName}</td>
                            <th class="trn" data-trn-key="TR_APPMNG_APP_VERSION"><%--앱 버전--%></th>
                            <td>${log.appVersion}</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPMNG_MOBILE_NAME"><%--기기명--%></th>
                            <td>${log.mobileName}</td>
                            <th class="trn" data-trn-key="TR_APPMNG_MOBILE_VERSION"><%--모바일 버전--%></th>
                            <td>${log.mobileVersion}</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPMNG_ERROR_LOG"><%--에러로그--%></th>
                            <td colspan="3" style="white-space: pre-wrap; word-break:break-all">${log.errFunc}</td>
                        </tr>
                    </table>

                    <div class="btn-area">
                        <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_CANCEL" value="" onclick="self.close()"><%--취소--%>
                    </div>
            </div><!--contentBox-->
        </div><!--container_list-->
    </div>
</div>
<!--article-->
</div><!--section-->
</div><!--wrapper-->
</body>
</html>