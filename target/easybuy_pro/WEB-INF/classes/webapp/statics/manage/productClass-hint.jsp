<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/30
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    alert('<%=request.getAttribute("info")%>');
    window.location="productClass.jsp";
</script>
</body>
</html>
