<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/1/7
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"> </script>
    <script type="text/javascript">
        $(function () {
            $("#one").mouseover(function () {
                /*alert(123);*/
                $(this).css("border","2px red solid");
            })
            $("#one").mouseout(function () {
                /*$(this).css("border","2px yellow solid");*/
                $(this).css("border","none");
            })
        })
    </script>
</head>
<body>
<textarea class="ckeditor" name="photo"></textarea>
<div id="one">
    sadasd
</div>
</body>
</html>
