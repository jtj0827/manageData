<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">파트너사 관리</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${partner.idx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">파트너사 정보</h1>
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
                    <tr>
                        <th>스텝</th>
                        <td>${partner.step eq 'Z' ? 'ZeroStep' : partner.step eq 'O' ? 'OneStep' : 'BelowStep'}</td>
                        <th>상위 파트너사</th>
                        <td>${partner.step eq 'Z' ? '-' : partner.topPartnerName}</td>
                    </tr>
                    <tr>
                        <th>사업자 여부</th>
                        <td>${partner.businessYn ? "법인" : "개인"}</td>
                        <th>기업명</th>
                        <td>${partner.name}</td>
                    </tr>
                    <tr>
                        <c:if test="${partner.businessYn}">
                            <th>법인명</th>
                            <td>${partner.corporationName}</td>
                        </c:if>
                        <th>사업자등록번호</th>
                        <td>${partner.businessNumber}</td>
                    </tr>
                    <tr>
                        <th>계약일</th>
                        <td>${partner.formatedContractDate}</td>
                        <th>고유번호</th>
                        <td>${partner.uniqueNumber}</td>
                    </tr>
                    <tr>
                        <th>대표자명</th>
                        <td>${partner.repName}</td>
                        <th>대표 전화번호</th>
                        <td>${partner.repTel}</td>
                    </tr>
                    <tr>
                        <th>매출형태</th>
                        <td>${partner.salesForm}</td>
                        <th>종업원 수(명)</th>
                        <td><fmt:formatNumber value="${partner.employCount}" pattern="#,###"/></td>
                    </tr>
                    <tr>
                        <th>주요 매출처</th>
                        <td>${partner.mainSales}</td>
                        <th>주요 매입처</th>
                        <td>${partner.mainBuyer}</td>
                    </tr>
                    <tr>
                        <th>연간 매출(억원)</th>
                        <td><fmt:formatNumber value="${partner.annualSales}" pattern="#,###"/></td>
                        <th>수익배분율(%)</th>
                        <td>${partner.revenue}</td>
                    </tr>
                    <tr class="table-head">
                        <th colspan="4" class="a_left form-maintitle strong">관리자 정보</th>
                    </tr>
                    <tr>
                        <th>관리자 아이디</th>
                        <td>${partner.adminId}</td>
                        <th>관리자 이름</th>
                        <td>${partner.adminName}</td>
                    </tr>
                    <tr>
                        <th>관리자 전화번호</th>
                        <td>${partner.adminPhone}</td>
                        <th>관리자 이메일</th>
                        <td>${partner.adminEmail}</td>
                    </tr>
                    <tr class="table-head">
                        <th colspan="4" class="a_left form-maintitle strong">추가 정보</th>
                    </tr>
                    <tr>
                        <th>희망 서브 도메인</th>
                        <td <c:if test="${partner.step == 'Z'}">colspan="3"</c:if>>${partner.subDomain}.egpartner.com</td>
                        <c:if test="${partner.step != 'Z'}">
                            <th>온라인 영업 사용 여부</th>
                            <td>${partner.onlineSalesYn ? '사용 가능' : '사용 불가'}</td>
                        </c:if>
                    </tr>
                    <tr>
                        <th>서비스 사용</th>
                        <td colspan="3">
                            <input type="button" class="btn btn-baseRound" style="color: #fb4949;" value="서비스 사용중지${partner.servicePauseYn ? ' 해제' : ''}" onclick="updateServicePauseAjax(${partner.servicePauseYn}, ${partner.idx})">
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td colspan="3">
                            <span class="dis_b">(${partner.zipcode})</span>
                            <span class="dis_b">${partner.addr}</span>
                            <span class="dis_b">${partner.addrDetail}</span>
                        </td>
                    </tr>
                    <tr>
                        <th>메모</th>
                        <td colspan="3" style="white-space: pre-wrap;">${partner.memo}</td>
                    </tr>
                    <tr>
                        <th>사업자 등록증</th>
                        <td colspan="3">
                            <c:choose>
                                <c:when test="${businessFile.idx > 0}">
                                    <a href="/file/download/${businessFile.idx}">${businessFile.name}</a>
                                </c:when>
                                <c:otherwise>
                                    등록된 파일이 없습니다.
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </div>
        </section>

        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title">정산 정보</h1>
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
                    <tr>
                        <th>사업장 주소</th>
                        <td>
                            <span class="dis_b">(${calc.workplaceZipcode})</span>
                            <span class="dis_b">${calc.workplaceAddr}</span>
                            <span class="dis_b">${calc.workplaceAddrDetail}</span>
                        </td>
                        <th>은행</th>
                        <td>${calc.bankName}</td>
                    </tr>
                    <tr>
                        <th>계좌 번호</th>
                        <td>${calc.accountNumber}</td>
                        <th>예금주 명</th>
                        <td>${calc.accountHolder}</td>
                    </tr>
                    <tr>
                        <th>계산서 이메일</th>
                        <td colspan="3">${calc.billEmail}</td>
                    </tr>
                </table>
            </div>
        </section>

        <section class="mt30">
            <ul class="set_step">
                <li style="width: 33.3%;"><a href="#" name="tabSelector" path="partner" class="active"><span>파트너사 현황</span> <span class="fs8">▶</span></a></li>
                <li style="width: 33.3%;"><a href="#" name="tabSelector" path="user"><span>고객사 현황</span> <span class="fs8">▶</span></a></li>
                <li style="width: 33.3%;"><a href="#" name="tabSelector" path="contactHistory"><span>컨택 기록</span> <span class="dis_ib fs8">▶</span></a></li>
            </ul>
            <div id="partner" class="tabDiv"><%@ include file="tab/partnerList.jsp" %></div>
            <div id="user" class="tabDiv dis_n"><%@ include file="tab/customerList.jsp" %></div>
            <div id="contactHistory" class="tabDiv dis_n"><%@ include file="tab/contactHistory.jsp" %></div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5" value="삭제" onclick="deleteConfirm()">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form?idx=${partner.idx}'">
            <input type="button" class="btn-base btn-large" value="목록" onclick="moveList()">
        </div>
    </form>
    </div>

</section><!--l-content-area-->
<script src="/resources/js/customerMng/partner/view.js" type="text/babel"></script>

</div><!--l-container-->
</body>
</html>