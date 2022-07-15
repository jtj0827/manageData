<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<script src="/resources/js/customerMng/customer/list.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CLOUD_TITLE4"><%--고객사 현황--%></h1>

<%--    <div class="l-maxwrap">--%>
    <div>
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>
                            <div class="inline-group">
                                <select name="businessYn" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_CLOUD_COMPANY_BUSINESS_YN" value=""><%--기업 형태--%></option>
                                    <option class="trn" data-trn-key="TR_CORPORATE_BODY" value="true" ${param.businessYn == "true" ? 'selected' : ''}><%--법인--%></option>
                                    <option class="trn" data-trn-key="TR_INDIVIDUAL" value="false" ${param.businessYn == "false" ? 'selected' : ''}><%--개인--%></option>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="searchType" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER" value="name" ${param.searchType eq 'name' ? 'selected' : ''}><%--고객사--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_REP_NAME" value="repName" ${param.searchType eq 'repName' ? 'selected' : ''}><%--대표자명--%></option>
                                    <option class="trn" data-trn-key="TR_CLOUD_ADMIN_NAME" value="adminName" ${param.searchType eq 'adminName' ? 'selected' : ''}><%--담당자명--%></option>
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
                    <table class="b-listTable plus">
                        <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                        <colgroup>
                            <col width="5%">
                            <col width="15%">
                            <col width="10%">
                            <col width="10%">
                            <%--<col width="10%">--%>
                            <%--<col width="10%">--%>
                            <%--<col width="10%">--%>
                            <col width="12%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                            <th class="trn" data-trn-key="TR_CUSTOMER"><%--고객사--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_ADMIN_INFO"><%--담당자 정보--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_ADMIN_INFO_PHONE_NUM"><%--담당자 휴대폰번호--%></th>
                            <th class="trn" data-trn-key="TR_CLOUD_ADMIN_INFO_EMAIL"><%--담당자 보조 이메일--%></th>
                            <th class="trn" data-trn-key="TR_MOD_DATE"><%--수정일--%></th>
                            <th class="trn" data-trn-key="TR_MOD_WRITER"><%--수정자--%></th>
                            <th class="trn" data-trn-key="TR_COMMON_REG_DATE"><%--등록일--%></th>
                            <th class="trn" data-trn-key="TR_COMMON_REGISTRANT"><%--등록자--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="10" class="nodata trn" data-trn-key="TR_COMMON_NOTDATALIST"><%--데이터가 존재 하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="management" items="${managementList}" varStatus="status">
                            <tr class="pointer" onclick="moveView(${management.idx})">
                                <td class="a_center">${management.idx}</td>                             <%-- 번호 --%>
                                <td class="a_center">${management.name}                            <%-- 고객사 --%>
                                    <c:if test="${management.name == null}">-</c:if>
                                </td>
                                <td class="a_center">                                               <%-- 담당자 이름 --%>
                                    ${management.adminName} / ${management.adminPosition}
                                </td>
                                <td class="a_center">                                               <%--담당자 휴대폰번호--%>
                                    <c:set var="adminPhone" value="${fn:split(management.adminPhone, '-')}"/>
                                    <c:if test="${fn:replace(adminPhone[0], null, '') != '' && fn:replace(adminPhone[1], null, '') != '' && fn:replace(adminPhone[2], null, '') != ''}">
                                        ${management.adminPhone}
                                    </c:if>
                                </td>
                                <td class="a_center">                                               <%--담당자 보조메일--%>
                                    ${management.adminSubEmail}
                                </td>
                                <td class="a_center">                                                   <%-- 수정일 --%>
                                    <fmt:formatDate value="${management.modDate}" pattern="yyyy-MM-dd"/>
                                    <c:if test="${management.modDate == null}">-</c:if>
                                </td>
                                <td class="a_center">${management.modId}                                <%-- 수정자 --%>
                                    <c:if test="${management.modDate == null}">-</c:if>
                                </td>
                                <td class="a_center">                                                   <%-- 등록일 --%>
                                    <fmt:formatDate value="${management.regDate}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td class="a_center">${management.regId}</td>                           <%-- 등록자 --%>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../include/paging.jsp" %>
                </div>

                <input type="button" class="trn btn-baseRound btn-add w80 mt10 trn" data-trn-value="TR_COMMON_REGISTRATION" value="등록" onclick="location.href='form'">

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>

</div><!--l-container-->
</body>
</html>