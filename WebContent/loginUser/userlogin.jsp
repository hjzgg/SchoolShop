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
		<title>У԰��ʳ��</title>
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
			$(function() { //�ú��������Ĳ��֣�����ҳ�������ȫ��ִ�У���  window.onload �¼�����
				$("#user").val("�������û���");
				$("#user").focus(function () {
					if ($("#user").val() == "�������û���" ) {
						$("#user").val("");
						$("#user").css("color", "gray");
					}

					if ($("#user").val() == "����Ϊ5��19λ��Ӣ�ĺ�����") {
						$("#user").val("");
						$("#user").css("color", "gray")
					}
				});

				$("#pwd").focus(function () {
					if ($("#pwd").val() == "����������") {
						$("#pwd").val("");
						//$("#pwd").attr("type", "password");
						document.getElementById("pwd").type = "password";
					}

					if ($("#pwd").val() == "����Ϊ5��19λ��Ӣ�ĺ�����") {
						document.getElementById("pwd").type = "password";
						//$("#pwd").attr("type", "password");
						$("#pwd").val("");
						$("#pwd").css("color", "gray")
					}
				})

				$("#user").blur(function () {
					if ($("#user").val() == "") {
						$("#user").val("�������û���");
					}
				});

				$("#pwd").blur(function () {
					if ($("#pwd").val() == "") {
						document.getElementById("pwd").type = "text";
						//$("#pwd").attr("type", "text");
						$("#pwd").val("����������");
					}
				});

				$("#login_btn").click(function() { //Ϊ��¼��ť���ӵ���¼������ڡ���¼����������ִ�к���������Χ�ڵĴ���
					var checkRes = username("�û���", "#user"); //��֤�û����Ƿ�Ϸ�
					if (checkRes != 1) { //���У������Ϊ1����ʾ�û�����ʽ����
						//alert(checkRes); //У�麯�����صĽ����ֱ��������ʾ�û�
						$("#user").val("����Ϊ5��19λ��Ӣ�ĺ�����");
						$("#user").css("color", "red");
						return; //У��ʧ�ܣ�֮��Ĵ��벻��ִ�С�
					}
					checkRes = password("����", "#pwd"); //Ȼ��У�������Ƿ�Ϸ�
					if (checkRes != 1) { //���У������Ϊ1����ʾ�û�����ʽ����
						//alert(checkRes); //У�麯�����صĽ����ֱ��������ʾ�û�
						document.getElementById("pwd").type = "text";
						//$("#pwd").attr("type", "text");
						$("#pwd").val("����Ϊ5��19λ��Ӣ�ĺ�����");
						$("#pwd").css("color", "red");
						return; //У��ʧ�ܣ�֮��Ĵ��벻��ִ�С�
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
                    <p style="text-align: center; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 50px">�����ڸ��û����û����������!</p>
            <%} else if("2".equals(request.getParameter("mark"))) {%>
                    <p style="text-align: center; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 50px">��֤�����!</p>
            <%
              }
              if(isLogin){
            %>
                    <p style="text-align: center; color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 50px">�û�<%=(String)session.getAttribute("schoolshop")%>�Ѿ���½�ɹ�!</p>
            <%}%>
		<div class="content">
                    <table width="90%" align="center" class="tablelist">
                            <tr>
                                    <td  align="right">
                                <a href="register.jsp" target="_blank">���ע��</a>
                                    </td>
                                </tr>
				<tr>
					<td align="center"><input type="text" value="�������û���" id="user" /></td>
				</tr>
				<tr>
					<td align="center"><input type="text" value="����������" id="pwd" /></td>
				</tr>

                                <tr>
                                <td style="vertical-align: middle">
				<label>��֤��</label>
				<input name="code" id="randStr" type="text" style=" width: 50px">
				<img style="vertical-align: middle" id="imgValidate" src="code.jsp" onclick="refresh()"/>
				<a href="userlogin.jsp">���»�ȡ</a>

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
                                            <img src="../images/login-btn.png" alt="��¼��ť" id="login_btn" />
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
							��������
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
								��վ������Ա��
								<br />
								�����
								<br />
								��������������
								<br />
								���������־��
								<br />
							</strong>
							<p>
                                                            �򵥽���У԰��ʳ��:
							</p>
							<p>
						        ���ǵ�У԰��ʳ����Ҫ��Ϊ�˷�������ͬѧ��ʱ���˽�ѧУ����ʳ�õ������Ϣ�Լ�ʳ�����Ϊ��λլ��լŮ���ṩ��ص���������
							</p>
						</div>
						<div class="clear">
						</div>
						<div class="introduction">
							<p>
								��λ����Ҫ��ͬѧ�ǿ����ڵ�¼�������Ӧ��ͣ���ӭ���Ĺ��٣�
							</p>
							<p>
								�����Ե�������ͼ����ϵ�ң�ʮ����������������
								<br />
								<a class="qq" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=457781132&site=qq&menu=yes" title="hjzgg��QQ">QQ</a>
								<a class="mail" target="_blank" href="mailto:457781132@qq.com" title="hjzgg�ĵ�������">��ΰǿ�ĵ�������</a>
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
							��ϵ����
						</div>
						<div class="close">
						</div>
					</div>
					<ul>
						<li class="qq-email">
							<a href="mailto:2570230521@qq.com" target="_blank" title="У԰��ʳ��������">У԰��ʳ��</a>
							<span><b>02</b>
								<font>
									��������
								</font>
								<i class="png"></i></span>
						</li>
						<li class="QQ">
							<a href="http://wpa.qq.com/msgrd?v=3&uin=2570230521&site=qq&menu=yes" target="_blank" title="У԰��ʳ����">У԰��ʳ����</a>
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
							��Ʒ����
						</div>
						<div class="close">
						</div>
					</div>
				</div>
				<div class="contact-me-body body">
					<div class="show">
						<div class="features">
							&lt;У԰����&gt;
							<ul>
								<li>
									&lt;1&gt;<strong>һ���˺�����������ʳ</strong>
									<span>&lt;/1&gt;</span>
								</li>
								<li>
									&lt;2&gt; <strong name="replace" val="У����ζ����һ���ƿ�">loading...</strong>
									<span>&lt;/2&gt;</span>
								</li>
								<li>
									&lt;3&gt;<strong name="replace" val="���ϳ�����������ʱ��">loading...</strong>
									<span>&lt;/3&gt;</span>
								</li>
								<li>
									&lt;4&gt;<strong>�Ͽ�ע�����Ի�����</strong>
									<span>&lt;/4&gt;</span>
								</li>
							</ul>
							&lt;/У԰����&gt;
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
