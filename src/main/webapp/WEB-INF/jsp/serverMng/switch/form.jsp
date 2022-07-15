<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/switch/form.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">스위치 장비 관리</h1>
<%--    <form id="IDCinstallLocation">--%>
<%--        <input type="hidden" name="installLocation">--%>
<%--    </form>--%>
    <div class="l-maxwrap">
        <form id="saveForm">
            <input type="hidden" name="delFileIdxArray" id="delFileIdxArray">
            <c:if test="${switchEqip.idx > 0}"><input type="hidden" name="idx" id="idx" value="${switchEqip.idx}"></c:if>
            <div id="common_tempArea"></div>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">장비 정보</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">스위치 장비 관리</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th><span class="necessary">장비 이름</span></th>
                            <td><input type="text" class="default-input" name="name" value="${switchEqip.name}"></td>
                            <th><span class="necessary">관리번호</span></th>
                            <td>
                                <input type="hidden" id="managementNumberCheck" value="${switchEqip != null ? 'true' : 'false'}">
                                <input type="text" class="default-input" name="managementNumber" value="${switchEqip.managementNumber}" onchange="managementNumberChange()">
                                <input type="button" class="btn btn-baseRound ml10" onclick='managementNumberDuplicateCheck(${switchEqip.idx != null and serverInfo.idx > 0 ? serverInfo.idx : 0})' value="중복확인">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">장비 구분</span></th>
                            <td><input type="text" class="default-input" name="gubun" value="${switchEqip.gubun}"></td>
                            <th><span class="necessary">장비 종류</span></th>
                            <td>
                                <select name="kindGubun" class="default-input wp80">
                                    <option value="">선택</option>
                                    <option value="I" ${switchEqip.kindGubun == 'I' ? 'selected':''}>내부망</option>
                                    <option value="E" ${switchEqip.kindGubun == 'E' ? 'selected':''}>외부망</option>
                                    <option value="N" ${switchEqip.kindGubun == 'N' ? 'selected':''}>미확정</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">랙번호</span></th>
                            <td>
                                <select name="rackNumber" class="w120">
                                    <option value="">선택</option>
                                    <c:forEach var="rackNumber" items="${rackNumber}">
                                        <option value="${rackNumber.idx}" ${rackNumber.idx eq switchEqip.rackNumber ? 'selected' : ''}>${rackNumber.rackNumber}</option>
                                    </c:forEach>
                                </select>
                                /
                                <input type="number" class="w120" name="subRackNumber" value="${switchEqip.subRackNumber}">
                            </td>
                            <th><span class="necessary">사용 여부</span></th>
                            <td>
                                <label class="dis_ib w80">
                                    <input type="radio" name="useYn" value="1" checked> 사용함
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="useYn" value="0" ${switchEqip != null && switchEqip.useYn == 0 ? 'checked' : ''}> 사용 안함
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>소유자</th>
                            <td>
                                <select name="ownerIdx" class="w155">
                                    <option value="0">선택</option>
                                    <c:forEach var="owner" items="${ownerList}">
                                        <option value="${owner.idx}" ${switchEqip.ownerIdx == owner.idx ? 'selected' : ''}>${owner.ownerName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>서버 전면사진</th>
                            <td colspan="3">
                                <c:if test="${not empty beForeImg}">
                                    <p>${beForeImg.name}
                                        <input type="button" class="mViewBtn_permit" id="switchImageFileBeforeDelBtn" value="-" style="color:#e74701; width: 30px;" onclick="deleteAttach(this, ${beForeImg.idx})">
                                    </p>
                                </c:if>
                                <input type="file" name="switchImageFileBefore" class="dis_b" onchange="fileTypeCheck(this)">
                            </td>

                        </tr>
                        <tr>
                            <th>서버 후면사진</th>
                            <td colspan="3">
                                <c:if test="${not empty afterImg}">
                                    <p>${afterImg.name}
                                        <input type="button" class="mViewBtn_permit" id="switchImageFileAfterDelBtn" value="-" style="color:#e74701; width: 30px;" onclick="deleteAttach(this, ${afterImg.idx})">
                                    </p>
                                </c:if>
                                <input type="file" name="switchImageFileAfter" class="dis_b" onchange="fileTypeCheck(this)">
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
        </form>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5" value="${switchEqip.idx > 0 ?  '수정' : '등록'}" onclick="saveConfirm()">
            <c:choose>
                <c:when test="${switchEqip.idx > 0}">
                    <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view?idx=${switchEqip.idx}'">
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