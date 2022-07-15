<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/leftMenu.jsp"%>
<div class="content">
    <h1 class="title">중앙 데이터 관리-바이러스 등록</h1>
    <main class="max-wrap">
        <form id="pageForm" name="frm">
            <input type="hidden" id="orderBy" name="orderBy" value="">
            <input type="hidden" id="sortBy" name="sortBy" value="">
            <input type="hidden" id="filterType" name="filterType" value="0">
            <div class="search_form">
                <ul>
                    <li class="mr10">
                        <label class="dis-ib a-center w100">바이러스 종류</label>
                        <select class="w120" id="searchCondition" name="searchCondition" onchange="">
                            <option value="">전체</option>
                            <option value="0">바이러스</option>
                            <option value="1">문서내검출</option>
                            <option value="2">랜섬웨어</option>
                            <option value="3">행위검출</option>
                        </select>
                        <label class="dis-ib a-center w120">HASH SHA256</label>
                        <input type="text" id="sha256" name="sha256" value="" onkeyup="" maxlength="64">
                        <label class="dis-ib a-center w80">파일이름</label>
                        <input type="text" id="fileName" name="fileName" value="">
                        <label class="dis-ib a-center w100">바이러스 이름</label>
                        <input type="text" id="result" name="result" value="">
                        <input type="button" value="등록" id="saveBtn" class="btn sky normal mid w70" onclick="">
                    </li>
                </ul>
            </div>
        </form>
        <article class="content-area mb30">
            <div class="list-info">
                <span class="total" id="totalCnt"></span>
            </div>
            <table id="list_table" class="list-table nohover">
                <colgroup>
                    <col width="15%"/>
                    <col/>
                    <col width="20%"/>
                    <col width="20%"/>
                    <col width="15%"/>
                </colgroup>
                <thead>
                    <tr style="cursor: pointer;">
                        <th><a onclick="">바이러스 종류<span id="orderBy1_txt"></span></a></th>
                        <th><a onclick="">HASH SHA256<span id="orderBy2_txt"></span></a></th>
                        <th><a onclick="">파일이름<span id="orderBy3_txt"></span></a></th>
                        <th><a onclick="">바이러스이름<span id="orderBy4_txt"></span></a></th>
                        <th><a onclick="">등록일자<span id="orderBy5_txt"></span></a></th>
                    </tr>
                </thead>
                <tbody id="tableBody">

                </tbody>
            </table>
        </article>
    </main>
</div><%--content--%>
</body>
</html>
