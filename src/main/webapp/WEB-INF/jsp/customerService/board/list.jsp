<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/customerService/board/list.js" type="text/babel"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
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
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>
                            <c:if test="${boardCode.pathValue == 'faq'}">
                                <div class="inline-group">
                                    <select name="category" class="default-input w150">
                                        <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_CATEGORY_GUBUN" value=""><%--문의구분--%></option>
                                        <c:forEach var="category" items="${categoryList}">
                                            <option value="${category.code}" ${paging.category eq category.code ? 'selected' : ''}>${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </c:if>

                            <div class="inline-group">
                                <select name="searchUseYn" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_USE_YN" value=""><%--게시여부--%></option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_USE" value="Y" ${paging.searchUseYn eq 'Y' ? 'selected' : ''}><%--게시--%></option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_UNUSE" value="N" ${paging.searchUseYn eq 'N' ? 'selected' : ''}><%--미게시--%></option>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_SUBJECT" value="subject" ${paging.searchType eq 'subject' ? 'selected' : ''}><%--제목--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_WRITER" value="regId" ${paging.searchType eq 'regId' ? 'selected' : ''}><%--작성자--%></option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${paging.searchText}" maxlength="100">
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
                    <input type="hidden" name="searchUseYn" value="${paging.searchUseYn}">
                    <input type="hidden" name="searchType" value="${paging.searchType}">
                    <input type="hidden" name="searchText" value="${paging.searchText}">
                    <input type="hidden" name="category" value="${paging.category}">
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
                            <c:if test="${boardCode.pathValue == 'faq'}">
                                <col width="13%">
                            </c:if>
                            <col width="*%">
                            <col width="7%">
                            <col width="10%">
                            <col width="13%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <c:if test="${boardCode.pathValue == 'faq'}">
                                <th class="trn" data-trn-key="TR_COMMON_GUBUN"><%--구분--%></th>
                            </c:if>
                            <th class="trn" data-trn-key="TR_COMMON_SUBJECT"><%--제목--%></th>
                            <c:if test="${boardCode.replyYn}">
                                <span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_REPLY_YN"><%--답변여부--%></span>
                            </c:if>
                            <c:if test="${!boardCode.replyYn}">
                                <span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_USE_YN"><%--게시여부--%></span>
                            </c:if>
                            <th class="trn" data-trn-key="TR_COMMON_WRITER"><%--작성자--%></th>
                            <th class="trn" data-trn-key="TR_WRITEN_DATE"><%--작성일--%></th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:if test="${totalCount == 0}">
                                <tr>
                                    <td colspan="${boardCode.pathValue == 'faq' ? '6' : '5'}" class="nodata trn" data-trn-key="TR_COMMON_NOTDATALIST"><%--데이터가 존재하지 않습니다.--%></td>
                                </tr>
                            </c:if>
                            <c:forEach var="board" items="${boardList}" varStatus="status">
                                <tr class="pointer" onclick="moveView(${board.idx})">
                                    <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                    <c:if test="${boardCode.pathValue == 'faq'}">
                                        <td class="a_center">${board.categoryName}</td>
                                    </c:if>
                                    <td>${board.subject}</td>
                                    <td class="a_center">
                                        <%-- LINE :: 답변형 게시판인 경우 답변여부 노출 --%>
                                        <c:if test="${boardCode.replyYn}">
                                            <c:choose>
                                                <c:when test="${board.replyIdx > 0}">
                                                    <span class="fc_bn trn" data-trn-key="TR_CUSTOMER_SERVICE_REPLY_COMPLETE"><%--답변완료--%></span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="fc_r trn" data-trn-key="TR_CUSTOMER_SERVICE_REPLY_INCOMPLETE"><%--미답변--%></span>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        <%-- LINE :: 답변형 게시판이 아닌 경우 게시여부 노출 --%>
                                        <c:if test="${!boardCode.replyYn}">
                                            <c:if test="${board.useYn}">
                                                <span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_USE"><%--게시--%></span>
                                            </c:if>
                                            <c:if test="${!board.useYn}">
                                                <span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_UNUSE"><%--미게시--%></span>
                                            </c:if>
                                        </c:if>
                                    </td>
                                    <td class="a_center">${board.regId}</td>
                                    <td class="a_center">
                                        <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../include/paging.jsp" %>
                </div>

                <%-- LINE :: 답변형 게시판 아닌 경우에만 등록버튼 활성화 --%>
                <c:if test="${boardCode.replyYn eq 'N'}">
                    <input type="button" class="trn btn-baseRound btn-add mt20 w80 trn" data-trn-key="TR_COMMON_REGISTRATION" value="등록" onclick="location.href='form'">
                </c:if>

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>