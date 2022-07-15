<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/serverMng/ipInfo/popup/popupView.js" type="text/babel"></script>
<div id="wrapper_pop">
    <div id="article_pop">
        <%--<p class="pop_back_top"></p>--%>
        <p class="pop_title">배정 IP관리</p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
                <%--<hr class="subLine">--%>
                <form id="deleteForm">
                    <input type="hidden" name="idx" value="${serverIpInfo.idx}">
                </form>

                    <table class="pop_tbl_t2">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>IP</th>
                            <td>${serverIpInfo.assignmentIp}</td>
                            <th>등록일</th>
                            <td>${serverIpInfo.formatedRegDate}</td>
                        </tr>
                        <tr>
                            <th>IDC 위치</th>
                            <td>${serverIpInfo.idcAddress}</td>
                            <th>사용 구분</th>
                            <td>${serverIpInfo.useGubunExp}</td>
                        </tr>
                        <tr>
                            <th>서브넷 마스크</th>
                            <td>${serverIpInfo.subnet}</td>
                            <th>게이트 웨이</th>
                            <td>${serverIpInfo.gateway}</td>
                        </tr>
                        <tr>
                            <th>IP정보</th>
                            <td>${serverIpInfo.ipInfo}</td>
                            <th>사용 유무</th>
                            <td>${serverIpInfo.useYn ? '사용':'미사용'}</td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td colspan="3" style="white-space: pre-wrap;">${serverIpInfo.note}</td>
                        </tr>
                    </table>

                    <div class="btn-area">
                        <input type="button" class="btn-rm btn-large" onclick="deleteAjax();" value="삭제">
                        <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="moveModPage()">
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