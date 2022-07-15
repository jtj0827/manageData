<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/customerService/board/view.js" type="text/babel"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <c:choose>
        <c:when test="${boardCode.pathValue == 'notice'}">
            <h1 class="main-title trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE1"><%--공지사항 관리--%></h1>
        </c:when>
        <c:when test="${boardCode.pathValue == 'faq'}">
            <h1 class="main-title trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE2"><%--FAQ 관리--%></h1>
        </c:when>
    </c:choose>

    <div class="l-maxwrap">
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_COMMON_CONTENTS_INFO"><%--게시글 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
                <form id="deleteForm"><input type="hidden" name="idx" value="${board.idx}"></form>
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_INFO"><%--게시글 정보--%></caption>
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="35%">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key="TR_COMMON_SUBJECT"><%--제목--%></th>
                        <td colspan="3">${board.subject}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CUSTOMER_SERVICE_USE_YN"><%--게시여부--%></th>
                        <td>
                            <c:if test="${board.useYn}"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_USE"><%--게시--%></span></c:if>
                            <c:if test="${!board.useYn}"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_UNUSE"><%--미게시--%></span></c:if>
                        </td>
                        <c:choose>
                            <c:when test="${boardCode.pathValue == 'faq'}">
                                <th class="trn" data-trn-key=""><%--카테고리--%></th>
                                <td colspan="3">
                                    ${board.categoryName} ${fn:replace(board.category2Name, null, "") != "" ? ">" : ""} ${board.category2Name}
                                </td>
                            </c:when>
                            <c:otherwise>
                                <th class="trn" data-trn-key=""><%--공지여부--%></th>
                                <td>
                                    <c:if test="${board.noticeYn}"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_NOTICE"><%--공지--%></span></c:if>
                                    <c:if test="${!board.noticeYn}"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_NO_NOTICE"><%--비공지--%></span></c:if>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key=""><%--등록일--%></th>
                        <td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <th class="trn" data-trn-key="TR_COMMON_WRITER"><%--작성자--%></th>
                        <td>${board.regId}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key=""><%--첨부파일--%></th>
                        <td colspan="3">
                            <c:if test="${fn:length(attachList) == 0}">
                                <span class="trn" data-trn-key="TR_NO_FILE_MSG"><%--등록된 첨부파일이 없습니다.--%></span>
                            </c:if>
                            <c:forEach var="file" items="${attachList}">
                                <span class="dis_b">
                                    <a href="/file/download/${file.idx}">${file.name}</a>
                                </span>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr class="h300">
                        <th class="trn" data-trn-key=""><%--내용--%></th>
                        <td colspan="3" class="v-top">${board.contents}</td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5 trn" data-trn-key="TR_COMMON_DELETE" value="삭제" onclick="deleteAjax()">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-key="TR_COMMON_MODIFIED" value="수정" onclick="location.href='form?idx=${board.idx}'">
            <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_LIST" value="목록" onclick="moveList();">
        </div>

    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>