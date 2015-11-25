<%-- 
    Document   : AddDataCheck
    Created on : 2014-11-22, 10:06:30
    Author     : HJZ
--%>

<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message Page</title>
    </head>
    <body>
        <center>
               <%
                   request.setCharacterEncoding("utf-8");
                   String type = request.getParameter("type");
                   if(type.equals("add")){
               %>
                     <h1>文件添加出错！错误类型：</h1>
               <%
                   } else if(type.equals("load")) {
               %>
                     <h1>文件加载出错！错误类型：</h1>
               <%
                   } else if(type.equals("show")){
               %>
                     <h1>文件显示出错！错误类型：</h1>
               <%  
                   } else if(type.equals("success")){
               %>
                     <h1>Happy every day!</h1>
               <%
                   } else if(type.equals("deleteNo")){
               %>
                     <h1>文件删除出错！错误类型：</h1>   
               <%
                   } else if(type.equals("deleteOK")){
               %>
                        <h1>Happy every day!</h1>
               <%
                   } else if(type.equals("updateNo")) {
               %>
                     <h1>文件更新出错！错误类型：</h1>   
               <%
                   } else if(type.equals("updateOK")) {
               %>
                      <h1>Happy every day!</h1>
               <%
                   } else if(type.equals("picChangeAtuo")){
               %>
                       <h1>图片自动轮换加载时出错!</h1>
               <%
                   } else if(type.equals("choose")){
               %>
                       <h1>购买时间超时!</h1>
               <%
                   } else if(type.equals("buy")){
               %>
                       <h1>购买出错!</h1>
               <%}%>
               
               <%
                   out.println(URLDecoder.decode(request.getParameter("error"), "utf-8"));
                   if(type.equals("choose"))
                       out.println("<a href=\'./loginUser/userlogin.jsp\'>登陆</a>");
               %>
        </center>
    </body>
</html>
