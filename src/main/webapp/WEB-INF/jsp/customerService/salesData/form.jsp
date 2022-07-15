<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/customerService/salesData/form.js" type="text/babel"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
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
    <h1 class="main-title">${salesDataCode.name} 관리</h1>

    <div class="l-maxwrap">

        <form id="saveForm">
            <c:if test="${salesData.idx > 0}"><input type="hidden" name="idx" id="idx" value="${salesData.idx}"></c:if>
            <input type="hidden" name="delFileIdxArray" id="delFileIdxArray">
            <input type="hidden" name="delThumbnailIdx" id="delThumbnailIdx">
            <input type="hidden" name="code" value="${salesDataCode.code}">
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">게시글 정보</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">게시글 정보</caption>
                        <colgroup>
                            <col width="10%">
                            <col width="23%">
                            <col width="10%">
                            <col width="23%">
                            <col width="10%">
                            <col width="23%">
                        </colgroup>
                        <tr>
                            <th>제목</th>
                            <td colspan="6">
                                <input type="text" name="subject" class="default-input wp100"
                                       value="${salesData.subject}">
                            </td>
                        </tr>
                        <tr>
                            <th>게시여부</th>
                            <td>
                                <label class="mr10">
                                    <input type="radio" name="useYn" value="true" checked> 게시
                                </label>
                                <label>
                                    <input type="radio" name="useYn"
                                           value="false" ${salesData != null && !salesData.useYn ? 'checked' : ''}> 미게시
                                </label>
                            </td>
                            <c:choose>
                                <c:when test="${salesDataCode.pathValue == 'proposal'}">

                                    <th>카테고리</th>
                                    <td>
                                        <select name="category" class="w150">
                                            <c:forEach var="category" items="${categoryList}">
                                                <option value="${category.code}" ${salesData.category == category.code ? 'selected' : ''}>${category.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <th>종류</th>
                                    <td>
                                        <label class="mr10">
                                            <input type="radio" name="materialGubun" value="P" checked> 제안서
                                        </label>
                                        <label>
                                            <input type="radio" name="materialGubun"
                                                   value="B" ${salesData != null && salesData.materialGubun eq 'B' ? 'checked' : ''}>
                                            브로셔
                                        </label>
                                    </td>

                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>

                        </tr>
                        <tr>
                            <th>썸네일 이미지</th>
                            <td colspan="6" id="thumbnailArea">
                                <c:forEach var="thumbnail" items="${thumbnailImage}">
                                    <span class="dis_b fileSpan">
                                        <input type="text" class="default-input" value="${thumbnail.name}" readonly
                                               style="width: 30%;">
                                        <input type="button" class="mViewBtn_permit" value="-"
                                               style="color:#e74701; width: 30px;"
                                               onclick="deleteThumbnail(this, ${thumbnail.idx})">
                                    </span>

                                </c:forEach>
                                <c:if test="${fn:length(thumbnailImage) < 1}">
                                    <span class="dis_b fileSpan">
                                        <input type="file" name="thumbnailImage" style="width: 30%;">
                                        <input type="button" class="mViewBtn_permit" value="-"
                                               style="color:#e74701; width: 30px;" onclick="deleteThumbnail(this)">
                                    </span>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일
                                <c:choose>
                                    <c:when test="${salesDataCode.pathValue == 'secuissue'}">
                                        <input type="button" class="mViewBtn_permit" value="+" onclick="addAttach()">
                                    </c:when>
                                </c:choose>

                            </th>
                            <td colspan="6" id="attachArea">
                                <c:forEach var="file" items="${attachList}">
                                    <span class="dis_b fileSpan">
                                        <input type="text" class="default-input" value="${file.name}" readonly
                                               style="width: 30%;">
                                        <input type="button" class="mViewBtn_permit" value="-"
                                               style="color:#e74701; width: 30px;"
                                               onclick="deleteAttach(this, ${file.idx})">
                                    </span>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${salesDataCode.pathValue == 'proposal'}">
                                        <c:if test="${fn:length(attachList) < 1}">
                                            <span class="dis_b fileSpan">
                                                <input type="file" name="attachFiles" style="width: 30%;">
                                                <input type="button" class="mViewBtn_permit" value="-"
                                                       style="color:#e74701; width: 30px;" onclick="deleteAttach(this)">
                                            </span>
                                        </c:if>
                                    </c:when>
                                    <c:when test="${salesDataCode.pathValue == 'newsletter'}">

                                    </c:when>
                                    <c:when test="${salesDataCode.pathValue == 'secuissue'}">

                                    </c:when>
                                </c:choose>

                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="6">
                                <textarea class="wp100 h300" name="mainContents"
                                          id="mainContents">${salesData.mainContents}</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

            <div class="btn-area">
                <input type="button" class="btn-base btn-add btn-large mr5" value="${salesData.idx > 0 ?  '수정' : '등록'}"
                       onclick="save()">
                <c:choose>
                    <c:when test="${salesData.idx > 0}">
                        <input type="button" class="btn-base btn-large" value="취소"
                               onclick="location.href='view?idx=${salesData.idx}'">
                    </c:when>
                    <c:otherwise>
                        <input type="button" class="btn-base btn-large" value="취소" onclick="moveList()">
                    </c:otherwise>
                </c:choose>
            </div>

        </form>
    </div>

</section>
<!--l-content-area-->

</div><!--l-container-->
</body>
</html>