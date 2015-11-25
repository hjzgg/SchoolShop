<%-- 
    Document   : conditionDelete
    Created on : 2014-11-28, 8:39:28
    Author     : HJZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>conditionDelete</title>
        
        <script type="text/javascript">
            <!--
             function check(){
                  if(document.getElementById("condition").value == "" && !confirm("删除所有!"))
                        return false;
                  return true;
             }
            -->
       </script>
    </head>
    <body>
        <center>
            <form action="DeleteInCondition" name="delete" metho="post" onsubmit="return check();">
                <table>
                    <tr>
                        <td colspan="2">删除条件[or正则]:<input type="text" name="regex" size="10" id="condition"/> </td>
                    </tr>
                    <tr style="text-align: center">
                        <td> <input type="submit" name="submit" value="确定"/> </td>
                        <td> <input type="reset" name="reset" value="清空"/> </td>
                    </tr>
                </table>
            </form>
        </center>
            <p>Tip:</p>
            <p>正则表达式条件:regexp_like(ename,'^a[a-z]*n$') 或者 picName like '%园'</p>
            <p>普通条件:picName='菊园'</p>
    </body>
</html>
