<%-- 
    Document   : modify
    Created on : 2014-12-18, 14:07:03
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
        response.sendRedirect("../error.jsp?type=choose&error=" + URLEncoder.encode("��½��ʱ�������µ�½!", "utf-8"));
        return ;
    }
%>
<html>
    <head>
        <script>
function validation(){

    if(document.getElementById("password1").value=="") {
      alert("���벻��Ϊ��");
      document.getElementById("password1").focus();
     return false;
  }
  //����ͬ����֤��
  if(document.getElementById("password2").value=="") {
      alert("���벻��Ϊ��");
      document.getElementById("password2").focus();
     return false;
  }
  if(document.getElementById("password1").value!=document.getElementById("password2").value) {
      alert("�����������벻һ�£�����������");
      document.getElementById("password2").focus();
     return false;
  }
  return true;
}
</script>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>�޸�����</title>
    </head>
    <body background="images/bg.png">
     <center><h1>�޸ĸ�����Ϣ</h1></center>
     <div align="center">
  <table width="400" height="150" border="5" cellpadding="10" cellspacing="8" bgcolor="#C0C0C0">
     <tr bgcolor="white"><MARQUEE direction="left" scrolldelay="60"bgcolor="#EE7600"><font color="#0000FF">�����ע�ᣬΪ�����İ�ȫ�뽫���뾡����ĸ��ӣ�����</font></MARQUEE></tr>
     <br>
  <tr>
  <form name="modifying" method="post" action="Modify" onsubmit="return validation()">
      <tr>
        <td width="40%"><font face="����">��ǰ�û�����</font></td>
        <td width="60%" colspan="2"><input type="text" id="user" name="user" value="<%=session.getAttribute("schoolshop")%>">
      </tr>
      <tr>
        <td width="40%"><font face="����">�����������룺</font></td>
        <td width="60%" colspan="2"><input type="password" id="password1" name="password1" value="">
      </tr>
      <tr>
      <td width="40%"><font face="����">��ȷ�������룺</font></td>
      <td width="60%" colspan="2"><input type="password" id="password2" name="password2" value="">
      </tr>
      <tr>
      <td><input type="submit" name="tj" value="�ύ"></td>
      <td><input type="reset" name="reset" value="����"></td>
 </form>
  <form name="exit" method="post" action="../mainweb.jsp">
      <td align="center"><input type="submit" name="tj" value="����"></td>
  </form>
   </tr>
 </table>
 </div>
    </body>
</html>
