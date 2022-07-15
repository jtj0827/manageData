<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/customerService/board/form.js" type="text/babel"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // LINE :: CKEditor 세팅
        CKEDITOR.replace("contents", {
            height: 300,
            uploadUrl: "/file/handleFileUpload",
            filebrowserUploadUrl: "/file/editorImageUpload"
        });
    });
</script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <c:choose>
        <c:when test="${boardCode.pathValue == 'notice'}">
            <span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE1"><%--공지사항 관리--%></span>
        </c:when>
        <c:when test="${boardCode.pathValue == 'faq'}">
            <span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE2"><%--FAQ 관리--%></span>
        </c:when>
    </c:choose>

    <div class="l-maxwrap">

        <form id="saveForm">
            <c:if test="${board.idx > 0}"><input type="hidden" name="idx" id="idx" value="${board.idx}"></c:if>
            <input type="hidden" name="delFileIdxArray" id="delFileIdxArray">
            <input type="hidden" name="code" value="${boardCode.code}">
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_COMMON_CONTENTS_INFO"><%--게시글 정보--%></h1>
                </div>

                <div class="b-tableWrap mt20">
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
                            <td colspan="3">
                                <input type="text" name="subject" class="default-input wp100" value="${board.subject}">
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CUSTOMER_SERVICE_USE_YN"><%--게시여부--%></th>
                            <td>
                                <label class="dis_ib w80">
                                    <input type="radio" name="useYn" value="true" checked> <span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_USE"><%--게시--%></span>
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="useYn" value="false" ${board != null && !board.useYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_UNUSE"><%--미게시--%></span>
                                </label>
                            </td>
                            <c:choose>
                                <c:when test="${boardCode.pathValue == 'faq'}">
                                    <th class="trn" data-trn-key="TR_CUSTOMER_SERVICE_CATEGORY"><%--카테고리--%></th>
                                    <td>
                                        <input type="hidden" id="category2" value="${board.category2}">
                                        <select name="category" class="wp80" onchange="getCategoryListAjax(2)">
                                            <c:forEach var="category" items="${categoryList}">
                                                <option value="${category.code}" ${board.category == category.code ? 'selected' : ''}>${category.name}</option>
                                            </c:forEach>
                                        </select>
                                        <select id="category2select" name="category2" class="wp80">
                                            <option class="trn" data-trn-key="TR_COMMON_CHOICE" value=""><%--선택--%></option>
                                        </select>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <th class="trn" data-trn-key="TR_CUSTOMER_SERVICE_NOTICE_YN"><%--공지여부--%></th>
                                    <td>
                                        <label class="dis_ib w80">
                                            <input type="radio" name="noticeYn" value="true" checked> <span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_NOTICE"><%--공지--%></span>
                                        </label>
                                        <label class="dis_ib w80">
                                            <input type="radio" name="noticeYn" value="false" ${board == null || !board.noticeYn ? 'checked' : ''}> <span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_NO_NOTICE"><%--비공지--%></span>
                                        </label>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th><span class="trn" data-trn-key="TR_ATTACH"><%--첨부파일--%></span> <input type="button" class="mViewBtn_permit" value="+" onclick="addAttach()"></th>
                            <td colspan="3" id="attachArea">
                                <c:forEach var="file" items="${attachList}">
                                    <span class="dis_b fileSpan">
                                        <input type="text" class="default-input w370" value="${file.name}" readonly>
                                        <input type="button" class="mViewBtn_permit" value="-" style="color:#e74701; width: 30px;" onclick="deleteAttach(this, ${file.idx})">
                                    </span>
                                </c:forEach>
                                <c:if test="${fn:length(attachList) < 5}">
                                    <span class="dis_b fileSpan">
                                        <input type="file" name="attachFiles" class="w370">
                                        <input type="button" class="mViewBtn_permit" value="-" style="color:#e74701; width: 30px;" onclick="deleteAttach(this)">
                                    </span>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_CONTENTS"><%--내용--%></th>
                            <td colspan="3">
                                <textarea class="wp100 h300" name="contents" id="contents">${board.contents}</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

            <div class="btn-area">
                <c:if test="${board.idx > 0}">
                    <span class="trn" data-trn-key="TR_COMMON_MODIFIED"><%--수정--%></span>
                </c:if>
                <c:if test="${board.idx == null}">
                    <span class="trn" data-trn-key="TR_COMMON_REGISTRATION"><%--등록--%></span>
                </c:if>
                <c:choose>
                    <c:when test="${board.idx > 0}">
                        <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_CANCEL" value="취소" onclick="location.href='view?idx=${board.idx}'">
                    </c:when>
                    <c:otherwise>
                        <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_CANCEL" value="취소" onclick="moveList()">
                    </c:otherwise>
                </c:choose>
            </div>

        </form>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>