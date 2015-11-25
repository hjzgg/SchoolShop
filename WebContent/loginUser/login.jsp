<%-- 
    Document   : login
    Created on : 2014-11-27, 13:37:47
    Author     : Administrator
--%>

<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
    </head>
    <body>
    <%
        if(session.getAttribute("randStr")==null){
    %>
            <p style="text-align: center; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 20px">回话超时,请刷新登陆页面重试!</p>
    <%
             return ;
        }
    %>
    <%
        Cookie cookie=null;
        Cookie[] cookies=request.getCookies();
        String userID=request.getParameter("userID");
        if(userID==null)userID="";
        String password=request.getParameter("password");
        if(password==null) password="";
        Connection conn=null;
        Statement sqlStmt=null;
        ResultSet sqlRst=null;
        int mark=0;
        try{
            String code = (String)session.getAttribute("randStr");
            if(code.equals(request.getParameter("code"))){
                    String path=application.getRealPath("/");//访问当前web工程所在的物理路径
                    path = path.replaceAll("%20", " ");
                    Class.forName("org.sqlite.JDBC").newInstance();
                    conn=DriverManager.getConnection("jdbc:sqlite:" + path + "\\usermessages.db3");
                    sqlStmt=conn.createStatement();
                    String sqlQuery="select * from customer";
                    sqlRst=sqlStmt.executeQuery(sqlQuery);
                    while(sqlRst.next()){
                          if((userID.equals(sqlRst.getString(1))&&password.equals(sqlRst.getString(2)))){
                                cookie=new Cookie("UserFlag","OK");
                                cookie.setPath(request.getContextPath());
                                cookie.setMaxAge(250);
                                response.addCookie(cookie);
                                if(session.getAttribute("schoolshop") == null)
                                     session.setAttribute("schoolshop", userID);//标记这一个session
                                response.sendRedirect("../mainweb.jsp");
                                mark=1;
                                break;
                          }
                    }
                    //if(mark==0) 用户名或者密码错误
            } else mark = 2;//验证码错误
            if(mark!=1) response.sendRedirect("userlogin.jsp?mark="+mark);
            if(sqlRst!=null) sqlRst.close();
            if(sqlStmt!=null) sqlStmt.close();
            if(conn!=null)conn.close();
        }catch(java.sql.SQLException e){
            System.out.println(e.toString());
        }catch(java.lang.Exception e){
        	System.out.println(e.toString());
        }
    %>
    </body>
</html>
