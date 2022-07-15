<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/customerMng/partner/manager/form.js" type="text/babel"></script>

<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title">파트너사 관리 > 담당자 관리</p>
        <div class="con_view">
            <div class="container_pop b-tableWrap" style="width: 850px">
                <%--<hr class="subLine">--%>
                <input type="hidden" id="isIdDuplicateCheck" value="${manager.idx > 0 ? "true" : "false"}">
                <form id="managerForm">
                    <input type="hidden" name="partnerIdx" value="${param.partnerIdx}">
                    <c:if test="${manager.idx > 0}"><input type="hidden" id="idx" name="idx" value="${manager.idx}"></c:if>
                    <table class="b-listTable b-listTable--border">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <c:choose>
                                    <c:when test="${manager.idx > 0}">${manager.id}</c:when>
                                    <c:otherwise>
                                        <input type="text" name="id" class="default-input w155">
                                        <input type="button" class="btn btn-baseRound" value="중복확인" onclick="idDuplicateCheckAjax()">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <th>이름</th>
                            <td>
                                <input type="text" name="name" class="default-input" value="${manager.name}">
                            </td>
                        </tr>
                        <tr>
                            <th>${manager.idx > 0 ? "변경 " : ""}비밀번호</th>
                            <td>
                                <input type="password" name="password" class="default-input">
                            </td>
                            <th>${manager.idx > 0 ? "변경 " : ""}비밀번호 확인</th>
                            <td>
                                <input type="password" id="pwdCheck" class="default-input">
                            </td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td>
                                <input type="text" name="phone" class="default-input" value="${manager.phone}" maxlength="13">
                            </td>
                            <th>메일주소</th>
                            <td>
                                <input type="text" name="email" class="default-input" value="${manager.email}" maxlength="70">
                            </td>
                        </tr>
                    </table>
                </form>

                <p class="clear a_center mt10" style="overflow:hidden">
                    <%-- LINE :: 수정인 경우에만 활성화 --%>
                    <c:if test="${manager.idx > 0}">
                        <span class="a_center">
                            <input type="button" class="btn-large btn-rm" onclick="deleteAjax(${manager.idx});" value="삭제">
                        </span>
                    </c:if>
                    <span class="clear a_center">
                        <input type="button" class="btn-large btn-add" onclick="save();" value="${manager.idx > 0 ? '수정' : '등록'}">
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
