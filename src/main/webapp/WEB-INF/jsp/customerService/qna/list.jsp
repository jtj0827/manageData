<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/customerService/qna/list.js" type="text/babel"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE3"><%--1:1 문의--%></h1>


    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>

                            <div class="inline-group">
                                <select name="procState" class="default-input w130">
                                    <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_PROCSTATE" value=""><%--처리 상태--%></option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_UNPROCESSED" value="W" ${param.procState eq 'W' ? 'selected' : ''}><%--미처리--%></option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_PROCESSING" value="P" ${param.procState eq 'P' ? 'selected' : ''}><%--처리중--%></option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_REQUESTING" value="R" ${param.procState eq 'R' ? 'selected' : ''}><%--요청중--%></option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_PROCESSING_COMPLETED" value="C" ${param.procState eq 'C' ? 'selected' : ''}><%--처리완료--%></option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="searchType" class="default-input w130">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_SUBJECT" value="S" ${param.searchType eq 'S' ? 'selected' : ''}><%--제목--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_WRITER" value="R" ${param.searchType eq 'R' ? 'selected' : ''}><%--작성자--%></option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER_NAME" value="C" ${param.searchType eq 'C' ? 'selected' : ''}><%--고객사명--%></option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${param.searchText}" maxlength="100">
                            </div>
                        </div>

                        <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                        <div class="b-form-group__item">
                            <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                            <div class="inline-group">
                                <%--검색--%>
                                <input type="button" class="btn-base btn-search w100 trn" data-trn-value="TR_SEARCH" value="검색" onclick="search()">
                            </div>
                            <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                        </div>
                    </div>
                </form>
                <form id="pageForm">
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="searchType" value="${param.searchType}">
                    <input type="hidden" name="searchText" value="${param.searchText}">
                    <input type="hidden" name="procState" value="${param.procState}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <fmt:formatNumber value="${totalCount}" pattern="#,###"/></span>

                    <div class="b-list-top__right">
                        <%@ include file="../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">
                    <table class="b-listTable">
                        <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                        <colgroup>
                            <col width="5%">
                            <col width="9%">
                            <col width="10%">
                            <col width="*">
                            <col width="10%">
                            <col width="7%">
                            <col width="13%">
                            <col width="13%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="trn" data-trn-key=""><%--번호--%></th>
                            <th class="trn" data-trn-key=""><%--구분--%></th>
                            <th class="trn" data-trn-key=""><%--고객사명--%></th>
                            <th class="trn" data-trn-key=""><%--제목--%></th>
                            <th class="trn" data-trn-key=""><%--작성자--%></th>
                            <th class="trn" data-trn-key=""><%--처리상태--%></th>
                            <th class="trn" data-trn-key=""><%--작성일--%></th>
                            <th class="trn" data-trn-key=""><%--답변일--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${totalCount eq 0}">
                                <tr>
                                    <td colspan="8" class="nodata trn" data-trn-key="TR_COMMON_NODATA"><%--데이터가 존재 하지 않습니다.--%></td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${qnaList}" var="list" varStatus="status">
                                    <tr class="pointer" onclick="moveView(${list.idx});">
                                        <td class="a-center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                        <td class="a-center">
                                            <c:choose>
                                                <c:when test="${list.gubun == 'SECU'}">SecuMail</c:when>
                                                <c:when test="${list.gubun == 'GRPW'}">GroupWear</c:when>
                                                <c:otherwise>${list.gubun}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="a-center">${list.customerName}</td>
                                        <td class="a-center">${list.subject}</td>
                                        <td class="a-center">${list.regName}</td>
                                        <td class="a-center">
                                            <c:choose>
                                            <c:when test="${list.procState eq 'P'}"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_PROCESSING"><%--처리중--%></span></c:when>
                                                <c:when test="${list.procState eq 'R'}"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_REQUESTING"><%--요청중--%></span></c:when>
                                                <c:when test="${list.procState eq 'C'}"><span class="fc_bn fwBold"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_PROCESSING_COMPLETED"><%--처리완료--%></span></span></c:when>
                                                <c:otherwise><span class="fc_r fwBold trn" data-trn-key="TR_CUSTOMER_SERVICE_UNPROCESSED"><%--미처리--%></span></c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="a-center"><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                        <td class="a-center">
                                            <c:if test="${list.repDate eq null}">-</c:if>
                                            <c:if test="${list.repDate ne null}">
                                                <fmt:formatDate value="${list.repDate}" pattern="yyyy-MM-dd HH:mm"/>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../include/paging.jsp" %>
                </div>

                <%-- LINE :: 답변형 게시판 아닌 경우에만 등록버튼 활성화 --%>
                <%--<c:if test="${boardCode.replyYn eq 'N'}">
                    <input type="button" class="trn btn-baseRound btn-add mt20 w80" value="등록" onclick="location.href='form'">
                </c:if>--%>
            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>