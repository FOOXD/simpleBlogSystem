<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Yeah!</title>
</head>
<body>
	<%
		String status = request.getParameter("status");
		if(status.equals("admin")){
			out.println("你好，管理员！"); 
			response.setHeader("refresh", "1;url=adminPage.jsp");
		}else {
			out.println("你好！");
			response.setHeader("refresh", "1;url=userPage.jsp");
		}
	%>
</body>
</html>