<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>sign in or sign up</title>
</head>
<body>
	<form action="Signup" method="post">
		<table align="center" width="50%" border="1">
			<caption style="font-size:24px">登陆</caption>
			<tr>
				<th width="30%" height="111" style="font-size:24px">账号：</th>
				<td width="70%"><input name="id" type="text"></td>		
			</tr>
			<tr>
				<th height="95" style="font-size:24px">密码：</th>
				<td><input name="pw" type="password"></td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="submit" name="submit" value="登陆">
				</th>
			</tr>
		</table>
	</form>
	<a href="#">我要注册</a>
</body>
</html>