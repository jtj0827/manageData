<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="b-contents table-area mt0">
    <p class="contents-tit">일반 서버</p>

    <div class="b-contentsTable b-contents__inner">
        <table class="b-activeTable" id="generalTable">
            <colgroup>
                <col style="width: 7%">
                <col style="width: 13%">
                <col style="width: 12%">
                <col style="width: 19%">
                <col style="">
                <col style="width: 15%">
            </colgroup>

            <thead class="tableHeader">
            <tr>
                <th>구분</th>
                <th>Task No.</th>
                <th>장비 번호</th>
                <th>용도</th>
                <th>경고 발생</th>
                <th>날짜</th>
            </tr>
            </thead>

            <tbody class="main-tableBody" id="generalServerLog">
            <%--<tr class="grey">
                <td rowspan="2">일반서버</td>
                <td rowspan="2">2202idx19595959</td>
                <td rowspan="2">VMIGUARD001</td>
                <td rowspan="2">납품 / KAI한국항공우주산업(카이)</td>
                <td class="table-contents table-contensTop">
                    <p>하드 디스크 C Drive ( <span>60%</span> / <span>50%</span> ) 남은 용량 <span>10G</span> 경고 발생</p>
                </td>
                <td class="table-contents table-contensTop">
                    <p class="date-tit">2022-02-09 20:05</p>
                </td>
            </tr>

            <tr class="active">
                <td class="table-contents table-contensBottom grey">
                    <p class="active">하드 디스크 C Drive ( <span class="red-tit">70%</span> / <span>50%</span> ) 남은 용량 <span>10G</span> 경고 발생</p>
                </td>
                <td class="table-contents table-contensBottom grey">
                    <p class="date-tit">2022-02-17 14:14</p>
                </td>
            </tr>

            <tr class="lightgrey">
                <td rowspan="2">일반서버</td>
                <td rowspan="2">2202idx19595959</td>
                <td rowspan="2">VMIGUARD001</td>
                <td rowspan="2">납품 / KAI한국항공우주산업(카이)</td>
                <td class="table-contents table-contensTop">
                    <p>하드 디스크 C Drive ( <span>60%</span> / <span>50%</span> ) 남은 용량 <span>10G</span> 경고 발생</p>
                </td>
                <td class="table-contents table-contensTop">
                    <p class="date-tit">2022-02-09 20:05</p>
                </td>
            </tr>

            <tr class="active">
                <td class="table-contents table-contensBottom">
                    <p class="active">하드 디스크 C Drive ( <span class="red-tit">70%</span> / <span>50%</span> ) 남은 용량 <span>10G</span> 경고 발생</p>
                </td>
                <td class="table-contents table-contensBottom">
                    <p class="date-tit">2022-02-17 14:14</p>
                </td>
            </tr>

            <tr class="grey">
                <td rowspan="2">S · G</td>
                <td rowspan="2">2202idx19595959</td>
                <td rowspan="2">KW-110</td>
                <td rowspan="2">납품 / 코오롱베니트 / 기원테크 / 통합</td>
                <td class="table-contents table-contensTop">
                    <p>네트워크 (Main) Port ( <span>150M</span> / <span>100M</span> ) 초과 경고 발생</p>
                </td>
                <td class="table-contents table-contensTop">
                    <p class="date-tit">2022-02-09 20:05</p>
                </td>
            </tr>

            <tr>
                <td class="table-contents table-contensBottom grey">
                    <p>네트워크 (Main) Port ( <span>160M</span> / <span>100M</span> ) 초과 경고 발생 경고 발생</p>
                </td>
                <td class="table-contents table-contensBottom grey">
                    <p class="date-tit">2022-02-17 14:14</p>
                </td>
            </tr>--%>

            </tbody>
        </table>

        <div id="generalListNone" class="list-none dis_n">
            <p>리스트가 없습니다.</p>
        </div>
    </div>
</div>