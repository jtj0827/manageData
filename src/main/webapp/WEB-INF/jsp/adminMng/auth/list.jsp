<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>
<script>
    $(function (){
        $('.sortable').sortable();
    })
</script>
<script type="text/babel" src="/resources/js/adminMng/auth/list.js"></script>
<script src="/resources/js/lang/adminMng/adminMng_lang.js"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_TITLE4"><%--메뉴 관리--%></h1>

    <div class="b-depthMng">
        <div class="b-depthMng__tit">
            <input type="text" class="w200 mr10" style="width: 380px;" id="oneDepthName" value="" onkeyup="if(event.keyCode == 13) settingDoneNewMenu(document.querySelector('.b-depthMngList'))">
            <input type="button" class="trn btn-baseRound btn-add w80 trn" data-trn-value="TR_ACCOUNT_ADMIN_MNG_ADD_MENU" value="<%--메뉴 추가--%>" onclick="settingDoneNewMenu(document.querySelector('.b-depthMngList'))">
        </div>

        <div style="display: flex; justify-content: space-between;">
            <div class="b-depthMng__half left" style="/*min-width: 49%; margin-right: 0%;*/ min-width: 29%; margin-right: 0%; width: inherit;">
                <ul class="b-depthMngList MultipleSelectBox sortable">
                    <c:forEach items="${oneDepthMenuList}" var="oneDepthMenu">
                        <li class="menuList">
                            <div class="b-depthMng__1dep" ondblclick="openTwoDepth(this)" onclick="menuListCheck(this)">
                                <input type="hidden" class="code" name="code" value="${oneDepthMenu.code}">
                                <input type="hidden" class="name" name="name" value="${oneDepthMenu.name}">
                                <input type="hidden" class="url" name="url" value="${oneDepthMenu.url}">
                                <input type="hidden" class="topCode" name="topCode" value="">
                                <input type="hidden" class="depth" name="depth" value="1">
                                <div class="authList dis-n">
                                    <c:forEach items="${oneDepthMenu.menuAuthList}" var="authList">
                                        <input type="hidden" class="accountIdx" name="accountIdx" value="${authList.accountIdx}">
                                    </c:forEach>
                                </div>
                                <label>
                                    <input type="checkbox">
                                    <span class="nameTxt">${oneDepthMenu.name}</span>
                                </label>
                                <button type="button" class="btn-plus__sm" onclick="addMenu(this)"/>
                                <button type="button" class="btn-minus__sm" onclick="menuDelete(this)" />

                            </div>
                            <ul class="sortable 2depth_ul dis-n">
                                <c:forEach items="${oneDepthMenu.subCode}" var="twoDepthMenu">
                                    <li class="twoDepthList">
                                        <div class="b-depthMng__2dep dis-n" ondblclick="openThreeDepth(this)" onclick="menuListCheck(this)">
                                            <input type="hidden" class="code" name="code" value="${twoDepthMenu.code}">
                                            <input type="hidden" class="name" name="name" value="${twoDepthMenu.name}">
                                            <input type="hidden" class="url" name="url" value="${twoDepthMenu.url}">
                                            <input type="hidden" class="topCode" name="topCode" value="${twoDepthMenu.topCode}">
                                            <input type="hidden" class="depth" name="depth" value="2">
                                            <div class="authList dis-n">
                                                <c:forEach items="${twoDepthMenu.menuAuthList}" var="authList">
                                                    <input type="hidden" class="accountIdx" name="accountIdx" value="${authList.accountIdx}">
                                                </c:forEach>
                                            </div>
                                            <label>
                                                <input type="checkbox">
                                                <span class="nameTxt">${twoDepthMenu.name}</span>
                                            </label>
                                            <button type="button" class="btn-plus__sm" onclick="addMenu(this)"/>
                                            <button type="button" class="btn-minus__sm" onclick="menuDelete(this)" />
                                        </div>
                                        <ul class="sortable 3depth_ul dis-n">
                                            <c:forEach items="${twoDepthMenu.subCode}" var="threeDepthMenu">
                                                <li class="b-depthMng__3dep threeDepthList dis-n" onclick="menuListCheck(this)">
                                                    <input type="hidden" class="code" name="code" value="${threeDepthMenu.code}">
                                                    <input type="hidden" class="name" name="name" value="${threeDepthMenu.name}">
                                                    <input type="hidden" class="url" name="url" value="${threeDepthMenu.url}">
                                                    <input type="hidden" class="topCode" name="topCode" value="${threeDepthMenu.topCode}">
                                                    <input type="hidden" class="depth" name="depth" value="3">
                                                    <div class="authList dis-n">
                                                        <c:forEach items="${threeDepthMenu.menuAuthList}" var="authList">
                                                            <input type="hidden" class="accountIdx" name="accountIdx" value="${authList.accountIdx}">
                                                        </c:forEach>
                                                    </div>
                                                    <label>
                                                        <input type="checkbox">
                                                        <span class="nameTxt">${threeDepthMenu.name}</span>
                                                    </label>
                                                    <button type="button" class="btn-minus__sm" onclick="delMenu(this)" />
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="b-depthMng__half right" style="/*min-width: 50%; margin-right: 0%;*/min-width: 69%; margin-right: 0%;">
                <div class="b-depthMng__fix">
                    <%--                <div class="b-depthMng__form dis-n">--%>
                    <%--                    <label>--%>
                    <%--                        상위메뉴 코드--%>
                    <%--                    </label>--%>
                    <%--                    <input type="text" id="topCode" onchange="modData('topCode')" readonly>--%>
                    <%--                </div>--%>
                    <%--                <div class="b-depthMng__form dis-n">--%>
                    <%--                    <label>--%>
                    <%--                        메뉴 코드--%>
                    <%--                    </label>--%>
                    <%--                    <input type="text" id="code" onchange="modData('code')" maxlength="4">--%>
                    <%--                </div>--%>
                    <div class="b-depthMng__form">
                        <label class="trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_MENU_NAME">
                            <%--메뉴 이름--%>
                        </label>
                        <input type="text" id="name" onkeyup="modData('name')" readonly>
                    </div>
                    <div class="b-depthMng__form">
                        <label class="trn" data-trn-key="TR_ACCOUNT_ADMIN_MNG_MENU_URL">
                            <%--메뉴 URL--%>
                        </label>
                        <input type="text" id="url" onkeyup="modData('url')" readonly>
                    </div>
                </div>
                <div class="b-tableWrap b-fixTableWrap dis-n" id="authArea" style="max-height: 60vh">
                    <table class="b-listTable">
                        <caption class="offscreen trn" data-trn-key="TR_COMMON_CONTENTS_LIST"><%--게시글 목록--%></caption>
                        <colgroup>
                            <col width="50px">
                            <col/>
                            <col/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th><input type="checkbox" class="allCheck" onclick="allCheck(this)"></th>
                            <th class="trn" data-trn-key="TR_COMMON_NAME"><%--이름--%></th>
                            <th>ID</th>
                        </tr>
                        </thead>
                        <tbody id="authList">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


        <div id="userList" class="dis-n">
            <c:forEach items="${userList}" var="user">
                <input type="hidden" class="userIdx" name="idx" value="${user.idx}">
                <input type="hidden" class="userName" name="name" value="${user.name}">
                <input type="hidden" class="userId" name="id" value="${user.id}">
            </c:forEach>
        </div>
        <div class="a-center default-btnGroup" style="margin: 23px 0px;">
            <input type="button" class="btn-base btn-add btn-large mr5 trn" data-trn-value="TR_COMMON_MODIFIED" value="<%--수정--%>" onclick="save()">
        </div>
    </div>
</section>

</div><!--l-container-->
</body>
</html>