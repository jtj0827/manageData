<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="b-contents warning-area">
    <ul class="warningllist-wrap">
        <li>
            <p class="warning-tit">어제 경고 발생 수</p>
            <p class="warning-num">
                <span id="countYesterday"></span>
            </p>
        </li>
        <li>
            <p class="warning-tit">오늘 경고 발생 수</p>
            <p class="warning-num">
                <span id="countToday"></span>
                <span class="arrowWrap bg-arrowRed" id="moreThanYesterDay"><span id="toMinusYes"></span> <i class="ico-up"></i></span>
                <span class="arrowWrap bg-arrowBlue" id="moreThanToday"><span id="yesMinusTo"></span> <i class="ico-down"></i></span>
            </p>
        </li>
    </ul>
</div>