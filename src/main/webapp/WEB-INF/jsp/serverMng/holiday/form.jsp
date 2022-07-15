<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header_popup.jsp" %>

<script src="/resources/js/serverMng/holiday/holiday.js" type="text/babel"></script>

<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
    <p class="pop_title">메일서버 공휴일 등록</p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
        </div>
    </div>
    <div class="ml15 mr15">
        <div class="b-tableWrap">
            <div>
                <form id="saveForm">
                    <input type="hidden" name="delYn" value="false">
                    <table class="b-listTable b-listTable--border">
                        <caption class="oppscreen">IP 정보</caption>
                        <colgroup>
                            <col width="25%">
                            <col width="75%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>공휴일</th>
                            <td><input type="text" name="holidayDate" class="default-input calendar w155" readonly></td>
                        </tr>
                        <tr>
                            <th>공휴일명</th>
                            <td><input type="text" class="w300" maxlength="100" name="holidayName" value="${whiteList.contents}"></td>
                        </tr>
                        <tr>
                            <th>반복여부</th>
                            <td>
                                <label class="dis-ib mt10 mb10 w90">
                                    <input type="radio" name="repeatYn" value="true" checked>
                                    <span>반복</span>
                                </label>
                                <label class="dis-ib mt10 mb10 w90">
                                    <input type="radio" name="repeatYn" value="false">
                                    <span>미반복</span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>사용언어</th>
                            <td>
                                <select name="lang" class="default-input w200">
                                    <option value="">언어구분</option>
                                    <option value="ko" ${param.lang eq 'ko' ? 'selected' : ''}>한국어</option>
                                    <option value="en" ${param.lang eq 'en' ? 'selected' : ''}>영어</option>
                                    <option value="jp" ${param.lang eq 'jp' ? 'selected' : ''}>일본어</option>
                                    <option value="vn" ${param.lang eq 'vn' ? 'selected' : ''}>베트남어</option>
                                    <option value="cn" ${param.lang eq 'cn' ? 'selected' : ''}>중국어</option>
                                </select>
                            </td>
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