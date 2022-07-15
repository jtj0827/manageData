<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<script src="/resources/js/customerService/salesData/list.js" type="text/babel"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>
<section class="l-content-area">
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CUSTOMER_SERVICE_TITLE4"><%--영업자료 - 뉴스레터--%></h1>

    <div class="l-maxwrap" style="font-size: 0;padding-bottom: 45px;">
        <div class="b-sub-content b-sub-content--borderbox">
            <article class="b-newsletter-wrap">
                <form id="pageForm">
                    <input type="hidden" name="pageNo">
                </form>
                <h1 class="offscreen"></h1>
                <div class="b-newsletter layout-cnt3 layout-cnt3-t layout-cnt2-m">
                    <c:forEach var="salesData" items="${salesDataList}">
                        <div class="b-newsletter__box">
                            <a href="javaScript:;" onclick="moveView(${salesData.idx})" class="b-newsletter__item item hoverline open_view_popup_btn dis-ib">
                                <figure class="b-newsletter__figure">
                                    <div class="b-newsletter__imgwrap hasmask">
                                        <span class="dis-n hasmask-item"></span>
                                        <div class="b-newsletter__img">
                                            <img src="/file/download/${salesData.thumbnailIdx}">
                                        </div>
                                    </div>
                                </figure>
                            </a>
                            <div class="a-right">
                                <button class="b-newsletter__btn l-ico-wrap b-custDown-list__btn--openlayer" onclick="location.href='/customerService/salesData/fileDownload?idx=${salesData.idx}&fileIdx=${salesData.thumbnailIdx}'">
                                    <span class="b-custDown-list__txt txtell">${salesData.subject}</span>
                                    <i class="icosp icosp-download"></i>
                                </button>
                                <a href="javascript:void(0)" onclick="popupDownView(${salesData.idx})">
                                    <span class="downcount"><span class="trn" data-trn-key="TR_CUSTOMER_SERVICE_DOWNLOAD_COUNT"><%--다운 수--%></span> <fmt:formatNumber value="${salesData.downloadCount}" pattern="#,###"/></span>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </article>
        </div>
        <input type="button" class="fr mt10 trn btn-baseRound btn-add w80 trn" data-trn-value="TR_COMMON_REGISTRATION" value="등록" onclick="location.href='form'">

    </div>
    <%--b-list--%>
    <div style="max-width: 1024px;">
        <%@ include file="../../../include/paging.jsp" %>
    </div>
    </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>
</div><!--l-container-->
</body>
</html>