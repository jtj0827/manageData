<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/lang/cloud/cloud_lang.js"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_CLOUD_TITLE4"><%--고객사 현황--%></h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${management.idx}">
        </form>
        <section class="mt30">
            <div class="b-title">
                <h1 class="b-title__title trn" data-trn-key="TR_CLOUD_TITLE4"><%--고객사 정보--%></h1>
            </div>

            <div class="b-tableWrap mt20">
                <table class="b-listTable b-listTable--border">
                    <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_INFO"><%--게시글 정보--%></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tr class="table-head">
                        <th colspan="4" class="a_left form-maintitle strong trn" data-trn-key="TR_COMMON_BASIC_DATA"><%--기본 정보--%></th>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_COMPANY_NAME"><%--기업명--%></th>
                        <td>${management.name}</td>
                        <th class="trn" data-trn-key="TR_CLOUD_COMPANY_BUSINESS_YN">기업형태</th>
                        <td>
                            <c:if test="${management.businessYn}">
                                <span class="trn" data-trn-key="TR_CORPORATE_BODY"><%--법인--%></span>
                            </c:if>
                            <c:if test="${!management.businessYn}">
                                <span class="trn" data-trn-key="TR_INDIVIDUAL"><%--개인--%></span>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_REP_NAME"><%--대표자 이름--%></th>
                        <td colspan="3">${management.repName}
                        <c:if test="${management.repName == null or management.repName eq ''}">-</c:if></td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_REP_TEL_NUMBER"><%--대표 전화번호--%></th>
                        <td>${management.tel}
                        <c:if test="${management.tel == null or management.tel eq ''}">-</c:if></td>
                        <th class="trn" data-trn-key="TR_CLOUD_REP_FAX_NUMBER"><%--팩스번호--%></th>
                        <td>${management.fax}
                            <c:if test="${management.fax == null or management.fax eq ''}">-</c:if></td>

                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_REP_EMAIL"><%--대표 이메일--%></th>
                        <td colspan="3">${management.email}
                            <c:if test="${management.email == null or management.email eq ''}">-</c:if></td>
                    </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_CLOUD_VAT_BILL_EMAIL"><%--세금 계산서 발행 이메일--%></th>
                            <td colspan="3">${management.vatBillEmail}
                                <c:if test="${management.vatBillEmail == null or management.vatBillEmail eq ''}">-</c:if></td>
                        </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_BUSINESS_NUMBER"><%--사업자 등록번호--%></th>
                        <td>${management.businessNumber}
                            <c:if test="${management.businessNumber == null or management.businessNumber eq ''}">-</c:if></td>
                        <th class="trn" data-trn-key="TR_CLOUD_EMPLOY_COUNT"><%--총 임직원 수--%></th>
                        <td>
                            <fmt:formatNumber value="${management.employCount > 0 ? management.employCount : 0}" pattern="#,###"/>명
                        </td>
                    </tr>
                    <%-- LINE :: 사업자 여부 false(개인)인 경우 노출 --%>
                    <c:if test="${!management.businessYn}">
                        <tr>
                            <th class="trn" data-trn-key="TR_BIRTH_DATE"><%--생년월일--%></th>
                            <td colspan="3">
                                    ${management.birthDate}
                                <c:if test="${management.birthDate == null}">
                                    -
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <th class="trn" data-trn-key="TR_ADDR"><%--주소--%></th>
                        <td colspan="3">
                            <span class="dis_b">(${management.zipcode})</span>
                            <span class="dis_b">${management.addr}</span>
                            <span class="dis_b">${management.addrDetail}</span>
                        </td>
                    </tr>
                        <tr>
                            <th class="trn" data-trn-key="TR_COMMON_MEMO"><%--메모--%></th>
                            <td colspan="3" style="white-space: pre-wrap;">${management.memo}</td>
                        </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_APPLY_FORM_FILE"><%--사업자등록증--%></th>
                        <td colspan="3">
                            <c:choose>
                                <c:when test="${applyFormFile.idx > 0}">
                                    <a href="/file/download/${applyFormFile.idx}">${applyFormFile.name}</a>
                                </c:when>
                                <c:otherwise>
                                    <span class="trn" data-trn-key="TR_NO_FILE_MSG"><%--등록된 파일이 없습니다.--%></span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr class="table-head">
                        <th colspan="4" class="a_left form-maintitle strong trn" data-trn-key="TR_CLOUD_ADMIN_INFO"><%--담당자 정보--%></th>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_ADMIN_INFO_NAME"><%--담당자 정보 (이름/직책)--%></th>
                        <td>${management.adminName}
                            <c:if test="${management.adminName == null or management.adminName eq ''}">-</c:if>
                            / ${management.adminPosition}
                            <c:if test="${management.adminPosition == null or management.adminPosition eq ''}">-</c:if>
                        </td>
                        <th class="trn" data-trn-key="TR_PHONENUM"><%--휴대폰 번호--%></th>
                        <td>
                            <c:set var="adminPhone" value="${fn:split(management.adminPhone, '-')}"/>
                            <c:if test="${fn:replace(adminPhone[0], null, '') != '' && fn:replace(adminPhone[1], null, '') != '' && fn:replace(adminPhone[2], null, '') != ''}">
                                ${management.adminPhone}
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th class="trn" data-trn-key="TR_CLOUD_ADMIN_SUB_EMAIL"><%--보조 이메일--%></th>
                        <td colspan="3">${management.adminSubEmail}
                            <c:if test="${management.adminSubEmail == null or management.adminSubEmail eq ''}">-</c:if>
                        </td>
                    </tr>
                </table>
            </div>
        </section>

        <div class="btn-area">
            <input type="button" class="btn-base btn-rm btn-large mr5 trn" data-trn-value="TR_COMMON_DELETE" value="삭제" onclick="deleteConfirm()">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_MODIFIED" value="수정" onclick="location.href='form?idx=${management.idx}'">
            <input type="button" class="btn-base btn-large trn" data-trn-value="TR_COMMON_LIST" value="목록" onclick="moveList()">
        </div>
    </div>
<script src="/resources/js/customerMng/management/view.js" type="text/babel"></script>
</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>