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
</div>
