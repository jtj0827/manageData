<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/info/form.js" type="text/babel"></script>
<script src="/resources/js/serverMng/info/serverCommon.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">서버 정보 관리</h1>

    <div class="l-maxwrap">
        <form id="saveForm">
            <c:if test="${serverInfo.serverIdx > 0}"><input type="hidden" name="serverIdx" id="idx" value="${serverInfo.serverIdx}"></c:if>
            <div id="common_tempArea"></div>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">서버 정보</h1>
                </div>

                <p style="color: red; text-align: right" class="lh20 dis_b mt10"> * 표시는 필수 입력 항목입니다.</p>

                <div class="b-tableWrap mt10">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">서버 정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th><span class="necessary">서버명칭</span></th>
                            <td>
                                <input type="text" name="name" class="default-input w155" value="${serverInfo.name}">
                            </td>
                            <th><span class="necessary">입고일</span></th>
                            <td>
                                <input type="text" name="receivingDate" class="default-input calendar w155" value="${serverInfo.formatedReceivingDate}" readonly>
                            </td>
                        </tr>

                        <tr>
                            <th><span class="necessary">CPU</span></th>
                            <td>
                                <input type="text" name="cpu" value="${serverInfo.cpu}" class="w155">
                            </td>
                            <th><span class="necessary">RAM</span></th>
                            <td>
                                <input type="text" name="ram" value="${serverInfo.ram}" class="w155">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">HDD</span></th>
                            <td><input type="text" name="hdd" class="default-input w155" value="${serverInfo.hdd}"></td>
                            <th>IP</th>
                            <td><input type="text" name="ip" class="default-input w155" value="${serverInfo.ip}"></td>
                        </tr>
                        <tr>
                            <th>Storage</th>
                            <td style="padding: 0;" class="v_top" colspan="5">
                                <table>
                                    <colgroup>
                                        <col width="13%">
                                        <col width="16.8%">
                                        <col width="20%">
                                        <col width="23%">
                                        <col width="7%">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th class="gray">구분</th>
                                        <th class="gray">용량</th>
                                        <th class="gray">인치</th>
                                        <th class="gray">입고일</th>
                                        <th class="gray a-center"><input type="button" class="mViewBtn_permit dis_b" value="+" onclick="addStorageLine();" style="width: 30px; margin: 0 auto"></th>
                                    </tr>
                                    </thead>
                                    <tbody id="storageList">
                                    <c:forEach var="storage" items="${serverInfo.storageList}">
                                        <tr>
                                            <td class="a_center bb-n">
                                                <select name="gubun" class="wp100">
                                                    <option value="H" ${storage.gubun eq 'H' ? 'selected' : ''}>SATA</option>
                                                    <option value="S" ${storage.gubun eq 'S' ? 'selected' : ''}>SSD</option>
                                                    <option value="A" ${storage.gubun eq 'A' ? 'selected' : ''}>SAS</option>
                                                </select>
                                            </td>
                                            <td class="a_center bd-n">
                                                <input type="text" name="capacity" class="default-input wp100" value="${storage.capacity}">
                                            </td>
                                            <td class="a_center bd-n">
                                                <select name="inch" class="wp100">
                                                    <option value="2.5" ${storage.inch eq '2.5' ? 'selected' : ''}>2.5인치</option>
                                                    <option value="3.5" ${storage.inch eq '3.5' ? 'selected' : ''}>3.5인치</option>
                                                    <option value="0.0" ${storage.inch eq '0.0' ? 'selected' : ''}>확인 요망</option>
                                                </select>
                                            </td>
                                            <td class="a_center bd-n">
                                                <fmt:formatDate value="${storage.storageDate}" pattern="yyyy-MM-dd" var="storageDate"/>
                                                <input type="text" name="storageDate" class="default-input calendar w155" value="${storageDate}" readonly>
                                            </td>
                                            <td class="a_center bd-n">
                                                <input type="button" class="mViewBtn_permit dis_b" value="-" style="color:#e74701; width: 30px; margin: 0 auto" onclick="removeStorage(this);">
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <th>서버 전면사진</th>
                            <td colspan="3">
                                <c:if test="${not empty beForeImg}">
                                    <p>${beForeImg.name}
                                        <input type="button" class="mViewBtn_permit" value="-" style="color:#e74701; width: 30px;" onclick="deleteAttach(this, ${serverImg.idx})">
                                    </p>
                                </c:if>
                                <input type="file" name="serverImageFile" class="dis_b w295">
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">관리 정보</h1>
                </div>

                <div class="b-tableWrap mt10">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">관리 정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th><span class="necessary">OS 종류</span></th>
                            <td>
                                <select name="osCode" class="wp100">
                                    <option value="">선택</option>
                                    <c:forEach var="code" items="${osList}">
                                        <option value="${code.code}" ${serverInfo.osCode eq code.code ? 'selected' : ''}>${code.codeExp}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <th>OS 설치일자</th>
                            <td>
                                <input type="text" name="osInstallDate" class="default-input calendar w155" value="${serverInfo.formatedOsInstallDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>OS 업데이트일자</th>
                            <td>
                                <input type="text" name="osUpdateDate" class="default-input calendar w155" value="${serverInfo.formatedOsUpdateDate}" readonly>
                            </td>
                            <th>OS 리부팅일자</th>
                            <td colspan="3">
                                <input type="text" name="osRebootDate" class="default-input calendar w155" value="${serverInfo.formatedOsRebootDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">운영체제 아이디</span></th>
                            <td>
                                <input type="text" name="osId" class="default-input w155" value="${serverInfo.osId}">
                            </td>
                            <th><span class="necessary">운영체제 비밀번호</span></th>
                            <td>
                                <input type="text" name="osPwd" class="default-input w155" value="${serverInfo.osPwd}">
                            </td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td colspan="3">
                                <textarea name="note" class="wp100 h100" style="resize: none">${serverInfo.note}</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

        </form>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5" value="${serverInfo.serverIdx > 0 ?  '수정' : '등록'}" onclick="saveConfirm()">
            <c:choose>
                <c:when test="${serverInfo.serverIdx > 0}">
                    <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view?serverIdx=${serverInfo.serverIdx}'">
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