<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/lang/appmng/appmng_lang.js"></script>
<script src="/resources/js/appMng/mobileAppUpdate/form.js" type="text/babel"></script>
<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title trn" data-trn-key="TR_APPMNG_TITLE2"><%--버전관리--%></p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
                <%--<hr class="subLine">--%>
                <form id="saveForm">
                    <table class="pop_tbl_t2">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPMNG_APP_VERSION"><%--버전--%></th>
                            <td><input type="text" name="appVersion" value="${version.appVersion}" ${version != null ? "readonly" : ""}></td>
                            <th class="trn" data-trn-key="TR_APPMNG_APP_ESSENTIAL_UPDATE_YN"><%--필수 업데이트 유무--%></th>
                            <td>
                                <label class="dis_ib w80">
                                    <input type="radio" name="appEssential" value="0" ${!version.appEssential ? 'checked' : ''}><span class="trn" data-trn-key="TR_APPMNG_APP_ESSENTIAL_UPDATE_N"><%--자율--%></span>
                                </label>
                                <label class="dis_ib mw80">
                                    <input type="radio" name="appEssential" value="1" ${version.appEssential ? 'checked' : ''}><span class="trn" data-trn-key="TR_APPMNG_APP_ESSENTIAL_UPDATE_Y"><%--필수--%></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPMNG_APP_EXPLAIN"><%--버전 설명--%></th>
                            <td colspan="3">
                                <textarea name="appExplain" class="wp100 h200" style="resize: none">${version.appExplain}</textarea>
                            </td>
                        </tr>
                    </table>
                </form>

                <div class="btn-area">
                    <input type="button" class="btn-base btn-add btn-large mr5 saveBtn trn" data-trn-value="TR_COMMON_${version != null ? "MODIFIED" : "REGISTRATION"}" value="" onclick="save()"><%--수정 or 등록--%>
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