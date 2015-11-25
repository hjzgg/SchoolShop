<%-- 
    Document   : userlogin
    Created on : 2014-12-15, 19:18:13
    Author     : Administrator
--%>

<%@page language="java"%>
<%@page import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>校园美食网</title>
		<style type="text/css">
			div.content {
				position: absolute;
				top: 100px;
				left: 100px;
				width: 299px;
				height: 426px;
				background: url(../images/login-form.png);
				z-index: 100;
			}

			div.content table {
				width: 200px;
				padding: 0px;
				margin: 0px;
				position: absolute;
				left: 25px;
				bottom: 18px;
			}

			div.content td {
				height: 50px;
                                padding: 6px;
			}

			#login_btn:hover {
				cursor: pointer;
			}

			td input {
				height: 40px;
				width: 170px;
				border: none;
			}
		</style>
		<link href="../css/main.css" rel="stylesheet" type="text/css" media="all" />
		<script src="../js/jquery.js" type="text/javascript"></script>
		<script src="../js/fun.base.js" type="text/javascript"></script>
		<script src="../js/julying.gridmenu.js" type="text/javascript"></script>
		<script src="../js/julying.planettravel.js" type="text/javascript"></script>
		<script src="../js/home.js" type="text/javascript"></script>
		<script src="../js/frame-pc.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() { //该函数包括的部分，会在页面加载完全后执行，与  window.onload 事件类似
				$("#user").val("请输入用户名");
				$("#user").focus(function () {
					if ($("#user").val() == "请输入用户名" ) {
						$("#user").val("");
						$("#user").css("color", "gray");
					}

					if ($("#user").val() == "必须为5到19位的英文和数字") {
						$("#user").val("");
						$("#user").css("color", "gray")
					}
				});

				$("#pwd").focus(function () {
					if ($("#pwd").val() == "请输入密码") {
						$("#pwd").val("");
						//$("#pwd").attr("type", "password");
						document.getElementById("pwd").type = "password";
					}

					if ($("#pwd").val() == "必须为5到19位的英文和数字") {
						document.getElementById("pwd").type = "password";
						//$("#pwd").attr("type", "password");
						$("#pwd").val("");
						$("#pwd").css("color", "gray")
					}
				})

				$("#user").blur(function () {
					if ($("#user").val() == "") {
						$("#user").val("请输入用户名");
					}
				});

				$("#pwd").blur(function () {
					if ($("#pwd").val() == "") {
						document.getElementById("pwd").type = "text";
						//$("#pwd").attr("type", "text");
						$("#pwd").val("请输入密码");
					}
				});

				$("#login_btn").click(function() { //为登录按钮增加点击事件，即在“登录”点击左键后，执行函数包括范围内的代码
					var checkRes = username("用户名", "#user"); //验证用户名是否合法
					if (checkRes != 1) { //如果校验结果不为1，表示用户名格式有误
						//alert(checkRes); //校验函数返回的结果可直接用于提示用户
						$("#user").val("必须为5到19位的英文和数字");
						$("#user").css("color", "red");
						return; //校验失败，之后的代码不再执行。
					}
					checkRes = password("密码", "#pwd"); //然后校验密码是否合法
					if (checkRes != 1) { //如果校验结果不为1，表示用户名格式有误
						//alert(checkRes); //校验函数返回的结果可直接用于提示用户
						document.getElementById("pwd").type = "text";
						//$("#pwd").attr("type", "text");
						$("#pwd").val("必须为5到19位的英文和数字");
						$("#pwd").css("color", "red");
						return; //校验失败，之后的代码不再执行。
					}
                                        var userID = document.getElementById("user").value;
                                        var pd = document.getElementById("pwd").value;
					location.href = "login.jsp?userID=" + userID + "&password=" + pd + "&code=" + document.getElementById("randStr").value;
				});
			});
		</script>
	</head>
	<body>
            <%
                Cookie cookies[] = request.getCookies();
                boolean isLogin = false;
                for(int i=0; i<cookies.length; ++i)
                        if(cookies[i].getName().equals("UserFlag") && cookies[i].getValue().equals("OK")){
                            isLogin = true;
                            break;
                        }
                if("0".equals(request.getParameter("mark"))){
            %>
                    <p style="text-align: center; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 50px">不存在该用户或用户名密码错误!</p>
            <%} else if("2".equals(request.getParameter("mark"))) {%>
                    <p style="text-align: center; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 50px">验证码错误!</p>
            <%
              }
              if(isLogin){
            %>
                    <p style="text-align: center; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 50px">用户<%=(String)session.getAttribute("schoolshop")%>已经登陆成功!</p>
            <%}%>
		<div class="content">
                    <table width="90%" align="center" class="tablelist">
                            <tr>
                                    <td  align="right">
                                <a href="register.jsp" target="_blank">免费注册</a>
                                    </td>
                                </tr>
				<tr>
					<td align="center"><input type="text" value="请输入用户名" id="user" /></td>
				</tr>
				<tr>
					<td align="center"><input type="text" value="请输入密码" id="pwd" /></td>
				</tr>

                                <tr>
                                <td style="vertical-align: middle">
				<label>验证码</label>
				<input name="code" id="randStr" type="text" style=" width: 50px">
				<img style="vertical-align: middle" id="imgValidate" src="code.jsp" onclick="refresh()"/>
				<a href="userlogin.jsp">重新获取</a>

				<script type="text/javascript">
					function refresh()
					{
						imgValidate.src="code.jsp";
					}
				</script>
                                <td>
                                </tr>
				<tr>
					<td align="left">
                                            <img src="../images/login-btn.png" alt="登录按钮" id="login_btn" />
					</td>
				</tr>
			</table>
		</div>
		<div id="julyingGridMenu" class="gridMenu">
			<div class="position">
				<div id="about-me" class="about-me item">
					<div class="show">
						<div class="thumb">
							01
						</div>
						<div class="small-thumb">
						</div>
						<div class="title">
							关于我们
						</div>
						<div class="close">
						</div>
					</div>
				</div>
				<div class="about-me-body body">
					<div class="show">
						<div class="me">
						</div>
						<div class="about">
							<strong class="name">
								网站工作人员：
								<br />
								胡峻峥
								<br />
								刘晓康，马永花
								<br />
								黎国健，林志宝
								<br />
							</strong>
							<p>
                                                            简单介绍校园美食网:
							</p>
							<p>
						        我们的校园美食网主要是为了方便所有同学及时的了解学校各大食堂的相关信息以及食物，并且为各位宅男宅女们提供相关的外卖服务。
							</p>
						</div>
						<div class="clear">
						</div>
						<div class="introduction">
							<p>
								各位有需要的同学们可以在登录后进行相应点餐，欢迎您的光临！
							</p>
							<p>
								您可以点击下面的图标联系我，十分乐意与您交流。
								<br />
								<a class="qq" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=457781132&site=qq&menu=yes" title="hjzgg的QQ">QQ</a>
								<a class="mail" target="_blank" href="mailto:457781132@qq.com" title="hjzgg的电子邮箱">郭伟强的电子邮箱</a>
							</p>
						</div>
					</div>
					<!-- .show-->
					<div class="bg" child-num="20">
					</div>
				</div>
				<!-- .about-me-body-->
				<div id="link" class="link item">
					<div class="show">
						<div class="thumb">
							02
						</div>
						<div class="small-thumb">
						</div>
						<div class="title">
							联系我们
						</div>
						<div class="close">
						</div>
					</div>
					<ul>
						<li class="qq-email">
							<a href="mailto:2570230521@qq.com" target="_blank" title="校园美食电子邮箱">校园美食网</a>
							<span><b>02</b>
								<font>
									电子邮箱
								</font>
								<i class="png"></i></span>
						</li>
						<li class="QQ">
							<a href="http://wpa.qq.com/msgrd?v=3&uin=2570230521&site=qq&menu=yes" target="_blank" title="校园美食博客">校园美食博客</a>
							<span><b>02</b>
								<font>
									QQ
								</font>
								<i class="png"></i></span>
						</li>
					</ul>
				</div>
				<div id="contact-me" class="contact-me item">
					<div class="show">
						<div class="thumb">
							03
						</div>
						<div class="small-thumb">
						</div>
						<div class="title">
							产品宣传
						</div>
						<div class="close">
						</div>
					</div>
				</div>
				<div class="contact-me-body body">
					<div class="show">
						<div class="features">
							&lt;校园外卖&gt;
							<ul>
								<li>
									&lt;1&gt;<strong>一个账号享受所有美食</strong>
									<span>&lt;/1&gt;</span>
								</li>
								<li>
									&lt;2&gt; <strong name="replace" val="校内美味佳肴一手掌控">loading...</strong>
									<span>&lt;/2&gt;</span>
								</li>
								<li>
									&lt;3&gt;<strong name="replace" val="跟上潮流畅游外卖时代">loading...</strong>
									<span>&lt;/3&gt;</span>
								</li>
								<li>
									&lt;4&gt;<strong>赶快注册进入吃货世界</strong>
									<span>&lt;/4&gt;</span>
								</li>
							</ul>
							&lt;/校园外卖&gt;
							<div class="expand">
							</div>
						</div>
					</div>
					<div class="bg" child-num="0">
					</div>
				</div>
				<div class="cells">
					<li class="cell">
					</li>
				</div>
			</div>
		</div>
		<!-- #julyingGridMenu -->
	</body>
</html>
