<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="keyword" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="msapplication-TileImage" content="/resources/images/favicon/favicon.png">
    <link rel="shortcut icon" href="/resources/images/favicon/favicon.ico">
    <meta name="format-detection" content="telephone=no" >
    <link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/loading.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/layout.css">
    <link rel="stylesheet" type="text/css" href="/resources/mycss/style.css">

<%--    <script>--%>
<%--        const filter = 'win16|win32|win64|macintel|mac|';--%>

<%--        if(navigator.platform){--%>
<%--            if(filter.indexOf(navigator.platform.toLowerCase())<0){--%>
<%--                location.href = '/error/preventMobile';--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>

    <script src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
    <script src="/resources/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="/resources/js/jquery-ui-1.12.1/jquery-ui.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.24.0/babel.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fetch/2.0.4/fetch.min.js"></script>
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script>
    <script src="/resources/js/common.js" type="text/babel"></script>

    <title>데이터관리</title>
</head>
<body>

<div class="l-container">
    <div class="l-layer-mask dis-n"></div>
    <div class="l-layer-mask l-layer-mask__tab dis-n"></div>
    <div id="page_loading_progressbar" style="z-index:9998; position:absolute; visibility:hidden; left:calc(100%/2); top:calc(100%/2);">
        <div class="closeMask" style="left:0px; top:0px;"></div>
        <div id="ajaxloader2">
            <div class="outer"></div>
            <div class="inner"></div>
            <p style="color:#fff; text-align:center;">Checking...</p>
        </div>
    </div>

    <%@ include file="../include/leftMenu.jsp" %>
    <header class="b-header">
        <h1 class="offscreen">manageData</h1>
        <div class="b-header-inner">
            <nav class="b-header-nav dis-f">
                <h1 class="offscreen">메인네비게이션</h1>
                <ul class="b-header-mainNav">
                    <c:forEach var="menu" items="${sessionScope.headerMenu}">
                        <li class="b-header-mainNav__item">
                            <a href="${menu.url}" class="b-header-mainNav__btn
                                ${menu.code eq sessionScope.activeMenu.code2 || menu.code eq sessionScope.activeMenu.code1 ? 'active' : ''}">
                                    ${menu.name}
                            </a>
                        </li>
                    </c:forEach>

                </ul>

                <ul class="b-header-userNav">
                    <li class="b-header-userNav__item">
                        ${sessionScope.accountInfo.name} 님
                    </li>
                    <li class="b-header-userNav__item">
                        <a href="/logout" class="b-header-userNav__btn hoverline">로그아웃</a>
                    </li>
                </ul>
            </nav>
        </div><!--b-header-inner-->
    </header>