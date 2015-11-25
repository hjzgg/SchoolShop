<%-- 
    Document   : createXsl
    Created on : 2014-12-16, 11:58:50
    Author     : HJZ
--%>

<%@page import="com.bean.SQLBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="jxl.write.Label"%>
<%@page import="jxl.write.WritableSheet"%>
<%@page import="jxl.write.WritableWorkbook"%>
<%@page import="jxl.Workbook"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        String filePath = request.getParameter("filePath");
        filePath=filePath.replaceAll("\\\\", "/");
        FileOutputStream os = new FileOutputStream(new File(filePath));
       //创建工作薄
        WritableWorkbook workbook = Workbook.createWorkbook(os);
        //创建新的一页
        WritableSheet sheet = workbook.createSheet("First Sheet",0);
        //创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
        try{
            ResultSet rs = null;
            SQLBean dbMsg = new SQLBean();
            dbMsg.getConncetion();
            dbMsg.getStatement();
            String sql = request.getParameter("sql");
            rs = dbMsg.getResultSet(sql);
            Label tmp = new Label(0,0,"园类型");
            sheet.addCell(tmp);
            tmp = new Label(1,0,"楼标号");
            sheet.addCell(tmp);
            tmp = new Label(2,0,"用户名");
            sheet.addCell(tmp);
            tmp = new Label(3,0,"联系方式");
            sheet.addCell(tmp);
            tmp = new Label(4,0,"订餐类型");
            sheet.addCell(tmp);
            tmp = new Label(5,0,"订餐名称");
            sheet.addCell(tmp);
            tmp = new Label(6,0,"订餐份数");
            sheet.addCell(tmp);
            tmp = new Label(7,0,"支付总金额");
            sheet.addCell(tmp);
            tmp = new Label(8,0,"付款方式");
            sheet.addCell(tmp);
            tmp = new Label(9,0,"订单时间");
            sheet.addCell(tmp);
            int row = 0;
            while(rs.next()){
                ++row;
                for(int i=1; i<=10; ++i){
                    tmp = new Label(i-1,row, rs.getString(i));
                    sheet.addCell(tmp);
                }
            }
        } catch (Exception e){
            out.println("数据生成错误!");
            return ;
        } finally{
            //把创建的内容写入到输出流中，并关闭输出流
            workbook.write();
            workbook.close();
            os.close();
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
        <title>生成.xls数据文件</title>
    </head>
    <body>
        <center>
             数据生成成功!
             <a href="javascript:;" onclick="openFileIIs('<%=filePath%>')">查看数据文件</a>
        </center>
    </body>
</html>
