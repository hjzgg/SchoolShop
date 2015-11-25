<%-- 
    Document   : userMsg
    Created on : 2014-12-14, 10:36:42
    Author     : HJZ
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
      if(session.getAttribute("schoolshop") == null){//被标记的seesion失效了！也就是不存在了!
                response.sendRedirect("../error.jsp?type=choose&error=" + URLEncoder.encode("会话已经不存在，请重新登陆!", "utf-8"));
                return ;
      }
      response.setHeader("Cache-Control", "no-store"); //HTTP   1.1   
      response.setHeader("Pragma", "no-cache"); //HTTP   1.0   
      response.setDateHeader("Expires", 0); //prevents   caching   at   the   proxy   server   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>用户信息</title>
        <script>
            function funFloor(place){
                var floor = document.getElementById("floor");
                if(place.value=="") floor.options.length = 0;
                else{
                    var len = 0;
                    floor.options.length = 0;
                    if(place.value=="菊园") len = 6;
                    else if(place.value=="松园") len = 22;
                    else if(place.value=="荷园") len = 12;
                    else if(place.value=="柳园") len = 24;
                    for(var i=1; i<=len; ++i){
                        var op = document.createElement("option");//创建option对象
                        if(place.value=="荷园" && i==1) continue;
                        floor.appendChild(op);
                        op.text = i+'号楼';
                        op.value= i+'号楼';
                    }
                }
            }
        </script>
        <script>
            var pay_way = 1;
            function hideNumAndPwd(){
                document.getElementById("numberAndpassword").innerHTML="";
                pay_way = 1;
            }
            function showNumAndPwd(){
                document.getElementById("numberAndpassword").innerHTML='<table>\
                        <tr>\
                            <td style=" padding: 15px">\
                                学号:\
                            </td>\
                             <td style=" padding: 15px">\
                                  <input id="studentID" name="studentID" id="number" type="text" size="15" value=""/>\
                             </td>\
                        </tr>\
                        <tr>\
                            <td style=" padding: 15px">\
                                密码:\
                            </td>\
                             <td style="padding: 15px">\
                                  <input id="pwd" name="pwd" id="pwd" type="password" size="15" value=""/>\
                             </td>\
                        </tr>\
                </table>';
                pay_way = 2;
            }
        </script>
    </head>
    <body style="background-image:url(../images/20100508_19cd4c82b47e5b2852e9E1AIind9nhd1.gif);">
        <div style="position: absolute; top: 220px; left: 550px">
                <div style="display: none" id="timeout" style="text-align: center; ">
                        <p style="color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 30px">
                            登陆超时,请重新登陆！ &nbsp;&nbsp;
                            <a href="../loginUser/userlogin.jsp">登陆</a>
                        </p>
                </div>
                <br>
                <h1 align="center">请填写交易信息</h1>
                <form action="billProcess.jsp" post="get" name="user" id="userForm">
                    <table style="text-align: left">
                        <tr>
                            <td style=" padding: 15px">请选择地点:</td>
                            <td>
                                <select id="place" name="place" onchange="funFloor(this)">
                                     <option  selected="selected" value=""> </option>
                                     <option  value="菊园">菊园</option>
                                     <option  value="荷园">荷园</option>
                                     <option  value="松园">松园</option>
                                     <option  value="柳园">柳园</option>
                                </select>
                                <select name="floor" id="floor" style="width: 70px">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style=" padding: 15px">
                                联系电话:
                            </td>
                            <td>
                                <input id="tel" name="tel" type="text" size="16"/>
                            </td>
                        </tr>
                        <tr>
                            <td  style=" padding: 15px">订餐类型:</td>
                            <td id="bill">
                                <%
                                     boolean isbill = true;
                                     Calendar cal = Calendar.getInstance();
                                     int hour = cal.get(Calendar.HOUR_OF_DAY);
                                     if(hour<8){
                                %>
                                         <input type="radio" value="1" name="foodtype">早餐
                                <%} if(hour<13){%>
                                         <input type="radio" value="2" name="foodtype">午餐
                                <%} if(hour<20){%>
                                         <input type="radio" value="3" checked name="foodtype">晚餐
                                <%} else {
                                         isbill = false;
                                 }%>
                            </td>
                        </tr>
                        <tr>
                            <td style=" padding: 15px">
                                付款方式:
                            </td>
                            <td>
                                <input type="radio" value="1" name="pay_way"  checked onclick="hideNumAndPwd()">当面付款
                                <input type="radio" value="2" name="pay_way"  onclick="showNumAndPwd()">网上支付
                            </td>
                        </tr>
                        <tr>
                            <td id="numberAndpassword" colspan="2">
                                <!--显示学生的学号和密码-->
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%
                                        String picName = request.getParameter("picName");
                                        String count = request.getParameter("count");
                                        if(picName!=null && count!=null){ 
                                %>
                                        <input type="hidden" name="picName" value="<%=picName%>">
                                        <input type="hidden" name="count" value="<%=count%>">
                                <%}%>
                            </td>
                        </tr>
                        <tr>
                            <td  style=" padding: 15px">
                                <input type="button" name="btn_submit" value="确定" onclick="isBillOK();">
                            </td>
                            <td>
                                <input type="reset" name="reset" onclick="document.getElementById('pay_way1').click()" value="重置">
                            </td>
                        </tr>
                    </table>
                </form>
        </div>
        <script>
             var flag = true;
             function isBillOK(){
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
                            if("false"==tmp)
                                 document.getElementById("timeout").style.display="";
                            else if(flag) document.getElementById("userForm").submit();
                        }
                    }
                    var url = "../CustomerOrder?&buyNow=true";
                    url=encodeURI(url);
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();
                    var isbill = <%=isbill%>;
                    if(!isbill){
                          flag = false;
                          document.getElementById("bill").innerHTML="<span style='font-size:30px; color:red;'>对不起,当前不能订餐!</span>";
                          return;
                    }
                    if(document.getElementById("place").value ==""){
                         alert("地点不能为空!");
                         flag = false;
                         document.getElementById("place").focus();
                         return;
                    } 
                    if(document.getElementById("tel").value ==""){
                         alert("联系方式不能为空!");
                         flag = false;
                         document.getElementById("tel").focus();
                         return;
                    } else {
                        if(!(/^(?:18\d|13\d|15[89])-?\d{5}(\d{3}|\*{3})$/.test(document.getElementById("tel").value))){
                               alert("请输入正确的手机号!");
                               flag = false;
                               document.getElementById("tel").focus();
                               return;
                        }
                    }
                    if(pay_way == 2){
                        if(document.getElementById("studentID").value ==""){
                            alert("学号不能为空!");
                            flag = false;
                            document.getElementById("studentID").focus();
                            return;
                        }
                        if(document.getElementById("pwd").value ==""){
                            alert("密码不能为空!");
                            flag = false;
                            document.getElementById("pwd").focus();
                            return;
                        }
                     }
             }
        </script>
    </body>
</html>
