<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- chart js --%>

<div class="b-contents chart-area mt0">
    <p class="contents-tit">이벤트 증가율</p>

    <div class="b-chart__inner">
        <div id="chart-evnt" class="b-chart" style="height: 100%"></div>
    </div>

    <div class="b-chart__list">
        <div>
            <span class="contentsInner-text">총 경고 수</span>
            <span class="contentsInner-num" id="totalWarningCount"></span>
        </div>

        <div>
            <span class="contentsInner-text">해결 수</span>
            <span class="contentsInner-num" id="solvedWarningCount"></span>
        </div>

        <div>
            <span class="contentsInner-text">미해결 수</span>
            <span class="contentsInner-num" id="unsolvedWarningCount"></span>
        </div>
    </div>
</div>


