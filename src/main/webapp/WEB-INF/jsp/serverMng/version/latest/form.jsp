<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>

<script src="/resources/js/serverMng/version/form.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">최신 버전정보 관리</h1>
    <div class="l-maxwrap">
        <form id="saveForm">
            <div id="common_tempArea"></div>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">RECEIVE GUARD</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">RECEIVE GUARD</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>SCMA</th>
                            <td colspan="3">
                                <input type="text" name="scma" class="default-input a_right w158" value="${versionInfo.scma}">
                            </td>
                        </tr>
                        <tr>
                            <th>SECU GUARD</th>
                            <td>
                                <input type="text" name="sg" class="default-input a_right w158" value="${versionInfo.sg}">
                            </td>
                            <th>SCMGUARD MTA</th>
                            <td>
                                <input type="text" name="scmguardMta" class="default-input a_right w158" value="${versionInfo.scmguardMta}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMSUB</th>
                            <td>
                                <input type="text" name="scmsub" class="default-input a_right w158" value="${versionInfo.scmsub}">
                            </td>
                            <th>SCMGUARD SMTPC</th>
                            <td>
                                <input type="text" name="scmguardSmtpc" class="default-input a_right w158" value="${versionInfo.scmguardSmtpc}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMUTIL2</th>
                            <td>
                                <input type="text" name="scmutil2" class="default-input a_right w158" value="${versionInfo.scmutil2}">
                            </td>
                            <th>MANAGER</th>
                            <td>
                                <input type="text" name="manager" class="default-input a_right w158" value="${versionInfo.manager}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMSYNC</th>
                            <td>
                                <input type="text" name="scmsync" class="default-input a_right w158" value="${versionInfo.scmsync}">
                            </td>
                            <th>SCMMAL</th>
                            <td>
                                <input type="text" name="scmmal" class="default-input a_right w158" value="${versionInfo.scmmal}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMSCANCODE</th>
                            <td>
                                <input type="text" name="scmscancode" class="default-input a_right w158" value="${versionInfo.scmscancode}">
                            </td>
                            <th>SCMHACLI RG</th>
                            <td>
                                <input type="text" name="scmhacliRg" class="default-input a_right w158" value="${versionInfo.scmhacliRg}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMSYSTEM</th>
                            <td>
                                <input type="text" name="scmsystem" class="default-input a_right w158" value="${versionInfo.scmsystem}">
                            </td>
                            <th>RGUARD MONITOR</th>
                            <td>
                                <input type="text" name="rguardMonitor" class="default-input a_right w158" value="${versionInfo.rguardMonitor}">
                            </td>
                        </tr>
                    </table>
                </div>
            </section>

            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">SEND GUARD</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">SEND GUARD</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>DB</th>
                            <td>
                                <input type="text" name="db" class="default-input a_right w158" value="${versionInfo.db}">
                            </td>
                            <th>DAEMON</th>
                            <td>
                                <input type="text" name="daemon" class="default-input a_right w158" value="${versionInfo.daemon}">
                            </td>
                        </tr>
                        <tr>
                            <th>MAG</th>
                            <td>
                                <input type="text" name="mag" class="default-input a_right w158" value="${versionInfo.mag}">
                            </td>
                            <th>MTA</th>
                            <td>
                                <input type="text" name="mta" class="default-input a_right w158" value="${versionInfo.mta}">
                            </td>
                        </tr>
                        <tr>
                            <th>PARSER</th>
                            <td>
                                <input type="text" name="parser" class="default-input a_right w158" value="${versionInfo.parser}">
                            </td>
                            <th>sender</th>
                            <td>
                                <input type="text" name="sender" class="default-input a_right w158" value="${versionInfo.sender}">
                            </td>
                        </tr>
                        <tr>
                            <th>FIREWALL</th>
                            <td>
                                <input type="text" name="firewall" class="default-input a_right w158" value="${versionInfo.firewall}">
                            </td>
                            <th>SUB</th>
                            <td>
                                <input type="text" name="sub" class="default-input a_right w158" value="${versionInfo.sub}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCNHACLI</th>
                            <td>
                                <input type="text" name="scnhacli" class="default-input a_right w158" value="${versionInfo.scnhacli}">
                            </td>
                            <th>G SYSTEM</th>
                            <td>
                                <input type="text" name="gsystem" class="default-input a_right w158" value="${versionInfo.gsystem}">
                            </td>
                        </tr>
                        <tr>
                            <th>SGUARD MONITOR</th>
                            <td colspan="3">
                                <input type="text" name="sguardMonitor" class="default-input a_right w158" value="${versionInfo.sguardMonitor}">
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">SECU MAIL</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">SECU MAIL</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>SCMMAIL</th>
                            <td colspan="3">
                                <input type="text" name="scmmail" class="default-input a_right w158" value="${versionInfo.scmmail}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMMAIL PAR</th>
                            <td>
                                <input type="text" name="scmmailPar" class="default-input a_right w158" value="${versionInfo.scmmailPar}">
                            </td>
                            <th>SCMARCHIVE</th>
                            <td>
                                <input type="text" name="scmarchive" class="default-input a_right w158" value="${versionInfo.scmarchive}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMMANAGER</th>
                            <td>
                                <input type="text" name="scmmanager" class="default-input a_right w158" value="${versionInfo.scmmanager}">
                            </td>
                            <th>SCMMAILSUB</th>
                            <td>
                                <input type="text" name="scmmailsub" class="default-input a_right w158" value="${versionInfo.scmmailsub}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMUPSERVER</th>
                            <td>
                                <input type="text" name="scmupserver" class="default-input a_right w158" value="${versionInfo.scmupserver}">
                            </td>
                            <th>SCMUP SERVER SSL</th>
                            <td>
                                <input type="text" name="scmupServerSsl" class="default-input a_right w158" value="${versionInfo.scmupServerSsl}">
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">CUBE</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">CUBE</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>

                        <tr>
                            <th>SC DET</th>
                            <td>
                                <input type="text" name="scDet" class="default-input a_right w158" value="${versionInfo.scDet}">
                            </td>
                            <th>SC MAIN</th>
                            <td>
                                <input type="text" name="scMain" class="default-input a_right w158" value="${versionInfo.scMain}">
                            </td>
                        </tr>
                        <tr>
                            <th>SC MANAGER</th>
                            <td>
                                <input type="text" name="scManager" class="default-input a_right w158" value="${versionInfo.scManager}">
                            </td>
                            <th>SCMSAND</th>
                            <td>
                                <input type="text" name="scmsand" class="default-input a_right w158" value="${versionInfo.scmsand}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMSAND RUN</th>
                            <td>
                                <input type="text" name="scmsandRun" class="default-input a_right w158" value="${versionInfo.scmsandRun}">
                            </td>
                            <th>SCMSANDSUB</th>
                            <td>
                                <input type="text" name="scmsandsub" class="default-input a_right w158" value="${versionInfo.scmsandsub}">
                            </td>
                        </tr>
                        <tr>
                            <th>GUARD SYSTEM</th>
                            <td colspan="3">
                                <input type="text" name="guardSystem" class="default-input a_right w158" value="${versionInfo.guardSystem}">
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
            <section class="mt30">
                <div class="b-title">
                    <h1 class="b-title__title">MIMS</h1>
                </div>

                <div class="b-tableWrap mt20">
                    <table class="b-listTable b-listTable--border">
                        <caption class="offscreen">MIMS</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <th>IGUARD DAEMON</th>
                            <td colspan="3">
                                <input type="text" name="iguardDaemon" class="default-input a_right w158" value="${versionInfo.iguardDaemon}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMHAMAG</th>
                            <td>
                                <input type="text" name="scmhamag" class="default-input a_right w158" value="${versionInfo.scmhamag}">
                            </td>
                            <th>SCMHASVR MAIN</th>
                            <td>
                                <input type="text" name="scmhasvrMain" class="default-input a_right w158" value="${versionInfo.scmhasvrMain}">
                            </td>
                        </tr>
                        <tr>
                            <th>SCMHASVR PARSER</th>
                            <td>
                                <input type="text" name="scmhasvrParser" class="default-input a_right w158" value="${versionInfo.scmhasvrParser}">
                            </td>
                            <th>IGUARD FIREWALL</th>
                            <td>
                                <input type="text" name="iguardFirewall" class="default-input a_right w158" value="${versionInfo.iguardFirewall}">
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
        </form>

        <div class="btn-area">
            <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="saveConfirm()">
            <input type="button" class="btn-base btn-large" value="취소" onclick="location.href='view'">
        </div>
    </div>

</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>