<%-- 
    Document   : billProcess
    Created on : 2014-12-14, 10:39:08
    Author     : HJZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.MyBuyBaby"%>
<%@page import="java.util.Map"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bean.SQLBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("schoolshop") == null){//被标记的seesion失效了！也就是不存在了!
                response.sendRedirect("../error.jsp?type=choose&error=" + URLEncoder.encode("会话已经不存在，请重新登陆!", "utf-8"));
                return ;
    }
%>
<%
    SQLBean dbMsg = new SQLBean();
    PreparedStatement psta = null;
    Statement sta = null;
    Connection con = null;
    ResultSet rs = null;
    String place = request.getParameter("place");//用户信息：地点
    String floor = request.getParameter("floor");
    String pay_way = request.getParameter("pay_way");//用户付款方式
    if ("1".equals(pay_way)) {
        pay_way = "当面付款";
    } else {
        pay_way = "网上付款";
    }
    String foodtype = request.getParameter("foodtype");//用户订餐类型
    if ("1".equals(foodtype)) {
        foodtype = "早餐";
    } else if ("2".equals(foodtype)) {
        foodtype = "午餐";
    } else {
        foodtype = "晚餐";
    }
    String tel = request.getParameter("tel");
    boolean canBuy = true;
    if ("2".equals(pay_way)) {//网上支付
        String number = request.getParameter("studentID");
        String pwd = request.getParameter("pwd");
        /*连入学校的学生校园卡的数据库，进行密码和学号的验证！
         if(check is NO)  canBuy = false;
         else{
         //对相应的饭卡信息进行操作！
         }
         */
    }
    try{
        if (canBuy) {
            int money = 0;
            con = dbMsg.getConncetion();
            con.setAutoCommit(false);
            String sql = "insert into billmsg(place, floor, user, tel, requesttime, picName, cnt, totmoney, payway, billtime) values(?,?,?,?,?,?,?,?,?,?)";
            String picName = request.getParameter("picName");
            String count = request.getParameter("count");
            if(session.getAttribute("MyBuyBaby") == null)
                session.setAttribute("MyBuyBaby", new ArrayList<MyBuyBaby>());
            ArrayList mybuy = (ArrayList)session.getAttribute("MyBuyBaby");
            if (picName != null && count != null) {//立刻购买
                    psta = dbMsg.getPreparedStatement(sql);
                    sta = dbMsg.getStatement();
                    rs = dbMsg.getResultSet("select money from food where picName=\'" + picName + "\'");
                    if(rs.next()){
                        money = rs.getInt(1);
                        psta.setString(1, place);//哪个园
                        psta.setString(2, floor);//哪个楼
                        psta.setString(3, "hjzgg");//用户名称
                        psta.setString(4, tel);//电话
                        psta.setString(5, foodtype);//外卖类型
                        psta.setString(6, picName);//外卖名称
                        psta.setInt(7, Integer.parseInt(count));//份数
                        psta.setInt(8, money * Integer.parseInt(count));//总价格
                        psta.setString(9, pay_way);//付款方式
                        psta.setTimestamp(10, new Timestamp(new Date().getTime()));//订单时间
                        psta.executeUpdate();
                        mybuy.add(new MyBuyBaby(picName, Integer.parseInt(count),  money * Integer.parseInt(count), false));
                    } else {
                        response.sendRedirect("../error.jsp?type=buy&error=" + URLEncoder.encode("服务器出错!当前不能购买，请耐心等待!", "utf-8"));
                        return;
                    }
            } else {//购物车购买
                    Map<String, Integer> mp = null, mp_money = null;
                    mp = (Map<String, Integer>) session.getAttribute("customer_order");
                    mp_money = (Map<String, Integer>) session.getAttribute("food_money");
                    if (mp != null) {
                        Timestamp tt = new Timestamp(new Date().getTime());
                        for (String key : mp.keySet()) {
                            psta = dbMsg.getPreparedStatement(sql);
                            money = mp_money.get(key);
                            psta.setString(1, place);//哪个园
                            psta.setString(2, floor);//哪个楼
                            psta.setString(3, "hjzgg");//用户名称
                            psta.setString(4, tel);//电话
                            psta.setString(5, foodtype);//外卖类型
                            psta.setString(6, key);//外卖名称
                            psta.setInt(7, mp.get(key));//份数
                            psta.setInt(8, money * mp.get(key));//总价格
                            psta.setString(9, pay_way);//付款方式
                            psta.setTimestamp(10, tt);//订单时间    
                            psta.executeUpdate();
                            mybuy.add(new MyBuyBaby(key, mp.get(key),  money * mp.get(key), true));//放入已购买
                        }
                        mp.clear();//清空当前map（也就是购物车的内容）
                    } else {
                        response.sendRedirect("../error.jsp?type=buy&error=" + URLEncoder.encode("服务器出错!当前不能购买，请耐心等待!", "utf-8"));
                        return;
                    }
                }
                con.commit();
            }
        } finally{
            dbMsg.close();
        }
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/style1.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/foot.css" rel="stylesheet" type="text/css" media="screen" />
        <title>处理结果</title>
    </head>
    <body style="background-image:url(../images/20100508_19cd4c82b47e5b2852e9E1AIind9nhd1.gif);">
        <div style="position: absolute; top:150px; left: 250px;">
            <p id="actext" style="font-size:5em; font-weight: bold; font-family: 'Yanone Kaffeesatz', 'Lucida Grande', Lucida, Verdana, sans-serif;">恭喜你已成功购买外卖!</p>
            <center>
                <a href="../mainweb.jsp" class="a_demo_one">回到主页</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="../MyCart/mybuybaby.jsp" class="a_demo_one">已买到的宝贝</a>
            </center>
        </div>
        <script type="text/javascript">
            var i = 0;
            function getColor() {
                i++;
                switch (i) {
                    case 1:
                        return "#ff0000";
                    case 2:
                        return "#ff6600";
                    case 3:
                        return "#3366cc";
                    default:
                        return "black";
                }
            }

            function colorful() {
                var o = document.getElementById('actext');
                o.style.color = getColor();
                if (i == 3)
                    i = 0;
                setTimeout('colorful()', 1000);
            }
            colorful();
        </script>
    </body>
</html>
