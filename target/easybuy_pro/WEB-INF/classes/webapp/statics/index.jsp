
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/function.js"></script>
  <html>
  <head>
    <title>易买网</title>
  </head>
  <body>
  <div id="welcomeImage"><jsp:include page="welcome.jsp" /></div>
  <div id="header" class="wrap"><jsp:include page="header.jsp" /></div>
  <div id="childNav"><jsp:include page="childnav.jsp" /></div>
  <div id="main" class="wrap"><jsp:include page="main.jsp" /></div>
  <div id="footer"><jsp:include page="footer.jsp" /></div>
  </body>
</html>
