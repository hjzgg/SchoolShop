<%-- 
    Document   : chooseFood
    Created on : 2014-11-29, 14:05:23
    Author     : HJZ
--%>

<%@page import="java.util.Map"%>
<!DOCTYPE html>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbMsg" class="com.bean.SQLBean" scope="session"/>
<%
    int port = request.getLocalPort();
    Statement staFood = null;
    ResultSet rtFood = null;
    String place = null, food=null, describing=null;
    boolean isChoose = false;
    Map<String, Integer> mp = null;
    int  money= 0, left = 0;
    String picName = request.getParameter("choosefood");
    InetAddress ip = InetAddress.getLocalHost();
    request.setCharacterEncoding("utf-8");
    mp = (Map<String, Integer>)session.getAttribute("customer_order");
    if(mp != null && mp.containsKey(picName))
         isChoose=true;
    dbMsg.getConncetion();
    staFood = dbMsg.getStatement();
    String sqlFood = "select * from food where picName=\'" + picName + "\'";
    rtFood = staFood.executeQuery(sqlFood);
    if(rtFood.next()){
        place = rtFood.getString("place")+" "+rtFood.getString("floor")+" " +rtFood.getString("window");
        food = rtFood.getString("food");
        money= rtFood.getInt("money");
        left = rtFood.getInt("cnt");
        describing = rtFood.getString("describing");
    } else {
        response.sendRedirect("error.jsp?type=choose&error=已经不存在该内容，请刷新重试！");
    }
    if(describing != null){
        String sql = "select picName from food where describing=\'" + describing + "\'";
        rtFood = dbMsg.getResultSet(sql);
    }
    response.setHeader("Cache-Control", "no-store"); //HTTP   1.1   
    response.setHeader("Pragma", "no-cache"); //HTTP   1.0   
    response.setDateHeader("Expires", 0); //prevents   caching   at   the   proxy   server   
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的选择</title>

    <link rel="stylesheet" href="../css/jquery.spinner.css" />
    <link rel="stylesheet" href="../button.css" />
    <link rel="stylesheet" href="../css/style.css" media="screen" type="text/css" />
    <style type="text/css">
        .spinnerExample{margin:10px 0;}
    </style>
    <script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../js/jquery.spinner.js"></script>
    <script type="text/javascript" >
        var ischooose = false;
        var totLeft = 0;
        var bn=false;
        function checkChoose(){
            ischoose = <%=isChoose%>;
            totLeft = <%=left%>;
        }
        window.onload = checkChoose();
        function checkCounter(buyNow){
            bn=buyNow;
            var cc = document.getElementById("counter").value;
            var xmlhttp;   
            if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
                   xmlhttp=new XMLHttpRequest();
            }
            else{// code for IE6, IE5
                  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function(){
                if (xmlhttp.readyState==4 && xmlhttp.status==200){
                    var tmp = xmlhttp.responseText; 
                    tmp = tmp.match(/[\S]+/);
                    if("false"==tmp){
                         document.getElementById("timeout").style.display="";
                    } else {
                            var ccc = document.getElementById("counter").value;
                            if(ccc > totLeft){
                                 alert("食品数量不足!");
                                 return;
                            }
                            totLeft -= ccc;
                            document.getElementById("left").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;剩余:" + totLeft;
                            if(bn){//立刻购买
                                window.location.href="../processUserMsg/userMsg.jsp?picName="+ "<%=picName%>" + "&count=" + cc;
                                return ;
                            }
                            if(ischoose == false){
                                ischoose = true;
                                document.getElementById("myBaby").click();
                            } else {
                                document.getElementById("myBaby").click();//两次指定click事件的解决办法！
                                setTimeout(function(){document.getElementById("myBaby").click();},50);
                            }
                     }
                }
            }
            var url = "../CustomerOrder?picName="+ "<%=picName%>" + "&count=" + cc + "&money=" + "<%=money%>" + "&buyNow=" + buyNow;
            url=encodeURI(url);
            xmlhttp.open("GET", url, true);
            xmlhttp.send();
        }
        
        function changeFood(strName, strId){
            document.getElementById(strId).style.borderColor="#a11115";
            document.getElementById("showFood").src = "<%="http://" + ip.getHostAddress() + ":" + port + request.getContextPath() + "/GetPicture?picName="%>" + strName;
        }
        function changToPrevious(strId){
            document.getElementById(strId).style.borderColor="#00678e";
        }
    </script>

</head>
<body>
        <div style="display: none" id="timeout" style="text-align: center; ">
                <p style="color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 30px">登陆超时,请重新登陆！</p>
        </div>
        <br><br>
        <table style=" height: 400px; width: 650px;">
                <tr>
                    <td style=" width:300px; height: 400px" rowspan="2">
                        <img width="300px" height="325px" id="showFood" src="<%="http://" + ip.getHostAddress() + ":8080" + request.getContextPath() + "/GetPicture?picName=" + picName%>">
                        <br>
                        <table>
                            <tr>
                                 <%
                                     int cntPic = 0;
                                     while(rtFood.next()){
                                         ++cntPic;
                                         if(cntPic > 4) break;
                                         picName = rtFood.getString("picName");
                                 %>     
                                        <td id="<%="pic"+cntPic%>" style=" width: 75px; height: 75px; border: solid 3px #00678e">
                                            <img height="73" width="73" title="<%=picName%>" onmouseout="changToPrevious('<%="pic"+cntPic%>')" onmouseover="changeFood('<%=picName%>', '<%="pic"+cntPic%>')"  src="<%="http://" + ip.getHostAddress() + ":8080" + request.getContextPath() + "/GetPicture?picName=" + picName%>"/>
                                        </td>
                                 <%}%>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 400px; height: 100px;" colspan="2">
                            菜名:<%=food%><br>
                            地点:<%=place%><br>
                            <p style="color: #FF0A0A; font-weight: 700; font-family: verdana,arial; font-size: 20px">价格:<%=money%>元/份</p>
                            <div id="left">剩余:<font style="color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 20px"><%=left%></font></div>
                    </td>
                </tr>
                <tr>
                    <td style="width:150px;">
                            <table>
                                <tr>
                                    <td style="width:50px">
                                        数量:
                                    </td>
                                    <td>
                                            <input type="text" class="spinnerExample" id="counter"/> 
                                            <script type="text/javascript">
                                                $('.spinnerExample').spinner({});
                                            </script>
                                    </td>
                                </tr>
                            </table>
                            <br>
                            <a href="javascript:;" class="button" onclick="checkCounter(true);" id="myCart">立刻购买</a>
                            <br>
                            <a href="javascript:;" class="button" onclick="checkCounter(false);" id="myCart">加入购物车</a>
                    </td>
                    <td style="height: 300px; width: 200px;">
                        <table>
                            <tr><td style="height: 140px"></td></tr>
                            <tr>
                                <td>
                                    <!--将这一个div覆盖在下一个div的上面（也就是将下面的div的时间屏蔽掉）-->
                                    <div style=" position: absolute; top: 175px; height: 250px; width: 150px; z-index: 10" title="<%="已购买"+picName%>"></div>
                                    <div style=" position: relative; top: -55px; left: 0px">
                                      <a href="#" class="contain-icon icon-hook">
                                        <!--Begin First Cart Icon-->
                                        <svg version="1.1" width="150px" height="150px" viewBox="0 0 90.156 89.89" title="我买到的东西">
                                          <path class="main-path" fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" d="
                                          M14.973,26.021V15.296c0-1.109-0.865-2.292-1.922-2.628L1.49,8.99 M62.354,55.639c0,1.109-0.101,2.236-0.224,2.504
                                          c-0.123,0.268-1.684,0.487-2.793,0.487H17.989c-1.109,0-2.242-0.098-2.517-0.218c-0.275-0.12-0.5-1.664-0.5-2.773V23.273
                                          c0-1.109,0.101-2.236,0.224-2.504c0.123-0.268,1.684-0.487,2.793-0.487h41.348c1.109,0,2.242,0.098,2.517,0.218  c0.275,0.12,0.5,1.664,0.5,2.773V55.639z"/>
                                          <line fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="30.863" y1="20.74" x2="30.863" y2="58.63"/>
                                          <line fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="46.837" y1="20.74" x2="46.837" y2="58.63"/>
                                          <line fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="15.973" y1="33.308" x2="61.24" y2="33.308"/>
                                          <line fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="15.973" y1="46.285" x2="61.125" y2="46.285"/>
                                          <circle class="wheel" fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" cx="23.442" cy="64.554" r="5.924"/>
                                          <circle class="wheel" fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" cx="53.314" cy="64.554" r="5.924"/>
                                          <path class="outer-plus-1" fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-miterlimit="10" d="M67.378,52.665
                                          c1.29-0.143,2.615-0.147,3.959,0.001c9.837,1.087,16.93,9.943,15.843,19.78s-9.943,16.93-19.78,15.843
                                          c-7.378-0.815-13.212-6.001-15.21-12.692"/>
                                          <path class="cart-plus-1" fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" d="
                                          M61.516,70.556h17.695 M70.364,61.708v17.695"/>
                                          <path class="check-1" fill="none" stroke="#7aa23f" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" d="
                                          M60.207,73.377l6.817,6.817 M81.273,64.554l-14.249,15.64"/>
                                        </svg>
                                        <!--End First Cart Icon-->
                                         <img id="myBaby" class="apple-1" src="<%="http://" + ip.getHostAddress() + ":8080" + request.getContextPath() + "/GetPicture?picName=" + picName%>" title="点击加入购物车" />
                                       </a>
                                    </div>

                                      <script src="../js/index.js"></script>
                                      <script>
                                        if(ischoose == true)//刷新页面时候判断是否已经选择过了！
                                             document.getElementById("myBaby").click();
                                      </script>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
          </table>
</body>
</html>
<%
    dbMsg.close();
%>