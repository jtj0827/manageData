<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<script src="/resources/js/customerService/salesData/view.js" type="text/babel"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>

<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE6"><%--제안서 및 브로셔 관리--%></h1>

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
                        <col width="10%">
                        <col width="23%">
                        <col width="10%">
                        <col width="23%">
                        <col width="10%">
                        <col width="23%">
                    </colgroup>
                    <tr>
                        <th class="trn" data-trn-key=""><%--제목--%></th>
                        <td colspan="6">${salesData.subject}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key=""><%--게시여부--%></th>
                        <td>${salesData.useYn ? '게시' : '미게시'}</td>
                        <th class="trn" data-trn-key=""><%--카테고리--%></th>
                        <td>${salesData.categoryName}</td>
                        <th class="trn" data-trn-key=""><%--종류--%></th>
                        <c:choose>
                            <c:when test='${salesData.materialGubun eq "P" && salesData.categoryName eq "Secu E Cloud"}'>
                                <td class="trn" data-trn-key=""><%--파트너 제안서--%></td>
                            </c:when>
                            <c:when test='${salesData.materialGubun eq "P" && salesData.categoryName ne "Secu E Cloud"}'>
                                <td class="trn" data-trn-key=""><%--제안서--%></td>
                            </c:when>
                            <c:when test='${salesData.materialGubun eq "C"}'>
                                <td class="trn" data-trn-key=""><%--고객사 제안서--%></td>
                            </c:when>
                            <c:otherwise>
                                <td class="trn" data-trn-key=""><%--브로셔--%></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key=""><%--등록일--%></th>
                        <td><fmt:formatDate value="${salesData.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <th class="trn" data-trn-key=""><%--작성자--%></th>
                        <td colspan="4">${salesData.regId}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key=""><%--이미지 썸네일--%></th>
                        <td colspan="6">
                            <a class="b-blue" href="/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${thumbnailImage.idx}">${thumbnailImage.name}</a>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key=""><%--첨부파일--%></th>
                        <td colspan="6">
                            <c:if test="${proposalFile == null}">
                                등록된 첨부파일이 없습니다.
                            </c:if>
                            <span class="dis_b">
                                <a class="b-blue" href="/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${proposalFile.idx}">${proposalFile.name}</a>
                            </span>
                        </td>
                    </tr>
<%--                    <tr class="h300">--%>
<%--                        <th>내용</th>--%>
<%--                        <td colspan="6" class="v-top">${salesData.mainContents}</td>--%>
<%--                    </tr>--%>
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