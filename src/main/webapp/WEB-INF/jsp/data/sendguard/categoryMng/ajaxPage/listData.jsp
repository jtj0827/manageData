<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="l-maxwrap">
    <div class="b-listSearchForm">
        <div class="b-listSearchForm__inner">
            <form id="searchForm">
                <input type="hidden" name="searchCategory" value="${param.searchCategory}">

                <div class="b-form-group">
                    <div class="b-form-group__item">
                        <label>유형</label>
                        <div class="inline-group">
                            <input type="text" class="default-input w200" id="searchText" name="searchText" value="${param.searchText}" maxlength="30">
                        </div>
                    </div>

                    <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                    <div class="b-form-group__item">
                        <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                        <div class="inline-group">

                            <%--검색--%>
                            <input type="button" class="btn-base btn-search w100" value="검색" onclick="search()">
                        </div>
                        <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                    </div>
                </div>
            </form>
            <form id="pageForm">
                <input type="hidden" name="pageNo" value="${paging.pageNo}">
                <input type="hidden" name="pageSize" value="${paging.pageSize}">
                <input type="hidden" name="searchText" value="${param.searchText}">
                <input type="hidden" name="searchCategory" value="${param.searchCategory}">
            </form>

        </div><!--b-listSearchForm__inner-->

    </div><!--b-listSearchForm-->

    <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
    <div class="l-content">
        <div class="b-list">
            <div class="b-list-top">
                <span class="b-list-top__total">TOTAL - <span id="totalCount"><fmt:formatNumber value="${totalCount}" pattern="#,###"/></span></span>
                <div class="b-list-top__right"><%@ include file="../../../../include/pageSize.jsp" %></div>


                <input type="button" class="btn-baseRound trn" onclick="categoryManagerPopUp(${topIdx})" value="등록">
                <input type="button" onclick="categoryDeleteAll();" class="btn-baseRound fc-red" value="삭제">
            </div>

            <div class="b-tableWrap">
                <table class="b-listTable">
                    <caption class="offscreen">게시글 목록</caption>
                    <colgroup>
                        <col width="5%"/>
                        <col width="55%"/>
                        <col width="20%"/>
                        <col width="20%"/>
                    </colgroup>
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="categoryListCheckGubun" class="categoryListCheckGubun" onchange="allCheckedBox(this)"></th>
                        <th>유형</th>
                        <th>작성자</th>
                        <th>등록일</th>
                    </tr>
                    </thead>
                    <tbody id="tableBody">
                    <c:if test="${totalCount eq 0}">
                        <tr>
                            <td class="a-center" colspan="7">조회되는 데이터가 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:if test="${totalCount ne 0}">
                        <c:forEach items="${categoryManagerList}" var="data" varStatus="status">
                            <tr class="pointer">
                                <td class="a-center">
                                    <input type="checkbox" name="categoryListCheckGubun" class="categoryListCheckGubun" value="${data.idx}">
                                </td>
                                <td class="a-center" onclick="moveDetailList('${data.idx}')">${data.name}</td>
                                <td class="a-center" onclick="moveDetailList('${data.idx}')">${data.regId}</td>
                                <td class="a-center" onclick="moveDetailList('${data.idx}')"><fmt:formatDate value="${data.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
            <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

            <div id="pagingDiv">
                <%@ include file="../../../../include/paging.jsp" %>
            </div>

        </div><%--b-list--%>
    </div><%--l-content--%>
</div><%--l-maxwrap--%>