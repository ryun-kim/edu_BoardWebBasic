<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/res/css/board/list.css">

<c:choose>
    <c:when test="${fn:length(requestScope.list) == 0}">

    </c:when>
</c:choose>