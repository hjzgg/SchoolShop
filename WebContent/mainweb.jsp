<%-- 
    Document   : searchjsp
    Created on : 2014-11-22, 13:07:10
    Author     : Administrator
--%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta name="keywords" content="shoes store, free template, ecommerce, online shop, website templates, CSS, HTML" />
<meta name="description" content="Shoes Store is a free ecommerce template provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "top_nav", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>
<%
    Cookie cookies[] = request.getCookies();
    boolean isLogin = false;
    for(int i=0; i<cookies.length; ++i)
            if(cookies[i].getName().equals("UserFlag") && cookies[i].getValue().equals("OK")){
                isLogin = true;
                Cookie cookie=new Cookie("UserFlag","OK");
                cookie.setPath(request.getContextPath());
                cookie.setMaxAge(250);
                response.addCookie(cookie);
                break;
            }
    if(session.getAttribute("schoolshop") == null){//被标记的seesion失效了！也就是不存在了!
                response.sendRedirect("./error.jsp?type=choose&error=" + URLEncoder.encode("会话已经不存在，请重新登陆!", "utf-8"));
                return ;
    }
%>
<html>
    <style>
        .myp{font-size: 15px;color: black;}
    </style>
    
    <script language="javascript" type="text/javascript">
        function myfun(){
             var sql=document.getElementById("searchCondition").value;
             if(sql!="")
                 window.location.href="mainweb.jsp?conditionContent=" + sql;
        }
        function checkEnableCookie(){
            var cookieEnabled=(navigator.cookieEnabled)? true : false//判断cookie是否开启
            //如果浏览器不是ie4+或ns6+
            if (typeof navigator.cookieEnabled=="undefined" && !cookieEnabled){ 
                  document.cookie="testcookie";
                  cookieEnabled=(document.cookie=="testcookie")? true : false;
                  document.cookie=""  
            }
        }
        window.onload=checkEnableCookie();
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>校园美食主页</title>
    </head>
    <div style="position: absolute; top: 63px; right: 307px">
        <p style="color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 80px">郑州大学欢迎您</p>
    </div>
    <div style=" position: absolute; top: 60px; left: 1146px; text-align: center">
                    <a style=" text-decoration: none; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 20px" href="./MyCart/Cart.jsp">我的购物车</a>
                    <br><br>
                    <a style=" text-decoration: none; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 20px" href="./MyCart/mybuybaby.jsp">已买到的宝贝</a>
                    <br><br><br>
                    <%
                        if(isLogin){
                   %>
                                <p><a style="text-decoration: none; color: #980c10; font-weight: 700; font-family: verdana,arial; font-size: 30px" href="./loginUser/modify.jsp"><%=(String)session.getAttribute("schoolshop")%></a>&nbsp; &nbsp; <a href="./loginUser/register.jsp">注册</p></a>
                    <%} else {%>
                                <p class="myp"><a href="./loginUser/userlogin.jsp">登录 </a>&nbsp; &nbsp; <a href="./loginUser/register.jsp">注册</p></a>
                    <%}%>
    </div>
    <div id="templatemo_body_wrapper">
      <div id="templatemo_wrapper">
        <div id="site_title"><h1><a href="#"></a></h1></div>
	<div id="templatemo_header">
                        <div class="cleaner">校&nbsp;&nbsp;&nbsp;园&nbsp;&nbsp;&nbsp;美&nbsp;&nbsp;&nbsp;食&nbsp;&nbsp;&nbsp;网</div>
 	</div>
        <body>
                <jsp:useBean id="dbMsg" class="com.bean.SQLBean" scope="session"/>
                <%
                     int pageCur = 0;
                     String pageCnt = request.getParameter("page");
                     if(pageCnt==null) pageCur = 1;
                     else pageCur = Integer.parseInt(pageCnt);
                     request.setCharacterEncoding("utf-8");
                     String sql = "";
                     String place = null;
                     String floor = null;
                     String window = null;
                     String search = null;
                     if((search=request.getParameter("conditionContent"))!=null && !search.equals("")){
                            sql = "select * from food where place like \'%" + search + "%\' or " + "floor like \'%" + search +"%\' or "
                               + "window like \'%" + search +"%\' or " + "food like \'%" + search +"%\' or " + "money like \'%" + search +"%\' or "
                               + "picName like \'%" + search +"%\' or " + " describing like \'%" + search +"%\'";
                     } else {
                            search = "";
                            if((place=request.getParameter("place"))!=null && !place.equals(""))
                                 sql += "select * from food where place =\'" + place + "\'";
                            else place="";
                            if((floor=request.getParameter("floor"))!=null && !floor.equals(""))
                                 sql += " and floor=\'" + floor + "\'";
                            else floor="";
                            if((window=request.getParameter("window"))!=null && !window.equals(""))
                                 sql += " and window=\'" + window + "\'";
                            else window="";
                            if("".equals(sql))  sql = "select * from food";
                     }
                %>
                <div id="templatemo_menubar">
                    <div id="templatemo_search">
                        <input type="text" value="" name="search" id='searchCondition' value="<%=search%>" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                        <input type="submit" name="submit" value="" id="searchbutton" title="Search" class="sub_btn" onclick="myfun();"  />
                   </div>
                 </div>
                 <div id="templatemo_main">
                        <marquee scrollAmount=2 width=300 onmouseover=stop() onmouseout=start()>
                               <p class="myp"> 
                                   网站公告:  ......
                               </p>    
                        </marquee>
                        <table cellspacing="0">
                           <tr>
                               <td style="height: 210px; padding-top: 15px; background-image: url(格兰.jpg); background-size: cover; -moz-background-size: cover" align="center" valign="top">
                                   <div style="position: relative; z-index: 1;">
                                      <jsp:include page="menu.jsp"/>
                                   </div>
                               </td>
                               <td  style="background-image: url(清新.jpg); width: 650px" rowspan="2" colspan="3" valign="top">
                                   <center>
                                      <jsp:include page="showFood.jsp" flush="true">
                                          <jsp:param name="page" value="<%=pageCur%>"/>
                                          <jsp:param name="menuCondition" value="<%=sql%>"/>
                                          <jsp:param name="conditionContent" value="<%=search%>"/>
                                          <jsp:param name="place" value="<%=place%>"/>
                                          <jsp:param name="floor" value="<%=floor%>"/>
                                          <jsp:param name="window" value="<%=window%>"/>
                                      </jsp:include>
                                   </center>
                               </td>
                           </tr>
                           <tr>
                                   <td style=" padding-top:100px; background-image: url(格兰.jpg); background-size: contain" align="center" valign="top">
                                       <jsp:include page="picChangeAuto.jsp"/>
                                   </td>
                           </tr>
                        </table>
                 </div>
            </div>
        </div>                           
    </body>
</html>
