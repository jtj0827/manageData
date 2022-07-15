<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/rack/form.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">IDC RACK 관리</h1>
<%--    <form id="IDCinstallLocation">--%>
<%--        <input type="hidden" name="installLocation">--%>
<%--    </form>--%>
    <div class="l-maxwrap">
        <form id="saveForm">
            <c:if test="${serverRack.idx > 0}"><input type="hidden" name="idx" id="idx" value="${serverRack.idx}"></c:if>
            <div id="common_tempArea"></div>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">IDC RACK 정보</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">IDC RACK 정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>IDC 위치</th>
                            <td>
                                <select name="idcIdx" id="idcIdx" class="wp45" onchange="idcAddress()">
                                    <option value="">선택</option>
                                    <c:forEach var="IdcCountry" items="${IdcCountry}">
                                        <option value="${IdcCountry.idx}" ${IdcCountry.idx eq serverRack.idcIdx ? 'selected' : ''}>${IdcCountry.idcAddress}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <th>RACK 위치</th>
                            <td>
                                <select name="rackNumber" class="wp45">
                                    <option value="">선택</option>
                                    <c:forEach var="rackNumber" items="${rackNumber}">
                                        <option value="${rackNumber.idx}" ${rackNumber.idx eq serverRack.rackNumber ? 'selected' : ''}>${rackNumber.rackNumber}</option>
                                    </c:forEach>
                                </select>
                                /
                                <input type="number" class="wp45" name="subRackNumber" value="${serverRack.subRackNumber}">
                            </td>
                        </tr>
                        <tr>
                            <th>배정IP</th>
                            <td>
                                <select name="ipIdx" id="ipIdx" class="wp70 dis-n" readonly>
                                    <option value="">선택</option>
                                    <c:if test="${modIpData.idx != null}">
                                        <option value="${modIpData.idx}" selected>${modIpData.assignmentIp}</option>
                                    </c:if>
                                    <c:if test="${unUsingIp != null}">
                                        <c:forEach var="unUsingIp" items="${unUsingIp}">
                                            <option value="${unUsingIp.idx}">${unUsingIp.assignmentIp}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                                <span id="ipAddress">${modIpData.idx != null ? modIpData.assignmentIp : '선택된 IP가 존재하지 않습니다.'}</span>
                                <input class="wq10 ml10" type="button" value="IP찾기" onclick="popupIpList()">
                            </td>
                            <th>입고일</th>
                            <td>
                                <c:if test="${sysdate == null}">
                                    <input type="text" name="receivingDate" class="default-input calendar w155" value="${serverRack.formatedReceivingDate}" readonly>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>연결 서버</th>
                            <td colspan="3">
                                <select name="mngNum" id="mngNum" class="wp30">
                                    <option value="">선택</option>
                                    <c:if test="${modAMData.idx != null}">
                                        <option value="${modAMData.idx}" selected>${modAMData.managementNumber}/${modAMData.name}</option>
                                    </c:if>
                                    <c:forEach var="mngNum" items="${mngNum}">
                                        <option value="${mngNum.idx}" ${serverRack.mngNum eq mngNum.idx ? 'selected' : ''}>${mngNum.managementNumber}/${mngNum.name}</option>
                                    </c:forEach>
                                </select>
                                <input class="w100" type="button" value="연결 서버 찾기" onclick="popupMngNumList()">
                            </td>
                        </tr>
                        <tr>
                            <th>외부망 Switch</th>
                            <td>
                                <select name="externalSwitch" class="wp45">
                                    <option value="">선택</option>
                                    <c:forEach var="externalSwitch" items="${externalSwitchList}">
                                        <option value="${externalSwitch.idx}" ${externalSwitch.idx eq serverRack.externalSwitch ? 'selected' : ''}>${externalSwitch.name}/${externalSwitch.managementNumber}/${externalSwitch.gubun}</option>
                                    </c:forEach>
                                </select>
                                <input type="text" class="onlynumber default-input w60 ml10" name="externalSwitchPort" value="${serverRack.externalSwitchPort}">
                            </td>
                            <th>외부망 Switch</th>
                            <td>
                                <select name="subExternalSwitch" class="wp45">
                                    <option value="">선택</option>
                                    <c:forEach var="externalSwitch" items="${externalSwitchList}">
                                        <option value="${externalSwitch.idx}" ${externalSwitch.idx eq serverRack.subExternalSwitch ? 'selected' : ''}>${externalSwitch.name}/${externalSwitch.managementNumber}/${externalSwitch.gubun}</option>
                                    </c:forEach>
                                </select>
                                <input type="text" class="onlynumber default-input w60 ml10" name="subExternalSwitchPort" value="${serverRack.subExternalSwitchPort}">
                            </td>
                        </tr>
                        <tr>
                            <th>내부망 Switch</th>
                            <td>
                                <select name="internalSwitch" class="wp45">
                                    <option value="">선택</option>
                                    <c:forEach var="internalSwitch" items="${internalSwitchList}">
                                        <option value="${internalSwitch.idx}" ${internalSwitch.idx eq serverRack.internalSwitch ? 'selected' : ''}>${internalSwitch.name}/${internalSwitch.managementNumber}/${internalSwitch.gubun}</option>
                                    </c:forEach>
                                </select>
                                <input type="text" class="onlynumber default-input w60 ml10" name="internalSwitchPort" value="${serverRack.internalSwitchPort}">
                            </td>
                            <th>내부망 Switch</th>
                            <td>
                                <select name="subInternalSwitch" class="wp45">
                                    <option value="">선택</option>
                                    <c:forEach var="internalSwitch" items="${internalSwitchList}">
                                        <option value="${internalSwitch.idx}" ${internalSwitch.idx eq serverRack.subInternalSwitch ? 'selected' : ''}>${internalSwitch.name}/${internalSwitch.managementNumber}/${internalSwitch.gubun}</option>
                                    </c:forEach>
                                </select>
                                <input type="text" class="onlynumber default-input w60 ml10" name="subInternalSwitchPort" value="${serverRack.subInternalSwitchPort}">
                            </td>
                        </tr>
                        <tr>
                            <th>사용 여부</th>
                            <td colspan="${serverRack.idx > 0 ? 1 : 3}">
                                <label class="dis_ib w60">
                                    <input type="radio" name="useWhether" value="1" data-target="common" checked> 사용
                                </label>
                                <label class="dis_ib w60">
                                    <input type="radio" name="useWhether" value="0" data-target="common" ${serverRack.useWhether == 0 ? 'checked' : ''}> 미사용
                                </label>
                                <label class="dis_ib w60">
                                    <input type="radio" name="useWhether" value="3" data-target="common" ${serverRack.useWhether == 3 ? 'checked' : ''}> 중지
                                </label>
                                <label class="dis_ib w60">
                                    <input type="radio" name="useWhether" value="4" data-target="common" ${serverRack.useWhether == 4 ? 'checked' : ''}> 대기
                                </label>
                            </td>
                            <c:if test="${serverRack.idx > 0}">
                                <th>점검일</th>
                                <td colspan="3">
                                    <input type="text" name="inspectionDate" class="default-input w250" value="${serverRack.inspectionDate}">
                                </td>
                            </c:if>
                        </tr>
                        <tr>
                            <th>관리 부서</th>
                            <td colspan="3">
                                <select name="manageGubun" class="w155">
                                    <option value="">선택</option>
                                    <option value="E" ${serverRack.manageGubun eq 'E' ? 'selected' : ''}>EG-Platform 팀</option>
                                    <option value="S" ${serverRack.manageGubun eq 'S' ? 'selected' : ''}>Secu E Cloud 팀</option>
                                    <option value="O" ${serverRack.manageGubun eq 'O' ? 'selected' : ''}>운영팀</option>
                                    <option value="R" ${serverRack.manageGubun eq 'R' ? 'selected' : ''}>기타</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td colspan="3">
                                <textarea name="memo" class="wp100 h100" style="resize: none">${serverRack.memo}</textarea>
                            </td>
                        </tr>
<%--=======================================================================================================================================================--%>
<%--                        <tr>--%>
<%--                            <th>IDC 위치</th>--%>
<%--                            <td>--%>
<%--                                <select name="idcIdx" id="idcIdx" class="wp45" onchange="idcAddress()">--%>
<%--                                    <option value="">선택</option>--%>
<%--                                    <c:forEach var="IdcCountry" items="${IdcCountry}">--%>
<%--                                    <option value="${IdcCountry.idx}" ${IdcCountry.idx eq serverRack.idcIdx ? 'selected' : ''}>${IdcCountry.idcAddress}</option>--%>
<%--                                    </c:forEach>--%>
<%--                                </select>--%>
<%--                            </td>--%>
<%--                            <th>RACK 번호</th>--%>
<%--                            <td>--%>
<%--                                <select name="rackNumber" class="w120">--%>
<%--                                    <option value="">선택</option>--%>
<%--                                    <c:forEach var="rackNumber" items="${rackNumber}">--%>
<%--                                        <option value="${rackNumber.idx}" ${rackNumber.idx eq serverRack.rackNumber ? 'selected' : ''}>${rackNumber.rackNumber}</option>--%>
<%--                                    </c:forEach>--%>
<%--                                </select>--%>
<%--                                /--%>
<%--                                <input type="number" class="w120" name="subRackNumber" value="${serverRack.subRackNumber}">--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th>배정IP</th>--%>
<%--                            <td colspan="3">--%>
<%--                                <select name="ipIdx" id="ipIdx" class="w400">--%>
<%--                                    <option value="">선택</option>--%>
<%--                                    <c:if test="${modIpData.idx != null}">--%>
<%--                                        <option value="${modIpData.idx}" selected>${modIpData.assignmentIp}</option>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${unUsingIp != null}">--%>
<%--                                        <c:forEach var="unUsingIp" items="${unUsingIp}">--%>
<%--                                            <option value="${unUsingIp.idx}">${unUsingIp.assignmentIp}</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </c:if>--%>
<%--                                </select>--%>
<%--                                <input class="w100" type="button" value="IP찾기" onclick="popupIpList()">--%>
<%--                            </td>--%>
<%--                        </tr>--%>

<%--                        <tr>--%>
<%--                            <th>관리 번호</th>--%>
<%--                            <td colspan="3">--%>
<%--                                <select name="mngNum" id="mngNum" class="w400">--%>
<%--                                    <option value="">선택</option>--%>
<%--                                    <c:if test="${modAMData.idx != null}">--%>
<%--                                        <option value="${modAMData.idx}" selected>${modAMData.managementNumber}/${modAMData.name}</option>--%>
<%--                                    </c:if>--%>
<%--                                    <c:forEach var="mngNum" items="${mngNum}">--%>
<%--                                        <option value="${mngNum.idx}" ${serverRack.mngNum eq mngNum.idx ? 'selected' : ''}>${mngNum.managementNumber}/${mngNum.name}</option>--%>
<%--                                    </c:forEach>--%>
<%--                                </select>--%>
<%--                                <input class="w100" type="button" value="관리번호 찾기" onclick="popupMngNumList()">--%>
<%--                            </td>--%>
<%--                        </tr>--%>

<%--                        <tr>--%>
<%--                            <th>용도</th>--%>
<%--                            <td>--%>
<%--                                <select name="useGubunCode" class="wp45">--%>
<%--                                    <option value="">선택</option>--%>
<%--                                    <c:forEach var="code" items="${useGubunList}">--%>
<%--                                    <option value="${code.code}" ${serverRack.useGubunCode eq code.code ? 'selected' : ''}>${code.codeExp}</option>--%>
<%--                                    </c:forEach>--%>
<%--                                </select>--%>
<%--                                <input type="text" name="useGubunCodeEtc" class="default-input wp50" value="${serverRack.useGubunCodeEtc}">--%>
<%--                                <span class="useGubunNotEtcArea">--%>
<%--                                    <select name="serverGubun" class="wp50">--%>
<%--                                        <option value="">선택</option>--%>
<%--                                        <option value="RG" ${serverRack.serverGubun == 'RG' ? 'selected' : ''}>ReceiveGUARD</option>--%>
<%--                                        <option value="SG" ${serverRack.serverGubun == 'SG' ? 'selected' : ''}>Send&SpamGUARD</option>--%>
<%--                                        <option value="RC" ${serverRack.serverGubun == 'RC' ? 'selected' : ''}>Cube</option>--%>
<%--                                        <option value="SD" ${serverRack.serverGubun == 'SD' ? 'selected' : ''}>SendGUARD</option>--%>
<%--                                        <option value="SP" ${serverRack.serverGubun == 'SP' ? 'selected' : ''}>SpamGUARD</option>--%>
<%--                                        <option value="MS" ${serverRack.serverGubun == 'MS' ? 'selected' : ''}>Mail Server</option>--%>
<%--                                        <option value="SO" ${serverInfo.serverGubun == 'SO' ? 'selected' : ''}>SPAMOUT</option>--%>
<%--                                        <option value="EG" ${serverInfo.serverGubun == 'EG' ? 'selected' : ''}>EML Generator</option>--%>
<%--                                    </select>--%>
<%--                                </span>--%>
<%--                            </td>--%>
<%--                            <th>입고일</th>--%>
<%--                            <td>--%>
<%--                                <c:if test="${sysdate == null}">--%>
<%--                                    <input type="text" name="receivingDate" class="default-input calendar w155" value="${serverRack.formatedReceivingDate}" readonly>--%>
<%--                                </c:if>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <c:if test="${serverRack.idx > 0}">--%>
<%--                            <tr>--%>
<%--                                <th>점검일</th>--%>
<%--                                <td colspan="3">--%>
<%--                                    <input type="text" name="inspectionDate" class="default-input" value="${serverRack.inspectionDate}">--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                        </c:if>--%>
<%--                        <tr>--%>
<%--                            <th rowspan="2">메모</th>--%>
<%--                            <td colspan="3" rowspan="2">--%>
<%--                                <textarea name="memo" class="wp100 h100" style="resize: none">${serverRack.memo}</textarea>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr></tr>--%>
<%--                        <tr>--%>
<%--                            <th>사용 여부</th>--%>
<%--                            <td colspan="3">--%>
<%--                                <label class="dis_ib w80">--%>
<%--                                    <input type="radio" name="useWhether" value="true" data-target="common" checked> 사용--%>
<%--                                </label>--%>
<%--                                <label class="dis_ib w80">--%>
<%--                                    <input type="radio" name="useWhether" value="false" data-target="common" ${serverRack.useWhether == false ? 'checked' : ''}> 미사용--%>
<%--                                </label>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr id="common_raidPossibleArea" class="dis-n">--%>
<%--                        </tr>--%>
                    </table>
                </div>
            </section>
        </form>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5" value="${serverRack.idx > 0 ?  '수정' : '등록'}" onclick="rackSaveConfirm()">
            <c:choose>
                <c:when test="${serverRack.idx > 0}">
                    <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view?idx=${serverRack.idx}'">
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