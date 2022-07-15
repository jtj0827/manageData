<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script src="/resources/js/adminMng/admin/access.js" type="text/babel"></script>
<script src="/resources/js/lang/adminMng/adminMng_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->


<section class="l-content-area">

    <p class="title"><h1 class="main-title trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_TITLE1"><%--관리자 접근 관리--%></h1></p>
    <div class="con_view">
        <div class="container_list">
            <div class="contantBox mb30">
                <div class="contantBox">
                    <form id="form" class="mt20">
                    <table class="set_tbl_view_st1">
                        <tr class="dis_b mt20">
                            <th style="border-bottom:none;" class="dis_i">
                                <span class="trn cloudTitle trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_ALLOW_IP"><%--로그인 접속 허용 IP--%></span>
                                <span class="ml30">
                                    <div class="dis-ib w100"><input type="radio" name="allowIp" value="true" onchange="radioChange()"><span class="trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_ALLOW_IP_TRUE"><%--전체 아이피--%></span></div>
                                    <div class="dis-ib w100"><input type="radio" name="allowIp" value="false" onchange="radioChange()"><span class="trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_ALLOW_IP_FALSE">지정 아이피</span></div>
                                </span>
                            </th>
                        </tr>
                        <tr class="login_ip_use">
                            <td class="pl15" style="border-bottom:none;">
                                <input type="text" class="clear w160" id="ipInput" style="height:27px;" maxlength="15" placeholder="ex)111.111.111.111">
                                <input type="text" id="expInput" class="clear trn" data-trn-holder="TR_MAXLENG20" style="height:27px;" maxlength="20" placeholder="설명(최대 20자)">                                &nbsp;&nbsp;
                                <input type="button" value="<%--등록--%>" class="btn-search w80 btn-baseRound trn" data-trn-value="TR_COMMON_REGISTRATION" id="addBtn" onclick="add()"><%--등록--%>
                                <input type="button" value="<%--취소--%>" class="btn-base btn-baseRound w80 trn" data-trn-value="TR_COMMON_CANCEL" onclick="resetInput()"><%--취소--%>
                            </td>
                        </tr>
                        <tr class="login_ip_use">
                            <td class="pl15 pr15">
                                <div class="conView_multyBox mb10 fs13 login_list max-h200 login-box" style="height: auto; width: 100%">
                                    <ul id="login_ip_list"></ul>
                                </div>
                            </td>
                        </tr>
                    </table>
                    </form>
                    <p class="clear conView_p mb30 fs13">
                        <input type="button" value="<%--적용하기--%>" class="btn-add btn-baseRound w100 trn" data-trn-value="TR_COMMON_APPLY" onclick="save()"><%--적용하기--%>
                        <input type="button" value="<%--되돌리기--%>" class="btn-baseRound w100 trn" data-trn-value="TR_COMMON_RESTORE" onclick="getData()"><%--되돌리기--%>
                    </p>
                </div>
            </div><!--contentBox-->
        </div><!--container_list-->
    </div>
</section><!--article-->

</body>
</html>
