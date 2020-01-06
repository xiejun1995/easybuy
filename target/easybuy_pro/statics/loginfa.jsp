<%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2019/12/31
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    alert("用户名或密码错误，请重新登录");
    window.location="${pageContext.request.contextPath }/statics/index.jsp";
</script>
</body>
</html>
