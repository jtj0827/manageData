<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" id="secuEcloudGubun" value="${customer.secuEcloudGubun}">
<input type="hidden" id="company_idx" value="${customer.idx}">
<input type="hidden" id="search_type" value="1">
<div class="b-form-group mt10">
    <div class="b-form-group__item" style="margin-bottom: 0px;">
        <%--<label>사용자 권한</label>--%>
        <div class="inline-group">
            <select id="searchPosition" class="default-input w100">
                <option class="trn" data-trn-key="TR_CLOUD_AUTH" value=""><%--권한--%></option>
                <option class="trn" data-trn-key="TR_CLOUD_COMPANY" value="C"><%--기업--%></option>
                <option class="trn" data-trn-key="TR_CLOUD_NOMAL" value="A"><%--일반--%></option>
            </select>
        </div>
        <div class="inline-group ml10">
            <select id="searchGubun" class="default-input w100">
                <option class="trn" data-trn-key="TR_COMMON_SEARCH_CONDITION" value=""><%--검색조건--%></option>
                <option class="trn" data-trn-key="TR_CLOUD_USER_ID" value="I"><%--아이디--%></option>
                <option class="trn" data-trn-key="TR_COMMON_NAME" value="N"><%--이름--%></option>
            </select>
        </div>

        <div class="inline-group">
            <input type="text" id="searchText" class="default-input w230" value="" maxlength="100" placeholder="">
        </div>
    </div>

    <!--인라인단위 검색 영역/화면줄였을때 라벨과같이 그룹단위로 떨어지게하는역할 <div class="b-form-group__item">-->
    <div class="b-form-group__item" style="margin-bottom: 0px;">
        <!--인풋단위 인풋 여러개를 묶는 역할 <div class="inline-group">, 체크박스 가진 라벨 묶는 클래스 checkbox-group-->
        <div class="inline-group">
            <%--검색--%>
            <input type="button" class="btn-base btn-search w100 trn" data-trn-value="TR_SEARCH" value="" onclick="searchList();"><%--검색--%>
        </div>
        <!--인풋단위 인풋 여러개를 묶는 역할 </div>, checkbox-group-->
    </div>
</div>

<div class="b-tableWrap mt20">
    <table class="b-listTable b-listTable--border">
        <caption class="offscreen trn" data-trn-key="TR_CLOUD_USER_STATUS"><%--사용자 현황--%></caption>
        <colgroup>
            <col width="7%">
            <col width="24%">
            <col width="24%">
            <col width="10%">
            <col width="10%">
            <c:if test="${customer.secuEcloudGubun eq 'P'}">
                <col width="10%">
            </c:if>
            <col width="*">
        </colgroup>
        <thead>
            <tr>
                <th style="text-align: center" class="bb-n trn" data-trn-key="TR_COMMON_NUMBER"><%--번호--%></th>
                <th style="text-align: center" class="bb-n trn" data-trn-key="TR_CLOUD_USER_ID"><%--아이디--%></th>
                <th style="text-align: center" class="bb-n trn" data-trn-key="TR_COMMON_NAME"><%--이름--%></th>
                <th style="text-align: center" class="bb-n trn" data-trn-key="TR_CLOUD_USER_AUTH"><%--사용권한--%></th>
                <th style="text-align: center" class="bb-n">SMTP</th>
                <c:if test="${customer.secuEcloudGubun eq 'P'}">
                    <th style="text-align: center" class="bb-n">POP3</th>
                </c:if>
                <th style="text-align: center" class="bb-n trn" data-trn-key="TR_CONTACT_INFO"><%--연락처--%></th>
            </tr>
        </thead>
        <tbody id="userListTbody">
            <tr>
                <td colspan="${customer.secuEcloudGubun == 'P' ? '7' : '6'}" class="nodata trn" data-trn-key="TR_NO_USER"><%--사용자가 없습니다.--%></td>
            </tr>
        </tbody>
    </table>
    <div id="userListPaging" class="b-paging">

    </div>
</div>