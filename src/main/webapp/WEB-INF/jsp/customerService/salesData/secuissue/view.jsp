<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<script src="/resources/js/customerService/salesData/view.js" type="text/babel"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>

<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">${salesDataCode.name} 관리</h1>

    <div class="l-maxwrap">
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">게시글 정보</h1>
            </div>

            <div class="b-tableWrap mt20">
                <form id="deleteForm"><input type="hidden" name="idx" value="${salesData.idx}"></form>
                <table class="b-listTable b-listTable--border secuissue-img">
                    <caption class="offscreen">게시글 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>제목</th>
                        <td colspan="3">${salesData.subject}</td>
                    </tr>
                    <tr>
                        <th>게시여부</th>
                        <td colspan="3">${salesData.useYn ? '게시' : '미게시'}</td>
                    </tr>
                    <tr>
                        <th>등록일</th>
                        <td><fmt:formatDate value="${salesData.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <th>작성자</th>
                        <td>${salesData.regId}</td>
                    </tr>
                    <tr>
                        <th>썸네일</th>
                        <td colspan="3">
                            <a href="/file/download/${thumbnailImage.idx}">${thumbnailImage.name}</a>
                        </td>
                    </tr>
                    <tr>
                        <th>이슈파일</th>
                        <td colspan="3">
                            <c:choose>
                                <c:when test="${issueFile.idx > 0}">
                                    <a href="/file/download/${issueFile.idx}" >${issueFile.name}</a>
                                </c:when>
                                <c:otherwise>
                                    등록된 파일이 없습니다.
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="3">
                            <c:if test="${fn:length(attachList) == 0}">
                                등록된 첨부파일이 없습니다.
                            </c:if>
                            <c:forEach var="file" items="${attachList}">
                                <span class="dis_b">
                                    <a href="/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${file.idx}">${file.name}</a>
                                </span>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr class="h300">
                        <th>내용</th>
                        <td colspan="3" class="v-top">${salesData.mainContents}</td>
                    </tr>
                    <tr class="h300">
                        <th>내용2</th>
                        <td colspan="3" class="v-top">${salesData.subContents}</td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteAjax()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정"
                   onclick="location.href='form?idx=${salesData.idx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="moveList();">
        </div>

    </div>

</section>
<!--l-content-area-->

</div><!--l-container-->
</body>
</html>