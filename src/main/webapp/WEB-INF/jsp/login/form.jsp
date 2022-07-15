<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="keyword" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="format-detection" content="telephone=no"/>
    <meta name="msapplication-TileImage" content="/resources/images/favicon/favicon.ico">

    <link rel="shortcut icon" href="/resources/images/favicon/favicon.ico">

    <link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/layout.css">

    <script>
        const filter = 'win16|win32|win64|macintel|mac|';

        if(navigator.platform){
            if(filter.indexOf(navigator.platform.toLowerCase())<0){
                location.href = '/error/preventMobile';
            }
        }
    </script>

    <title class="trn" data-trn-key="TR_COMMON_HEADER_POPUP_TITLE"><%--중앙관제시스템--%></title>

    <script src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
    <script src="/resources/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="/resources/js/jquery-ui-1.12.1/jquery-ui.css">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.24.0/babel.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fetch/2.0.4/fetch.min.js"></script>
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script>
    <script src="/resources/js/common.js" type="text/babel"></script>
    <script src="/resources/js/login/login.js" type="text/babel"></script>
</head>
<body>
<div id="wrapper_login">
    <div id="page_loading_progressbar" style="z-index:9998; position:absolute; visibility:hidden; left:calc(100%/2); top:calc(100%/2);">
        <div class="closeMask" style="left:0px; top:0px;"></div>
        <div id="ajaxloader2">
            <div class="outer"></div>
            <div class="inner"></div>
            <p style="color:#fff; text-align:center;">Checking...</p>
        </div>
    </div>
    <div id="login">

        <div id="loginMent">

            <p class="a_center mt100">
                <img src="/resources/images/logo_login.png" alt="">
            </p>


        </div>

        <div id="loginForm" style="margin-top:50px;">

            <fieldset class="loginField" style="margin-top:20px;">
                <legend>로그인</legend>

                <form id="login_form">
                    <p class="login_add">
                        <span class="fl">
                            <span id="sizeSpan" style="display:none;"><input type="checkbox" name="sizeKey" id="sizeKey" value="1024"/><label for="sizeKey">1024x*</label></span>

                            <span>USER IP :</span> ${clientIP}
                        </span>

                    </p>

                    <ul class="formLogin mb40">
                        <li>
                            <span class="formLogin_name">아이디</span>
                            <span class="formLogin_field">
                                <input type="text" name="id" style="text-indent:0;" value="" maxlength="50">
                            </span>

                        </li>
                        <li>
                            <span class="formLogin_name">비밀번호</span>
                            <span class="formLogin_field">
                                <input type="password" name="password" autocomplete="off" style="text-indent:0;" value="" onkeyup="if(event.keyCode == 13) login()" maxlength="20">
                            </span>
                        </li>
                    </ul>
                </form>
                <p class="loginBtn">
                    <input type="button" value="로그인" onclick="login()"/>
                </p>
            </fieldset>
        </div>
    </div>
</div>
</body>
</html>