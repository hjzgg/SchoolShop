<%-- 
    Document   : showFood
    Created on : 2014-11-24, 16:34:36
    Author     : HJZ
--%>

<%@page import="com.bean.SQLBean"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        SQLBean dbMsg = new SQLBean();
        String sql = null;
        ResultSet rt = null;
        Connection con = null;
        ResultSet rtSalecount = null;//销售量
        ResultSet rtSale_evaluate = null;//销售好评
        int pageCur=0, pageBegin=0, pageTot=0, row = 0;
        final int pageSize = 6;//每一面显示的图片的个数
        InetAddress ip = InetAddress.getLocalHost();
        try{
                //URL url = Thread.currentThread().getContextClassLoader().getResource("");
                //String rootPath = url.getFile();
                //rootPath = rootPath.replaceAll("%20", " ");
                request.setCharacterEncoding("utf-8");
                if((sql=request.getParameter("menuCondition")).equals(""))
                      sql = "select place,floor,window,food,money,picName,describing from food";
                con = dbMsg.getConncetion();
                rt = con.createStatement().executeQuery(sql);
                rt.last();
                row = rt.getRow();//总行数
                pageTot = row%pageSize == 0 ? row/pageSize : row/pageSize+1;//总页数
                String curPage  = request.getParameter("page");//当前定位的页码
                if(curPage == null) pageCur = 1; 
                else pageCur = Integer.valueOf(curPage);
                pageBegin = pageCur-2;
                if(pageBegin < 1) pageBegin = 1;
                rt.absolute((pageCur-1)*pageSize + 1);
                
        } catch(SQLException e) {
                response.sendRedirect("error.jsp?error=" + e.getMessage() + "&type=show");
        }  
%>

<html>
    <head>
         <script language= "javascript">
            function dumpTo(tot) { //函数参数定义时不加var，否则出错
                    var pageMsg = document.getElementById("pageTo").value;
                    var patrn=/^\d+$/;
                    <%
                        String conditionContent = request.getParameter("conditionContent");
                        if(conditionContent==null) conditionContent = "";
                    %>
                    var conditionContent = "<%=conditionContent%>";
                    if (patrn.test(pageMsg)) {   
                        if(parseInt(pageMsg)<1 || parseInt(pageMsg)>parseInt(tot)) return;
                        location.href="mainweb.jsp?page=" + pageMsg + "&conditionContent=" + conditionContent + "&place=<%=request.getParameter("place")%>&floor=<%=request.getParameter("floor")%>&window=<%=request.getParameter("window")%>";
                    }
            }
        </script>
        
        <style type="text/css">
            <!--

            .mybody {
                    margin:20px;
                    font-size: 12px;
                    line-height:18px;
            }
            .mystyle {
                    background-color: #CCC;
                    margin:5px;/*因为我一共做了三个实例,等一下排列使它们不会靠在一起*/
                    padding: 3px;/*形成边框装饰，同时等一下也方便控制其子元素位置,所以我没有用BORDER*/
                    height: 160px;/*与图片等高*/
                    width: 220px;
                    position: relative;
                    float:left;/*让三个实例横向排列*/
            }
            .mystyle a img {
                    height: 160px;
                    width: 220px;
                    border:none;
            }
            .mystyle a span {
                    margin-top:-9000px;/*初始化对象不可见,这里不用display: none,因为display: none对搜索引擎不友好*/
                    margin-left:-9000px;
                    position: absolute;
            }
            .mystyle a:hover {
                    background-color: #FFF;/*IE7以下版本A状态伪类bug*/
            }
            .mystyle a:hover span {
                    height: 40px;
                    width: 220px; 
                    position: absolute;
                    left: 0px;
                    top: 110px;
                    border:1px solid #F90;
                    padding: 10px 2px 2px 2px;/*让说明文字不要太靠上边界*/
                    background:#FFF;//背景色
                    text-indent: 28px;/*文本缩进28px,避免与背景LOGO叠加*/
                    text-align: center;
                    filter:alpha(opacity=50);/*CSS透明度滤镜*/
                    opacity:0.5;/*针对Mozilla浏览器CSS透明度滤镜*/
                    display: block;
                    text-decoration: none;/*去除说明文字链接下划线*/
                    cursor:pointer; /*让光标显示手形*/
                    margin:0px;/*重定位文字说明层回到正常位置*/
            }
            
            .mybtn {
                    line-height:100%;
                    padding-top:0.5em;
                    padding-right:2em;
                    padding-bottom:0.55em;
                    padding-left:2em;
                    font-family:Arial,sans-serif;
                    font-size:14px;
                    font-style:normal;
                    font-variant:normal;
                    font-weight:normal;
                    text-decoration:none;
                    display:inline-block;
                    cursor:pointer;
                    zoom:1;
                    outline-width:medium;
                    outline-color:invert;
                    font-size-adjust:none;
                    font-stretch:normal;
                    border-top-left-radius:0.5em;
                    border-top-right-radius:0.5em;
                    border-bottom-left-radius:0.5em;
                    border-bottom-right-radius:0.5em;
                    box-shadow:0px 1px 2px rgba(0,0,0,0.2);
                    text-shadow:0px 1px 1px rgba(0,0,0,0.3);
                    color:#fefee9;
                    border-top-color:#da7c0c;
                    border-right-color:#da7c0c;
                    border-bottom-color:#da7c0c;
                    border-left-color:#da7c0c;
                    border-top-width:1px;
                    border-right-width:1px;
                    border-bottom-width:1px;
                    border-left-width:1px;
                    border-top-style:solid;
                    border-right-style:solid;
                    border-bottom-style:solid;
                    border-left-style:solid;
                    background-image:none;
                    background-attachment:scroll;
                    background-repeat:repeat;
                    background-position-x:0%;
                    background-position-y:0%;
                    background-size:auto;
                    background-origin:padding-box;
                    background-clip:padding-box;
                    background-color:#f78d1d;
                    text-align:center;
              }
              
              .mybtn:hover {
                    background: #f47c20;
              }
            -->
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>showFood</title>
    </head>
    <body class="mybody">
        <table>
            <%
                int port = request.getLocalPort();
                int cnt = 0;
                if(row > 0)
                    for(int i=1; i<=3 && cnt<pageSize && !rt.isAfterLast(); ++i){
            %>
                      <tr>
            <%
                        for(int j=1; j<=2 && cnt<pageSize && !rt.isAfterLast(); ++j){
                            ++cnt;
                            String picName = rt.getString("picName");
            %>
                            <td style="padding: 15px">
                                <div class="mystyle"><a href="./mainChooseFood/showChooseFood.jsp?choosefood=<%=picName%>"><img  src=<%="http://" + ip.getHostAddress() + ":" + port + request.getContextPath() + "/GetPicture?picName=" + picName%> title="点击购买" /><span><%=picName%></span></a></div>
                                <br>
                                <table>
                                    <tr>
                                        <td style="color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 20px">
                                            ¥<%=rt.getString("money")%>
                                        </td>
                                        <td>
                                            <%
                                                rtSalecount = con.createStatement().executeQuery("select * from  salecount where picName=\'" + picName + "\'");
                                                int salecount= 0;
                                                if(rtSalecount.next())
                                                        salecount = rtSalecount.getInt("sale");
                                                String mainplace = picName.substring(0, picName.indexOf("窗口")+1);
                                                String foodName = picName.substring(picName.indexOf("窗口")+2);
                                            %>
                                            销售量:<%=salecount%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                            <a href="./mainChooseFood/showChooseFood.jsp?choosefood=<%=picName%>"><%=foodName%></a>
                                        </td>
                                        <td>
                                            类型:<%=rt.getString("describing")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%
                                                rtSale_evaluate = con.createStatement().executeQuery("select * from sale_evaluate where picName=\'" + picName + "\'");
                                                double sale_evaluate_good = 0.0;
                                                double sale_evaluate_middle = 0.0;
                                                double sale_evaluate_bad = 0.0;
                                                if(rtSale_evaluate.next()){
                                                     sale_evaluate_good = rtSale_evaluate.getDouble("evaluate_good");
                                                     sale_evaluate_middle = rtSale_evaluate.getDouble("evaluate_middle");
                                                     sale_evaluate_bad = rtSale_evaluate.getDouble("evaluate_bad");
                                                }
                                                double sale_evaluate_sum = sale_evaluate_good+sale_evaluate_middle+sale_evaluate_bad;
                                                if(sale_evaluate_sum==0.0)  sale_evaluate_sum = 1.0;
                                            %>
                                            好评:<%=sale_evaluate_good/sale_evaluate_sum*100%>%
                                        </td>
                                        <td>
                                            地点:<%=mainplace%>
                                        </td>
                                    </tr>
                                </table>
                            </td>
            <%
                            rt.next();
                       }  
            %>
                      </tr>
            <%
                }
                dbMsg.close();
            %> 
            <table>
                <tr>
                         <%if(pageCur!=1){%>
                                <td>
                                    <input class="mybtn" style="width:86px;" type="button" name="skip" value="上一页" onclick="javascript:location.href='mainweb.jsp?page=<%=pageCur-1%>&conditionContent=<%=conditionContent%>&place=<%=request.getParameter("place")%>&floor=<%=request.getParameter("floor")%>&window=<%=request.getParameter("window")%>'">
                                </td>
                         <%}%>
                         <% for(int i=pageBegin, j=1; j<=3 && i<=pageTot; ++i, ++j) {%>
                             <%if(i == pageCur){%>
                                <td>
                                    <div style="text-align: center; width: 30px; font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;">
                                        <%=i%>
                                    </div>
                                </td>
                             <%} else {%>
                                <td>
                                    <input class="mybtn" style="width:30px;" type="button" name="skip" value="<%=i%>" onclick="javascript:location.href='mainweb.jsp?page=<%=i%>&conditionContent=<%=conditionContent%>&place=<%=request.getParameter("place")%>&floor=<%=request.getParameter("floor")%>&window=<%=request.getParameter("window")%>'">
                                </td>
                             <%}%>
                         <% } %>

                         <%if(pageCur!=pageTot){%>
                                 <td>
                                    <input class="mybtn" style="width:86px;" type="button" name="skip" value="下一页" onclick="javascript:location.href='mainweb.jsp?page=<%=pageCur+1%>&conditionContent=<%=conditionContent%>&place=<%=request.getParameter("place")%>&floor=<%=request.getParameter("floor")%>&window=<%=request.getParameter("window")%>'">
                                </td>
                         <%}%>
                         <td>
                             <div style="text-align: center; width: 60px; font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;">
                                     &nbsp;&nbsp;共<%=pageTot%>页&nbsp;&nbsp;
                             </div>
                         </td>
                         <td>
                             <div style="width: 100px; font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;">
                                 向第<input type="text" id="pageTo" size="1">页
                             </div>
                         </td>
                         <td>
                                <input class="mybtn" type="button" name="skip" value="跳转" onclick="dumpTo(<%=pageTot%>)"> <!--传递总页数-->
                         </td>
                  </tr>
                </table>
        </talbe>
    </body>
</html>
 