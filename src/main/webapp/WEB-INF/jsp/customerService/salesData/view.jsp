<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
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
                        <td colspan="6">${salesData.subject}</td>
                    </tr>
                    <tr>
                        <th>게시여부</th>
                        <td>${salesData.useYn ? '게시' : '미게시'}</td>
                        <c:choose>
                            <c:when test="${salesDataCode.pathValue == 'proposal'}">
                                <th>카테고리</th>
                                <td>${salesData.categoryName}</td>
                                <th>종류</th>
                                <c:choose>
                                    <c:when test='${salesData.materialGubun eq "P"}'>
                                        <td>제안서</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>브로셔</td>
                                    </c:otherwise>
                                </c:choose>

                            </c:when>
                            <c:otherwise>
                                <%--                                <th>공지여부</th>--%>
                                <%--                                <td>${salesData.noticeYn ? '공지' : '비공지'}</td>--%>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <th>등록일</th>
                        <td><fmt:formatDate value="${salesData.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <th>작성자</th>
                        <td>${salesData.regId}</td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="6">
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
                        <td colspan="6" class="v-top">${salesData.mainContents}</td>
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