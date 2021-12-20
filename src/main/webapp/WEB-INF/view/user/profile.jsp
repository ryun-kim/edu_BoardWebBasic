<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
    <c:set var="pImg" value="defaultProfile.png"/>
    <c:if test="${requestScope.data.profileImg != null}">
        <c:set var="pImg" value="${sessionScope.loginUser.iuser}/${requestScope.data.profileImg}"/>
    </c:if>
    <div class="circular--landscape circular--size200"><img src="/res/img/${pImg}"></div>
    <div>
        <div>아이디 : ${requestScope.data.uid}</div>
        <div>이름 : ${requestScope.data.nm}</div>
        <div>성별 : ${requestScope.data.gender == 1?'남성':'여성'}</div>
        <div>가입일 : ${requestScope.data.rdt}</div>
    </div>
    <div>
        <form action="/board/profile" method="post" enctype="multipart/form-data">
            <div><label>이미지 : <input type="file" name="profileImg"></label></div>
            <div><input type="submit" value="프로필 이미지 변경"></div>
        </form>
    </div>
</div>