<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/board/list.css?ver=2">

<c:choose>
    <c:when test="${requestScope.maxPageNum ==0}">
        <div>글이 없습니다.</div>
    </c:when>
    <c:otherwise>
        <div>
            <form action="/board/list" method="get">
                <select name="searchType">
                    <option value="1">제목</option>
                    <option value="2">내용</option>
                    <option value="3">제목/내용</option>
                    <option value="4">글쓴이</option>
                    <option value="5">전체</option>
                </select>
                <div><input type="search" name="searchText"><input type="submit" value="검색"></div>
            </form>
        </div>
        <div class="listContainer">
            <table id ="boardTable">
                <tr>
                    <th>no</th>
                    <th>title</th>
                    <th>hits</th>
                    <th>writer</th>
                    <th>reg-datetime</th>
                </tr>
                <c:forEach items="${requestScope.list}" var="item">
                    <tr class="record" onclick="moveToDetail(${item.iboard})">
                        <td><c:out value="${item.iboard}"/></td>
                        <td><c:out value="${item.title}"/></td>
                        <td><c:out value="${item.hit}"/></td>
                        <td><c:out value="${item.writerNm}"/></td>
                        <td><c:out value="${item.rdt}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="pageContainer">

            <c:set var="selectedPage" value="${param.page == null? 1: param.page}"/>
            <c:forEach var="page" begin="1" end="${maxPageNum}">
                <div><a href="/board/list?page=${page}"><span class="${selectedPage == page ? 'selected' : ''}" ><c:out value="${page}"/></span></a></div>
            </c:forEach>
            <!--
            maxPageNum값이 0이면 테이블이 나타나지 않고, <div>글이 없습니다.</div>
            이게 나타나도록 하고,

            테이블이 나타났다면 페이지 숫자를 출력
            구글링, Jstl 지난번에 forEach문을 items 사용해서  for문 돌렸는데
            이번에 forEach문을 시작값이 1, 끝값이 3 이렇게 해서 for문
            -->
        </div>
    </c:otherwise>
</c:choose>
<script src="/res/js/board/list.js"></script>