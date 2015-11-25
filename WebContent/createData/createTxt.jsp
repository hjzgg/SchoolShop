<%-- 
    Document   : createTxt
    Created on : 2014-12-16, 11:58:33
    Author     : HJZ
--%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.bean.SQLBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String filePath = request.getParameter("filePath");
    try{
        filePath=filePath.replaceAll("\\\\", "/");
        ResultSet rs = null;
        BufferedWriter bw = new BufferedWriter(new FileWriter(new File(filePath)));
        SQLBean dbMsg = new SQLBean();
        dbMsg.getConncetion();
        dbMsg.getStatement();
        String sql = request.getParameter("sql");
        rs = dbMsg.getResultSet(sql);
        String head = "园类型" + "     楼标号" + "     用户名" + "     联系方式" + "    订餐类型" + "   订餐名称" +  "   订餐份数" + "   支付总金额" + "   付款方式" + "    订单时间";
        bw.write(head);
        bw.newLine();
        bw.flush();
        while(rs.next()){
            String content="";
            for(int i=1; i<=10; ++i)
                content += " "+rs.getString(i);
            bw.write(content);
            bw.newLine();
            bw.flush();
        }
        bw.close();
    } catch (Exception e){
        out.println("数据生成错误!");
    }
%>
<html>
    <head>
        <script>
            function openFileIIs(filename){//打开本地的文件！  
                    try{   
                        var obj=new ActiveXObject("wscript.shell");   
                        if(obj){   
                            obj.Run("\""+filename+"\"", 1, false );  
                            obj=null;   
                        }   
                    }catch(e){   
                        alert("请确定是否存在该盘符或文件");   
                    }   
          }  
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>生成.txt数据文件</title>
    </head>
    <body>
        <center>
            数据生成成功!
            <a href="javascript:;" onclick="openFileIIs('<%=filePath%>')">查看数据文件</a>
        </center>
    </body>
</html>
