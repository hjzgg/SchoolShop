<%-- 
    Document   : showChooseFood
    Created on : 2014-12-13, 16:10:44
    Author     : HJZ
--%>

<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("schoolshop") == null){//被标记的seesion失效了！也就是不存在了!
            response.sendRedirect("../error.jsp?type=choose&error=" + URLEncoder.encode("会话已经不存在，请回到主页刷新重试!", "utf-8"));
    } else {
%>
        <!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>食品信息</title>
            </head>
            <body style="background-image: url(../蝴蝶飞.jpg); background-size:1365px 610px">
                <table style="position: absolute; top: 50px; left:250px ">
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <jsp:include page="chooseFood.jsp"/>
                        </td>
                        <td>
                            <center>
                                相似推荐
                            </center>
                                <jsp:include page="similarRecommend.jsp"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </body>
        </html>
<%
    }
%>

