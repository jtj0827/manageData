<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<script src="/resources/js/customerService/salesData/list.js" type="text/babel"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>
<section class="l-content-area">
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE7"><%--영업자료 - 제안서 및 브로슈어--%></h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION"><%--검색 조건--%></label>
                            <div class="inline-group">
                                <select name="materialGubun" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_COMMON_GUBUN" value=""><%--구분--%></option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_PROPOSAL" value="P" ${param.materialGubun eq 'P' ? 'selected' : ''}><%--제안서--%></option>
                                    <option class="trn" data-trn-key="TR_CUSTOMER_SERVICE_BROCHURE" value="B" ${param.materialGubun eq 'B' ? 'selected' : ''}><%--브로셔--%></option>
                                </select>
                            </div>
                            <div class="inline-group">
                                <select name="searchType" class="default-input w120">
                                    <option class="trn" data-trn-key="TR_COMMON_SEARCH_ALL" value=""><%--전체--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_SUBJECT" value="subject" ${param.searchType eq 'subject' ? 'selected' : ''}><%--제목--%></option>
                                    <option class="trn" data-trn-key="TR_COMMON_WRITER" value="regId" ${param.searchType eq 'regId' ? 'selected' : ''}><%--작성자--%></option>
                                </select>

                                <input type="text" class="default-input w200" name="searchText"
                                       value="${param.searchText}" maxlength="100">
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
                    <input type="hidden" name="pageNo">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">
                    <input type="hidden" name="step" value="${param.step}">
                    <input type="hidden" name="searchType" value="${param.searchType}">
                    <input type="hidden" name="searchText" value="${param.searchText}">
                </form>
            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->


        <div class="b-sub-content b-sub-content--borderbox mt40">
            <article class="b-custDown-list">

                <c:forEach var="category" items="${categoryList}" varStatus="status">
                    <c:choose>
                        <c:when test="${category.name eq 'Secu E Cloud'}">
                            <div class="b-custDown-list__row layout-cnt2 layout-cnt1-t">
                                <div class="item-inner b-custDown-list__item"
                                     style="${status.count % 2 != 0 ? 'margin-right: 2%' : ''}; width:100%; margin-right:2px;">
                                    <h1 class="b-custDown-list__heading b-sub-heading">${category.name}</h1>
                                    <ul class="b-custDown-list__div layout-cnt3 layout-cnt1-ml">

                                        <c:forEach var="salesData" items="${salesDataList}" varStatus="status2">
                                            <c:if test="${salesData.category eq category.code}">
                                                <c:choose>
                                                    <c:when test="${salesData.materialGubun eq 'P'}">
                                                        <li class="item">
                                                            <a href="#" onclick="moveView(${salesData.idx});">
                                                                <img src="/file/download/${salesData.thumbnailIdx}">
                                                            </a>
                                                            <a href="/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${salesData.proposalFileIdx}">
                                                                <button class="b-custDown-list__btn l-ico-wrap b-custDown-list__btn--openlayer">
                                                                    <span class="pr5">${salesData.subject}</span>
                                                                    <i class="icosp icosp-download"></i>
                                                                </button>
                                                            </a>
                                                            <a href="javascript:void(0)" onclick="popupDownView(${salesData.idx})">
                                                                <span class="downcount"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_DOWNLOAD_COUNT"><%--다운 수--%></span> <fmt:formatNumber value="${salesData.downloadCount}" pattern="#,###"/></span>
                                                            </a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="item">
                                                            <a href="#" onclick="moveView(${salesData.idx});">
                                                                <img src="/file/download/${salesData.thumbnailIdx}">
                                                            </a>
                                                            <a href="/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${salesData.proposalFileIdx}">
                                                                <button class="b-custDown-list__btn l-ico-wrap b-custDown-list__btn--openlayer">
                                                                    <span class="pr5">${salesData.subject}</span>
                                                                    <i class="icosp icosp-download"></i>
                                                                </button>
                                                            </a>
                                                            <a href="javascript:void(0)" onclick="popupDownView(${salesData.idx})">
                                                                <span class="downcount"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_DOWNLOAD_COUNT"><%--다운 수--%></span> <fmt:formatNumber value="${salesData.downloadCount}" pattern="#,###"/></span>
                                                            </a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>
                        </c:when>
                        <%--                        <c:when test="${catagory.name eq 'Kiwontech'}"></c:when>--%>
                        <c:when test="${status.count < 3}">
                            <c:if test="${status.count % 2 == 1}">
                                <div class="b-custDown-list__row layout-cnt2 layout-cnt1-t">
                            </c:if>
                            <div class="item-inner b-custDown-list__item"
                                 style="${status.count % 2 != 0 ? 'margin-right: 2%' : ''}">
                                <h1 class="b-custDown-list__heading b-sub-heading">${category.name}</h1>
                                <ul class="b-custDown-list__div layout-cnt2 layout-cnt1-ml">

                                    <c:forEach var="salesData" items="${salesDataList}" varStatus="status2">
                                        <c:if test="${salesData.category eq category.code}">

                                            <c:choose>
                                                <c:when test="${salesData.materialGubun eq 'P'}">
                                                    <li class="item">
                                                        <a href="#" onclick="moveView(${salesData.idx});">
                                                            <img src="/file/download/${salesData.thumbnailIdx}">
                                                        </a>
                                                        <a href="/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${salesData.proposalFileIdx}">
                                                            <button class="b-custDown-list__btn l-ico-wrap b-custDown-list__btn--openlayer">
                                                                <span class="pr5">${salesData.subject}</span>
                                                                <i class="icosp icosp-download"></i>
                                                            </button>
                                                        </a>
                                                        <a href="javascript:void(0)" onclick="popupDownView(${salesData.idx})">
                                                            <span class="downcount"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_DOWNLOAD_COUNT"><%--다운 수--%></span> <fmt:formatNumber value="${salesData.downloadCount}" pattern="#,###"/></span>
                                                        </a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="item">
                                                        <a href="#" onclick="moveView(${salesData.idx});">
                                                            <img src="/file/download/${salesData.thumbnailIdx}">
                                                        </a>
                                                        <a href="/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${salesData.proposalFileIdx}">
                                                            <button class="b-custDown-list__btn l-ico-wrap b-custDown-list__btn--openlayer">
                                                                <span class="pr5">${salesData.subject}</span>
                                                                <i class="icosp icosp-download"></i>
                                                            </button>
                                                        </a>
                                                        <a href="javascript:void(0)" onclick="popupDownView(${salesData.idx})">
                                                            <span class="downcount"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_DOWNLOAD_COUNT"><%--다운 수--%></span> <fmt:formatNumber value="${salesData.downloadCount}" pattern="#,###"/></span>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </c:forEach>

                                </ul>
                            </div>
                            <c:if test="${status.count % 2 == 0}">
                                </div>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${status.count % 2 == 0}">
                                <div class="b-custDown-list__row layout-cnt2 layout-cnt1-t">
                            </c:if>
                            <div class="item-inner b-custDown-list__item"
                                 style="${status.count % 2 != 1 ? 'margin-right: 2%' : ''}">
                                <h1 class="b-custDown-list__heading b-sub-heading">${category.name}</h1>
                                <ul class="b-custDown-list__div layout-cnt2 layout-cnt1-ml">

                                    <c:forEach var="salesData" items="${salesDataList}" varStatus="status2">
                                        <c:if test="${salesData.category eq category.code}">

                                            <c:choose>
                                                <c:when test="${salesData.materialGubun eq 'P'}">
                                                    <li class="item">
                                                        <a href="#" onclick="moveView(${salesData.idx});">
                                                            <img src="/file/download/${salesData.thumbnailIdx}">
                                                        </a>
                                                        <a href="/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${salesData.proposalFileIdx}">
                                                            <button class="b-custDown-list__btn l-ico-wrap b-custDown-list__btn--openlayer">
                                                                <span class="pr5">${salesData.subject}</span>
                                                                <i class="icosp icosp-download"></i>
                                                            </button>
                                                        </a>
                                                        <a href="javascript:void(0)" onclick="popupDownView(${salesData.idx})">
                                                            <span class="downcount"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_DOWNLOAD_COUNT"><%--다운 수--%></span> <fmt:formatNumber value="${salesData.downloadCount}" pattern="#,###"/></span>
                                                        </a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="item">
                                                        <a href="#" onclick="moveView(${salesData.idx});">
                                                            <img src="/file/download/${salesData.thumbnailIdx}">
                                                        </a>
                                                        <a href="/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${salesData.proposalFileIdx}">
                                                            <button class="b-custDown-list__btn l-ico-wrap b-custDown-list__btn--openlayer">
                                                                <span class="pr5">${salesData.subject}</span>
                                                                <i class="icosp icosp-download"></i>
                                                            </button>
                                                        </a>
                                                        <a href="javascript:void(0)" onclick="popupDownView(${salesData.idx})">
                                                            <span class="downcount"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_DOWNLOAD_COUNT"><%--다운 수--%></span> <fmt:formatNumber value="${salesData.downloadCount}" pattern="#,###"/></span>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </c:forEach>

                                </ul>
                            </div>
                            <c:if test="${status.count % 2 == 1}">
                                </div>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    <%--                    <c:if test="${status.count % 2 == 0}">--%>
                    <%--                        </div>--%>
                    <%--                    </c:if>--%>
                </c:forEach>
            </article>
        </div>
        <div style="max-width:1024px ">
            <input type="button" class="fr mt10 trn btn-baseRound btn-add w80 trn" data-trn-key="TR_COMMON_REGISTRATION" value="등록" onclick="location.href='form'">
        </div>
    </div>
    <%--l-maxwrap--%>
    <%--b-list--%>
</section>
</div><!--l-container-->
</body>
</html>