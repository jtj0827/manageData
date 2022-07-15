<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<script type="text/babel" src="/resources/js/data/common/dataCommon.js"></script>
<script type="text/babel" src="/resources/js/data/whiteList.js"></script>

<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">화이트리스트</h1>

    <div class="l-maxwrap">
        <div class="b-listSearchForm">
            <div class="b-listSearchForm__inner">
                <form id="searchForm">
                    <div class="b-form-group">
                        <div class="b-form-group__item">
                            <label class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE">검사 범위</label>

                            <div class="inline-group checkbox-group multi fixedW">
                                <label>
                                    <input type="checkbox" name="inspRangeArray" value="T" ${paging.rangeCheck("T") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_T">제목</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspRangeArray" value="C" ${paging.rangeCheck("C") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_C">본문</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspRangeArray" value="H" ${paging.rangeCheck("H") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_H">헤더</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspRangeArray" value="A" ${paging.rangeCheck("A") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_A">첨부파일</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspRangeArray" value="S" ${paging.rangeCheck("S") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_S">메일서버 IP</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspRangeArray" value="D" ${paging.rangeCheck("D") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_D">도메인</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspRangeArray" value="M" ${paging.rangeCheck("M") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_M">메일 주소</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspRangeArray" value="R" ${paging.rangeCheck("R") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_M">IP 대역</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspRangeArray" value="N" ${paging.rangeCheck("N") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_RAGNE_M">발신자 명</span>
                                </label>
                            </div><!--inline-group-->
                        </div>
                        <div class="b-form-group__item">

                            <label class="trn" data-trn-key="TR_FILTER_RECV_INSP_CONDITION">검사 조건</label>

                            <div class="inline-group checkbox-group multi fixedW">
                                <label>
                                    <input type="checkbox" name="inspConditionArray" value="Q" ${paging.conditionCheck("Q") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSPCON_Q">일치</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspConditionArray" value="S" ${paging.conditionCheck("S") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSPCON_S">시작</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspConditionArray" value="I" ${paging.conditionCheck("I") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSPCON_I">포함</span>
                                </label>

                                <label>
                                    <input type="checkbox" name="inspConditionArray" value="E" ${paging.conditionCheck("E") ? "checked" : ""}>
                                    <span class="checkmark"></span>
                                    <span class="trn" data-trn-key="TR_FILTER_RECV_INSPCON_E">끝</span>
                                </label>
                            </div><!--inline-group-->

                        </div>
                        <div class="b-form-group">
                            <div class="b-form-group__item">

                                <label class="trn" data-trn-key="TR_FILTER_RECV_INSP_GUBUN">검사 구분</label>

                                <div class="inline-group checkbox-group multi fixedW">
                                    <label>
                                        <input type="checkbox" name="inspGubunArray" value="T" ${paging.gubunCheck("T") ? "checked" : ""}>
                                        <span class="checkmark"></span>
                                        <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_GUBUN_T">텍스트</span>
                                    </label>

                                    <label>
                                        <input type="checkbox" name="inspGubunArray" value="R" ${paging.gubunCheck("R") ? "checked" : ""}>
                                        <span class="checkmark"></span>
                                        <span class="trn" data-trn-key="TR_FILTER_RECV_INSP_GUBUN_R">정규표현식</span>
                                    </label>
                                </div><!--inline-group-->

                            </div><!--b-form-group__item-->

                        </div>
                        <div class="b-form-group">
                            <!--b-form-group__item-->



                            <div class="b-form-group__item">
                                <label class="trn" data-trn-key="TR_FILTER_RECV_ALLOW_CONTENTS">허용내용</label>

                                <div class="inline-group">
                                    <input type="text" class="default-input w175" maxlength="100" name="searchText" value="${paging.searchText}">
                                </div><!--inlinesearchForm-group-->

                            </div><!--b-form-group__item-->

                            <div class="b-form-group__item">
                                <div class="inline-group">

                                    <input type="button" value="검색" onclick="search()" class="btn-base btn-search w100 trn" data-trn-value="TR_SEARCH" data-trn-key="">
                                </div><!--inline-group-->

                            </div><!--b-form-group__item-->

                        </div>

                    </div>
                </form>
                <form id="pageForm">
                    <input type="hidden" name="pageNo" value="${paging.pageNo}">
                    <input type="hidden" name="pageSize" value="${paging.pageSize}">

                    <c:forEach var="rangeArray" items="${paging.inspRangeArray}">
                        <input type="hidden" name="inspRangeArray" value="${rangeArray}">
                    </c:forEach>
                    <c:forEach var="conditionArray" items="${paging.inspConditionArray}">
                        <input type="hidden" name="inspConditionArray" value="${conditionArray}">
                    </c:forEach>
                    <c:forEach var="gubunArray" items="${paging.inspGubunArray}">
                        <input type="hidden" name="inspGubunArray" value="${gubunArray}">
                    </c:forEach>
                    <input type="hidden" name="searchText" value="${paging.searchText}">
                </form>

            </div><!--b-listSearchForm__inner-->

        </div><!--b-listSearchForm-->

        <!--컨텐츠영역 공통 스타일 <div class="l-content">-->
        <div class="l-content">
            <div class="b-list">
                <div class="b-list-top">
                    <span class="b-list-top__total">TOTAL - <span id="totalCount"><fmt:formatNumber value="${totalCount}" pattern="#,###"/></span></span>
                    <div class="b-list-top__right"><%@ include file="../include/pageSize.jsp" %></div>

                    <input type="button" class="btn-baseRound trn" onclick="whiteListPopup()" value="등록">
                    <input type="button" onclick="deleteAll();" class="btn-baseRound fc-red" value="삭제">
                </div>

                <div class="b-tableWrap">
                    <table class="b-listTable">
                        <caption class="offscreen">게시글 목록</caption>
                        <colgroup>
                            <col width="5%"/>
                            <col width="20%"/>
                            <col width="15%"/>
                            <col width="25%"/>
                            <col width="10%"/>
                            <col width="15%"/>
                            <col width="20%"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th><input type="checkbox" name="whiteListCheckGubun" class="whiteListCheckGubun" onchange="allCheckedBox()"></th>
                            <th>검사범위/구분/조건</th>
                            <th>내용</th>
                            <th>설명</th>
                            <th>점수</th>
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
                            <c:forEach items="${whiteList}" var="data" varStatus="status">
                                <tr class="pointer">
                                    <td class="a-center">
                                        <input type="checkbox" name="whiteListCheckGubun" class="whiteListCheckGubun" value="${data.idx}">
                                    </td>
                                    <td class="a-center" onclick="whiteListPopup('${data.idx}')">
                                        <c:choose>
                                            <c:when test="${data.inspRange eq 'T'}">제목</c:when>
                                            <c:when test="${data.inspRange eq 'C'}">본문</c:when>
                                            <c:when test="${data.inspRange eq 'H'}">헤더</c:when>
                                            <c:when test="${data.inspRange eq 'A'}">첨부파일</c:when>
                                            <c:when test="${data.inspRange eq 'S'}">메일서버IP</c:when>
                                            <c:when test="${data.inspRange eq 'D'}">도메인</c:when>
                                            <c:when test="${data.inspRange eq 'M'}">메일주소</c:when>
                                            <c:when test="${data.inspRange eq 'R'}">IP 대역</c:when>
                                            <c:when test="${data.inspRange eq 'N'}">발신자 명</c:when>
                                        </c:choose>
                                        <c:if test="${data.inspRange ne 'R'}">
                                            /
                                            <c:choose>
                                                <c:when test="${data.inspGubun eq 'T'}">텍스트</c:when>
                                                <c:when test="${data.inspGubun eq 'R'}">정규식표현</c:when>
                                            </c:choose>
                                            /
                                            <c:choose>
                                                <c:when test="${data.inspCondition eq 'Q'}">일치</c:when>
                                                <c:when test="${data.inspCondition eq 'S'}">시작</c:when>
                                                <c:when test="${data.inspCondition eq 'I'}">포함</c:when>
                                                <c:when test="${data.inspCondition eq 'E'}">끝</c:when>
                                            </c:choose>
                                        </c:if>

                                    </td>
                                    <td class="a-center" onclick="whiteListPopup('${data.idx}')">${data.contents}</td>
                                    <td class="a-center" onclick="whiteListPopup('${data.idx}')">${data.explanation}</td>
                                    <td class="a-center" onclick="whiteListPopup('${data.idx}')">${data.spamScore}</td>
                                    <td class="a-center" onclick="whiteListPopup('${data.idx}')">${data.regId}</td>
                                    <td class="a-center" onclick="whiteListPopup('${data.idx}')"><fmt:formatDate value="${data.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
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