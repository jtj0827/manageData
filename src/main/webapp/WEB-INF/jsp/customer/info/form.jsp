<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/customer/info/form.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">고객 정보 관리</h1>

    <div class="l-maxwrap">
        <form id="saveForm">
            <div id="common_tempArea"></div>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">고객 정보</h1>
                </div>

                <p style="color: red; text-align: right" class="lh20 dis_b mt10"> * 표시는 필수 입력 항목입니다.</p>

                <div class="b-tableWrap mt10">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">고객 정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th><span class="necessary">고객명</span></th>
                            <td>
                                <input type="text" name="customerName" class="default-input w155" value="${info.customerName}">
                            </td>
                            <th><span class="necessary">유입 경로</span></th>
                            <td>
                                <%--<input type="text" name="inflowPathCode" class="default-input w155" value="${info.inflowPathCode}">--%>
                                <select id="inflowPathCode" name="inflowPathCode" class="w155">
                                    <option value="">선택</option>
                                    <c:forEach var="inflow" items="${inflowList}">
                                    <option value="${inflow.code}" ${inflow.code == info.inflowPathCode ? 'selected' : ''}>${inflow.codeExp}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="necessary">고객 핸드폰번호</span></th>
                            <td>
                                <c:set var="phone" value="${fn:split(info.phoneNum, '-')}"/>
                                <input type="hidden" name="phoneNum" class="default-input w155" value="${info.phoneNum}">
                                <select id="phoneNum1" class="w55">
                                    <option value="010" ${repPhone[0] == '010' ? 'selected' : ''}>010</option>
                                    <option value="011" ${repPhone[0] == '011' ? 'selected' : ''}>011</option>
                                    <option value="016" ${repPhone[0] == '016' ? 'selected' : ''}>016</option>
                                    <option value="017" ${repPhone[0] == '017' ? 'selected' : ''}>017</option>
                                    <option value="018" ${repPhone[0] == '018' ? 'selected' : ''}>018</option>
                                    <option value="019" ${repPhone[0] == '019' ? 'selected' : ''}>019</option>
                                </select>
                                -
                                <input type="text" id="phoneNum2" class="default-input w50 onlyNumber" maxlength="4" value="${phone[1]}">
                                -
                                <input type="text" id="phoneNum3" class="default-input w50 onlyNumber" maxlength="4" value="${phone[2]}">
                            </td>
                            <th><span class="necessary">고객 Email</span></th>
                            <td>
                                <%--<input type="text" name="email" class="default-input w155" value="${info.email}">--%>
                                <c:set var="email" value="${fn:split(info.email, '@')}"/>
                                <input type="hidden" name="email">
                                <input type="text" id="email1" class="default-input mr5" value="${email[0]}" style="width:130px;" maxlength="50">@
                                <input type="text" id="email2" class="default-input" value="${email[1]}" style="width:130px;" maxlength="20">
                                <select onchange="changeEmailSelect(this);" data-target="email2" class="w155">
                                    <option value="">직접입력</option>
                                    <option value="gmail.com" ${email[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                    <option value="naver.com" ${email[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
                                    <option value="daum.net" ${email[1] == 'daum.net' ? 'selected' : ''}>daum.net</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">담당자 정보</h1>
                </div>

                <div class="b-tableWrap mt10">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">담당자 정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>담당 부서</th>
                            <td>
                                <select id="departmentInChargeCode" name="departmentInCharge" class="w155" onchange="selectDepartmentChargeCode(this, 'contactName')">
                                    <option value="">선택</option>
                                    <c:forEach var="departmentInCharge" items="${departmentInChargeList}">
                                        <option value="${departmentInCharge.code}" ${departmentInCharge.code == info.departmentInChargeCode ? 'selected' : ''}>${departmentInCharge.codeExp}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <th>담당자 명</th>
                            <td>
                                <select id="contactName" name="contactName" class="w155">
                                    <option value="">선택</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

        </form>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5" value="${info.idx > 0 ?  '수정' : '등록'}" onclick="saveConfirm()">
            <c:choose>
                <c:when test="${info.idx > 0}">
                    <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view?serverIdx=${info.idx}'">
                </c:when>
                <c:otherwise>
                    <input type="button" class="btn-base btn-large" value="취소" onclick="moveList();">
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>