<%-- 
    Document   : Login
    Created on : 2014-12-11, 15:23:17
    Author     : liuxk
--%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Font"%>
<%@page import="java.util.Random"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE html>
<html>
    <head>
        <title>�����˻���¼</title>
        <meta http-equiv="Content-Type" content="text/html"charset="gb2312">
        <script> 
           function myDump(){
               window.location.href = "LoginAdmin.jsp?adname=" + document.getElementById("adminID").value;
               //���ڶ�λ��ָ��ҳ�沢��document����ȡ��ǰ�ı����ƶ�ID��Ԫ�ص�ֵ
           }
        </script>
    </head>
    
    <%
        String adminname=null;
        adminname = request.getParameter("adname");
        if(adminname==null)
            adminname="";
    %>
    <body bacolor="#FFFFFF">
        <%
             String mark = request.getParameter("mark");
             int mk = -1;
             if(mark!=null){
                 mk = Integer.parseInt(mark);
                 if(mk==0){
        %>  
                        <p style="text-align: center; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 50px">�û�������!</p>
                <%} else if(mk==1) { %>
                        <p style="text-align: center; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 50px">�������!</p>
                <%} else if(mk==2) {%>
                        <p style="text-align: center; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 50px">��֤�����!</p>
                <%}%>
        <%}%>
        <h1 align="center"><b>��ӭ��¼����Աϵͳ</b></h1>
        <form action="../CheckAdmin" methor="post">
        <p></p>
         <table width="52%" border="2" align="center">
              <tr bgcolor="#FFFFCC">
                  <td align="center" width="43%"><div align="center">�û���:</div></td>
                  <td width="57%"><div align="left">
                          <input type="text" name="adminname" id="adminID" value="<%=adminname%>">
                     </div></td>
              </tr>
              <tr bgcolor="#CCFF99">
                  <td align="center" width="43%"><div align="center">����:</div></td>
                  <td width="57%"><div align="left">
                          <input type="password" name="password">
                      </div></td>
              </tr>
              <tr>
                  <td align="center" width="43%"><div align="center">��֤��:</div></td>
                  <td width="57%"><div align="left">
                         <input name="code" type="text"> 
                         <img id="imgValidate" src="../loginUser/code.jsp" onclick="refresh()"/>
                         <a href="<%="LoginAdmin.jsp?mark="+mk%>" onclick="myDump()">���»�ȡ</a>
                         <script type="text/javascript">
                                function refresh(){
                                        imgValidate.src="../loginUser/code.jsp";
                                } 
                         </script>
                      </div></td> 
               </tr>
          </table>
        <p align="center">
            <input type="reset" name="Reset" value="����">
            <input type="submit" name="Submie2" value="�ύ">
        </p>
        </form>
    </body>
</html>
