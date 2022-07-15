<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/stock/form.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">
    <h1 class="main-title">서버 재고 등록</h1>
    <div class="l-maxwrap">
        <form id="ipForm">
            <c:if test="${serverStock.idx > 0}"><input type="hidden" name="idx" id="stockIdx" value="${serverStock.idx}"></c:if> <!--수정삭제 여부 idx-->
            <div id="common_tempArea"></div>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">재고 등록</h1>
                </div>
                <p style="color: red; text-align: right" class="lh20 dis_b mt10"> * 표시는 필수 입력 항목입니다.</p>
                <div class="b-tableWrap mt10">

                    <table class="b-listTable b-listTable--border">
                        <caption class="oppscreen">재고 등록</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th><span class="necessary">관리번호</span></th>
                            <td colspan="3">
                                <input type="text" class="default-input saveCheckStar w155" name="uniqueNumber" value="${serverStock.uniqueNumber}">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">구분</span></th>
                            <td colspan="3">
                                <select name="firstDepth" class="saveCheckStar w155">
                                    <option value="">선택</option>
                                    <c:forEach var="step" items="${firstDepth}">
                                        <option value="${step.idx}"${serverStock.firstDepth == step.idx ? 'selected' : ''}>${step.name}</option>
                                    </c:forEach>
                                </select>
                                <select name="secondDepth" class="w155">

                                </select>
                                <select name="thirdDepth" class="w155">

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>제조사</th>
                            <td><input type="text" class="default-input w155" name="manufacturer" value="${serverStock.manufacturer}"></td>
                            <th>사용 용도</th>
                            <td>
                                <input type="text" class="default-input w155" name="stockUsage" value="${serverStock.stockUsage}">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">상태</span></th>
                            <td>
                                <select name="state" class="saveCheckStar w155">
                                    <option value="">선택</option>
                                    <option value="stock" ${serverStock.state eq 'stock' ? 'selected' : ''}>재고</option>
                                    <option value="eruption" ${serverStock.state eq 'eruption' ? 'selected' : ''}>사용중</option>
                                </select>
                            </td>
                            <th><span class="necessary">입고일</span></th>
                            <td><input type="text" name="receivingDate" class="default-input saveCheckStar calendar w155" value="${serverStock.formatedReceivingDate}" readonly></td>
                        </tr>
                        <tr>
                            <th>분출 용도</th>
                            <td>
                                <input type="text" name="eruptionUsage" class="default-input w155" value="${serverStock.eruptionUsage}">
                            </td>
                            <th>수량</th>
                            <td>
                                <input type="text" name="volume" class="default-input w155" value="${serverStock.volume}">
                            </td>
                        </tr>
                        <tr>
                            <th rowspan="4">메모</th>
                            <td rowspan="4" colspan="3">
                                <textarea name="memo" class="wp100 h100" style="resize: none">${serverStock.memo}</textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </form>
        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5" value="${serverStock.idx > 0 ?  '수정' : '등록'}" onclick="saveStock()">
            <c:choose>
                <c:when test="${serverIp.idx > 0}">
                    <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view?idx=${serverStock.idx}'">
                </c:when>
                <c:otherwise>
                    <input type="button" class="btn-base btn-large" value="취소" onclick="moveList();">
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section>
</body>
</html>