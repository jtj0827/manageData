<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header_popup.jsp" %>
<script src="/resources/js/customerMng/customer/popup/getPartnerInfoPopup.js" type="text/babel"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
    <p class="pop_title trn" data-trn-key="TR_CLOUD_TITLE_ADD_PARTNER"><%--파트너사 추가--%></p>
        <div class="con_view">
            <div class="container_pop" style="width: 680px">
                <div class="b-listSearchForm">
                    <div class="b-listSearchForm__inner">
                        <form id="searchForm">
                            <div class="b-form-group">
                                <div class="b-form-group__item">
                                    <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>

                                    <div class="inline-group">
                                        <select name="step" class="default-input w100">
                                            <option value="">STEP</option>
                                            <option value="Z" ${paging.step eq 'Z'? 'selected' : ''}>ZeroStep</option>
                                            <option value="O" ${paging.step eq 'O'? 'selected' : ''}>OneStep</option>
                                            <option value="B" ${paging.step eq 'B'? 'selected' : ''}>BelowStep</option>
                                        </select>
                                    </div>

                                    <div class="inline-group">
                                        <select name="searchType" class="default-input w100">
                                            <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                            <option class="trn" data-trn-key="TR_CLOUD_COMPANY_NAME" value="name" ${paging.searchType eq 'name' ? 'selected' : ''}><%--기업명--%></option>
                                            <option class="trn" data-trn-key="TR_CLOUD_REP_NAME" value="repName" ${paging.searchType eq 'repName' ? 'selected' : ''}><%--대표자 명--%></option>
                                            <option class="trn" data-trn-key="TR_CLOUD_TOP_PARTNER" value="topName" ${paging.searchType eq 'topName' ? 'selected' : ''}><%--상위 파트너사--%></option>
                                        </select>
                                    </div>

                                    <div class="inline-group">
                                        <input type="text" class="default-input w200" name="searchText" value="${paging.searchText}" maxlength="100">
                                    </div>
                                </div>

                                <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                                <div class="b-form-group__item">
                                    <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                                    <div class="inline-group">

                                        <%--검색--%>
                                        <input type="button" class="btn-base btn-search w100 trn" data-trn-key="TR_SEARCH" value="검색" onclick="search()">
                                    </div>
                                    <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                                </div>
                            </div>
                        </form>

                        <form id="pageForm">
                            <input type="hidden" name="pageNo" value="${paging.pageNo}">
                            <input type="hidden" name="pageSize" value="${paging.pageSize}">
                            <input type="hidden" name="searchType" value="${paging.searchType}">
                            <input type="hidden" name="searchText" value="${paging.searchText}">
                            <input type="hidden" name="step" value="${paging.step}">
                        </form>
                    </div><!--b-listSearchForm__inner-->

                </div>
        </div>
    </div>
    <div class="l-content" style="padding: 20px;">
        <div class="b-tableWrap">
            <div class="b-tableWrap">
                <table class="b-listTable">
                    <colgroup>
                        <col width="10%">
                        <col width="13%">
                        <col width="*%">
                        <col width="15%">
                        <col width="30%">
                    </colgroup>
                    <thead>
                    <tr class="b-pop">
                        <th class="trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                        <th>STEP</th>
                        <th class="trn" data-trn-key="TR_CLOUD_COMPANY_NAME"><%--기업명--%></th>
                        <th class="trn" data-trn-key="TR_CLOUD_OWNER"><%--대표자--%></th>
                        <th class="trn" data-trn-key="TR_CLOUD_IDX"><%--고유번호--%></th>
                    </tr>
                    </thead>
                    <tbody class="text-center">
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="5" class="nodata trn" data-trn-key="TR_COMMON_NOTDATALIST"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="partner" items="${partnerList}" varStatus="status">
                            <tr class="pointer" onclick="selectPartnerAjax(${partner.idx})">
                                <td class="a_center">${(totalCount-status.index) - ((paging.pageNo-1) * paging.pageSize)}</td>
                                <td class="a_center">
                                    <c:choose>
                                        <c:when test="${partner.step eq 'Z'}">
                                            ZeroStep
                                        </c:when>
                                        <c:when test="${partner.step eq 'O'}">
                                            OneStep
                                        </c:when>
                                        <c:when test="${partner.step eq 'B'}">
                                            BellowStep
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td class="a_center">
                                    ${partner.name}
                                </td>
                                <td class="a_center">
                                    <span class="dis_b">${partner.repName}</span>
                                </td>
                                <td class="a_center">
                                    <span class="dis_b">${partner.uniqueNumber}</span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <%@ include file="../../../include/paging.jsp" %>
            </div>
        </div>
    </div>
</body>
</html>