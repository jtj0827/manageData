<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/serverMng/ipInfo/popup/modify.js" type="text/babel"></script>
<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title">배정 IP관리</p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
                <%--<hr class="subLine">--%>
                <form id="saveForm">
                    <input type="hidden" name="idx" id="idx" value="${serverIpInfo.idx}">
                    <table class="pop_tbl_t2">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>IP</th>
                            <td colspan="3"><input type="text" id="ip" name="assignmentIp" value="${serverIpInfo.assignmentIp}"></td>
                        </tr>
                        <tr>
                            <th>IDC 위치</th>
                            <td>
                                <select name="idcAddress" id="idcAddress" class="wp50">
                                    <option value="">선택</option>
                                    <c:forEach var="idc" items="${serverIdc}">
                                        <option value="${idc.idcAddress}" ${serverIpInfo.idcAddress == idc.idcAddress ? 'selected' : ''}>${idc.idcAddress}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <th>사용 구분</th>
                            <td>
                                <select name="useGubun" id="useGubun" class="w100">
                                    <option value="K">기원테크</option>
                                    <c:forEach items="${ipUseGubun}" var="useGubun">
                                        <c:if test="${useGubun.code != 'K'}">
                                            <option value="${useGubun.code}" ${serverIpInfo.useGubun == useGubun.code ? 'selected' : ''}>${useGubun.codeExp}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>서브넷 마스크</th>
                            <td>
                                <input type="text" class="default-input w120" id="subnet" name="subnet" maxlength="20" value="${serverIpInfo.subnet}">
                            </td>
                            <th>게이트 웨이</th>
                            <td>
                                <input type="text" class="default-input w120" id="gateway" name="gateway" maxlength="20" value="${serverIpInfo.gateway}">
                            </td>
                        </tr>
                        <tr>
                            <th>IP정보</th>
                            <td>
                                <input type="text" class="default-input w120" name="ipInfo" value="${serverIpInfo.ipInfo}">
                            </td>
                            <th>아이피 사용여부</th>
                            <td>
                                <label class="dis_ib w60">
                                    <input type="radio" name="useYn" value="1" data-target="common" ${serverIpInfo.useYn == true ? 'checked' : ''}> 사용
                                </label>
                                <label class="dis_ib w60">
                                    <input type="radio" name="useYn" value="0" data-target="common" ${serverIpInfo.useYn == false ? 'checked' : ''}> 미사용
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td colspan="3">
                                <textarea name="note" id="note" class="wp100 h100" style="resize: none">${serverIpInfo.note}</textarea>
                            </td>
                        </tr>
                    </table>
                </form>

                <div class="btn-area">
                    <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="saveIP()">
                    <input type="button" class="btn-base btn-large" value="취소" onclick="self.close()">
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