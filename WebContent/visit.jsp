<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看博文</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");/*标准的访问JDBC数据库流程*/
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/userDB?useUnicode=true&characterEncoding=utf-8","root","aqst98987");
		String number = request.getParameter("id");
		Statement stmt = con.createStatement();
		String str = "select content from blog where number='"+number+"'";
		ResultSet rs = stmt.executeQuery(str);
		while(rs.next()){
			String content = rs.getString(1);
			out.println(content);
		}
		rs.close();
		stmt.close();
		con.close();
	%>
</body>
</html>