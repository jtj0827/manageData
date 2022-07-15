<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header_popup.jsp" %>

<script src="/resources/js/data/whiteListPopup.js" type="text/babel"></script>
<script src="/resources/js/data/listPopup.js" type="text/babel"></script>

<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
    <p class="pop_title">화이트 리스트 관리 등록</p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
        </div>
    </div>
    <div class="ml15 mr15">
        <div class="b-tableWrap">
            <div>
                <form id="saveForm">
                    <c:if test="${whiteList.idx > 0}">
                    <input type="hidden" name="idx" value="${whiteList.idx}">
                    </c:if>
                <table class="b-listTable b-listTable--border">
                    <caption class="oppscreen">IP 정보</caption>
                    <colgroup>
                        <col width="25%">
                        <col width="75%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="a_center">검사 범위</th>
                        <td>
                            <label class="dis-ib mt10 mb10  w90">
                                <input type="radio" name="inspRange" value="T" checked>
                                <span>제목</span>
                            </label>
                            <label class="dis-ib mt10 mb10  w90">
                                <input type="radio" name="inspRange" value="C" ${whiteList.inspRange eq 'C' ? 'checked' : ''}>
                                <span>본문</span>
                            </label>
                            <label class="dis-ib mt10 mb10  w90">
                                <input type="radio" name="inspRange" value="H" ${whiteList.inspRange eq 'H' ? 'checked' : ''}>
                                <span>헤더</span>
                            </label>
                            <label class="dis-ib mt10 mb10 w90 v_mid">
                                <input type="radio" name="inspRange" value="A" ${whiteList.inspRange eq 'A' ? 'checked' : ''}>
                                <span>첨부파일</span>
                            </label>
                            <br>
                            <label class="dis-ib mt10 mb10  w90 v_mid">
                                <input type="radio" name="inspRange" value="S" ${whiteList.inspRange eq 'S' ? 'checked' : ''}>
                                <span>메일서버 IP</span>
                            </label>
                            <label class="dis-ib mt10 mb10  w90">
                                <input type="radio" name="inspRange" value="D" ${whiteList.inspRange eq 'D' ? 'checked' : ''}>
                                <span>도메인</span>
                            </label>
                            <label class="dis-ib mt10 mb10  w90 v_mid">
                                <input type="radio" name="inspRange" value="M" ${whiteList.inspRange eq 'M' ? 'checked' : ''}>
                                <span>메일 주소</span>
                            </label>
                            <label class="dis-ib mt10 mb10  w90 v_mid">
                                <input type="radio" name="inspRange" value="R" ${blackList.inspRange eq 'R' ? 'checked' : ''}>
                                <span>IP 대역</span>
                            </label>
                            <br>
                            <label class="dis-ib mt10 mb10  w90 v_mid">
                                <input type="radio" name="inspRange" value="N" ${blackList.inspRange eq 'N' ? 'checked' : ''}>
                                <span>발신자 명</span>
                            </label>
                        </td>
                    </tr>
                    <tr class="inspArea">
                        <th class="a_center">검사 구분</th>
                        <td>
                            <label class="dis-ib mt10 mb10 w90">
                                <input type="radio" name="inspGubun" value="T" checked>
                                <span>텍스트</span>
                            </label>
                            <label class="dis-ib mt10 mb10 w90">
                                <input type="radio" name="inspGubun" value="R" ${whiteList.inspGubun eq 'R' ? 'checked' : ''}>
                                <span>정규표현식</span>
                            </label>
                        </td>
                    </tr>
                    <tr class="inspArea">
                        <th class="a_center">검사 조건</th>
                        <td>
                            <label class="dis-ib mt10 mb10  w90">
                                <input type="radio" name="inspCondition" value="Q" checked>
                                <span>일치</span>
                            </label>
                            <label class="dis-ib mt10 mb10  w90">
                                <input type="radio" name="inspCondition" value="S" ${whiteList.inspCondition eq 'S' ? 'checked' : ''}>
                                <span>시작</span>
                            </label>
                            <label class="dis-ib mt10 mb10  w90">
                                <input type="radio" name="inspCondition" value="I" ${whiteList.inspCondition eq 'I' ? 'checked' : ''}>
                                <span>포함</span>
                            </label>
                            <label class="dis-ib mt10 mb10  w90">
                                <input type="radio" name="inspCondition" value="E" ${whiteList.inspCondition eq 'E' ? 'checked' : ''}>
                                <span>끝</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <th class="a_center">내용</th>
                        <td><input type="text" class="w300" maxlength="100" name="contents" id="contents" value="${whiteList.contents}"></td>
                    </tr>
                    <tr>
                        <th class="a_center">설명</th>
                        <td><input type="text" class="w300" maxlength="100" name="explanation" id="explanation" value="${whiteList.explanation}"></td>
                    </tr>
                    <tr>
                        <th class="a_center">점수</th>
                        <td><input type="number" class="w300" maxlength="100" name="spamScore" id="spamScore" value="${whiteList.spamScore}"></td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </div>
        <div class="mt15 a_center">
            <input type="button" value="등록" class="btn-large btn-add trn" style="margin-right: 5px;" onclick="saveConfirm()">
            <input type="button" value="취소" class="btn-large trn" data-trn-value="TR_COMMON_CANCEL" onclick="window.close()">
        </div>
    </div>
</body>
</html>