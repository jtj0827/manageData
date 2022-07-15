<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header_popup.jsp" %>

<script src="/resources/js/serverMng/rack/totalRackImgFormPopup.js" type="text/babel"></script>

<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
    <p class="pop_title">IDC 랙 관리 - 전체이미지 등록</p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
        </div>
    </div>
    <div class="ml15 mr15">
        <div class="b-tableWrap">
            <div>
                <form id="saveForm">
                    <input type="hidden" name="delFileIdx" id="delFileIdx">
                    <input type="hidden" name="rackIdx" value="${serverRack.idx}">
                    <table class="b-listTable b-listTable--border">
                        <caption class="oppscreen">랙 전체이미지</caption>
                        <colgroup>
                            <col width="25%">
                            <col width="75%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>Rack번호</th>
                            <td>${serverRack.rackNumber}</td>
                        </tr>
                        <tr>
                            <th>랙 이미지</th>
                            <td>
                                <c:if test="${not empty rackImg}">
                                    <p>
                                        ${rackImg.name}
                                        <input type="button" class="mViewBtn_permit" value="-" style="color:#e74701; width: 30px;" onclick="deleteAttach(this, ${rackImg.idx})">
                                    </p>
                                </c:if>
                                <input type="file" name="serverImageFile" class="dis_b w295" onchange="fileTypeCheck(this)">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <div class="mt15 a_center">
            <input type="button" value="수정" class="btn-large btn-add trn" style="margin-right: 5px;" onclick="save()">
            <input type="button" value="취소" class="btn-large trn" data-trn-value="TR_COMMON_CANCEL" onclick="window.close()">
        </div>
    </div>
</body>
</html>