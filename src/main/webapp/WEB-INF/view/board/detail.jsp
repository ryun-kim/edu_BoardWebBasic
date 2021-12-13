<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
    <c:if test="${sessionScope.loginUser.iuser == requestScope.detail.writer}">
    <div>
        <a href="/board/del?iboard=${requestScope.detail.iboard}"><button>삭제</button></a>
        <a href="/board/regmod?iboard=${requestScope.detail.iboard}"><button>수정</button></a>
    </div>
    </c:if>
    <div>
        <th>번호 <c:out value=" ${requestScope.detail.iboard}"/></th>
        <th>제목 <c:out value="${requestScope.detail.title}"/> </th>
    </div>
    <div>
        <tr>내용</tr>
        <th><c:out value=" ${requestScope.detail.ctnt}"/></th>
    </div>
    <div>
        <tr>작성자</tr>
        <th><c:out value=" ${requestScope.detail.writerNm}"/></th>
    </div>
    <div>
        <th>조회수 <c:out value=" ${requestScope.detail.hit}"/></th>
        <th>등록일시 <c:out value="${requestScope.detail.rdt}"/></th>
    </div>

    <c:if test="${sessionScope.loginUser != null}">
        <div>
            <form action="/board/cmt/reg" method="post">
                <input type="hidden" name="iboard" value="${requestScope.detail.iboard}">
                <input type="text" name="ctnt" placeholder="댓글 내용">
                <input type="submit" value="댓글달기">
            </form>
        </div>
    </c:if>
    <c:if test="${sessionScope.loginUser !=null}">
        <div class="far">
            <c: when test="${requestScope.isHeart ==1 }">
                <a href="/board/heart?proc=1&iboard=${requestScope.data.iboard}"><i class="fas fa-thumbs-up"></i></a>
            </c:>
            <c:otherwise>
                <a href="/board/heart?proc=2&iboard=${requestScope.data.iboard}"><i class="far fa-thumbs-up"></i></a>
            </c:otherwise>


        </div>
    </c:if>
    <div>
        <talbe>
            <tr>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일시</th>
                <th>비고</th>
            </tr>
            <c:forEach items="${requestScope.cmtList}" var="item">
                <tr>
                    <td><c:out value="${item.ctnt}"/></td>
                    <td>${writerNm}</td>
                    <td>${rdt}</td>
                    <td>
                        <c:if test="${sessionScope.loginUser.iuser == item.writer}">
                            <button>수정</button>
                            <button onclick="isDelCmt(${item.icmt});">삭제</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </talbe>
    </div>
</div>
<script src="/res/js/board/detail.js"></script>