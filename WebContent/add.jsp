<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>写博文</title>
<script src="lib/ckeditor/ckeditor.js"></script>
</head>
<body>
	<form action="add.jsp" method="post">
	<input name="number" type="text" placeholder="请输入博客id"><br>
	<input name="name" type="text" placeholder="请输入博客名称">
	<textarea id="editor1" name="editor1"></textarea>	
		
	<script>
		CKEDITOR.replace("editor1");
		
		function setContent(){
			CKEDITOR.instances.editor1.getData();
		}
	</script>
	<input type="submit" name="submit" value="添加">
	</form>
	<button onclick="returnToPage()">返回</button>
	<script>
	function returnToPage(){
		window.location.href = "adminPage.jsp";
	}
	</script>
</body>
</html>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String submit=(request.getParameter("submit"));
if(submit != null && !submit.equals(" ")){
	String content = request.getParameter("editor1");
	String number = request.getParameter("number");
	String name = request.getParameter("name");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/userDB?useUnicode=true&characterEncoding=utf-8","root","aqst98987");
	Statement stmt = con.createStatement();
	String sql = "insert into blog values('"+number+"', '"+name+"', '"+content+"')";
	int i = stmt.executeUpdate(sql);
	if(i == 1){
		response.setHeader("refresh", "1;url=adminPage.jsp");
	}else{
		response.setHeader("refresh", "1;url=add.jsp");
	}
	stmt.close();
	con.close();
}
%>