<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/info/view.js" type="text/babel"></script>
<script src="/resources/js/serverMng/info/serverCommon.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">고객 정보 관리</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="customerIdx" id="idx" value="${info.customerIdx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">고객 정보</h1>
            </div>

            <div class="b-tableWrap mt10">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">고객 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>고객명</th>
                        <td>
                            ${info.name}
                        </td>
                        <th>유입경로</th>
                        <td>
                            ${info.}
                        </td>
                    </tr>

                    <tr>
                        <th><span class="necessary">CPU</span></th>
                        <td>
                            ${info.cpu}
                        </td>
                        <th><span class="necessary">RAM</span></th>
                        <td>
                            ${info.ram}
                        </td>
                    </tr>
                    <tr>
                        <th><span class="necessary">HDD</span></th>
                        <td>${info.hdd}</td>
                        <th>IP</th>
                        <td>${info.ip}</td>
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
                                </colgroup>
                                <thead>
                                <tr>
                                    <th class="gray">구분</th>
                                    <th class="gray">용량</th>
                                    <th class="gray">인치</th>
                                    <th class="gray">입고일</th>
                                </tr>
                                </thead>
                                <tbody id="storageList">
                                <c:forEach var="storage" items="${info.storageList}">
                                    <tr>
                                        <td class="a_center bb-n">
                                            <c:choose>
                                                <c:when test="${storage.gubun eq 'H'}">SATA</c:when>
                                                <c:when test="${storage.gubun eq 'S'}">SSD</c:when>
                                                <c:when test="${storage.gubun eq 'A'}">SAS</c:when>
                                            </c:choose>
                                        </td>
                                        <td class="a_center bd-n">
                                            ${storage.capacity}
                                        </td>
                                        <td class="a_center bd-n">
                                            <c:choose>
                                                <c:when test="${storage.inch eq '2.5'}">2.5인치</c:when>
                                                <c:when test="${storage.inch eq '3.5'}">3.5인치</c:when>
                                                <c:when test="${storage.inch eq '0.0'}">확인 요망</c:when>
                                            </c:choose>
                                        </td>
                                        <td class="a_center bd-n">
                                            <fmt:formatDate value="${storage.storageDate}" pattern="yyyy-MM-dd" var="storageDate"/>
                                            ${storageDate}
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${info.storageList == null}">
                                    <tr>
                                        <td class="a-center bd-n">등록된 Storage 데이터가 존재하지 않습니다.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <th>서버 전면사진</th>
                        <td colspan="3">
                            <c:if test="${not empty serverImg}">
                                <p>
                                    <img class="mt10" alt src="/file/download/${serverImg.idx}" style="max-width: 100%; height: auto">
                                </p>
                            </c:if>
                            <c:if test="${empty serverImg}">등록된 서버사진이 없습니다.</c:if>
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
                            <c:forEach var="code" items="${osList}">
                                <c:if test="${info.osCode eq code.code}">${code.codeExp}</c:if>
                            </c:forEach>
                        </td>
                        <th>OS 설치일자</th>
                        <td>
                            ${info.formatedOsInstallDate}
                        </td>
                    </tr>
                    <tr>
                        <th>OS 업데이트일자</th>
                        <td>
                            ${info.formatedOsUpdateDate}
                        </td>
                        <th>OS 리부팅일자</th>
                        <td colspan="3">
                            ${info.formatedOsRebootDate}
                        </td>
                    </tr>
                    <tr>
                        <th><span class="necessary">운영체제 아이디</span></th>
                        <td>
                            ${info.osId}
                        </td>
                        <th><span class="necessary">운영체제 비밀번호</span></th>
                        <td>
                            ${info.osPwd}
                        </td>
                    </tr>
                    <tr>
                        <th>비고</th>
                        <td colspan="3" style="white-space: pre-wrap;">${info.note}</td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteAjax()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?serverIdx=${serverInfo.serverIdx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="moveList()">
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>