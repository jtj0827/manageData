<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<script type="text/babel" src="/resources/js/data/common/dataCommon.js"></script>
<script type="text/babel" src="/resources/js/data/filterMngForCC.js"></script>

<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">중앙 데이터 관리-Filter 관리(CC전용)</h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="saveForm">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <div class="inline-group">
                                <label class="dis-ib a-center w80">파일</label>
                                <input type="file" class="w200" name="filterFileFiles" maxlength="100">
                            </div>
                        </div>

                        <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                        <div class="b-form-group__item">
                            <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                            <div class="inline-group">
                                <%--등록--%>
                                <input type="button" class="btn-base btn-search w100" value="등록" onclick="saveBtn()">
                            </div>
                            <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                        </div>
                    </div>
                </form>

                <form id="pageForm">
                    <input type="hidden" id="orderBy" name="orderBy" value="${paging.orderBy}">
                    <input type="hidden" id="sortBy" name="sortBy" value="${paging.sortBy}">
                    <input type="hidden" id="pageNo" name="pageNo" value="${paging.pageNo}">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                </form>

            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <span id="totalCount"><fmt:formatNumber value="${totalCount}" pattern="#,###"/></span></span>
                    <div class="b-list-top__right"><%@ include file="../include/pageSize.jsp" %></div>
                </div>

                <div class="b-tableWrap">
                    <table class="b-listTable">
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="17%"/>
                            <col/>
                            <col width="20%"/>
                        </colgroup>
                        <thead>
                        <tr style="cursor: pointer;">
                            <th><a>버전</a></th>
                            <th><a>파일명</a></th>
                            <th><a>등록일자</a></th>
                        </tr>
                        </thead>
                        <tbody id="tableBody">
                        <c:if test="${totalCount eq 0}">
                            <tr>
                                <td class="a-center" colspan="3">조회되는 데이터가 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:if test="${totalCount ne 0}">
                            <c:forEach items="${list}" var="data" varStatus="status">
                                <tr>
                                    <td class="a-center">${data.filterVersion}</td>
                                    <td class="a-center">${data.filterFile}</td>
                                    <td class="a-center"><fmt:formatDate value="${data.regDate}" pattern="yyyy-MM-dd"/></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div id="pagingDiv">
                    <%@ include file="../include/paging.jsp" %>
                </div>

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>
