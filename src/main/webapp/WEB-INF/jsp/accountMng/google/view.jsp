<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/accountMng/google/view.js" type="text/babel"></script>
<script src="/resources/js/lang/accountMng/accountMng_lang.js"></script>
<section class="l-content-area">
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_ACCOUNT_MNG_TITLE"><%--계정 관리--%></h1>
    <div class="l-maxwrap">
        <div>
            <section>
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_ACCOUNT_MNG_DATA"><%--계정 정보--%></h1>
                </div>

                <div class="b-tableWrap mt20 ofx-h">
                    <form id="deleteForm">
                        <input type="hidden" name="idx" value="${account.idx}">
                    </form>
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_ACCOUNT_MNG_DATA"><%--계정 정보--%></caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>ID</th>
                            <td>${account.accountId}</td>
                            <th class="trn" data-trn-key="TR_COMMON_NAME"><%--이름--%></th>
                            <td>${account.name}</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_ACCOUNT_MNG_GOOGLE_GMAIL_ADDR"><%--Gmail 주소--%></th>
                            <td>${account.gmailAddr}</td>
                            <th>API Key</th>
                            <td>${account.apiKey}</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_IS_USE"><%--사용 여부--%></th>
                            <td>
                                <span class="trn" data-trn-key="TR_COMMON_${account.useYn == true ? 'USED' : 'NOT_USED'}"></span>
                            </td>
                            <th class="trn" data-trn-key="TR_COMMON_REGDATE"><%--등록일--%></th>
                            <td>${account.regDate}</td>
                        </tr>
                    </table>
                </div>
            </section>
        </div>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5 trn" data-trn-value="TR_COMMON_DELETE" value="<%--삭제--%>" onclick="deleteAjax(${account.idx})">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_MODIFIED" value="<%--수정--%>" onclick="location.href='form?idx=${account.idx}'">
            <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_LIST" value="<%--목록--%>" onclick="moveList()">
        </div>
    </div>
</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>