<%-- 
    Document   : admin
    Created on : 2014-11-21, 22:55:24
    Author     : HJZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>校园美食网</title>
    </head>
    <body>
        <center>
            <h1>请选择数据来源：</h1>
            <form name="thisform" method="get"  action="AddData" id="thisform" enctype="multipart/form-data">
                <table border="1">
                    <tr><td><center>
                        <input type="file" name="theFile" accept=".txt" onchange="document.getElementById('theFilePath').value=this.value"/>  
                        <input type="hidden" id="theFilePath" name="theFilePath" value="">
                    </center></td></tr>
                    <tr><td>
                            <center>
                                <input type="submit" name="submit" value="确定">
                            </center>
                   </td></tr>
               </table>
           </form>
        </center>
    </body>
</html>
