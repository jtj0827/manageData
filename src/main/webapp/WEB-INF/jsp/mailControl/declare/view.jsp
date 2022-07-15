<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/customerService/board/view.js" type="text/babel"></script>

<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">신고 메일</h1>

    <div class="l-maxwrap">
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">게시글 정보</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">신고메일 정보</caption>
                    <colgroup>
                        <col width="15%">
                        <col width="85%">
                    </colgroup>
                    <tr>
                        <th>신고번호</th>
                        <td colspan="3">${declareMail.declareNumber}</td>
                    </tr>
                    <tr>
                        <th>등록일</th>
                        <td colspan="3">
                            <fmt:formatDate value="${declareMail.regDate}" pattern="yyyy-MM-dd HH:mm"/>
                        </td>
                    </tr>
                    <tr class="h300">
                        <th>내용</th>
                        <td colspan="3" class="v-top">${contents}</td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteAjax()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?idx=${board.idx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="moveList();">
        </div>

    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>