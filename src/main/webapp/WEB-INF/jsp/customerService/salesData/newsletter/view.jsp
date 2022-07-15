<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<script src="/resources/js/customerService/salesData/view.js" type="text/babel"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>

<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE5"><%--뉴스레터 관리--%></h1>

    <div class="l-maxwrap">
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_COMMON_CONTENTS_INFO"><%--게시글 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
                <form id="deleteForm"><input type="hidden" name="idx" value="${salesData.idx}"></form>
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_INFO"><%--게시글 정보--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key="TR_COMMON_SUBJECT"><%--제목--%></th>
                        <td colspan="3">${salesData.subject}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CUSTOMER_SERVICE_USE_YN"><%--게시여부--%></th>
                        <td colspan="3">${salesData.useYn ? '게시' : '미게시'}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_COMMON_REG_DATE"><%--등록일--%></th>
                        <td><fmt:formatDate value="${salesData.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <th class="trn" data-trn-key=""><%--등록자--%></th>
                        <td>${salesData.regId}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_IMG"><%--이미지--%></th>
                        <td colspan="3">
                            <a href="/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${thumbnailImage.idx}">${thumbnailImage.name}</a>
                        </td>
                    </tr>
                    <tr class="h300">
                        <th class="trn" data-trn-key="TR_COMMON_CONTENTS"><%--내용--%></th>
                        <td class="v-top" colspan="3"><img src="/file/download/${thumbnailImage.idx}"></td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5 trn" data-trn-key="TR_COMMON_DELETE" value="삭제" onclick="deleteAjax()">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-key="TR_COMMON_MODIFIED" value="수정"
                   onclick="location.href='form?idx=${salesData.idx}'">
            <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_LIST" value="목록" onclick="moveList();">
        </div>

    </div>

</section>
<!--l-content-area-->

</div><!--l-container-->
</body>
</html>