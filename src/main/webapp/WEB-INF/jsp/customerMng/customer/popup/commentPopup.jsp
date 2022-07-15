<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/customerMng/customer/popup/commentPopup.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title trn" data-trn-key="TR_CLOUD_TITLE_COMMENT"><%--고객사 관리 > 코멘트--%></p>
        <div class="con_view">
            <div class="container_pop b-tableWrap" style="width: 680px">
                <%--<hr class="subLine">--%>
                <form id="saveForm">
                    <c:if test="${customerComment.idx > 0}"><input type="hidden" name="idx" value="${customerComment.idx}"></c:if>
                    <input type="hidden" name="customerGubun" value="${customerGubun}">
                    <input type="hidden" name="customerIdx" value="${param.customerIdx}">
                    <input type="hidden" name="delFileIdx" id="delFileIdx" value="">
                    <table class="b-listTable b-listTable--border">
                        <colgroup>
                            <col width="20%">
                            <col width="*%">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_ATTACH"><%--첨부파일--%></th>
                            <td>
                                <c:if test="${not empty attachedFile}">
                                    <p>
                                        <a href="/file/download/${attachedFile.idx}">${attachedFile.name}</a>
                                        <input type="button" class="mViewBtn_permit" value="-" style="color:#e74701; width: 30px;" onclick="deleteAttach(this, ${attachedFile.idx})">
                                    </p>
                                </c:if>
                                <input type="file" name="attachedFile" class="dis_b w295">
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_CONTENTS"><%--내용--%></th>
                            <c:choose>
                                <c:when test="${customerComment.idx == null || (sessionScope.accountInfo.partnerIdx == customerComment.partnerIdx && sessionScope.accountInfo.id == customerComment.regId)}">
                                    <td>
                                        <textarea name="contents" class="mb5 mt5 wp100 h100" style="resize: none">${customerComment.contents}</textarea>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td style="white-space: pre-wrap;">${customerComment.contents}</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </table>
                </form>

                <p class="clear mt10 a_center" style="overflow:hidden;">
                    <c:choose>
                        <c:when test="${customerComment.idx == null || (sessionScope.accountInfo.partnerIdx == customerComment.partnerIdx && sessionScope.accountInfo.id == customerComment.regId)}">
                            <%-- LINE :: 수정인 경우에만 활성화 --%>
                            <c:if test="${customerComment.idx > 0}">
                            <span class="a_center">
                                <input type="button" class="btn-base btn-rm btn-large trn" data-trn-value="TR_COMMON_DELETE" onclick="deleteAjax(${customerComment.idx});" value="삭제">
                            </span>
                            </c:if>
                            <span class="mt10 a_center">
                                <c:if test="${customerComment.idx > 0}">
                                    <input type="button" class="btn-large btn-add trn" data-trn-key="TR_COMMON_MODIFIED" onclick="save();" value="수정">
                                </c:if>
                                <c:if test="${customerComment.idx < 0}">
                                    <input type="button" class="btn-large btn-add trn" data-trn-key="TR_COMMON_REGISTRATION" onclick="save();" value="등록">
                                </c:if>
                                <input type="button" class="btn-large trn" data-trn-key="TR_COMMON_CANCEL" onclick="self.close();" value="취소">
                            </span>
                        </c:when>
                        <c:otherwise>
                            <span class="a_center">
                                <input type="button" class="btn-large trn" data-trn-key="TR_COMMON_CANCEL" onclick="self.close();" value="취소">
                            </span>
                        </c:otherwise>
                    </c:choose>
                </p>
            </div><!--contentBox-->
        </div><!--container_list-->
    </div>
</div><!--article-->
</div><!--section-->
</div><!--wrapper-->
</body>
</html>
