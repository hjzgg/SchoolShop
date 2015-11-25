<%-- 
    Document   : createCondition
    Created on : 2014-12-16, 13:00:42
    Author     : HJZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String contentType = request.getParameter("contentType");
    if(contentType == null){
        out.println("<center><h1>操作错误!</h1></center>");
        return ;
    }
%>
<html>
    <head>
        <title>生成数据条件</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <script>
            function browseFolder(path) {//打开本地目录（目录选择功能）
                try {
                   var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
                   var Shell = new ActiveXObject("Shell.Application");
                   var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
                   //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
                   if (Folder != null) {
                       Folder = Folder.items(); // 返回 FolderItems 对象
                                   Folder = Folder.item(); // 返回 Folderitem 对象
                                   Folder = Folder.Path; // 返回路径
                                   if (Folder.charAt(Folder.length - 1) != "\\") {
                                       Folder = Folder + "\\";
                                   }
                                   document.getElementById(path).value = Folder;
                                   return Folder;
                               }
                           }
                   catch (e) {
                       alert(e.message);
                   }
               }
            function showDate(){ //初始化文本框为当天日期
                var today = new Date();   
                var year = today.getFullYear();   
                var month = today.getMonth() + 1;   
                var day = today.getDate();   
                var date = year + "-" + month + "-" + day;   
                document.getElementById("date").value=date;   
            }  
            function funFloor(place){
                var floor = document.getElementById("floor");
                if(place.value=="所有") floor.options.length = 0;
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
            
            function createConditionIsOK(){
                 if(document.getElementById("place").value ==""){
                     alert("地点不能为空!");
                     document.getElementById("place").focus();
                     return ;
                 } 
                 if(document.getElementById("path").value ==""){
                     alert("路径不能为空!");
                     document.getElementById("path").focus();
                     return ;
                 } 
                 var filePath = document.getElementById("path").value + document.getElementById("file").value + "." + "<%=contentType%>";
                 var sql = "select * from billmsg where ";
                 var place = document.getElementById("place").value;
                 if(place != "所有"){
                      sql += "place=\'" + place + "\'";
                      sql += " and floor=\'" + document.getElementById("floor").value + "\'";
                 }
                 var tmpRadio = document.getElementsByName("foodtype");
                 for(var i=0; i<tmpRadio.length; ++i)
                       if(tmpRadio.item(i).checked){
                           if("select * from billmsg where "==sql)
                               sql += " requesttime=\'" + tmpRadio.item(i).value + "\'";
                           else sql +=  " and requesttime=\'" + tmpRadio.item(i).value + "\'";
                       }
                 if("select * from billmsg where "==sql)
                     sql += "  date(billtime)=\'" + document.getElementById("date").value + "\'";
                 else sql += " and date(billtime)=\'" + document.getElementById("date").value + "\'";
                 if("<%=contentType%>" == "txt")
                        window.location.href="createTxt.jsp?filePath=" + filePath + "&sql=" + sql;
                 else   window.location.href="createXls.jsp?filePath=" + filePath + "&sql=" + sql;
             }
        </script>
    </head>

<body onload="showDate()">
    <center>
        <h1>请填写以下信息!</h1>
        <table>
            <tr style="padding: 20px">
                <td>选择存放位置：</td>
                <td><input id="path" type="text" name="path" size="30" readonly="readonly"></td>
                <td><input type="button" value="选择" onclick="browseFolder('path')"></td>
            </tr>
            <tr style="padding: 20px">
                <td>文件名字：</td>
                <td><input id="file" type="text" name="file" size="30" value="mydefault"></td>
            </tr>
            <tr style="padding: 20px">
                <td>数据条件:</td>
                <td>
                     地点:
                     <select id="place" name="place" onchange="funFloor(this)">
                        <option  selected="selected" value="所有"> </option>
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
                    <td></td>
                    <td>
                         订餐类型:
                          <input type="radio" value="早餐" name="foodtype">早餐
                          <input type="radio" value="午餐" name="foodtype">午餐
                          <input type="radio" value="晚餐" checked name="foodtype">晚餐
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                          <script type="text/javascript">
                            var gMonths=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
                            var WeekDay=new Array("日","一","二","三","四","五","六");
                            var strToday="今天";
                            var strYear="年";
                            var strMonth="月";
                            var strDay="日";
                            var splitChar="-";
                            var startYear=2000;
                            var endYear=2050;
                            var dayTdHeight=12;
                            var dayTdTextSize=12;
                            var gcNotCurMonth="#E0E0E0";
                            var gcRestDay="#FF0000";
                            var gcWorkDay="#444444";
                            var gcMouseOver="#79D0FF";
                            var gcMouseOut="#F4F4F4";
                            var gcToday="#444444";
                            var gcTodayMouseOver="#6699FF";
                            var gcTodayMouseOut="#79D0FF";
                            var gdCtrl=new Object();
                            var goSelectTag=new Array();
                            var gdCurDate=new Date();
                            var giYear=gdCurDate.getFullYear();
                            var giMonth=gdCurDate.getMonth()+1;
                            var giDay=gdCurDate.getDate();
                            function $(){var elements=new Array();for(var i=0;i<arguments.length;i++) {var element=arguments[i];if(typeof(arguments[i])=='string'){element=document.getElementById(arguments[i]);}if(arguments.length==1){return element;}elements.Push(element);}return elements;}
                            Array.prototype.Push=function(){var startLength=this.length;for(var i=0;i<arguments.length;i++){this[startLength+i]=arguments[i];}return this.length;}
                            String.prototype.HexToDec=function(){return parseInt(this,16);}
                            String.prototype.cleanBlank=function(){return this.isEmpty()?"":this.replace(/\s/g,"");}
                            function checkColor(){var color_tmp=(arguments[0]+"").replace(/\s/g,"").toUpperCase();var model_tmp1=arguments[1].toUpperCase();var model_tmp2="rgb("+arguments[1].substring(1,3).HexToDec()+","+arguments[1].substring(1,3).HexToDec()+","+arguments[1].substring(5).HexToDec()+")";model_tmp2=model_tmp2.toUpperCase();if(color_tmp==model_tmp1 ||color_tmp==model_tmp2){return true;}return false;}
                            function $V(){return $(arguments[0]).value;}
                            function fPopCalendar(evt,popCtrl,dateCtrl){evt.cancelBubble=true;gdCtrl=dateCtrl;fSetYearMon(giYear,giMonth);var point=fGetXY(popCtrl);with($("calendardiv").style){left=point.x+"px";top=(point.y+popCtrl.offsetHeight+1)+"px";visibility='visible';zindex='99';position='absolute';}$("calendardiv").focus();}
                            function fSetDate(iYear,iMonth,iDay){var iMonthNew=new String(iMonth);var iDayNew=new String(iDay);if(iMonthNew.length<2){iMonthNew="0"+iMonthNew;}if(iDayNew.length<2){iDayNew="0"+iDayNew;}gdCtrl.value=iYear+splitChar+iMonthNew+splitChar+iDayNew;fHideCalendar();}
                            function fHideCalendar(){$("calendardiv").style.visibility="hidden";for(var i=0;i<goSelectTag.length;i++){goSelectTag[i].style.visibility="visible";}goSelectTag.length=0;}
                            function fSetSelected(){var iOffset=0;var iYear=parseInt($("tbSelYear").value);var iMonth=parseInt($("tbSelMonth").value);var aCell=$("cellText"+arguments[0]);aCell.bgColor=gcMouseOut;with(aCell){var iDay=parseInt(innerHTML);if(checkColor(style.color,gcNotCurMonth)){iOffset=(innerHTML>10)?-1:1;}iMonth+=iOffset;if(iMonth<1){iYear--;iMonth=12;}else if(iMonth>12){iYear++;iMonth=1;}}fSetDate(iYear,iMonth,iDay);}
                            function Point(iX,iY){this.x=iX;this.y=iY;}
                            function fBuildCal(iYear,iMonth){var aMonth=new Array();for(var i=1;i<7;i++){aMonth[i]=new Array(i);}var dCalDate=new Date(iYear,iMonth-1,1);var iDayOfFirst=dCalDate.getDay();var iDaysInMonth=new Date(iYear,iMonth,0).getDate();var iOffsetLast=new Date(iYear,iMonth-1,0).getDate()-iDayOfFirst+1;var iDate=1;var iNext=1;for(var d=0;d<7;d++){aMonth[1][d]=(d<iDayOfFirst)?(iOffsetLast+d)*(-1):iDate++;}for(var w=2;w<7;w++){for(var d=0;d<7;d++){aMonth[w][d]=(iDate<=iDaysInMonth)?iDate++:(iNext++)*(-1);}}return aMonth;}
                            function fDrawCal(iYear,iMonth,iCellHeight,iDateTextSize){var colorTD=" bgcolor='"+gcMouseOut+"' bordercolor='"+gcMouseOut+"'";var styleTD=" valign='middle' align='center' style='height:"+iCellHeight+"px;font-weight:bolder;font-size:"+iDateTextSize+"px;";var dateCal="";dateCal+="<tr>";for(var i=0;i<7;i++){dateCal+="<td"+colorTD+styleTD+"color:#990099'>"+WeekDay[i]+"</td>";}dateCal+="</tr>";for(var w=1;w<7;w++){dateCal+="<tr>";for(var d=0;d<7;d++){var tmpid=w+""+d;dateCal+="<td"+styleTD+"cursor:pointer;' onclick='fSetSelected("+tmpid+")'>";dateCal+="<span id='cellText"+tmpid+"'></span>";dateCal+="</td>";}dateCal+="</tr>";}return dateCal;}
                            function fUpdateCal(iYear,iMonth){var myMonth=fBuildCal(iYear,iMonth);var i=0;for(var w=1;w<7;w++){for(var d=0;d<7;d++){with($("cellText"+w+""+d)){parentNode.bgColor=gcMouseOut;parentNode.borderColor=gcMouseOut;parentNode.onmouseover=function(){this.bgColor=gcMouseOver;};parentNode.onmouseout=function(){this.bgColor=gcMouseOut;};if(myMonth[w][d]<0){style.color=gcNotCurMonth;innerHTML=Math.abs(myMonth[w][d]);}else{style.color=((d==0)||(d==6))?gcRestDay:gcWorkDay;innerHTML=myMonth[w][d];if(iYear==giYear && iMonth==giMonth && myMonth[w][d]==giDay){style.color=gcToday;parentNode.bgColor=gcTodayMouseOut;parentNode.onmouseover=function(){this.bgColor=gcTodayMouseOver;};parentNode.onmouseout=function(){this.bgColor=gcTodayMouseOut;};}}}}}}
                            function fSetYearMon(iYear,iMon){$("tbSelMonth").options[iMon-1].selected=true;for(var i=0;i<$("tbSelYear").length;i++){if($("tbSelYear").options[i].value==iYear){$("tbSelYear").options[i].selected=true;}}fUpdateCal(iYear,iMon);}
                            function fPrevMonth(){var iMon=$("tbSelMonth").value;var iYear=$("tbSelYear").value;if(--iMon<1){iMon=12;iYear--;}fSetYearMon(iYear,iMon);}
                            function fNextMonth(){var iMon=$("tbSelMonth").value;var iYear=$("tbSelYear").value;if(++iMon>12){iMon=1;iYear++;}fSetYearMon(iYear,iMon);}
                            function fGetXY(aTag){var oTmp=aTag;var pt=new Point(0,0);do{pt.x+=oTmp.offsetLeft;pt.y+=oTmp.offsetTop;oTmp=oTmp.offsetParent;}while(oTmp.tagName.toUpperCase()!="BODY");return pt;}
                            function getDateDiv(){var noSelectForIE="";var noSelectForFireFox="";if(document.all){noSelectForIE="onselectstart='return false;'";}else{noSelectForFireFox="-moz-user-select:none;";}var dateDiv="";dateDiv+="<div id='calendardiv' onclick='event.cancelBubble=true' "+noSelectForIE+" style='"+noSelectForFireFox+"position:absolute;z-index:99;visibility:hidden;border:1px solid #999999;'>";dateDiv+="<table border='0' bgcolor='#E0E0E0' cellpadding='1' cellspacing='1' >";dateDiv+="<tr>";dateDiv+="<td><input type='button' id='PrevMonth' value='<' style='height:20px;width:20px;font-weight:bolder;' onclick='fPrevMonth()'>";dateDiv+="</td><td><select id='tbSelYear' style='border:1px solid;' onchange='fUpdateCal($V(\"tbSelYear\"),$V(\"tbSelMonth\"))'>";for(var i=startYear;i<endYear;i++){dateDiv+="<option value='"+i+"'>"+i+strYear+"</option>";}dateDiv+="</select></td><td>";dateDiv+="<select id='tbSelMonth' style='border:1px solid;' onchange='fUpdateCal($V(\"tbSelYear\"),$V(\"tbSelMonth\"))'>";for(var i=0;i<12;i++){dateDiv+="<option value='"+(i+1)+"'>"+gMonths[i]+"</option>";}dateDiv+="</select></td><td>";dateDiv+="<input type='button' id='NextMonth' value='>' style='height:20px;width:20px;font-weight:bolder;' onclick='fNextMonth()'>";dateDiv+="</td>";dateDiv+="</tr><tr>";dateDiv+="<td align='center' colspan='4'>";dateDiv+="<div style='background-color:#cccccc'><table width='100%' border='0' cellpadding='3' cellspacing='1'>";dateDiv+=fDrawCal(giYear,giMonth,dayTdHeight,dayTdTextSize);dateDiv+="</table></div>";dateDiv+="</td>";dateDiv+="</tr><tr><td align='center' colspan='4' nowrap>";dateDiv+="<span style='cursor:pointer;font-weight:bolder;' onclick='fSetDate(giYear,giMonth,giDay)' onmouseover='this.style.color=\""+gcMouseOver+"\"' onmouseout='this.style.color=\"#000000\"'>"+strToday+":"+giYear+strYear+giMonth+strMonth+giDay+strDay+"</span>";dateDiv+="</tr></tr>";dateDiv+="</table></div>";return dateDiv;}
                            with(document){onclick=fHideCalendar;write(getDateDiv());}
                          </script> <!--日期选择-->
                          日期：<input id="date" type="text" style="border:1px solid #999;" onclick="fPopCalendar(event,this,this)" onfocus="this.select()" readonly="readonly" />
                    </td>
                </tr>
            <tr>
                <td></td>
                <td style="padding-top: 20px">
                    <input type="button" name="submit" value="确定" onclick="createConditionIsOK()">
                </td>
            </tr>
        </table>
    </center>
</body>
 
</html>

