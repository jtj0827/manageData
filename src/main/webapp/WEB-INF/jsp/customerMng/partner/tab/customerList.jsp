<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="l-maxwrap">
    <div class="b-listSearchForm">
        <div class="b-listSearchForm__inner">
            <form id="customerSearchForm">
                <input type="hidden" name="partnerIdx" value="${partner.idx}">
                <input type="hidden" name="pageNo" value="1">
                <div class="b-form-group">
                    <div class="b-form-group__item">
                        <label>검색 조건</label>
                        <div class="inline-group">
                            <select name="operationType" class="default-input w100 ml20">
                                <option value="">운영 방식</option>
                                <option value="A">Appliance</option>
                                <option value="C">Cloud</option>
                            </select>
                        </div>

                        <div class="inline-group">
                            <select name="searchType" class="default-input w100">
                                <option value="">전체</option>
                                <option value="C">고객사명</option>
                                <option value="P">파트너사명</option>
                            </select>

                            <%-- LINE :: 검색어 input 엔터 서브밋 방지를 위한 input[type=hidden] 태그 --%>
                            <input hidden="hidden"/>
                            <input type="text" class="default-input w200" name="searchText" maxlength="100" onkeydown="if (window.event.keyCode == 13) getCustomerListAjax('S');">
                        </div>
                    </div>

                    <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
                    <div class="b-form-group__item">
                        <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
                        <div class="inline-group">

                            <%--검색--%>
                            <input type="button" class="btn-base btn-search w100" value="검색" onclick="getCustomerListAjax('S')">
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
            <div class="b-tableWrap">
                <table class="b-listTable">
                    <caption class="offscreen">게시글 목록</caption>
                    <colgroup>
                        <col width="5%">
                        <col width="10%">
                        <col width="10%">
                        <col width="*%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>운영방식</th>
                        <th>파트너사 명</th>
                        <th>고객사 명</th>
                        <th>승인여부</th>
                        <th>작성자</th>
                        <th>등록일</th>
                    </tr>
                    </thead>
                    <tbody id="customerList"></tbody>
                </table>
            </div>
            <!--리스트 감싸는 영역 </div class="b-tableWrap">-->

            <div id="customerPagingArea"></div>
        </div><%--b-list--%>
    </div><%--l-content--%>
</div><%--l-maxwrap--%>