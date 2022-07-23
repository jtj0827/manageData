<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<script type="text/babel" src="/resources/js/data/common/dataCommon.js"></script>
<script type="text/babel" src="/resources/js/data/urlWarning.js"></script>

<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">중앙 데이터 관리-URL 차단</h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="pageForm">
                    <input type="hidden" id="orderBy" name="orderBy" value="${paging.orderBy}">
                    <input type="hidden" id="sortBy" name="sortBy" value="${paging.sortBy}">
                    <input type="hidden" id="pageNo" name="pageNo" value="${paging.pageNo}">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <div class="inline-group">
                                <label class="dis-ib a-center w80">URL</label>
                                <input type="text" class="w120" id="url" name="url" value="${param.url}" onkeyup="searchSubmit();" maxlength="100">
                            </div>

                            <div class="inline-group">
                                <label class="dis-ib a-center w80">검출 구분</label>
                                <select class="w120" id="urlType" name="urlType" onchange="searchSubmit();">
                                    <option value="">선택</option>
                                    <option value="0" <c:if test="${param.urlType eq '0'}">selected</c:if>>전체 URL</option>
                                    <option value="1" <c:if test="${param.urlType eq '1'}">selected</c:if>>호스트만</option>
                                    <option value="2" <c:if test="${param.urlType eq '2'}">selected</c:if>>쿼리제외</option>
                                </select>
                            </div>

                            <div class="inline-group">
                                <label class="dis-ib a-center w80">검출명</label>
                                <input type="text" class="w200 mr30" id="detection" name="detection" value="${param.detection}" maxlength="150">
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

            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <span id="totalCount"><fmt:formatNumber value="${totalCount}" pattern="#,###"/></span></span>
                    <div class="b-list-top__right"><%@ include file="../include/pageSize.jsp" %></div>
                    <input type="button" onclick="deleteBtn();" class="btn-baseRound fc-red" value="삭제">
                </div>

                <div class="b-tableWrap">
                    <table class="b-listTable">
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="5%"/>
                            <col/>
                            <col width="17%"/>
                            <col width="12%"/>
                            <col width="12%"/>
                        </colgroup>
                        <thead>
                        <tr style="cursor: pointer;">
                            <th><input type="checkbox" id="allChk" style="cursor: pointer;" onclick="allCheck();"></th>
                            <th><a onclick="sortList('1');">URL<span id="orderBy1_txt"></span></a></th>
                            <th><a onclick="sortList('2');">구분<span id="orderBy2_txt"></span></a></th>
                            <th><a onclick="sortList('3');">검출명<span id="orderBy3_txt"></span></a></th>
                            <th><a onclick="sortList('4');">등록일자<span id="orderBy4_txt"></span></a></th>
                        </tr>
                        </thead>
                        <tbody id="tableBody">
                        <c:if test="${totalCount eq 0}">
                            <tr>
                                <td colspan="5">조회되는 데이터가 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:if test="${totalCount ne 0}">
                            <c:forEach items="${list}" var="data" varStatus="status">
                                <tr>
                                    <td class="a-center"><input type="checkbox" class="checkIdx" value="${data.idx}" onclick="singleCheck();"></td>
                                    <td class="a-center">${data.url}</td>
                                    <td class="a-center">
                                        <c:if test="${data.urlType eq '0'}">전체 URL</c:if>
                                        <c:if test="${data.urlType eq '1'}">호스트만</c:if>
                                        <c:if test="${data.urlType eq '2'}">쿼리제외</c:if>
                                    </td>
                                    <td>${data.detection}</td>
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