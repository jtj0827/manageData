<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="b-leftMenu">
    <div class="b-leftMenu-logo pointer">
        <img src="/resources/images/logo.png" alt="로고">
    </div>

    <div class="b-leftMenu-list">
        <c:forEach items="${sessionScope.leftMenu}" var="menu">
            <c:choose>
                <c:when test="${menu.code eq 'CS03'}">
                    <%--고객센터 > 1:1 문의 일 경우--%>
                    <p>
                        <a href="${menu.url}"
                           class="b-leftMenu-list__link ${menu.depth ne 2 ? 'dp2' : 'dp1'} ${menu.code eq sessionScope.activeMenu.code2 || menu.code eq sessionScope.activeMenu.code3 ? 'active' : ''}">
                                ${menu.name}<span style="float : right"><fmt:formatNumber value="${leftQuestionCount}" pattern="#,###"/></span>
                        </a>
                    </p>
                </c:when>
                <c:otherwise>
                    <%--그 외 메뉴 미표시--%>
                    <p>
                        <a href="${menu.url}"
                           class="b-leftMenu-list__link ${menu.depth ne 2 ? 'dp2' : 'dp1'} ${menu.code eq sessionScope.activeMenu.code2 || menu.code eq sessionScope.activeMenu.code3 ? 'active' : ''}">
                                ${menu.name}
                        </a>
                    </p>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
</div>