<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/adminMng/admin/list.js" type="text/babel" data-presets="es2015, stage-3"></script>
<script src="/resources/js/lang/adminMng/adminMng_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_TITLE2"><%--관리자 관리--%></h1>
    <input type="hidden" value="${sessionScope.accountInfo.id}" name="accountId">
    <input type="hidden" value="${sessionScope.accountInfo.idx}" name="accountIdx">
    <input type="hidden" value="${sessionScope.accountInfo.auth}" name="auth">

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="saveForm">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <input type="hidden" name="idx">
                            <div class="inline-group mr10">
                                <label class="trn" data-trn-key="TR_COMMON_NAME"><%--이름--%></label>
                                <input type="text" class="default-input w120 ml10" name="name" maxlength="100">
                            </div>
                            <div class="inline-group mr10">
                                <label>ID</label>
                                <input type="text" class="default-input w120 ml10" name="id" maxlength="100">
                            </div>
                            <div class="inline-group mr13" name="pwdArea">
                                <label class="trn" data-trn-key="TR_COMMON_PASSWORD"><%--비밀번호--%></label>
                                <input type="text" class="default-input w120 ml10" name="pwdText" maxlength="100">
                            </div>
                            <div class="inline-group mr10">
                                <label class="trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_DENY_IP"><%--IP 접근제한--%></label>
                                <select name="denyIp" class="default-input w120 ml10">
                                    <option class="trn" data-trn-key="TR_COMMON_APPLY_TRUE" value="T"><%--적용--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_APPLY_FALSE" value="F"><%--미적용--%></option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <%--등록--%>
                                <input type="button" class="btn-base w100 btn-add trn" data-trn-value="TR_COMMON_REGISTRATION" value="<%--등록--%>" onclick="save()">
                            </div>
                        </div>
                    </div>
                </form>

                <form id="pageForm">
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="denyIp" value="${param.denyIp}">
                    <input type="hidden" name="searchText" value="${paging.searchText}">
                    <input type="hidden" name="searchType" value="${param.searchType}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->


        <div>
            <div>
                <form id="searchForm" class="mt20">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="inline-group">
                        <select name="denyIp" class="default-input w155">
                            <option class="trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_ALLOW_IP_TRUE" value="" ${param.denyIp eq 'A' ? 'selected' : ''}><%--전체 IP--%></option>
                            <option class="trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_DENY_IP_TRUE" value="T" ${param.denyIp eq 'T' ? 'selected' : ''}>IP 접근제한 적용</option>
                            <option class="trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_DENY_IP_FALSE" value="F" ${param.denyIp eq 'F' ? 'selected' : ''}>IP 접근제한 미적용</option>
                        </select>
                    </div>
                    <div class="inline-group">
                        <select name="searchType" class="default-input w120">
                            <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                            <option value="id" ${param.searchType eq 'id' ? 'selected' : ''}>ID</option>
                            <option class="trn" data-trn-key="TR_COMMON_NAME" value="name" ${param.searchType eq 'name' ? 'selected' : ''}><%--이름--%></option>
                        </select>
                    </div>
                    <div class="inline-group">
                        <input type="text" class="default-input w200" name="searchText" value="${paging.searchText}"
                               maxlength="100">
                    </div>
                    <div class="inline-group">
                        <%--검색--%>
                        <input type="button" class="btn-base btn-search w100 trn" data-trn-value="TR_SEARCH" value="<%--검색--%>" onclick="search()">
                    </div>
                </form>
            </div>

        </div>


        <div class="l-content">
            <div class="b-list">
                <div class="b-tableWrap">
                    <table class="b-listTable plus" name="adminTable">
                        <caption class="offscreen trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_LIST"><%--관리자 목록--%></caption>
                        <colgroup>
                            <col width="7%">
                            <col width="10%">
                            <col width="12%">
                            <col width="13%">
                            <c:if test="${sessionScope.accountInfo.id eq '315'}">
                                <col width="7%">
                            </c:if>
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <th class="trn" data-trn-key="TR_COMMON_NAME"><%--이름--%></th>
                            <th>ID</th>
                            <th class="trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_DENY_IP"><%--IP 접근제한--%></th>
                            <c:if test="${sessionScope.accountInfo.id eq '315'}">
                                <th class="trn" data-trn-key="TR_COMMON_DELETE"><%--삭제--%></th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td class="a-center nodata trn" data-trn-key="TR_COMMON_SEARCH_NODATA" colspan="${sessionScope.accountInfo.id eq '315' ? '5' : '4'}"><%--검색 결과가 없습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:if test="${totalCount ne 0}">
                            <c:forEach var="account" items="${accountList}" varStatus="status">
                                <tr class="hover" onclick='modify(${status.index})'>
                                    <input type="hidden" value="${account.idx}">
                                    <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                    <td class="a_center">${account.name}</td>
                                    <td class="a_center">${account.id}</td>
                                    <c:choose>
                                        <c:when test="${account.denyIp eq 'T'}">
                                            <td class="a_center trn" data-trn-key="TR_COMMON_APPLY_TRUE"><%--적용--%></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="a_center trn" data-trn-key="TR_COMMON_APPLY_FALSE"><%--미적용--%></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${sessionScope.accountInfo.id eq '315'}">
                                        <td class="a_center">
                                            <c:choose>
                                                <c:when test="${account.id eq '315'}">
                                                    -
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="button" class="btn-base btn-default w100 trn" data-trn-value="TR_COMMON_DELETE" value="<%--삭제--%>" onclick="deleteByIdx(${account.idx})">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:if>

                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->
            </div>
            <div style="max-width: 1024px;">
                <%@ include file="../../include/paging.jsp" %>
            </div>

        </div>
    </div>
</section>

</body>
</html>
