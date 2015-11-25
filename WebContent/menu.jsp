<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<title>menu</title>
<style>
* {
list-style-type: none;
margin: 0px;
padding: 0px;
}
#nav {
font-size: 20px;
opacity: 0.8;
}
#nav a {
display: block;
width: 100px;
height: 15px;
padding: 3px 5px 12px;
background: #666;
color: coral;
text-decoration: none;
}
#nav a:hover {
background: #333;
}
#nav li {
float: center;
clear: left;
width: 120px;
background: #ccc;
padding-bottom: 3px;
}
#nav ul {
position: absolute;
margin-left: 115px;
margin-top: -30px;
}
#nav ul {
display: none;
}
#nav li.show ul {
display: block;
}
#nav li.show li ul {
display: none;
}
#nav li li.show ul {
display: block;
}
</style>
<script language="javascript" type="text/javascript">
function menuFix() {
    var sfEls = document.getElementById("nav").getElementsByTagName("li");
    for (var i=0; i<sfEls.length; i++) {
        sfEls[i].onmouseover=function() {
            this.className+=(this.className.length>0? " ": "") + "show";
        }
        sfEls[i].onmouseout=function() {
            this.className=this.className.replace(new RegExp("( ?|^)show\\b"), "");
        }
    }
}
window.onload=menuFix;
</script>
</head>
<body>
<br><br>
<a style="font-size: 30px; color: #000">导航菜单</a>
<br><br>
<jsp:useBean id="dbMsg" class="com.bean.SQLBean" scope="session"/>
<%
        Connection con = dbMsg.getConncetion();
        Statement sta1 = null;
        Statement sta2 = null;
        Statement sta3 = null;
        ResultSet rtGarden=null, rtFloor=null, rtWindow=null;
%>
<ul id="nav">
    <li><a href="mainweb.jsp">全部</a>
    <%
        sta1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        sta2 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        sta3 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        rtGarden = sta1.executeQuery("select distinct place from food");
        while(rtGarden.next()){
             String garden = rtGarden.getString("place");
    %>
                <li><a href="mainweb.jsp?place=<%=garden%>"><%=garden%></a>
                    <ul>
    <%
             String sql = "select distinct floor from food where place=\'" + garden + "\'";
             rtFloor = sta2.executeQuery(sql);
             while(rtFloor.next()){
                    String floor = rtFloor.getString("floor");
     %>
                    <li><a href="mainweb.jsp?place=<%=garden%>&floor=<%=floor%>"><%=floor%></a>
                        <ul>
     <%
                    sql = "select distinct window from food where floor=\'" + floor + "\'" +" and place=\'" + garden + "\'";
                    rtWindow = sta3.executeQuery(sql);
                    while(rtWindow.next()){
                            String window = rtWindow.getString("window");
     %>                     
                                <li><a href="mainweb.jsp?place=<%=garden%>&floor=<%=floor%>&window=<%=window%>"><%=window%></a></li>
     <%
                    }
     %>
                       </ul> </li>
     <%                     
             }
     %>
              </ul> </li>     
     <%                  
        }
     %>
</ul>
     <%
          try{
              if(rtWindow != null) rtWindow.close();
              if(rtFloor != null) rtFloor.close();
              if(rtGarden != null) rtGarden.close();
              if(sta1 != null) sta1.close();
              if(sta2 != null) sta1.close();
              if(sta3 != null) sta1.close();
          } catch(SQLException e){
              e.printStackTrace();
          }
     %>
</body>
</html>