<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<title>高校选课系统首页</title>
<link href="login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="logo">
		<div class="login-box">
			<div class="login-bg">
				<html:form action="/userLogin.do">
					<tr>
						<td height="22" colspan="3" align="center"><span
							class="style1">${error}</span></td>
					</tr>
					<table cellpadding="0" cellspacing="0">

						<tr>
							<td colspan="2" class="user"><html:text property="loginName"
									value="mr" /></td>
						</tr>
						<tr>
							<td colspan="2" class="pw" width="300" height="50"><html:password
									property="pwd" value="mrsoft" /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="提交"></td>
						</tr>
						<tr>
							<td colspan="2"><a href="reg.jsp" class="zhjh-a">用户注册</a><a
								href="#" class="wjmm-a" target="_blank">重置</a></td>
						</tr>
					</table>
				</html:form>
			</div>

		</div>
		<div id="footer">
			<p>JC&nbsp;&nbsp;版权所有&nbsp;&nbsp;©2017</p>
		</div>
	</div>
</body>
</html>