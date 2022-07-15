<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/header.jsp" %>

<script src="/resources/js/serverMng/info/view.js" type="text/babel"></script>
<script src="/resources/js/fileUploadArea.js" type="text/babel"></script>
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">최신 버전정보 관리</h1>

    <div class="l-maxwrap">
        <form id="deleteForm">
            <input type="hidden" name="idx" id="idx" value="${serverInfo.idx}">
        </form>
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
                            ${versionInfo.scma}
                        </td>
                    </tr>
                    <tr>
                        <th>SECU GUARD</th>
                        <td>
                            ${versionInfo.sg}
                        </td>
                        <th>SCMGUARD MTA</th>
                        <td>
                            ${versionInfo.scmguardMta}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMSUB</th>
                        <td>
                            ${versionInfo.scmsub}
                        </td>
                        <th>SCMGUARD SMTPC</th>
                        <td>
                            ${versionInfo.scmguardSmtpc}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMUTIL2</th>
                        <td>
                            ${versionInfo.scmutil2}
                        </td>
                        <th>MANAGER</th>
                        <td>
                            ${versionInfo.manager}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMSYNC</th>
                        <td>
                            ${versionInfo.scmsync}
                        </td>
                        <th>SCMMAL</th>
                        <td>
                            ${versionInfo.scmmal}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMSCANCODE</th>
                        <td>
                            ${versionInfo.scmscancode}
                        </td>
                        <th>SCMHACLI RG</th>
                        <td>
                            ${versionInfo.scmhacliRg}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMSYSTEM</th>
                        <td>
                            ${versionInfo.scmsystem}
                        </td>
                        <th>RGUARD MONITOR</th>
                        <td>
                            ${versionInfo.rguardMonitor}
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
                            ${versionInfo.db}
                        </td>
                        <th>DAEMON</th>
                        <td>
                            ${versionInfo.daemon}
                        </td>
                    </tr>
                    <tr>
                        <th>MAG</th>
                        <td>
                            ${versionInfo.mag}
                        </td>
                        <th>MTA</th>
                        <td>
                            ${versionInfo.mta}
                        </td>
                    </tr>
                    <tr>
                        <th>PARSER</th>
                        <td>
                            ${versionInfo.parser}
                        </td>
                        <th>sender</th>
                        <td>
                            ${versionInfo.sender}
                        </td>
                    </tr>
                    <tr>
                        <th>FIREWALL</th>
                        <td>
                            ${versionInfo.firewall}
                        </td>
                        <th>SUB</th>
                        <td>
                            ${versionInfo.sub}
                        </td>
                    </tr>
                    <tr>
                        <th>SCNHACLI</th>
                        <td>
                            ${versionInfo.scnhacli}
                        </td>
                        <th>G SYSTEM</th>
                        <td>
                            ${versionInfo.gsystem}
                        </td>
                    </tr>
                    <tr>
                        <th>SGUARD MONITOR</th>
                        <td colspan="3">
                            ${versionInfo.sguardMonitor}
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
                            ${versionInfo.scmmail}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMMAIL PAR</th>
                        <td>
                            ${versionInfo.scmmailPar}
                        </td>
                        <th>SCMARCHIVE</th>
                        <td>
                            ${versionInfo.scmarchive}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMMANAGER</th>
                        <td>
                            ${versionInfo.scmmanager}
                        </td>
                        <th>SCMMAILSUB</th>
                        <td>
                            ${versionInfo.scmmailsub}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMUPSERVER</th>
                        <td>
                            ${versionInfo.scmupserver}
                        </td>
                        <th>SCMUP SERVER SSL</th>
                        <td>
                            ${versionInfo.scmupServerSsl}
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
                            ${versionInfo.scDet}
                        </td>
                        <th>SC MAIN</th>
                        <td>
                            ${versionInfo.scMain}
                        </td>
                    </tr>
                    <tr>
                        <th>SC MANAGER</th>
                        <td>
                            ${versionInfo.scManager}
                        </td>
                        <th>SCMSAND</th>
                        <td>
                            ${versionInfo.scmsand}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMSAND RUN</th>
                        <td>
                            ${versionInfo.scmsandRun}
                        </td>
                        <th>SCMSANDSUB</th>
                        <td>
                            ${versionInfo.scmsandsub}
                        </td>
                    </tr>
                    <tr>
                        <th>GUARD SYSTEM</th>
                        <td colspan="3">
                            ${versionInfo.guardSystem}
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
                            ${versionInfo.iguardDaemon}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMHAMAG</th>
                        <td>
                            ${versionInfo.scmhamag}
                        </td>
                        <th>SCMHASVR MAIN</th>
                        <td>
                            ${versionInfo.scmhasvrMain}
                        </td>
                    </tr>
                    <tr>
                        <th>SCMHASVR PARSER</th>
                        <td>
                            ${versionInfo.scmhasvrParser}
                        </td>
                        <th>IGUARD FIREWALL</th>
                        <td>
                            ${versionInfo.iguardFirewall}
                        </td>
                    </tr>
                </table>
            </div>
        </section>

    </div>
    <div class="btn-area">
        <input type="button" class="btn-base btn-add btn-large mr5" value="수정" onclick="location.href='form'">
    </div>
</section><!--l-content-area-->

</div><!--l-container-->
</body>
</html>