<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/serverMng/switch/view.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">스위치 장비 관리</h1>
    <div class="l-maxwrap">
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
                        <th>장비 이름</th>
                        <td>${switchEqip.name}</td>
                        <th>관리번호</th>
                        <td>
                            ${switchEqip.managementNumber}
                        </td>
                    </tr>
                    <tr>
                        <th>장비 구분</th>
                        <td>${switchEqip.gubun}</td>
                        <th>장비 종류</th>
                        <td>
                            <c:choose>
                                <c:when test="${switchEqip.kindGubun == 'I'}">
                                    내부망
                                </c:when>
                                <c:when test="${switchEqip.kindGubun == 'E'}">
                                    외부망
                                </c:when>
                                <c:when test="${switchEqip.kindGubun == 'N'}">
                                    미확정
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>랙번호</th>
                        <td>
                            ${switchEqip.rackNum} / ${switchEqip.subRackNumber}
                        </td>
                        <th>사용 여부</th>
                        <td>
                            <c:choose>
                                <c:when test="${switchEqip.useYn == 0}">
                                    미사용
                                </c:when>
                                <c:when test="${switchEqip.useYn == 1}">
                                    사용
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>소유자</th>
                        <td colspan="3">
                            ${switchEqip.ownerName}
                        </td>
                    </tr>
                    <tr>
                        <th>서버 전면사진</th>
                        <td colspan="3">
                            <c:if test="${empty beForeImg}">등록된 전면사진이 없습니다.</c:if>
                            <span class="dis_b">
                                <a href="/file/download/${beForeImg.idx}">${beForeImg.name}</a>
                                <img class="mt10" alt src="/file/download/${beForeImg.idx}" style="max-width: 100%; height: auto">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>서버 후면사진</th>
                        <td colspan="3">
                            <c:if test="${empty afterImg}">등록된 후면사진이 없습니다.</c:if>
                            <span class="dis_b">
                                <a href="/file/download/${afterImg.idx}">${afterImg.name}</a>
                                <img class="mt10" alt src="/file/download/${afterImg.idx}" style="max-width: 100%; height: auto">
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteAjax(${switchEqip.idx})">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?idx=${switchEqip.idx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="moveList()">
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>