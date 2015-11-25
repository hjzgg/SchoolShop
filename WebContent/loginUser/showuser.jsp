<%-- 
    Document   : showuser
    Created on : 2014-12-18, 15:02:40
    Author     : Administrator
--%>

<%@page import="java.net.URLEncoder"%>
<%@page language="java"%>
<%@page import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    Cookie cookies[] = request.getCookies();
    boolean isLogin = false;
    for(int i=0; i<cookies.length; ++i)
            if(cookies[i].getName().equals("UserFlag") && cookies[i].getValue().equals("OK")){
                isLogin = true;
                break;
            }
    if(!isLogin){
        response.sendRedirect("../error.jsp?type=choose&error=" + URLEncoder.encode("登陆超时，请重新登陆!", "utf-8"));
        return ;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>用户信息显示</title>
    </head>
    <body background="images/bg.png">
       <center><h1>用户信息显示:</h1></center>
       <div align="center">
       <table width="400" height="150" border="5" cellpadding="10" cellspacing="8" bgcolor="#C0C0C0">
       <tr>
           <td>
           用户名为：
           </td>
           <td><%=session.getAttribute("schoolshop")%>
           </td>
       </tr>
       <tr>
           <td>
           密码为：
           </td>
           <td>
           ******
           </td>
       </tr>
       <tr>
       <form name="modifying" method="post" action="modify.jsp">
       <td><input type="submit" name="tj" value="修改密码"></td>
       </form>
       <form name="exit" method="post" action="mainweb.jsp">
       <td align="center"><input type="submit" name="tj" value="返回主页"></td>
       </form>
       </tr>
       </table>
       </div>
    </body>
</html>
