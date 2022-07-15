<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/customerService/qna/view.js" type="text/babel"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>

<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE3"><%--1:1 문의--%></h1>

    <div class="l-maxwrap">
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_CUSTOMER_SERVICE_CATEGORY_INFO"><%--문의 정보--%></h1>
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
                        <th class="trn" data-trn-key="TR_CUSTOMER_SERVICE_REG_INFO_ID"><%--작성자(아이디)--%></th>
                        <td>${question.regName}(${question.regId})</td>
                        <th class="trn" data-trn-key="TR_CUSTOMER_SERVICE_COMPANY_NAME"><%--회사명--%></th>
                        <td>${question.customerName}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CONTACT_INFO"><%--연락처--%></th>
                        <td>${question.hp}</td>
                        <th class="trn" data-trn-key="TR_COMMON_REG_DATE"><%--등록일--%></th>
                        <td><fmt:formatDate value="${question.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_COMMON_GUBUN"><%--구분--%></th>
                        <td>
                            <c:choose><%----%>
                                <c:when test="${question.gubun == 'SECU'}">SecuMail</c:when>
                                <c:when test="${question.gubun == 'GRPW'}">Groupwear</c:when>
                                <c:otherwise>${question.gubun}</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_COMMON_SUBJECT"><%--제목--%></th>
                        <td colspan="3">${question.subject}</td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_ATTACH"><%--첨부파일--%></th>
                        <td colspan="3">
                            <c:if test="${fn:length(attachList) == 0}">
                                <span class="trn" data-trn-key="TR_NO_FILE_MSG"><%--등록된 파일이 없습니다.--%></span>
                            </c:if>
                            <c:forEach var="file" items="${attachList}">
                                <span class="dis_b">
                                    <a href="/file/download/${file.idx}">${file.name}</a>
                                </span>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr class="h300">
                        <th class="trn" data-trn-key="TR_COMMON_CONTENTS"><%--내용--%></th>
                        <td colspan="3" class="v-top border-b">${question.contents}</td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <%-- LINE :: 처리상태가 R (요청)인 건만 답변 버튼 표시 --%>
            <%--<c:if test="${question.procState == 'R'}">--%>
                <c:if test="${reply.idx > 0}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_CUSTOMER_SERVICE_ANSWER_MOD" value="답변 수정" onclick="replySave()">
                </c:if>
                <c:if test="${reply.idx == null}">
                    <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_CUSTOMER_SERVICE_ANSWER_REG" value="답변 등록" onclick="replySave()">
                </c:if>
            <%--</c:if>--%>
            <input type="button" class="btn-base btn-large trn" data-trn-key="TR_COMMON_LIST" value="목록" onclick="moveList();">
        </div>

        <%-- LINE :: 답변형 게시판 이면서, 답변이 등록된 경우 답변 정보 노출 --%>
        <c:if test="${reply != null}">
            <section>
                <div class="b-title">
                    <h1 class="b-title__title trn" data-trn-key="TR_CUSTOMER_SERVICE_ANSWER_INFO"><%--답변 정보--%></h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen trn" data-trn-key="TR_CUSTOMER_SERVICE_ANSWER_INFO"> class="trn" data-trn-key= </caption<%-->--%>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th class="trn" data-trn-key="TR_CUSTOMER_SERVICE_ANSWER_DATE"><%--답변일--%></th>
                            <td><fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                            <th class="trn" data-trn-key="TR_COMMON_WRITER"><%--작성자--%></th>
                            <td>${reply.regId}</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_SUBJECT"><%--제목--%></th>
                            <td colspan="3">${reply.subject}</td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_ATTACH"><%--첨부파일--%></th>
                            <td colspan="3">
                                <c:if test="${fn:length(replyAttachList) == 0}">
                                    <span class="trn" data-trn-key="TR_NO_FILE_MSG"><%--등록된 파일이 없습니다.--%></span>
                                </c:if>
                                <c:forEach var="file" items="${replyAttachList}">
                                <span class="dis_b">
                                    <a href="/file/download/${file.idx}">${file.name}</a>
                                </span>
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_CONTENTS"><%--내용--%></th>
                            <td colspan="3">${reply.contents}</td>
                        </tr>
                    </table>
                </div>
            </section>
        </c:if>

    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>