<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp" %>

<script src="/resources/js/serverMng/step/list.js" type="text/babel"></script>
<!--header, leftMenu 제외한 컨텐츠 영역 <section class="l-content-area">-->
<section class="l-content-area">

    <!--메인타이틀 영역 <h1 class="main-title">-->
    <h1 class="main-title">코드 관리</h1>

    <div style="float: left; width: 31%; margin: 10px; height:70%; border: 1px solid #555; overflow-y:scroll; overflow-x:hidden">
        <table class="b-listTable">
            <caption class="offscreen">게시글 목록</caption>
            <colgroup>
                <col width="10%">
                <col>
                <col width="18%">
                <col width="18%">
            </colgroup>
            <thead>
            <tr>
                <th colspan="4">STEP1</th>
            </tr>
            <form class="saveForm">
                <tr>
                    <td class="a_center" colspan="4">
                        <input type="text" name="name" class="default-input w155">
                        <input type="button" class="trn btn-baseRound btn-add w80" value="추가" onclick="saveStep(1)">
                    </td>
                </tr>
            </form>
            </thead>
            <tbody id="oneStep">
                <c:forEach items="${oneStep}" var="step" varStatus="status">
                    <tr class="oneStep pointer" onclick="viewStep(${step.idx},${step.depth},this)">
                        <input type="hidden" value="${step.topIdx}" name="topIdx">
                        <td>${status.index+1}</td>
                        <td>${step.name}</td>
                        <td><input type="button" value="수정" onclick="updateText('${step.idx}',this)"></td>
                        <td><input type="button" value="제거" onclick="deleteStep('${step.idx}',this)"></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>


    <div style="float: left; width: 31%; margin: 10px; height:70%; border: 1px solid #555; overflow-y:scroll; overflow-x:hidden">
        <table class="b-listTable">
            <caption class="offscreen">게시글 목록</caption>
            <colgroup>
                <col width="10%">
                <col>
                <col width="18%">
                <col width="18%">
            </colgroup>
            <thead>
            <tr>
                <th colspan="4">STEP2</th>
            </tr>
            <form class="saveForm">
                <tr>
                    <td class="a_center" colspan="4">
                        <input type="hidden" id="twoTopIdx" name="topIdx" value="">
                        <input type="text" name="name" class="default-input w155" onkeypress="pressEnter(1)">
                        <input type="button" class="trn btn-baseRound btn-add w80" value="추가" onclick="saveStep(2)">
                    </td>
                </tr>
            </form>
            </thead>
            <tbody id="twoStep">

            </tbody>
        </table>
    </div>


    <div style="float: left; width: 31%; margin: 10px; height:70%; border: 1px solid #555; overflow-y:scroll; overflow-x:hidden">
        <table class="b-listTable">
            <caption class="offscreen">게시글 목록</caption>
            <colgroup>
                <col width="10%">
                <col>
                <col width="18%">
                <col width="18%">
            </colgroup>
            <thead>
            <tr>
                <th colspan="4">STEP3</th>
            </tr>
            <form class="saveForm">
                <tr>
                    <td class="a_center" colspan="4">
                        <input type="hidden" id="threeTopIdx" name="topIdx" value="">
                        <input type="text" name="name" class="default-input w155" onkeypress="pressEnter(1)">
                        <input type="button" class="trn btn-baseRound btn-add w80" value="추가" onclick="saveStep(3)">
                    </td>
                </tr>
            </form>
            </thead>
            <tbody id="threeStep">

            </tbody>
        </table>
    </div>
    <%--b-list--%>
</section>


</div><!--l-container-->
</body>
</html>