<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${totalCount > 0}">
    <div class="b-paging">

        <a href="javascript:goPage(${paging.firstPageNo})" class="first"><img src="/resources/images/icon/arrow_left_d.png" alt=""></a>
        <a href="javascript:goPage(${paging.prevPageNo})" class="prev"><img src="/resources/images/icon/arrow_left.png" alt=""></a>
        &nbsp;&nbsp;
        <span>
            <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
                <c:choose>
                    <c:when test="${i eq paging.pageNo}"><a href="javascript:goPage(${i})" class="choice">${i}</a></c:when>
                    <c:otherwise><a href="javascript:goPage(${i})">${i}</a></c:otherwise>
                </c:choose>
            </c:forEach>
        </span>
        &nbsp;&nbsp;
        <a href="javascript:goPage(${paging.nextPageNo})" class="next"><img src="/resources/images/icon/arrow_right.png" alt=""></a>
        <a href="javascript:goPage(${paging.finalPageNo})" class="last"> <img src="/resources/images/icon/arrow_right_d.png" alt=""></a>
    </div>
</c:if>