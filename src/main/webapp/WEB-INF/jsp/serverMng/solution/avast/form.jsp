<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>

<script src="/resources/js/serverMng/solution/avast/form.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">Avast 라이센스 관리</h1>
<%--    <form id="IDCinstallLocation">--%>
<%--        <input type="hidden" name="installLocation">--%>
<%--    </form>--%>
    <div class="l-maxwrap">
        <form id="saveForm">
            <c:if test="${license.idx > 0}"><input type="hidden" name="idx" id="idx" value="${license.idx}"></c:if>
            <div id="common_tempArea"></div>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">Avast 라이센스 정보</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">Avast 라이센스 정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>

                        <tr>
                            <th><span class="necessary">제품명</span></th>
                            <td>
                                <input type="text" name="productName" class="default-input" value="${license.productName}">
                            </td>
                            <th><span class="necessary">만료일자</span></th>
                            <td>
                                <input type="text" name="expiryDate" class="default-input calendar w155" value="${license.formatedExpiryDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">활성화 코드</span></th>
                            <td>
                                <input type="text" name="activeCode" class="default-input wp90" value="${license.activeCode}">
                            </td>
                            <th><span class="necessary">최대 사용가능 장비수</span></th>
                            <td>
                                <input type="text" name="maxUseEquip" class="default-input onlynumber autoComma" value="${license == null ? '0' : license.maxUseEquip}">
                            </td>
                        <%--</tr>
                        <tr>
                            <th>임시 사용 서버정보</th>
                            <td colspan="3" style="padding:0">
                                <table class="plus">
                                    <caption class="offscreen">임시 사용 장비</caption>
                                    <colgroup>
                                        <col width="50%"> &lt;%&ndash;번호&ndash;%&gt;
                                        <col width="50%"> &lt;%&ndash;번호&ndash;%&gt;
                                        <col width="5%"> &lt;%&ndash;+버튼&ndash;%&gt;
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th class="a-center">서버명칭</th>
                                        <th class="a-center">용도</th>
                                        <th class="a-center"><input type="button" class="mViewBtn_permit dis_b" onclick="addLine()" value="+" style="width: 30px; margin: 0 auto"></th>
                                    </tr>
                                    </thead>
                                    <tbody id="tempServerBody">
                                        <tr>
                                            <td class="a_center" style="text-align: center"><input type="text" name="productName" class="default-input wp90" value=""></td>
                                            <td class="a_center">
                                                <select name="tempServer.useGubunCode" class="useGubunCode w155" onchange="setAreaByUseGubunCode(false, this)">
                                                    <option value="">선택</option>
                                                    <c:forEach var="code" items="${useGubunList}">
                                                        <option value="${code.code}" ${serverInfo.useGubunCode eq code.code ? 'selected' : ''}>${code.codeExp}</option>
                                                    </c:forEach>
                                                </select>
                                                <input type="text" name="tempServer.useGubunCodeEtc" class="useGubunCodeEtc default-input w155" value="${serverInfo.useGubunCodeEtc}">
                                                <select name="tempServer.serverGubun" class="w155 serverGubun">
                                                    <option value="">선택</option>
                                                    <option value="RG" ${serverInfo.serverGubun == 'RG' ? 'selected' : ''}>ReceiveGUARD</option>
                                                    <option value="RC" ${serverInfo.serverGubun == 'RC' ? 'selected' : ''}>CUBE</option>
                                                    <option value="SG" ${serverInfo.serverGubun == 'SG' ? 'selected' : ''}>Send&SpamGUARD</option>
                                                    <option value="SD" ${serverInfo.serverGubun == 'SD' ? 'selected' : ''}>SendGUARD</option>
                                                    <option value="SP" ${serverInfo.serverGubun == 'SP' ? 'selected' : ''}>SpamGUARD</option>
                                                    <option value="SM" ${serverInfo.serverGubun == 'SM' ? 'selected' : ''}>SecuMail</option>
                                                    <option value="SO" ${serverInfo.serverGubun == 'SO' ? 'selected' : ''}>SPAMOUT</option>
                                                    <option value="EG" ${serverInfo.serverGubun == 'EG' ? 'selected' : ''}>EML Generator</option>
                                                    <option value="IG" ${serverInfo.serverGubun == 'IG' ? 'selected' : ''}>통합</option>
                                                </select>
                                            </td>
                                            <td class="a_center"><input type="button" class="mViewBtn_block dis_b" value="-" style="width: 30px; margin: 0 auto"></td>
                                        </tr>
                                    </tbody>

                                </table>
                            </td>
--%>
                        </tr>
                    </table>
                </div>
            </section>
        </form>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5" value="${solution.idx > 0 ?  '수정' : '등록'}" onclick="saveConfirm()">
            <c:choose>
                <c:when test="${solution.idx > 0}">
                    <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view?idx=${license.idx}'">
                </c:when>
                <c:otherwise>
                    <input type="button" class="btn-base btn-large" value="취소" onclick="moveList();">
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>