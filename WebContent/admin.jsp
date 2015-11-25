<%@page contentType="text/html" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
<TITLE>管理导航菜单</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<style>
.myA{background:#ff0000;color:#fff;display: block;height:20px;width: 200px;}
</style>
<SCRIPT>
function openP(_id)
{
var select_id = parseInt(_id.replace("box",""));
for (i=1;i<=4;i++)
{
if (i==select_id)
{
document.getElementById("box"+i).style.display = "block";
}
else
{
document.getElementById("box"+i).style.display = "none";
}
}
}
</SCRIPT>
<!--如何让超链接去掉下划线，鼠标停留在上面时有下划线--> 
<style>a,a.xh{TEXT-DECORATION:none}a:hover.xh{TEXT-DECORATION:underline}</style>
 
</HEAD>
<BODY>
    <center>
        <h1>管理员操作</h1>
        <p><a class="myA" href="###" onmouseover="openP('box1')">添加数据</a></p>
        <p id="box1" style="display:none">
             <table>
                <tr><td>
                  .<a href="#">手动添加</a>
                </td></tr>  
                <tr><td>
                  .<a href="chooseFile.jsp">文件添加</a>
                </td></tr>
             </table>
        </p>
        <p><a class="myA" href="###" onmouseover="openP('box2')">删除数据</a></p>
        <p id="box2" style="display:none">
             <table>
                <tr><td>
                  .<a href="delete.jsp">手动删除</a>
                </td></tr>  
                <tr><td>
                  .<a href="conditionDelete.jsp">条件删除</a>
                </td></tr>
             </table>
        </p>
        <p><a class="myA" href="###" onmouseover="openP('box3')">修改数据</a></p>
        <p id="box3" style="display:none">
            <table>
                <tr><td>
                  .<a href="update.jsp">手动修改</a>
                </td></tr>  
                <tr><td>
                  .<a href="#">条件修改</a>
                </td></tr>
             </table>
        </p>
        <a class="myA" href="###" onmouseover="openP('box4')">打印数据</a>
        <p id="box4" style="display:none">
            <table>
                <tr><td>
                  .<a href="createData/createCondition.jsp?contentType=txt">生成txt文件</a>
                </td></tr>  
                <tr><td>
                  .<a href="createData/createCondition.jsp?contentType=xls">生成excel文件</a>
                </td></tr>
             </table>
        </p>
    </cneter>
</BODY>
</HTML>