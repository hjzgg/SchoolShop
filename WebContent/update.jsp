<%-- 
    Document   : update
    Created on : 2014-11-29, 19:01:34
    Author     : HJZ
--%>

<%@page import="com.bean.SQLBean"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        response.setHeader("Cache-Control", "no-store"); //HTTP   1.1   
        response.setHeader("Pragma", "no-cache"); //HTTP   1.0   
        response.setDateHeader("Expires", 0); //prevents   caching   at   the   proxy   server   
        SQLBean dbMsg = new SQLBean();
        dbMsg.getConncetion();
        dbMsg.getStatement();
        ResultSet rt = null;
        if(session.getAttribute("sort")==null){
            Map<String,Boolean> mp = new TreeMap();
            mp.put("place", false);
            mp.put("floor", false);
            mp.put("window", false);
            mp.put("picName", false);
            mp.put("money", false);
            mp.put("cnt", false);
            session.setAttribute("sort", mp);
        }
        String placef=null, floorf=null, windowf=null;
        if(session.getAttribute("place")==null)
            session.setAttribute("place", "所有");
        if(session.getAttribute("floor")==null)
            session.setAttribute("floor", "所有");
        if(session.getAttribute("window")==null)
            session.setAttribute("window", "所有");
        String var=null;
        if((var=request.getParameter("placeFilter"))!=null){
             session.removeAttribute("place");
             session.setAttribute("place", var);
        }
        var = null;
        if((var=request.getParameter("floorFilter"))!=null){
             session.removeAttribute("floor");
             session.setAttribute("floor", var);
        }
        var = null;
        if((var=request.getParameter("windowFilter"))!=null){
             session.removeAttribute("window");
             session.setAttribute("window", var);
        }
        
        String [] place = {"菊园","荷园","柳园","松园"};
        String[] floor={"一楼","二楼","三楼","四楼"};
        String[] window = new String[20];
        for(int i=0; i<20; ++i)
            window[i] = i+1+"号窗口";
        String sortStr = request.getParameter("sort");
        String filter = "where ";
        boolean flag = false;
        placef = (String)session.getAttribute("place");
        if(!"所有".equals(placef))  { filter+="place=" + "\'" + placef + "\'"; flag=true;}

        floorf = (String)session.getAttribute("floor");
        if(!"所有".equals(floorf)){
              if(!flag) {
                  filter+="floor=" + "\'" + floorf + "\'";
                  flag = true;
              } else filter+="and floor=" + "\'" + floorf + "\'";
        }

        windowf = (String)session.getAttribute("window");
        if(!"所有".equals(windowf))  
            if(!flag){
                filter+="window=" + "\'" + windowf + "\'";
                flag = true;
            } else filter+="and window=" + "\'" + windowf + "\'";

        String sql = null;
        if("where ".equals(filter)) filter = "";
        if(sortStr==null)
            sql = "select * from food " + filter;
        else{
            Map<String,Boolean> mp = (Map<String,Boolean>)session.getAttribute("sort");
            if(mp.get(sortStr)==true)
                 sql = "select * from food " + filter + " order by " + sortStr + " asc";
            else sql = "select * from food " + filter + " order by " + sortStr + " desc";
            boolean tmp = !mp.get(sortStr);
            mp.remove(sortStr);
            mp.put(sortStr, tmp);
        }
        rt = dbMsg.getResultSet(sql);
%>
<html>
    <head>
        <style type="text/css">
            input{ vertical-align:middle; margin:0; padding:0}
           .file-box{ position:relative;width:340px; cursor:hand;}
           .txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
           .btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;}
           .file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px; }
           .site_nav{position:fixed; z-index: 2; padding:6px 10px; left:50%; top:50%; margin:-150px 0 0 -200px;}
        </style>
        
        <script type="text/javascript">   
            function showDiv(str){ 
                  document.getElementById("picDiv").style.display="";
                  var xmlhttp;   
                  if (str==""){
                        document.getElementById("picDiv").innerHTML="";
                        return;
                  }
                  if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
                         xmlhttp=new XMLHttpRequest();
                  }
                  else{// code for IE6, IE5
                        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                  }
                  xmlhttp.onreadystatechange=function(){
                    if (xmlhttp.readyState==4 && xmlhttp.status==200){
                        document.getElementById("picDiv").innerHTML=xmlhttp.responseText;
                    }
                }
                var url = "SBpicture.jsp?picName="+str;
                url=encodeURI(url);
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }
        </script> 
        
        <script type="text/javascript">
            var sql = "";
            var oldValue="";
            function checkNull(row){
                var str = document.getElementById("textID" + row).value;
                if(str.trim().length==0){//不能无空值！
                    alert("第"+Math.ceil(row/2)+"行文本(菜名或描述列)不能为空值!");
                    window.location.href="#"+Math.ceil(row/2)+"row";
                    return false;
                }
                return true;
            }
            
            function checkInt(row){
                var str = document.getElementById("intID" + row).value;
                var patten=new RegExp(/^[0-9]+$/); 
                if(!patten.test(str)){
                     alert("第"+Math.ceil(row/2)+"行文本(价格或剩余)必须为数字!");
                     window.location.href="#"+Math.ceil(row/2)+"row";
                     return false;
                }
                return true;
            }
            
            function myclick(val){
                oldValue = val;
            }
            function changePlace(row){
                if(sql != "")  sql+="$";
                var newPicName = document.getElementById(row+"place").value + document.getElementById(row+"floor").value + document.getElementById(row+"window").value + document.getElementById("textID" + (row*2-1)).value;
                var picName = document.getElementById(row+"picName").value;
                var sql1 = "update food set place=\'" + document.getElementById(row+"place").value + "\' where picName=\'" + picName + "\'";
                var sql2 = "update food set picName=\'" + newPicName + "\' where picName=\'" + picName + "\'";
                var sql3 = "update  foodpicture set picName=\'" + newPicName + "\' where picName=\'" + picName + "\'";
                var sql4 = "update salecount set picName=\'" + newPicName + "\' where picName=\'" + picName + "\'";
                sql += sql1 + "$" + sql2 + "$" + sql3 + "$" + sql4;
            }
            function changeFloor(row){
                if(sql != "")  sql+="$";
                var newPicName = document.getElementById(row+"place").value + document.getElementById(row+"floor").value + document.getElementById(row+"window").value + document.getElementById("textID" + (row*2-1)).value;
                var picName = document.getElementById(row+"picName").value;
                var sql1 = "update food set floor=\'" + document.getElementById(row+"floor").value + "\' where picName=\'" + picName + "\'";
                var sql2 = "update food set picName=\'" + newPicName + "\' where picName=\'" + picName + "\'";
                var sql3 = "update  foodpicture set picName=\'" + newPicName + "\' where picName=\'" + picName + "\'";
                var sql4 = "update salecount set picName=\'" + newPicName + "\' where picName=\'" + picName + "\'";
                sql += sql1 + "$" + sql2 + "$" + sql3 + "$" + sql4;
            }
            function changeWindow(row){
                if(sql != "")  sql+="$";
                var newPicName = document.getElementById(row+"place").value + document.getElementById(row+"floor").value + document.getElementById(row+"window").value + document.getElementById("textID" + (row*2-1)).value;
                var picName = document.getElementById(row+"picName").value;
                var sql1 = "update food set window=\'" + document.getElementById(row+"window").value + "\' where picName=\'" + picName + "\'";
                var sql2 = "update food set picName=\'" + newPicName + "\' where picName=\'" + picName + "\'";
                var sql3 = "update  foodpicture set picName=\'" + newPicName + "\' where picName=\'" + picName + "\'";
                var sql4 = "update salecount set picName=\'" + newPicName + "\' where picName=\'" + picName + "\'";
                sql += sql1 + "$" + sql2 + "$" + sql3 + "$" + sql4;
            }
            function changeText(row){
                if(!checkNull(row)){
                     document.getElementById("textID"+row).value = oldValue;
                     return ;
                }
                if(sql != "")  sql+="$";
                var picName = document.getElementById(Math.ceil(row/2)+"picName").value;
                var sql1 = "";
                if(row % 2 != 0)
                     sql1 = "update food set food=\'" + document.getElementById("textID"+row).value + "\' where picName=\'" + picName + "\'";
                 else sql1 = "update food set  describing=\'" + document.getElementById("textID"+row).value + "\' where picName=\'" + picName + "\'";
                sql += sql1;
            }
            
            function changeInt(row){
                if(!checkInt(row)){
                    document.getElementById("intID"+row).value = oldValue;
                    return ;
                }
                if(sql != "")  sql+="$";
                var picName = document.getElementById(Math.ceil(row/2)+"picName").value;
                var sql1 = "";
                if(row % 2 != 0)
                     sql1 = "update food set money=" + document.getElementById("intID"+row).value + " where picName=\'" + picName + "\'";
                 else sql1 = "update food set cnt=" + document.getElementById("intID"+row).value + " where picName=\'" + picName + "\'";
                sql += sql1;
            }
            
            function changeFile(row){
                    var file = document.getElementById("textfiled"+row).value=document.getElementById("filefiled"+row).value;
                    var reg = /\\/g; //这里是替换所有空格，如需替换其他则在正则里写上即可 
                    file = file.replace(reg,"/")
                    var patn = /\.jpg$|\.jpeg$|\.png$/i;
                    var allowString ="jpg,jpeg,png";
                    var index = file.lastIndexOf("\\");
                    var filename=file.substr(index + 1);
                    if(!patn.test(filename)){
                        document.getElementById("textfiled"+row).value=document.getElementById("filefiled"+row).value=oldValue;
                        alert("图片格式不正确，只能上传以下图片格式："+allowString);
                        window.location.href="#"+row+"row";
                        return ;
                    }
                     if(sql != "") sql += "$";
                     var picName = document.getElementById(row+"picName").value;
                     var sql1 = "update food set picpath=\'" + file +"\' where picName=\'" + picName + "\'";
                     var sql2 = "update  foodpicture set  picture=? where picName=\'" + picName + "\'";
                     sql += sql1 + "$" + sql2 + "***" + file;
            }
            
            function myCheckIsOK(){
                  window.location.href="UpdateData?sql="+sql;
            }
          
        </script>
        
        <script type="text/javascript">
            function myDumpTo(){
                var row = document.getElementById("dumpto").value;
                var patten=new RegExp(/^[0-9]+$/); 
                if(patten.test(row)){
                    window.location.href="#"+row+"row";
                }
            }
            function myFilter(){
                  window.location.href="?placeFilter="+document.getElementById("placeFilter").value
                                       + "&floorFilter="+document.getElementById("floorFilter").value
                                       +"&windowFilter="+document.getElementById("windowFilter").value
            }
        </script>
        
        <link rel="stylesheet" type="text/css" href="mybutton.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改页面</title>
    </head>
    <body>
        <div class="site_nav" id="picDiv" style="background-color: #ffcc33; width:400px;height:350px; display: none">
        </div>
        <table style="width:750px">
             <tr>
                 <td style="width:100px;text-align: center">
                      <a style="text-decoration: none" href="update.jsp?sort=place">园地点</a><br>
                      <img src="arrow-up16.png"/> 
                      <img src="arrow-down16.png">
                 </td>
                 <td style="width:50px;text-align: center">
                     <a style="text-decoration: none" href="update.jsp?sort=floor">楼层</a><br>
                     <img src="arrow-up16.png"/> 
                     <img src="arrow-down16.png">
                 </td>
                 <td style="width:50px;text-align: center">
                     <a style="text-decoration: none" href="update.jsp?sort=window">窗口</a><br>
                      <img src="arrow-up16.png"/> 
                      <img src="arrow-down16.png">
                 </td>
                 <td style="width:100px;text-align: center">
                     <a style="text-decoration: none" href="update.jsp?sort=picName">菜名</a><br>
                     <img src="arrow-up16.png"/> 
                     <img src="arrow-down16.png">
                 </td>
                 <td style="width:200px;text-align: center"> </td><!--将图片的名称进行隐藏！-->
                 <td style="width:50px;text-align: center">描述</td>
                 <td style="width:50px;text-align: center">
                     <a style="text-decoration: none" href="update.jsp?sort=money">价格</a><br>
                     <img src="arrow-up16.png"/> 
                     <img src="arrow-down16.png">
                 </td>
                 <td style="width:50px;text-align: center">
                     <a style="text-decoration: none" href="update.jsp?sort=cnt">剩余</a><br>
                     <img src="arrow-up16.png"/> 
                     <img src="arrow-down16.png">
                 </td>
                 <td style="width:100px;text-align: left">图片路径</td>
             </tr>
             <%
                 int id1 = 1, id2 = 1, row=0;
                 while(rt.next()){
                     ++row;
             %>
                    <tr id="<%=row+"row"%>">
                         <%
                               for(int i=1; i<=6; ++i){
                         %>
                               <td>
                                      <%
                                           if(i==1){
                                      %>
                                               <select onchange="changePlace(<%=row%>)" id="<%=row+"place"%>">
                                                   <%
                                                        for(int j = 0; j<place.length; ++j){
                                                   %>
                                                            <%
                                                                 if(place[j].equals(rt.getString(i))){
                                                            %>
                                                                        <option value ="<%=place[j]%>" selected="selected"> <%=place[j]%> </option>
                                                            <%
                                                                 } else {
                                                            %>
                                                                        <option value ="<%=place[j]%>"> <%=place[j]%> </option>
                                                            <%}%>
                                                        <%}%>
                                                </select>
                                      <%} else if(i==2) {%>
                                             <select  onchange="changeFloor(<%=row%>)" id="<%=row+"floor"%>">
                                                   <%
                                                        for(int j = 0; j<floor.length; ++j){
                                                   %>
                                                            <%
                                                                 if(floor[j].equals(rt.getString(i))){
                                                            %>
                                                                        <option value ="<%=floor[j]%>" selected="selected"> <%=floor[j]%> </option>
                                                            <%
                                                                 } else {
                                                            %>
                                                                        <option value ="<%=floor[j]%>"> <%=floor[j]%> </option>
                                                            <%}%>
                                                        <%}%>
                                                </select>
                                      <%} else if(i==3) {%>
                                               <select  onchange="changeWindow(<%=row%>)" id="<%=row+"window"%>">
                                                   <%
                                                        for(int j = 0; j<window.length; ++j){
                                                   %>
                                                            <%
                                                                 if(window[j].equals(rt.getString(i))){
                                                            %>
                                                                        <option value ="<%=window[j]%>" selected="selected"> <%=window[j]%> </option>
                                                            <%
                                                                 } else {
                                                            %>
                                                                        <option value ="<%=window[j]%>"> <%=window[j]%> </option>
                                                            <%}%>
                                                        <%}%>
                                                </select>
                                      <%} else if(i==5){%>
                                            <input type="hidden" value="<%=rt.getString(i)%>" id="<%=row+"picName"%>">
                                      <%} else {%>
                                            <input type="text" value="<%=rt.getString(i)%>" size="15"  onclick="myclick(this.value)" onchange="changeText(<%=id2%>)" id="<%="textID"+id2++%>">
                                      <%}%>
                                  </td>   
                        <%
                               }
                        %>
                        <td>
                              <input type="text" value="<%=rt.getInt(7)%>" size="5" onchange="changeInt(<%=id1%>)" id="<%="intID"+id1++%>">
                        </td>
                         <td>
                              <input type="text" value="<%=rt.getInt(8)%>" size="5" onclick="myclick(this.value)" onchange="changeInt(<%=id1%>)" id="<%="intID"+id1++%>">
                        </td>
                         <td>
                               <div class="file-box" >
                                    <input type='text' name='textField' id="<%="textfiled"+row%>" class='txt' value="<%=rt.getString(9)%>"/>  
                                    <button>浏览..</button>
                                    <input type="file" name="fileField" class="file" id="<%="filefiled"+row%>" size="28" onclick="myclick(document.getElementById('<%="textfiled"+row%>').value)" onchange="changeFile(<%=row%>)" />
                                    <button class="button white bigrounded" onclick="showDiv(document.getElementById('<%="textfiled"+row%>').value)" value="">预览</button>
                               </div>
                        </td>
                     </tr>
              <% 
                 }
                 dbMsg.close();
              %>
         </table>
         <div style="text-align: left; position:fixed; background-color: white; width:400px;height:50px; left:1090px; top:50px">
             地点  &nbsp;&nbsp;&nbsp;楼层 &nbsp;&nbsp; 窗口
             <br>
              
             <select id="placeFilter" onchange="myFilter()">
                 <%
                       if(placef.equals("所有")){
                 %>
                                <option value="所有" selected="selected">所有</option>>
                 <%} else { %>  
                                <option value="所有">所有</option>>
                 <%}%>
                 <%
                       for(int i=0; i<place.length; ++i)
                            if(placef.equals(place[i])){
                 %>
                        <option value="<%=place[i]%>" selected="selected"><%=place[i]%></option>   
                 <%} else { %>
                         <option value="<%=place[i]%>"><%=place[i]%></option>   
                 <%}%>
             </select>
             
             <select id="floorFilter" onchange="myFilter()">
                 <%
                       if(floorf.equals("所有")){
                 %>
                                <option value="所有" selected="selected">所有</option>
                 <%} else { %>  
                                <option value="所有">所有</option>
                 <%}%>
                 <%
                       for(int i=0; i<floor.length; ++i)
                            if(floorf.equals(floor[i])){
                 %>
                                <option value="<%=floor[i]%>" selected="selected"><%=floor[i]%></option>      
                 <%} else {%>
                                <option value="<%=floor[i]%>" ><%=floor[i]%></option>      
                 <%}%>
             </select>
             
             <select id="windowFilter" onchange="myFilter()">
                 <%
                       if(windowf.equals("所有")){
                 %>
                                <option value="所有" selected="selected">所有</option>
                 <%} else { %>  
                                <option value="所有">所有</option>
                 <%}%>
                 <%
                       for(int i=0; i<window.length; ++i)
                               if(windowf.equals(window[i])){
                 %>
                                    <option value="<%=window[i]%>" selected="selected"><%=window[i]%></option>      
                 <%} else {%>
                                     <option value="<%=window[i]%>"><%=window[i]%></option>      
                 <%}%>
             </select>
             <br><br>
              定位到第<input type="text" size="2" id="dumpto"/>行
             <input type="button" value="定位" onclick="myDumpTo()"/>
             <br><br>
             <input type="button" value="保存修改" onclick="myCheckIsOK(<%=id1%>,<%=id2%>)"/>
             &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返回"/>
        </div>
    </body>
</html>