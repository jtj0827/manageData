<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script type="text/babel" src="/resources/js/serverMng/rack/rackView.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">랙 현황</h1>

    <div class="b-depthMng">
        <div class="b-depthMng__tit">
            <select class="w200 mr10" name="rackNumber" onchange="rackNumberChange(this)">
                <option value="">랙 번호</option>
                <c:forEach var="rackNumber" items="${rackNumber}">
                    <option value="${rackNumber.idx}" ${rackInfo.rackNumber == rackNumber.idx ? 'selected' : ''}>${rackNumber.rackNumber}</option>
                </c:forEach>
            </select>

            <input type="button" class="btn-baseRound" id="totalRackImgBtn" onclick="setTotalImg()" value="전체이미지 등록">
        </div>

        <div id="rackInfo" style="display: flex; justify-content: space-between;" class="mb20">
            <div class="b-depthMng__half left" style="min-width: 59%; margin-right: 2%; height: auto;border-top:none;">
                <table class="b-listTable b-listTable--border">
                    <colgroup>
                        <col width="15%">
                        <col width="60%">
                        <col width="25%">
                    </colgroup>
                    <tbody id="leftTable">

                    </tbody>
                </table>
            </div>
            <div class="b-depthMng__half right" style="min-width: 39%; margin-right: 0%; height: auto; padding: 0;border-top:none;">
                <table class="b-listTable b-listTable--border">
                    <colgroup>
                        <col width="100%">
                    </colgroup>
                    <tbody id="rightTable">

                    </tbody>
                </table>
            </div>
        </div>
        <div class="b-form-group__item mr0">
            <table class="b-listTable b-listTable--border br-table">
                <colgroup>
                    <col width="8.8%">
                    <col width="91.2%">
                </colgroup>
                <tbody id="rackImgTable">

                </tbody>
            </table>
        </div>
    </div>
</section>

</div><!--l-container-->
</body>
</html>

<%@ include file="../../popup/layerpopup.jsp" %>