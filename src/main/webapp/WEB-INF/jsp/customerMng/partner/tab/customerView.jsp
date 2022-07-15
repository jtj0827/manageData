<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>
<script src="/resources/js/customerMng/partner/view.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">파트너사 관리 - 고객사 현황</h1>

    <div class="l-maxwrap">
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">고객사 정보</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">게시글 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr class="table-head">
                        <th colspan="4" class="a_left">기본 정보</th>
                    </tr>
                    <%-- LINE :: 승인된 경우 제품별 서버 정보 노출 --%>
                    <c:if test="${customer.approvalState == 'A'}">
                        <c:if test="${customer.rguardUseYn}">
                            <tr>
                                <th>R-Guard 서버</th>
                                <td colspan="3">${rguardServer.name} (${rguardServer.ip})</td>
                            </tr>
                        </c:if>
                        <c:if test="${customer.sguardUseYn}">
                            <tr>
                                <th>S-Guard 서버</th>
                                <td colspan="3">${sguardServer.name} (${sguardServer.ip})</td>
                            </tr>
                        </c:if>
                        <c:if test="${customer.ecloudUseYn}">
                            <tr>
                                <th>Secu-Mail 서버</th>
                                <td colspan="3">${secumailServer.name} (${secumailServer.ip})</td>
                            </tr>
                        </c:if>
                    </c:if>
                    <tr>
                        <th>운영 방식</th>
                        <td>${customer.operationType eq 'A' ? "Appliance" : "Cloud"}</td>
                        <th>secu E cloud<br/>서비스 종류</th>
                        <td>${customer.secuEcloudGubun eq 'I' ? "I-Service" : "P-Service"}</td>
                    </tr>
                    <tr>
                        <th>사업자 여부</th>
                        <td>${customer.businessYn ? "사업자" : "개인"}</td>
                        <th>기업명</th>
                        <td>${customer.name}</td>
                    </tr>
                    <%-- LINE :: 사업자 여부 true인 경우 노출 --%>
                    <c:if test="${customer.businessYn}">
                        <tr>
                            <th>주식회사 여부</th>
                            <td>${customer.corpYn eq true ? 'O' : 'X'}</td>
                            <th>사업자 번호</th>
                            <td>${customer.businessNumber}</td>
                        </tr>
                    </c:if>
                    <tr>
                        <%-- LINE :: 사업자 여부 true인 경우 노출 --%>
                        <c:if test="${customer.businessYn}">
                            <th>대표자명</th>
                            <td>${customer.repName}</td>
                        </c:if>
                        <%-- LINE :: 사업자 여부 false(개인)인 경우 노출 --%>
                        <c:if test="${!customer.businessYn}">
                            <th>생년월일</th>
                            <td>${customer.birthDate}</td>
                        </c:if>
                        <th>대표번호</th>
                        <td>${customer.tel}</td>
                    </tr>
                    <tr>
                        <th>대표 이메일</th>
                        <td>${customer.email}</td>
                        <th>총 임직원 수</th>
                        <td>${customer.employCount} 명</td>
                    </tr>
                    <tr>
                        <th>서비스 사용</th>
                        <td colspan="3">
                            ${customer.servicePauseYn ? '사용 중' : '사용 중지'}
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td colspan="3">
                            <span class="dis_b">(${customer.zipcode})</span>
                            <span class="dis_b">${customer.addr}</span>
                            <span class="dis_b">${customer.addrDetail}</span>
                        </td>
                    </tr>
                    <tr>
                        <th>메모</th>
                        <td colspan="3" style="white-space: pre-wrap;">${customer.memo}</td>
                    </tr>
                    <tr>
                        <th>신청서</th>
                        <td colspan="3">
                            <c:choose>
                                <c:when test="${applyFormFile.idx > 0}">
                                    <a href="/file/download/${applyFormFile.idx}">${applyFormFile.name}</a>
                                </c:when>
                                <c:otherwise>
                                    등록된 파일이 없습니다.
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr class="table-head">
                        <th colspan="4" class="a_left">담당자 정보 1</th>
                    </tr>
                    <tr>
                        <th>담당자 정보(이름/직책)</th>
                        <td>${customer.adminName} / ${customer.adminPosition}
                        </td>
                        <th>휴대폰 번호</th>
                        <td>${customer.adminPhone}</td>
                    </tr>
                    <tr>
                        <th>보조 이메일</th>
                        <td>${customer.adminSubEmail}</td>
                        <th>관리자 계정 ID</th>
                        <td>${customer.adminId}</td>
                    </tr>
                    <tr class="table-head">
                        <th colspan="4" class="a_left">담당자 정보 2</th>
                    </tr>
                    <tr>
                        <th>담당자 정보(이름/직책)</th>
                        <td>${customer.adminName2} ${fn:length(customer.adminPosition2) > 0 ? '/' : ''} ${customer.adminPosition2}</td>
                        <th>휴대폰 번호</th>
                        <td>${customer.adminPhone2}</td>
                    </tr>
                    <tr>
                        <th>보조 이메일</th>
                        <td>${customer.adminSubEmail2}</td>
                        <th>관리자 계정 ID</th>
                        <td>${customer.adminId2}</td>
                    </tr>
                    <tr class="table-head">
                        <th colspan="4" class="a_left">파트너사 정보</th>
                    </tr>
                    <tr>
                        <th>담당 파트너사</th>
                        <td>${customer.partnerName}</td>
                        <th>파트너사 관계도</th>
                        <td></td>
                    </tr>
                </table>
            </div>
        </section>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">업종/지역 정보</h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen">부가정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <th>업종</th>
                        <td colspan="3">
                            ${businessCodeNames.codeName1} ${businessCodeNames.codeName1 != null ? ">" : ""} ${businessCodeNames.codeName2} ${businessCodeNames.codeName2 != null ? ">" : ""} ${businessCodeNames.codeName3}
                        </td>
                    </tr>
                    <tr>
                        <th>지역</th>
                        <td colspan="3">
                            ${locationCodeNames.codeName1} ${locationCodeNames.codeName1 != null ? ">" : ""} ${locationCodeNames.codeName2} ${locationCodeNames.codeName2 != null ? ">" : ""} ${locationCodeNames.codeName3}
                        </td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-large" value="이전" onclick="moveList()">
        </div>

    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>