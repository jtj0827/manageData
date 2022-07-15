<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/customerMng/partner/form.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">파트너사 관리</h1>

    <div class="l-maxwrap">
        <%--<input type="hidden" id="isDuplicateCheck" value="${partner.idx > 0}">--%>
        <input type="hidden" id="isSubDomainDuplicateCheck" value="${partner.idx > 0}">
        <form id="saveForm">
            <c:if test="${partner.idx > 0}"><input type="hidden" name="partner.idx" id="idx" value="${partner.idx}"></c:if>
            <c:if test="${partner.step eq 'B'}">
                <input type="hidden" id="step" name="partner.step" value="${partner.step}">
                <input type="hidden" name="partner.topIdx" value="${partner.topIdx}">
            </c:if>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">파트너사 정보</h1>
                </div>

                <p style="color: red; text-align: right" class="lh20 dis_b mt10"> * 표시는 필수 입력 항목입니다.</p>

                <div class="b-tableWrap mt10 ofx-h">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">파트너사 정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>

                        <tr class="table-head">
                            <th colspan="4" class="a_left form-maintitle strong">기본 정보</th>
                        </tr>
                        <c:if test="${partner.step ne 'B'}">
                            <tr>
                                <th><span class="necessary">스텝</span></th>
                                <td class="stepInfoTd" style="border-right: none" <c:if test="${partner eq null || partner.step == 'Z'}">colspan="3"</c:if>>
                                    <select id="step" name="partner.step" class="w155">
                                        <option value="Z" ${partner.step eq 'Z' ? 'selected' : ''}>Zero Step</option>
                                        <option value="O" ${partner.step eq 'O' ? 'selected' : ''}>One Step</option>
                                    </select>
                                </td>
                                <th class="stepInfo ${partner eq null || partner.step eq 'Z' ? 'dis_n' : ''}" style="border-left: 1px solid #ddd;">상위 파트너사</th>
                                <td class="stepInfo ${partner eq null || partner.step eq 'Z' ? 'dis_n' : ''}">
                                    <select id="topIdx" name="partner.topIdx" class="w155">
                                        <option value="">파트너사 선택</option>
                                        <c:forEach items="${topPartnerList}" var="partnerList">
                                            <option value="${partnerList.idx}" ${partner.topIdx eq partnerList.idx ? 'selected' : ''}>${partnerList.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <th><span class="necessary">사업자 여부</span></th>
                            <td>
                                <label class="dis_ib w80">
                                    <input type="radio" name="partner.businessYn" value="true" checked> 법인
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="partner.businessYn" value="false" ${partner != null && !partner.businessYn ? 'checked' : ''}> 개인
                                </label>
                            </td>
                            <th><span class="necessary">기업명</span></th>
                            <td>
                                <input type="text" name="partner.name" class="default-input w155" value="${partner.name}">
                            </td>
                        </tr>
                        <tr>
                            <th class="businessArea" <c:if test="${partner != null && !partner.businessYn}">style="display: none"</c:if>><span class="necessary">법인명</span></th>
                            <td class="businessArea" <c:if test="${partner != null && !partner.businessYn}">style="display: none"</c:if>>
                                <input type="text" name="partner.corporationName" class="default-input w155" value="${partner.corporationName}">
                            </td>
                            <th><span class="necessary">사업자등록번호</span></th>
                            <td>
                                <c:set var="businessNumber" value="${fn:split(partner.businessNumber, '-')}"/>
                                <input type="hidden" name="partner.businessNumber">
                                <input class="default-input onlynumber w55" id="businessNumber1" value="${businessNumber[0]}" type="text" maxlength="3">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="businessNumber2" value="${businessNumber[1]}" type="text" maxlength="2">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="businessNumber3" value="${businessNumber[2]}" type="text" maxlength="5">
                                <%--<input type="button" class="btn btn-baseRound" value="중복확인" onclick="bizNumberDuplicateCheckAjax(${customer.idx})">--%>
                            </td>
                        </tr>
                        <tr>
                            <th>계약일</th>
                            <td>
                                <c:set var="now"><fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/></c:set>
                                <input type="text" name="partner.contractDate" class="default-input calendar w155" value="${partner.idx > 0 ? partner.formatedContractDate : now}" readonly>
                            </td>
                            <th>고유번호</th>
                            <td>
                                <c:choose>
                                    <c:when test="${partner.idx > 0}">${partner.uniqueNumber}</c:when>
                                    <c:otherwise>파트너사 등록 시 자동 생성됩니다.</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">대표자명</span></th>
                            <td>
                                <input type="text" name="partner.repName" class="default-input w155" value="${partner.repName}">
                            </td>
                            <th><span class="necessary">대표 전화번호</span></th>
                            <td>
                                <c:set var="repTel" value="${fn:split(partner.repTel, '-')}"/>
                                <c:set value="02 031 032 033 041 042 043 044 051 052 053 054 055 061 062 063 064 070" var="repTelFirst"/>
                                <input type="hidden" name="partner.repTel">
                                <select id="repTel1" class="wp35" onchange="setRepTelInput(false);">
                                    <option value="02" ${repTel eq null || repTel eq '' || repTel[0] == '02' ? 'selected' : ''}>02</option>
                                    <option value="031" ${repTel[0] == '031' ? 'selected' : ''}>031</option>
                                    <option value="032" ${repTel[0] == '032' ? 'selected' : ''}>032</option>
                                    <option value="033" ${repTel[0] == '033' ? 'selected' : ''}>033</option>
                                    <option value="041" ${repTel[0] == '041' ? 'selected' : ''}>041</option>
                                    <option value="042" ${repTel[0] == '042' ? 'selected' : ''}>042</option>
                                    <option value="043" ${repTel[0] == '043' ? 'selected' : ''}>043</option>
                                    <option value="044" ${repTel[0] == '044' ? 'selected' : ''}>044</option>
                                    <option value="051" ${repTel[0] == '051' ? 'selected' : ''}>051</option>
                                    <option value="052" ${repTel[0] == '052' ? 'selected' : ''}>052</option>
                                    <option value="053" ${repTel[0] == '053' ? 'selected' : ''}>053</option>
                                    <option value="054" ${repTel[0] == '054' ? 'selected' : ''}>054</option>
                                    <option value="055" ${repTel[0] == '055' ? 'selected' : ''}>055</option>
                                    <option value="061" ${repTel[0] == '061' ? 'selected' : ''}>061</option>
                                    <option value="062" ${repTel[0] == '062' ? 'selected' : ''}>062</option>
                                    <option value="063" ${repTel[0] == '063' ? 'selected' : ''}>063</option>
                                    <option value="064" ${repTel[0] == '064' ? 'selected' : ''}>064</option>
                                    <option value="070" ${repTel[0] == '070' ? 'selected' : ''}>070</option>
                                    <option value="ETC" ${(partner ne null) && ((fn:length(repTel) > 3) || (fn:length(repTel) < 3) || (!fn:contains(repTelFirst, repTel[0]))) ? 'selected' : ''}>기타</option>
                                </select>
                                <span class="unit repTelEach">-</span>
                                <input class="default-input onlynumber w50 repTelEach" id="repTel2" value="${repTel[1]}" type="text" maxlength="4">
                                <span class="unit repTelEach">-</span>
                                <input class="default-input onlynumber w50 repTelEach" id="repTel3" value="${repTel[2]}" type="text" maxlength="4">
                                <input class="repTelFull wp60 ml3" id="repTelFull" style="display: none;" value="${partner.repTel}" placeholder="'-' 포함하여 입력">
                                <br><span class="small-txt">* 작성하신 번호로 온라인 신청 시 표시됩니다.</span>
                            </td>
                        </tr>
                        <tr>
                            <th>매출형태</th>
                            <td>
                                <input type="text" name="partner.salesForm" class="default-input w155" value="${partner.salesForm}">
                            </td>
                            <th>종업원 수(명)</th>
                            <td>
                                <input type="text" name="partner.employCount" class="default-input w155 onlynumber autoComma" value="${partner.employCount}" placeholder="숫자만 입력" maxlength="9">
                            </td>
                        </tr>
                        <tr>
                            <th>주요 매출처</th>
                            <td>
                                <input type="text" name="partner.mainSales" class="default-input w155" value="${partner.mainSales}">
                            </td>
                            <th>주요 매입처</th>
                            <td>
                                <input type="text" name="partner.mainBuyer" class="default-input w155" value="${partner.mainBuyer}">
                            </td>
                        </tr>
                        <tr>
                            <th>연간 매출(억원)</th>
                            <td>
                                <input type="text" name="partner.annualSales" class="default-input w155 onlynumber autoComma" value="${partner.annualSales}" placeholder="숫자만 입력" maxlength="9">
                            </td>
                            <th><span class="necessary">수익배분율(%)</span></th>
                            <td>
                                <input type="text" name="partner.revenue" class="default-input w155 onlynumber" value="${partner.revenue}" placeholder="숫자만 입력">
                            </td>
                        </tr>

                        <tr class="table-head">
                            <th colspan="4" class="a_left strong">
                                <span class="form-maintitle"> 관리자 정보</span>
                            </th>
                        </tr>

                        <tr>
                            <th><span class="necessary">관리자 아이디</span></th>
                            <td>
                                <c:choose>
                                    <c:when test="${partner.idx > 0}">
                                        ${partner.adminId}
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" id="adminId" name="partner.adminId" class="default-input w155" value="${partner.adminId}">
                                        <%--<input type="button" class="btn btn-baseRound" value="중복확인" onclick="adminIdDuplicateAjax(${partner.idx});">--%>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <th <%--class="${partner.idx > 0 ? '' : 'necessary'}"--%>><span class="${partner.idx > 0 ? '' : 'necessary'}"<%--class="necessary"--%>> 관리자 패스워드</span></th>
                            <td>
                                <input type="password" name="partner.adminPwd" class="default-input w200" placeholder="영문,숫자,특수기호 조합 8~16자">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">관리자 이름</span></th>
                            <td>
                                <input type="text" name="partner.adminName" class="default-input w155" value="${partner.adminName}">
                            </td>
                            <th><span class="necessary">관리자 전화번호</span></th>
                            <td>
                                <c:set var="adminPhone" value="${fn:split(partner.adminPhone, '-')}"/>
                                <input type="hidden" name="partner.adminPhone">
                                <select id="adminPhone1" class="w55">
                                    <option value="010" ${adminPhone[0] == '010' ? 'selected' : ''}>010</option>
                                    <option value="011" ${adminPhone[0] == '011' ? 'selected' : ''}>011</option>
                                    <option value="016" ${adminPhone[0] == '016' ? 'selected' : ''}>016</option>
                                    <option value="017" ${adminPhone[0] == '017' ? 'selected' : ''}>017</option>
                                    <option value="018" ${adminPhone[0] == '018' ? 'selected' : ''}>018</option>
                                    <option value="019" ${adminPhone[0] == '019' ? 'selected' : ''}>019</option>
                                </select>
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="adminPhone2" value="${adminPhone[1]}" type="text" maxlength="4">
                                <span class="unit">-</span>
                                <input class="default-input onlynumber w50" id="adminPhone3" value="${adminPhone[2]}" type="text" maxlength="4">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">관리자 메일</span></th>
                            <td colspan="3">
                                <c:set var="adminEmail" value="${fn:split(partner.adminEmail, '@')}"/>
                                <input type="hidden" name="partner.adminEmail">
                                <input type="text" id="adminEmail1" class="default-input w120 mr1" value="${adminEmail[0]}" maxlength="50">@
                                <input type="text" id="adminEmail2" class="default-input w120" value="${adminEmail[1]}" maxlength="20">
                                <select onchange="changeEmailSelect(this);" data-target="adminEmail2" class="w120">
                                    <option value="">직접입력</option>
                                    <option value="gmail.com" ${adminEmail[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                    <option value="naver.com" ${adminEmail[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                    <option value="daum.net" ${adminEmail[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                </select>
                            </td>
                        </tr>

                        <tr class="table-head">
                            <th colspan="4" class="a_left form-maintitle strong">추가 정보</th>
                        </tr>

                        <tr>
                            <th><span class="necessary">희망 서브 도메인</span></th>
                            <td class="stepInfoTd" style="border-right: none" <c:if test="${partner eq null || partner.step == 'Z'}">colspan="3"</c:if>>
                                <c:choose>
                                    <c:when test="${partner.idx > 0}">
                                        ${partner.subDomain}.egpartner.com
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" id="subDomain" name="partner.subDomain" class="default-input w155 mr5" value="${partner.subDomain}"><span class="mr5">.egpartner.com</span>
                                        <div class="dis_ib mt5 mb5"><input type="button" class="btn btn-baseRound" value="중복확인" onclick="subDomainDuplicateAjax(${partner.idx});"></div>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <th class="stepInfo ${partner eq null || partner.step eq 'Z' ? 'dis_n' : ''}" style="border-left: 1px solid #ddd;">온라인 영업 사용 여부</th>
                            <td class="stepInfo ${partner eq null || partner.step eq 'Z' ? 'dis_n' : ''}">
                                <label class="dis_ib w80">
                                    <input type="radio" name="partner.onlineSalesYn" value="true" ${partner != null && partner.onlineSalesYn ? 'checked' : ''}> 사용 가능
                                </label>
                                <label class="dis_ib w80">
                                    <input type="radio" name="partner.onlineSalesYn" value="false" ${partner == null || !partner.onlineSalesYn ? 'checked' : ''}> 사용 불가
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">주소</span></th>
                            <td colspan="3">
                                <span class="dis_b mb5">
                                    <input type="text" name="partner.zipcode" class="default-input w155" onclick="openAddrPopup('partner')" value="${partner.zipcode}" readonly>
                                    <input type="button" class="btn btn-baseRound" value="주소검색" onclick="openAddrPopup('partner')">
                                </span>
                                <input type="text" name="partner.addr" class="default-input dis_b mb5 wp100" value="${partner.addr}" readonly>
                                <input type="text" name="partner.addrDetail" class="default-input dis_b wp100" value="${partner.addrDetail}">
                            </td>
                        </tr>
                        <tr>
                            <th>메모</th>
                            <td colspan="3">
                                <textarea name="partner.memo" class="wp100 h100" style="resize: none">${partner.memo}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">사업자 등록증</span></th>
                            <td colspan="3">
                                ${businessFile.name}
                                <span class="dis_b">
                                    <input type="file" name="partner.businessFile" class="w370" style="padding: 2px 0 0 0" onchange="fileTypeCheck(this);">
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">정산 정보</h1>
                </div>
                <label style="float: right;font-weight: bold; font-size: 13px;">
                    <input type="checkbox" id="copyInfo" style="margin:0 7px 0 0;height: auto;" onclick="copyInfoPartner();">위 정보와 동일
                </label>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">정산 정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th><span class="necessary">사업장 주소</span></th>
                            <td>
                                <span class="dis_b mb5">
                                    <input type="text" name="calc.workplaceZipcode" class="default-input" value="${calc.workplaceZipcode}" onclick="openAddrPopup('calc')" readonly>
                                    <input type="button" class="btn btn-baseRound" value="주소검색" onclick="openAddrPopup('calc')">
                                </span>
                                <input type="text" name="calc.workplaceAddr" class="default-input wp100 dis_b mb5" value="${calc.workplaceAddr}" readonly>
                                <input type="text" name="calc.workplaceAddrDetail" class="default-input wp100 dis_b" value="${calc.workplaceAddrDetail}">
                            </td>
                            <th><span class="necessary">은행</span></th>
                            <td>
                                <select name="calc.bankCode" class="w155">
                                    <option value="">은행선택</option>
                                    <c:forEach var="code" items="${bankCodeList}">
                                        <option value="${code.code}" ${code.code == calc.bankCode ? "selected" : ""}>${code.codeExp}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">계좌 번호</span></th>
                            <td>
                                <input type="text" name="calc.accountNumber" class="default-input w155" value="${calc.accountNumber}" placeholder="숫자만 입력">
                            </td>
                            <th><span class="necessary">예금주 명</span></th>
                            <td>
                                <input type="text" name="calc.accountHolder" class="default-input w155" value="${calc.accountHolder}">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">계산서 이메일</span></th>
                            <td colspan="3">
                                <c:set var="billEmail" value="${fn:split(calc.billEmail, '@')}"/>
                                <input type="hidden" name="calc.billEmail">
                                <input type="text" id="billEmail1" class="default-input w120 mr1" value="${billEmail[0]}" maxlength="50">@
                                <input type="text" id="billEmail2" class="default-input w120" value="${billEmail[1]}" maxlength="20">
                                <select onchange="changeEmailSelect(this);" data-target="billEmail2" class="w120">
                                    <option value="">직접입력</option>
                                    <option value="gmail.com" ${billEmail[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                    <option value="naver.com" ${billEmail[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                    <option value="daum.net" ${billEmail[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

            <div class="btn-area">
                <input type="button" class="btn-base btn-add btn-large mr5" value="${partner.idx > 0 ?  '수정' : '등록'}" onclick="saveConfirm()">
                <c:choose>
                    <c:when test="${partner.idx > 0}">
                        <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view?idx=${partner.idx}'">
                    </c:when>
                    <c:otherwise>
                        <input type="button" class="btn-base btn-large" value="취소" onclick="moveList()">
                    </c:otherwise>
                </c:choose>
            </div>
            <input type="hidden" name="blankValue">
        </form>
    </div>
</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>