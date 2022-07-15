<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<script src="/resources/js/appliance/versionMng/list.js" type="text/babel"></script>
<script src="/resources/js/lang/appliance/appliance_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_APPLIANCE_TITLE4"><%--라이센스 관리--%></h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>

                            <div class="inline-group">
                                <select name="customerIdx" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_APPLIANCE_CUSTOMER_NAME" value=""><%--업체명--%></option>
                                    <c:forEach var="customer" items="${customerList}">
                                        <option value="${customer.idx}" ${param.customerIdx eq customer.idx ? 'selected' : ''}>${customer.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="equipmentCode" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_APPLIANCE_EQUIPMENT_CODE_NAME" value=""><%--사용 장비명--%></option>
                                    <c:forEach var="code" items="${equipmentList}">
                                        <option value="${code.code}" ${param.equipmentCode eq code.code ? 'selected' : ''}>${code.codeExp}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="inline-group">
                                <select name="productCode" class="default-input w200">
                                    <option class="trn" data-trn-key="TR_APPLIANCE_PRODUCT_CODE" value=""><%--제품명--%></option>
                                    <c:forEach var="code" items="${productList}">
                                        <option value="${code.code}" ${param.productCode eq code.code ? 'selected' : ''}>${code.codeExp}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <%--<div class="inline-group">
                                <select name="searchType" class="default-input w100">
                                    <option value="">전체</option>
                                    <option value="subject" ${param.searchType eq 'subject' ? 'selected' : ''}>제목</option>
                                    <option value="regId" ${param.searchType eq 'regId' ? 'selected' : ''}>작성자</option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText" value="${param.searchText}" maxlength="100">
                            </div>--%>
                        </div>

                        <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                        <div class="b-form-group__item">
                            <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                            <div class="inline-group">

                                <%--검색--%>
                                <input type="button" class="btn-base btn-search w100 trn" data-trn-value="TR_SEARCH" value="<%--검색--%>" onclick="search()">
                            </div>
                            <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
                        </div>
                    </div>
                </form>

                <form id="pageForm">
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="customerIdx" value="${param.customerIdx}">
                    <input type="hidden" name="equipmentCode" value="${param.equipmentCode}">
                    <input type="hidden" name="productCode" value="${param.productCode}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <fmt:formatNumber value="${totalCount}" pattern="#,###"/></span>
                    <input type="button" class="btn-baseRound" value="등록" onclick="savePopup();">

                    <div class="b-list-top__right">
                        <%@ include file="../../../include/pageSize.jsp" %>
                    </div>
                </div>

                <div class="b-tableWrap">

                    <table class="b-listTable">
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="trn" data-trn-key="TR_APPLIANCE_CUSTOMER_NAME"><%--업체명--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_EQUIPMENT_CODE_NAME"><%--사용 장비명--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_ACTIVATION_CODE"><%--활성화 코드--%></th>
                            <th class="trn" data-trn-key="TR_APPLIANCE_PRODUCT_CODE"><%--제품명--%></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="4" class="nodata class" data-trn-key="TR_COMMON_NODATA"><%--데이터가 존재하지 않습니다.--%></td>
                            </tr>
                        </c:if>
                        <c:forEach var="version" items="${versionList}">
                            <tr class="pointer" onclick="savePopup(${version.idx})">
                                <td class="a_center">${version.customerName}</td>
                                <td class="a_center">${version.equipmentCodeName}</td>
                                <td class="a_center">${version.activationCode}</td>
                                <td class="a_center">${version.productCodeName}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

                <div>
                    <%@ include file="../../../include/paging.jsp" %>
                </div>

            </div><%--b-list--%>
        </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>


</div><!--l-container-->
</body>
</html>