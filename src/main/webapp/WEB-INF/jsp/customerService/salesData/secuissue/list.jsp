<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<script src="/resources/js/customerMng/partner/list.js" type="text/babel"></script>
<script src="/resources/js/lang/customerService/customerService_lang.js"></script>
<section class="l-content-area">
    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">영업자료 - 보안이슈</h1>

    <div class="l-maxwrap">
        <form id="pageForm">
            <input type="hidden" name="pageNo">
        </form>
        <div class="b-sub-content b-sub-content--borderbox">
            <article class="b-custIssue">
                <h1 class="offscreen">보안이슈 목록</h1>
                <ul class="b-custIssue-list">
                    <c:forEach var="salesData" items="${salesDataList}">
                        <li>
                            <div class="Security-inner">
                                <figure class="b-custIssue-list__figure">
                                    <img src="/file/download/${salesData.thumbnailIdx}" class="b-custIssue-list__img">
                                    <figcaption class="b-custIssue-list__caption">
                                        <a href="javaScript:;" onclick="moveView(${salesData.idx})" class="common_move_view_btn">
                                            <span class="title">${salesData.subject}</span>
                                            <span class="content">${salesData.mainContents.replaceAll('<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>', '')}</span>
                                        </a>

                                        <div class="Security-txt">
                                            <span class="date l-ico-wrap">
                                                <span class="downcount">작성일 <fmt:formatDate value="${salesData.regDate}" pattern="yyyy-MM-dd"/></span><br>
                                                <%--<span class="downcount">다운수 <fmt:formatNumber value="${salesData.downloadCount}" pattern="#,###"/></span>--%>
                                            </span>
                                                <%--<button class="b-Security__btn l-ico-wrap b-custDown-list__btn--openlayer">
                                                    <span class="pr5">다운로드</span>
                                                    <i class="icosp icosp-download"></i>
                                                </button>--%>
                                        </div>
                                    </figcaption>
                                </figure>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </article>
        </div>

        <input type="button" class="fr mt10 trn btn-baseRound btn-add w80" value="등록" onclick="location.href='form'">

    </div><%--b-list--%>

    <div style="max-width: 1024px;">
        <%@ include file="../../../include/paging.jsp" %>
    </div>
    </div><%--l-content--%>
    </div><%--l-maxwrap--%>
</section>
</div><!--l-container-->
</body>
</html>