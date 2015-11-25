<%-- 
    Document   : SBpicture
    Created on : 2014-11-30, 11:11:31
    Author     : HJZ
--%>

<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    InetAddress ip = InetAddress.getLocalHost();
    request.setCharacterEncoding("UTF-8");
    int port = request.getLocalPort();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Server To Browser Program</title>
    </head>
    <body>
        <table>
             <tr>
                 <td style="width:400px; height:300px">
                     <img style="width:400px; height:300px" src="<%="http://" + ip.getHostAddress() + ":" + port + request.getContextPath() + "/GetPicture?picName=" + request.getParameter("picName")+"&file=true"%>" >
                 </td>
             </tr>
             <tr>
                  <td style="height:50px; text-align: right">
                      <input type="button" value="确定" onclick="document.getElementById('picDiv').style.display='none'">
                  </td>
             </tr>
        </table>
    </body>
</html>
