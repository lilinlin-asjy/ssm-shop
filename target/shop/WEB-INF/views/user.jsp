<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2021/2/24
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    222333334444
    <c:forEach items="${users}" var="user" varStatus="vs">
        ${user.name} ${user.uId}
    </c:forEach>
</head>
<body>

</body>
</html>
