<%--
    Document   : register
    Created on : 2014-10-23, 15:12:26
    Author     : Administrator
--%>
<%@page language="java"%>
<%@page import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh">
  <head>
      <script>
function validation(){
   
    if(document.getElementById("userID").value=="") {
      alert("姓名不能为空");
      document.getElementById("userID").focus();
     return false;
  }
  //其他同上验证！
  if(document.getElementById("password").value=="") {
      alert("密码不能为空");
      document.getElementById("password").focus();
     return false;
  }
  return true;
}
</script>
    <title>登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  <body background="../images/lift_bg_3.jpg">
  <center><h1>请进行新用户注册</h1></center>
  <div align="center">
  <table style="text-align: center" width="500" height="150" border="5" cellpadding="10" cellspacing="8" bgcolor="#C0C0C0">
     <tr bgcolor="white"><MARQUEE direction="left" scrolldelay="60"bgcolor="#EE7600"><font color="#0000FF">请进行注册，为了您的安全请将密码尽量设的复杂！！！</font></MARQUEE></tr>
     <br>
  <tr>
  <form name="inserting" method="post" action="../Insert" onsubmit="return validation()">
      <td width="40%"><font face="黑体">请输入用户名：</font></td>
      <td width="60%" colspan="2"><input type="text" id="userID" name="userID" value="">
      <tr>
      <td width="40%"><font face="黑体">请输入密码：</font></td>
      <td width="60%" colspan="2"><input type="password" id="password" name="password" value="">
      </tr>
      <tr>
      <td width="40%"><font face="黑体">再次输入密码：</font></td>
      <td width="60%" colspan="2"><input type="password" id="password" name="passwordAgain" value="">
      </tr>
      <tr>
      <td><input type="submit" name="tj" value="提交"></td>
      <td><input type="reset" name="reset" value="重置"></td>
 </form>
  <form name="exit" method="post" action="userlogin.jsp">
      <td align="center"><input type="submit" name="tj" value="返回"></td>
  </form>
   </tr>
 </table>
 </div>
 </body>
</html>