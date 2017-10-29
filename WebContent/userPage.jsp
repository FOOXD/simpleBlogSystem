<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户操作界面</title>
</head>
<body>
	<table align="center" width="50%" border=1>
		<tr><th height="50" style="font-size:16px">编号</th>
		<th style="font-size:16px">博文名称</th>
		<th style="font-size:16px">操作</th></tr>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/userDB?useUnicode=true&characterEncoding=utf-8","root","aqst98987");
		Statement stmt = con.createStatement();
		String str = "select * from blog";
		ResultSet rs = stmt.executeQuery(str);
		while(rs.next()){
			String id = rs.getString(1);
			out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td><a href='visit.jsp?id="+id+"'>查看</a></td></tr>");
		}
		rs.close();
		stmt.close();
		con.close();
	%>
	</table>
</body>
</html>