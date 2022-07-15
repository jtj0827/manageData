<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<script src="/resources/js/customerService/salesData/form.js" type="text/babel"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // LINE :: CKEditor 세팅
        CKEDITOR.replace("mainContents", {
            height: 300,
            uploadUrl: "/file/handleFileUpload",
            filebrowserUploadUrl: "/file/editorImageUpload"
        });
    });
</script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE5"><%--뉴스레터 관리--%></h1>

    <div class="l-maxwrap">

        <form id="saveForm">
            <c:if test="${salesData.idx > 0}"><input type="hidden" name="idx" id="idx" value="${salesData.idx}"></c:if>
            <input type="hidden" name="code" value="${salesDataCode.code}">
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
                                <input type="text" name="subject" class="default-input wp100" value="${salesData.subject}">
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CUSTOMER_SERVICE_USE_YN"><%--게시여부--%></th>
                            <td colspan="3">
                                <label class="dis_ib w80">
                                    <input type="radio" name="useYn" value="true" checked> 게시
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="useYn" value="false" ${salesData != null && !salesData.useYn ? 'checked' : ''}> 미게시
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_IMG"><%--이미지--%></th>
                            <td colspan="3">
                                ${thumbnailImage.name}
                                <span class="dis_b fileSpan">
                                    <input type="file" name="thumbnailImage" class="w370">
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

            <div class="btn-area">
                <c:if test="${salesData.idx > 0}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_MODIFIED" value="수정" onclick="save()">
                </c:if>
                <c:if test="${salesData.idx == null}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_REGISTRATION" value="등록" onclick="save()">
                </c:if>
                <c:choose>
                    <c:when test="${salesData.idx > 0}">
                        <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_CANCEL" value="취소" onclick="location.href='view?idx=${salesData.idx}'">
                    </c:when>
                    <c:otherwise>
                        <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_CANCEL" value="취소" onclick="moveList()">
                    </c:otherwise>
                </c:choose>
            </div>

        </form>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>